#!/usr/bin/env python3
"""Send verification inputs to our isolated :99 X server, never the user's desktop."""
import ctypes as C
import os
import sys
import time

assert os.environ.get('DISPLAY') == ':99', 'Only the isolated verification display is permitted'
x = C.CDLL('libX11.so.6')
xt = C.CDLL('libXtst.so.6')
x.XOpenDisplay.restype = C.c_void_p
d = x.XOpenDisplay(b':99')
assert d
x.XDefaultRootWindow.argtypes = [C.c_void_p]
x.XDefaultRootWindow.restype = C.c_ulong
x.XQueryTree.argtypes = [C.c_void_p,C.c_ulong,C.POINTER(C.c_ulong),C.POINTER(C.c_ulong),C.POINTER(C.POINTER(C.c_ulong)),C.POINTER(C.c_uint)]
x.XSetInputFocus.argtypes = [C.c_void_p,C.c_ulong,C.c_int,C.c_ulong]
x.XStringToKeysym.argtypes = [C.c_char_p]
x.XStringToKeysym.restype = C.c_ulong
x.XKeysymToKeycode.argtypes = [C.c_void_p,C.c_ulong]
x.XKeysymToKeycode.restype = C.c_ubyte
x.XFlush.argtypes = [C.c_void_p]
xt.XTestFakeKeyEvent.argtypes = [C.c_void_p,C.c_uint,C.c_int,C.c_ulong]
xt.XTestFakeButtonEvent.argtypes = [C.c_void_p,C.c_uint,C.c_int,C.c_ulong]
xt.XTestFakeMotionEvent.argtypes = [C.c_void_p,C.c_int,C.c_int,C.c_int,C.c_ulong]
root=x.XDefaultRootWindow(d)
r,p,kids,n=C.c_ulong(),C.c_ulong(),C.POINTER(C.c_ulong)(),C.c_uint()
x.XQueryTree(d,root,C.byref(r),C.byref(p),C.byref(kids),C.byref(n))
window=kids[n.value-1] if n.value else root
if n.value: x.XSetInputFocus(d,window,1,0)
if sys.argv[1] == 'key':
    codes=[x.XKeysymToKeycode(d,x.XStringToKeysym(k.encode())) for k in sys.argv[2:]]
    for code in codes: xt.XTestFakeKeyEvent(d,code,1,0)
    x.XFlush(d);time.sleep(.1)
    for code in reversed(codes): xt.XTestFakeKeyEvent(d,code,0,0)
elif sys.argv[1] == 'text':
    names={' ':'space','/':'slash','.':'period','-':'minus','_':'underscore',':':'colon'}
    for ch in sys.argv[2]:
        name=names.get(ch,ch)
        code=x.XKeysymToKeycode(d,x.XStringToKeysym(name.encode()))
        shift=ch.isupper() or ch in '_:'
        shift_code=x.XKeysymToKeycode(d,x.XStringToKeysym(b'Shift_L'))
        if shift: xt.XTestFakeKeyEvent(d,shift_code,1,0)
        xt.XTestFakeKeyEvent(d,code,1,0);xt.XTestFakeKeyEvent(d,code,0,0)
        if shift: xt.XTestFakeKeyEvent(d,shift_code,0,0)
        x.XFlush(d);time.sleep(.035)
elif sys.argv[1] == 'click':
    xt.XTestFakeMotionEvent(d,-1,int(sys.argv[2]),int(sys.argv[3]),0)
    x.XFlush(d);time.sleep(.1)
    button=int(sys.argv[4]) if len(sys.argv)>4 else 1
    xt.XTestFakeButtonEvent(d,button,1,0);x.XFlush(d);time.sleep(.1)
    xt.XTestFakeButtonEvent(d,button,0,0)
elif sys.argv[1] == 'drag':
    sx,sy,ex,ey=map(int,sys.argv[2:6])
    button=int(sys.argv[6]) if len(sys.argv)>6 else 1
    xt.XTestFakeMotionEvent(d,-1,sx,sy,0);x.XFlush(d);time.sleep(.1)
    xt.XTestFakeButtonEvent(d,button,1,0);x.XFlush(d);time.sleep(.1)
    for i in range(1,21):
        xt.XTestFakeMotionEvent(d,-1,round(sx+(ex-sx)*i/20),round(sy+(ey-sy)*i/20),0)
        x.XFlush(d);time.sleep(.02)
    xt.XTestFakeButtonEvent(d,button,0,0)
elif sys.argv[1] == 'resize':
    x.XResizeWindow.argtypes=[C.c_void_p,C.c_ulong,C.c_uint,C.c_uint]
    x.XResizeWindow(d,window,int(sys.argv[2]),int(sys.argv[3]))
elif sys.argv[1] == 'close':
    class Data(C.Union):
        _fields_=[('l',C.c_long*5),('b',C.c_char*20)]
    class Client(C.Structure):
        _fields_=[('type',C.c_int),('serial',C.c_ulong),('send_event',C.c_int),('display',C.c_void_p),('window',C.c_ulong),('message_type',C.c_ulong),('format',C.c_int),('data',Data)]
    class Event(C.Union):
        _fields_=[('client',Client),('padding',C.c_long*24)]
    x.XInternAtom.argtypes=[C.c_void_p,C.c_char_p,C.c_int]
    x.XInternAtom.restype=C.c_ulong
    x.XSendEvent.argtypes=[C.c_void_p,C.c_ulong,C.c_int,C.c_long,C.POINTER(Event)]
    event=Event();event.client.type=33;event.client.display=d;event.client.window=window
    event.client.message_type=x.XInternAtom(d,b'WM_PROTOCOLS',0);event.client.format=32
    event.client.data.l[0]=x.XInternAtom(d,b'WM_DELETE_WINDOW',0)
    x.XSendEvent(d,window,0,0,C.byref(event))
x.XFlush(d)
time.sleep(.15)
