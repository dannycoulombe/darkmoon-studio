
; Candidate 0000:0000, file offset 0x3200
0000:0000  mov dx,2B16h
0000:0003  mov cs:[213h],dx
0000:0008  mov ah,30h
0000:000a  int 21h
0000:000c  mov bp,[2]
0000:0010  mov bx,[2Ch]
0000:0014  mov ds,dx
0000:0016  mov [7Dh],ax
0000:0019  mov [7Bh],es
0000:001d  mov [77h],bx
0000:0021  mov [8Fh],bp
0000:0025  call 0142h
0000:0028  les di,[75h]
0000:002c  mov ax,di
0000:002e  mov bx,ax
0000:0030  mov cx,7FFFh
0000:0033  cld
0000:0034  repne scasb [di]
0000:0036  jcxz 007Bh
0000:0038  inc bx
0000:0039  cmp es:[di],al
0000:003c  jne short 0034h
0000:003e  or ch,80h
0000:0041  neg cx
0000:0043  mov [75h],cx
0000:0047  mov cx,2
0000:004a  shl bx,cl
0000:004c  add bx,10h
0000:004f  and bx,0FFF0h
0000:0052  mov [79h],bx
0000:0056  mov dx,ss
0000:0058  sub bp,dx
0000:005a  mov di,2B16h
0000:005d  mov es,di
0000:005f  mov di,es:[696Ah]
0000:0064  cmp di,200h
0000:0068  jae short 0072h
0000:006a  mov di,200h
0000:006d  mov es:[696Ah],di
0000:0072  mov cl,4
0000:0074  shr di,cl
0000:0076  inc di
0000:0077  cmp bp,di
0000:0079  jae short 007Eh
0000:007b  jmp 01FDh
0000:007e  mov bx,di
0000:0080  add bx,dx
0000:0082  mov [87h],bx
0000:0086  mov [8Bh],bx
0000:008a  mov ax,[7Bh]
0000:008d  sub bx,ax
0000:008f  mov es,ax
0000:0091  mov ah,4Ah
0000:0093  push di
0000:0094  int 21h
0000:0096  pop di
0000:0097  shl di,cl
0000:0099  cli
0000:009a  mov ss,dx
0000:009c  mov sp,di
0000:009e  sti
0000:009f  mov ax,2B16h
0000:00a2  mov es,ax
0000:00a4  mov es:[696Ah],di
0000:00a9  xor ax,ax
0000:00ab  mov es,cs:[213h]
0000:00b0  mov di,6C68h
0000:00b3  mov cx,0F2E6h
0000:00b6  sub cx,di
0000:00b8  cld
0000:00b9  rep stosb [di]
0000:00bb  mov ah,0
0000:00bd  int 1Ah
0000:00bf  mov [81h],dx
0000:00c3  mov [83h],cx
0000:00c7  xor bp,bp
0000:00c9  mov ax,2B16h
0000:00cc  mov ds,ax
0000:00ce  mov si,6C4Ah
0000:00d1  mov di,6C62h
0000:00d4  call 01B2h
0000:00d7  mov ds,cs:[213h]
0000:00dc  mov byte ptr cs:[1C4h],72h
0000:00e2  mov byte ptr cs:[1B3h],0
0000:00e8  push word ptr [73h]
0000:00ec  push word ptr [71h]
0000:00f0  push word ptr [6Fh]
0000:00f4  push word ptr [6Dh]
0000:00f8  push word ptr [6Bh]
0000:00fc  call far 000Ah,0889h
0000:0101  push ax
0000:0102  call far 5A8Dh,0
0000:0107  mov ax,2B16h
0000:010a  mov ds,ax
0000:010c  mov si,6C62h
0000:010f  mov di,6C68h
0000:0112  call 01B2h
0000:0115  mov ds,cs:[213h]
0000:011a  call far dword ptr [6796h]
0000:011e  call far dword ptr [679Ah]
0000:0122  call far dword ptr [679Eh]
0000:0126  push ax
0000:0127  mov ds,cs:[213h]
0000:012c  push cs
0000:012d  call 0185h
0000:0130  mov bp,sp
0000:0132  mov ah,4Ch
0000:0134  mov al,[bp+4]
0000:0137  int 21h
0000:0139  mov cx,0Eh
0000:013c  mov dx,2Fh
0000:013f  jmp 0203h
0000:0142  push ds
0000:0143  mov ax,3500h
0000:0146  int 21h
0000:0148  mov [5Bh],bx
0000:014c  mov [5Dh],es
0000:0150  mov ax,3504h
0000:0153  int 21h
0000:0155  mov [5Fh],bx
0000:0159  mov [61h],es
0000:015d  mov ax,3505h
0000:0160  int 21h
0000:0162  mov [63h],bx
0000:0166  mov [65h],es
0000:016a  mov ax,3506h
0000:016d  int 21h
0000:016f  mov [67h],bx
0000:0173  mov [69h],es
0000:0177  mov ax,2500h
0000:017a  mov dx,cs
0000:017c  mov ds,dx
0000:017e  mov dx,139h
0000:0181  int 21h
0000:0183  pop ds
0000:0184  ret

; Candidate 0000:0008, file offset 0x3208
0000:0008  mov ah,30h
0000:000a  int 21h
0000:000c  mov bp,[2]
0000:0010  mov bx,[2Ch]
0000:0014  mov ds,dx
0000:0016  mov [7Dh],ax
0000:0019  mov [7Bh],es
0000:001d  mov [77h],bx
0000:0021  mov [8Fh],bp
0000:0025  call 0142h
0000:0028  les di,[75h]
0000:002c  mov ax,di
0000:002e  mov bx,ax
0000:0030  mov cx,7FFFh
0000:0033  cld
0000:0034  repne scasb [di]
0000:0036  jcxz 007Bh
0000:0038  inc bx
0000:0039  cmp es:[di],al
0000:003c  jne short 0034h
0000:003e  or ch,80h
0000:0041  neg cx
0000:0043  mov [75h],cx
0000:0047  mov cx,2
0000:004a  shl bx,cl
0000:004c  add bx,10h
0000:004f  and bx,0FFF0h
0000:0052  mov [79h],bx
0000:0056  mov dx,ss
0000:0058  sub bp,dx
0000:005a  mov di,2B16h
0000:005d  mov es,di
0000:005f  mov di,es:[696Ah]
0000:0064  cmp di,200h
0000:0068  jae short 0072h
0000:006a  mov di,200h
0000:006d  mov es:[696Ah],di
0000:0072  mov cl,4
0000:0074  shr di,cl
0000:0076  inc di
0000:0077  cmp bp,di
0000:0079  jae short 007Eh
0000:007b  jmp 01FDh
0000:007e  mov bx,di
0000:0080  add bx,dx
0000:0082  mov [87h],bx
0000:0086  mov [8Bh],bx
0000:008a  mov ax,[7Bh]
0000:008d  sub bx,ax
0000:008f  mov es,ax
0000:0091  mov ah,4Ah
0000:0093  push di
0000:0094  int 21h
0000:0096  pop di
0000:0097  shl di,cl
0000:0099  cli
0000:009a  mov ss,dx
0000:009c  mov sp,di
0000:009e  sti
0000:009f  mov ax,2B16h
0000:00a2  mov es,ax
0000:00a4  mov es:[696Ah],di
0000:00a9  xor ax,ax
0000:00ab  mov es,cs:[213h]
0000:00b0  mov di,6C68h
0000:00b3  mov cx,0F2E6h
0000:00b6  sub cx,di
0000:00b8  cld
0000:00b9  rep stosb [di]
0000:00bb  mov ah,0
0000:00bd  int 1Ah
0000:00bf  mov [81h],dx
0000:00c3  mov [83h],cx
0000:00c7  xor bp,bp
0000:00c9  mov ax,2B16h
0000:00cc  mov ds,ax
0000:00ce  mov si,6C4Ah
0000:00d1  mov di,6C62h
0000:00d4  call 01B2h
0000:00d7  mov ds,cs:[213h]
0000:00dc  mov byte ptr cs:[1C4h],72h
0000:00e2  mov byte ptr cs:[1B3h],0
0000:00e8  push word ptr [73h]
0000:00ec  push word ptr [71h]
0000:00f0  push word ptr [6Fh]
0000:00f4  push word ptr [6Dh]
0000:00f8  push word ptr [6Bh]
0000:00fc  call far 000Ah,0889h
0000:0101  push ax
0000:0102  call far 5A8Dh,0
0000:0107  mov ax,2B16h
0000:010a  mov ds,ax
0000:010c  mov si,6C62h
0000:010f  mov di,6C68h
0000:0112  call 01B2h
0000:0115  mov ds,cs:[213h]
0000:011a  call far dword ptr [6796h]
0000:011e  call far dword ptr [679Ah]
0000:0122  call far dword ptr [679Eh]
0000:0126  push ax
0000:0127  mov ds,cs:[213h]
0000:012c  push cs
0000:012d  call 0185h
0000:0130  mov bp,sp
0000:0132  mov ah,4Ch
0000:0134  mov al,[bp+4]
0000:0137  int 21h
0000:0139  mov cx,0Eh
0000:013c  mov dx,2Fh
0000:013f  jmp 0203h
0000:0142  push ds
0000:0143  mov ax,3500h
0000:0146  int 21h
0000:0148  mov [5Bh],bx
0000:014c  mov [5Dh],es
0000:0150  mov ax,3504h
0000:0153  int 21h
0000:0155  mov [5Fh],bx
0000:0159  mov [61h],es
0000:015d  mov ax,3505h
0000:0160  int 21h
0000:0162  mov [63h],bx
0000:0166  mov [65h],es
0000:016a  mov ax,3506h
0000:016d  int 21h
0000:016f  mov [67h],bx
0000:0173  mov [69h],es
0000:0177  mov ax,2500h
0000:017a  mov dx,cs
0000:017c  mov ds,dx
0000:017e  mov dx,139h
0000:0181  int 21h
0000:0183  pop ds
0000:0184  ret

; Candidate 0000:0029, file offset 0x3229
0000:0029  hint-taken jne short 002Ch
0000:002c  mov ax,di
0000:002e  mov bx,ax
0000:0030  mov cx,7FFFh
0000:0033  cld
0000:0034  repne scasb [di]
0000:0036  jcxz 007Bh
0000:0038  inc bx
0000:0039  cmp es:[di],al
0000:003c  jne short 0034h
0000:003e  or ch,80h
0000:0041  neg cx
0000:0043  mov [75h],cx
0000:0047  mov cx,2
0000:004a  shl bx,cl
0000:004c  add bx,10h
0000:004f  and bx,0FFF0h
0000:0052  mov [79h],bx
0000:0056  mov dx,ss
0000:0058  sub bp,dx
0000:005a  mov di,2B16h
0000:005d  mov es,di
0000:005f  mov di,es:[696Ah]
0000:0064  cmp di,200h
0000:0068  jae short 0072h
0000:006a  mov di,200h
0000:006d  mov es:[696Ah],di
0000:0072  mov cl,4
0000:0074  shr di,cl
0000:0076  inc di
0000:0077  cmp bp,di
0000:0079  jae short 007Eh
0000:007b  jmp 01FDh
0000:007e  mov bx,di
0000:0080  add bx,dx
0000:0082  mov [87h],bx
0000:0086  mov [8Bh],bx
0000:008a  mov ax,[7Bh]
0000:008d  sub bx,ax
0000:008f  mov es,ax
0000:0091  mov ah,4Ah
0000:0093  push di
0000:0094  int 21h
0000:0096  pop di
0000:0097  shl di,cl
0000:0099  cli
0000:009a  mov ss,dx
0000:009c  mov sp,di
0000:009e  sti
0000:009f  mov ax,2B16h
0000:00a2  mov es,ax
0000:00a4  mov es:[696Ah],di
0000:00a9  xor ax,ax
0000:00ab  mov es,cs:[213h]
0000:00b0  mov di,6C68h
0000:00b3  mov cx,0F2E6h
0000:00b6  sub cx,di
0000:00b8  cld
0000:00b9  rep stosb [di]
0000:00bb  mov ah,0
0000:00bd  int 1Ah
0000:00bf  mov [81h],dx
0000:00c3  mov [83h],cx
0000:00c7  xor bp,bp
0000:00c9  mov ax,2B16h
0000:00cc  mov ds,ax
0000:00ce  mov si,6C4Ah
0000:00d1  mov di,6C62h
0000:00d4  call 01B2h
0000:00d7  mov ds,cs:[213h]
0000:00dc  mov byte ptr cs:[1C4h],72h
0000:00e2  mov byte ptr cs:[1B3h],0
0000:00e8  push word ptr [73h]
0000:00ec  push word ptr [71h]
0000:00f0  push word ptr [6Fh]
0000:00f4  push word ptr [6Dh]
0000:00f8  push word ptr [6Bh]
0000:00fc  call far 000Ah,0889h
0000:0101  push ax
0000:0102  call far 5A8Dh,0
0000:0107  mov ax,2B16h
0000:010a  mov ds,ax
0000:010c  mov si,6C62h
0000:010f  mov di,6C68h
0000:0112  call 01B2h
0000:0115  mov ds,cs:[213h]
0000:011a  call far dword ptr [6796h]
0000:011e  call far dword ptr [679Ah]
0000:0122  call far dword ptr [679Eh]
0000:0126  push ax
0000:0127  mov ds,cs:[213h]
0000:012c  push cs
0000:012d  call 0185h
0000:0130  mov bp,sp
0000:0132  mov ah,4Ch
0000:0134  mov al,[bp+4]
0000:0137  int 21h
0000:0139  mov cx,0Eh
0000:013c  mov dx,2Fh
0000:013f  jmp 0203h
0000:0142  push ds
0000:0143  mov ax,3500h
0000:0146  int 21h
0000:0148  mov [5Bh],bx
0000:014c  mov [5Dh],es
0000:0150  mov ax,3504h
0000:0153  int 21h
0000:0155  mov [5Fh],bx
0000:0159  mov [61h],es
0000:015d  mov ax,3505h
0000:0160  int 21h
0000:0162  mov [63h],bx
0000:0166  mov [65h],es
0000:016a  mov ax,3506h
0000:016d  int 21h
0000:016f  mov [67h],bx
0000:0173  mov [69h],es
0000:0177  mov ax,2500h
0000:017a  mov dx,cs
0000:017c  mov ds,dx
0000:017e  mov dx,139h
0000:0181  int 21h
0000:0183  pop ds
0000:0184  ret

; Candidate 0000:0127, file offset 0x3327
0000:0127  mov ds,cs:[213h]
0000:012c  push cs
0000:012d  call 0185h
0000:0130  mov bp,sp
0000:0132  mov ah,4Ch
0000:0134  mov al,[bp+4]
0000:0137  int 21h
0000:0139  mov cx,0Eh
0000:013c  mov dx,2Fh
0000:013f  jmp 0203h
0000:0142  push ds
0000:0143  mov ax,3500h
0000:0146  int 21h
0000:0148  mov [5Bh],bx
0000:014c  mov [5Dh],es
0000:0150  mov ax,3504h
0000:0153  int 21h
0000:0155  mov [5Fh],bx
0000:0159  mov [61h],es
0000:015d  mov ax,3505h
0000:0160  int 21h
0000:0162  mov [63h],bx
0000:0166  mov [65h],es
0000:016a  mov ax,3506h
0000:016d  int 21h
0000:016f  mov [67h],bx
0000:0173  mov [69h],es
0000:0177  mov ax,2500h
0000:017a  mov dx,cs
0000:017c  mov ds,dx
0000:017e  mov dx,139h
0000:0181  int 21h
0000:0183  pop ds
0000:0184  ret

; Candidate 0000:0188, file offset 0x3388
0000:0188  and ax,16C5h
0000:018b  pop bx
0000:018c  add ch,cl
0000:018e  and [bx],bx
0000:0190  push ds
0000:0191  mov ax,2504h
0000:0194  lds dx,[5Fh]
0000:0198  int 21h
0000:019a  pop ds
0000:019b  push ds
0000:019c  mov ax,2505h
0000:019f  lds dx,[63h]
0000:01a3  int 21h
0000:01a5  pop ds
0000:01a6  push ds
0000:01a7  mov ax,2506h
0000:01aa  lds dx,[67h]
0000:01ae  int 21h
0000:01b0  pop ds
0000:01b1  ret far

; Candidate 0000:0251, file offset 0x3451
0000:0251  mov dx,cs
0000:0253  xor ah,ah
0000:0255  mov al,cs:[250h]
0000:0259  ret far

; Candidate 0000:025a, file offset 0x345a
0000:025a  mov dx,cs
0000:025c  mov ax,2C6h
0000:025f  ret far

; Candidate 0000:0260, file offset 0x3460
0000:0260  push bp
0000:0261  mov bp,sp
0000:0263  push bx
0000:0264  mov bx,[bp+6]
0000:0267  shl bx,1
0000:0269  mov bx,cs:[bx+2C6h]
0000:026e  add bx,[bp+8]
0000:0271  mov ax,[bp+0Ah]
0000:0274  mov cs:[bx],al
0000:0277  pop bx
0000:0278  pop bp
0000:0279  ret far

; Candidate 0000:027a, file offset 0x347a
0000:027a  push bp
0000:027b  mov bp,sp
0000:027d  push bx
0000:027e  mov bx,[bp+6]
0000:0281  shl bx,1
0000:0283  mov bx,cs:[bx+2C6h]
0000:0288  add bx,[bp+8]
0000:028b  mov al,cs:[bx]
0000:028e  xor ah,ah
0000:0290  pop bx
0000:0291  pop bp
0000:0292  ret far

; Candidate 0000:0293, file offset 0x3493
0000:0293  push bp
0000:0294  mov bp,sp
0000:0296  push bx
0000:0297  mov ax,[bp+6]
0000:029a  mov bx,ax
0000:029c  shl bx,1
0000:029e  add bx,2C6h
0000:02a2  mov ax,cs:[bx]
0000:02a5  mov dx,cs
0000:02a7  pop bx
0000:02a8  pop bp
0000:02a9  ret far

; Candidate 0000:02aa, file offset 0x34aa
0000:02aa  push cx
0000:02ab  push di
0000:02ac  push ds
0000:02ad  mov cx,1F4h
0000:02b0  mov ax,cs
0000:02b2  mov ds,ax
0000:02b4  xor di,di
0000:02b6  mov ax,2C6h
0000:02b9  add [di+2C6h],ax
0000:02bd  add di,2
0000:02c0  loop 02B9h
0000:02c2  pop ds
0000:02c3  pop di
0000:02c4  pop cx
0000:02c5  ret far

; Candidate 0000:0829, file offset 0x3a29
0000:0829  add [bx+si],al
0000:082b  add [bx+si],al
0000:082d  add [bx+si],al
0000:082f  add [bx+si],al
0000:0831  add [bx+si],al
0000:0833  add [bx+si],al
0000:0835  add [bx+si],al
0000:0837  add [bx+si],al
0000:0839  add [bx+si],al
0000:083b  add [bx+si],al
0000:083d  add [bx+si],al
0000:083f  add [bx+si],al
0000:0841  add [bx+si],al
0000:0843  add [bx+si],al
0000:0845  add [bx+si],al
0000:0847  add [bx+si],al
0000:0849  add [bx+si],al
0000:084b  add [bx+si],al
0000:084d  add [bx+si],al
0000:084f  add [bx+si],al
0000:0851  add [bx+si],al
0000:0853  add [bx+si],al
0000:0855  add [bx+si],al
0000:0857  add [bx+si],al
0000:0859  add [bx+si],al
0000:085b  add [bx+si],al
0000:085d  add [bx+si],al
0000:085f  add [bx+si],al
0000:0861  add [bx+si],al
0000:0863  add [bx+si],al
0000:0865  add [bx+si],al
0000:0867  add [bx+si],al
0000:0869  add [bx+si],al
0000:086b  add [bx+si],al
0000:086d  add [bx+si],al
0000:086f  add [bx+si],al
0000:0871  add [bx+si],al
0000:0873  add [bx+si],al
0000:0875  add [bx+si],al
0000:0877  add [bx+si],al
0000:0879  add [bx+si],al
0000:087b  add [bx+si],al
0000:087d  add [bx+si],al
0000:087f  add [bx+si],al
0000:0881  add [bx+si],al
0000:0883  add [bx+si],al
0000:0885  add [bx+si],al
0000:0887  add [bx+si],al
0000:0889  add [bx+si],al
0000:088b  add [bx+si],al
0000:088d  add [bx+si],al
0000:088f  add [bx+si],al
0000:0891  add [bx+si],al
0000:0893  add [bx+si],al
0000:0895  add [bx+si],al
0000:0897  add [bx+si],al
0000:0899  add [bx+si],al
0000:089b  add [bx+si],al
0000:089d  add [bx+si],al
0000:089f  add [bx+si],al
0000:08a1  add [bx+si],al
0000:08a3  add [bx+si],al
0000:08a5  add [bx+si],al
0000:08a7  add [bx+si],al
0000:08a9  add [bx+si],al
0000:08ab  add [bx+si],al
0000:08ad  add [bx+si],al
0000:08af  add [bx+si],al
0000:08b1  add [bx+si],al
0000:08b3  add [bx+si],al
0000:08b5  add [bx+si],al
0000:08b7  add [bx+si],al
0000:08b9  add [bx+si],al
0000:08bb  add [bx+si],al
0000:08bd  add [bx+si],al
0000:08bf  add [bx+si],al
0000:08c1  add [bx+si],al
0000:08c3  add [bx+si],al
0000:08c5  add [bx+si],al
0000:08c7  add [bx+si],al
0000:08c9  add [bx+si],al
0000:08cb  add [bx+si],al
0000:08cd  add [bx+si],al
0000:08cf  add [bx+si],al
0000:08d1  add [bx+si],al
0000:08d3  add [bx+si],al
0000:08d5  add [bx+si],al
0000:08d7  add [bx+si],al
0000:08d9  add [bx+si],al
0000:08db  add [bx+si],al
0000:08dd  add [bx+si],al
0000:08df  add [bx+si],al
0000:08e1  add [bx+si],al
0000:08e3  add [bx+si],al
0000:08e5  add [bx+si],al
0000:08e7  add [bx+si],al
0000:08e9  add [bx+si],al
0000:08eb  add [bx+si],al
0000:08ed  add [bx+si],al
0000:08ef  add [bx+si],al
0000:08f1  add [bx+si],al
0000:08f3  add [bx+si],al
0000:08f5  add [bx+si],al
0000:08f7  add [bx+si],al
0000:08f9  add [bx+si],al
0000:08fb  add [bx+si],al
0000:08fd  add [bx+si],al
0000:08ff  add [bx+si],al
0000:0901  add [bx+si],al
0000:0903  add [bx+si],al
0000:0905  add [bx+si],al
0000:0907  add [bx+si],al
0000:0909  add [bx+si],al
0000:090b  add [bx+si],al
0000:090d  add [bx+si],al
0000:090f  add [bx+si],al
0000:0911  add [bx+si],al
0000:0913  add [bx+si],al
0000:0915  add [bx+si],al
0000:0917  add [bx+si],al
0000:0919  add [bx+si],al
0000:091b  add [bx+si],al
0000:091d  add [bx+si],al
0000:091f  add [bx+si],al
0000:0921  add [bx+si],al
0000:0923  add [bx+si],al
0000:0925  add [bx+si],al
0000:0927  add [bx+si],al
0000:0929  add [bx+si],al
0000:092b  add [bx+si],al
0000:092d  add [bx+si],al
0000:092f  add [bx+si],al
0000:0931  add [bx+si],al
0000:0933  add [bx+si],al
0000:0935  add [bx+si],al
0000:0937  add [bx+si],al
0000:0939  add [bx+si],al
0000:093b  add [bx+si],al
0000:093d  add [bx+si],al
0000:093f  add [bx+si],al
0000:0941  add [bx+si],al
0000:0943  add [bx+si],al
0000:0945  add [bx+si],al
0000:0947  add [bx+si],al
0000:0949  add [bx+si],al
0000:094b  add [bx+si],al
0000:094d  add [bx+si],al
0000:094f  add [bx+si],al
0000:0951  add [bx+si],al
0000:0953  add [bx+si],al
0000:0955  add [bx+si],al
0000:0957  add [bx+si],al
0000:0959  add [bx+si],al
0000:095b  add [bx+si],al
0000:095d  add [bx+si],al
0000:095f  add [bx+si],al
0000:0961  add [bx+si],al
0000:0963  add [bx+si],al
0000:0965  add [bx+si],al
0000:0967  add [bx+si],al
0000:0969  add [bx+si],al
0000:096b  add [bx+si],al
0000:096d  add [bx+si],al
0000:096f  add [bx+si],al
0000:0971  add [bx+si],al
0000:0973  add [bx+si],al
0000:0975  add [bx+si],al
0000:0977  add [bx+si],al
0000:0979  add [bx+si],al
0000:097b  add [bx+si],al
0000:097d  add [bx+si],al
0000:097f  add [bx+si],al
0000:0981  add [bx+si],al
0000:0983  add [bx+si],al
0000:0985  add [bx+si],al
0000:0987  add [bx+si],al
0000:0989  add [bx+si],al
0000:098b  add [bx+si],al
0000:098d  add [bx+si],al
0000:098f  add [bx+si],al
0000:0991  add [bx+si],al
0000:0993  add [bx+si],al
0000:0995  add [bx+si],al
0000:0997  add [bx+si],al
0000:0999  add [bx+si],al
0000:099b  add [bx+si],al
0000:099d  add [bx+si],al
0000:099f  add [bx+si],al
0000:09a1  add [bx+si],al
0000:09a3  add [bx+si],al
0000:09a5  add [bx+si],al
0000:09a7  add [bx+si],al
0000:09a9  add [bx+si],al
0000:09ab  add [bx+si],al
0000:09ad  add [bx+si],al
0000:09af  add [bx+si],al
0000:09b1  add [bx+si],al
0000:09b3  add [bx+si],al
0000:09b5  add [bx+si],al
0000:09b7  add [bx+si],al
0000:09b9  add [bx+si],al
0000:09bb  add [bx+si],al
0000:09bd  add [bx+si],al
0000:09bf  add [bx+si],al
0000:09c1  add [bx+si],al
0000:09c3  add [bx+si],al
0000:09c5  add [bx+si],al
0000:09c7  add [bx+si],al
0000:09c9  add [bx+si],al
0000:09cb  add [bx+si],al
0000:09cd  add [bx+si],al
0000:09cf  add [bx+si],al
0000:09d1  add [bx+si],al
0000:09d3  add [bx+si],al
0000:09d5  add [bx+si],al
0000:09d7  add [bx+si],al
0000:09d9  add [bx+si],al
0000:09db  add [bx+si],al
0000:09dd  add [bx+si],al
0000:09df  add [bx+si],al
0000:09e1  add [bx+si],al
0000:09e3  add [bx+si],al
0000:09e5  add [bx+si],al
0000:09e7  add [bx+si],al
0000:09e9  add [bx+si],al
0000:09eb  add [bx+si],al
0000:09ed  add [bx+si],al
0000:09ef  add [bx+si],al
0000:09f1  add [bx+si],al
0000:09f3  add [bx+si],al
0000:09f5  add [bx+si],al
0000:09f7  add [bx+si],al
0000:09f9  add [bx+si],al
0000:09fb  add [bx+si],al
0000:09fd  add [bx+si],al
0000:09ff  add [bx+si],al
0000:0a01  add [bx+si],al
0000:0a03  add [bx+si],al
0000:0a05  add [bx+si],al
0000:0a07  add [bx+si],al
0000:0a09  add [bx+si],al
0000:0a0b  add [bx+si],al
0000:0a0d  add [bx+si],al
0000:0a0f  add [bx+si],al
0000:0a11  add [bx+si],al
0000:0a13  add [bx+si],al
0000:0a15  add [bx+si],al
0000:0a17  add [bx+si],al
0000:0a19  add [bx+si],al
0000:0a1b  add [bx+si],al
0000:0a1d  add [bx+si],al
0000:0a1f  add [bx+si],al
0000:0a21  add [bx+si],al
0000:0a23  add [bx+si],al
0000:0a25  add [bx+si],al
0000:0a27  add [bx+si],al
0000:0a29  add [bx+si],al
0000:0a2b  add [bx+si],al
0000:0a2d  add [bx+si],al
0000:0a2f  add [bx+si],al
0000:0a31  add [bx+si],al
0000:0a33  add [bx+si],al
0000:0a35  add [bx+si],al
0000:0a37  add [bx+si],al
0000:0a39  add [bx+si],al
0000:0a3b  add [bx+si],al
0000:0a3d  add [bx+si],al
0000:0a3f  add [bx+si],al
0000:0a41  add [bx+si],al
0000:0a43  add [bx+si],al
0000:0a45  add [bx+si],al
0000:0a47  add [bx+si],al
0000:0a49  add [bx+si],al
0000:0a4b  add [bx+si],al
0000:0a4d  add [bx+si],al
0000:0a4f  add [bx+si],al
0000:0a51  add [bx+si],al
0000:0a53  add [bx+si],al
0000:0a55  add [bx+si],al
0000:0a57  add [bx+si],al
0000:0a59  add [bx+si],al
0000:0a5b  add [bx+si],al
0000:0a5d  add [bx+si],al
0000:0a5f  add [bx+si],al
0000:0a61  add [bx+si],al
0000:0a63  add [bx+si],al
0000:0a65  add [bx+si],al
0000:0a67  add [bx+si],al
0000:0a69  add [bx+si],al
0000:0a6b  add [bx+si],al
0000:0a6d  add [bx+si],al
0000:0a6f  add [bx+si],al
0000:0a71  add [bx+si],al
0000:0a73  add [bx+si],al
0000:0a75  add [bx+si],al
0000:0a77  add [bx+si],al
0000:0a79  add [bx+si],al
0000:0a7b  add [bx+si],al
0000:0a7d  add [bx+si],al
0000:0a7f  add [bx+si],al
0000:0a81  add [bx+si],al
0000:0a83  add [bx+si],al
0000:0a85  add [bx+si],al
0000:0a87  add [bx+si],al
0000:0a89  add [bx+si],al
0000:0a8b  add [bx+si],al
0000:0a8d  add [bx+si],al
0000:0a8f  add [bx+si],al
0000:0a91  add [bx+si],al
0000:0a93  add [bx+si],al
0000:0a95  add [bx+si],al
0000:0a97  add [bx+si],al
0000:0a99  add [bx+si],al
0000:0a9b  add [bx+si],al
0000:0a9d  add [bx+si],al
0000:0a9f  add [bx+si],al
0000:0aa1  add [bx+si],al
0000:0aa3  add [bx+si],al
0000:0aa5  add [bx+si],al
0000:0aa7  add [bx+si],al
0000:0aa9  add [bx+si],al
0000:0aab  add [bx+si],al
0000:0aad  add [bx+si],al
0000:0aaf  add [bx+si],al
0000:0ab1  add [bx+si],al
0000:0ab3  add [bx+si],al
0000:0ab5  add [bx+si],al
0000:0ab7  add [bx+si],al
0000:0ab9  add [bx+si],al
0000:0abb  add [bx+si],al
0000:0abd  add [bx+si],al
0000:0abf  add [bx+si],al
0000:0ac1  add [bx+si],al
0000:0ac3  add [bx+si],al
0000:0ac5  add [bx+si],al
0000:0ac7  add [bx+si],al
0000:0ac9  add [bx+si],al
0000:0acb  add [bx+si],al
0000:0acd  add [bx+si],al
0000:0acf  add [bx+si],al
0000:0ad1  add [bx+si],al
0000:0ad3  add [bx+si],al
0000:0ad5  add [bx+si],al
0000:0ad7  add [bx+si],al
0000:0ad9  add [bx+si],al
0000:0adb  add [bx+si],al
0000:0add  add [bx+si],al
0000:0adf  add [bx+si],al
0000:0ae1  add [bx+si],al
0000:0ae3  add [bx+si],al
0000:0ae5  add [bx+si],al
0000:0ae7  add [bx+si],al
0000:0ae9  add [bx+si],al
0000:0aeb  add [bx+si],al
0000:0aed  add [bx+si],al
0000:0aef  add [bx+si],al
0000:0af1  add [bx+si],al
0000:0af3  add [bx+si],al
0000:0af5  add [bx+si],al
0000:0af7  add [bx+si],al
0000:0af9  add [bx+si],al
0000:0afb  add [bx+si],al
0000:0afd  add [bx+si],al
0000:0aff  add [bx+si],al
0000:0b01  add [bx+si],al
0000:0b03  add [bx+si],al
0000:0b05  add [bx+si],al
0000:0b07  add [bx+si],al
0000:0b09  add [bx+si],al
0000:0b0b  add [bx+si],al
0000:0b0d  add [bx+si],al
0000:0b0f  add [bx+si],al
0000:0b11  add [bx+si],al
0000:0b13  add [bx+si],al
0000:0b15  add [bx+si],al
0000:0b17  add [bx+si],al
0000:0b19  add [bx+si],al
0000:0b1b  add [bx+si],al
0000:0b1d  add [bx+si],al
0000:0b1f  add [bx+si],al
0000:0b21  add [bx+si],al
0000:0b23  add [bx+si],al
0000:0b25  add [bx+si],al
0000:0b27  add [bx+si],al
0000:0b29  add [bx+si],al
0000:0b2b  add [bx+si],al
0000:0b2d  add [bx+si],al
0000:0b2f  add [bx+si],al
0000:0b31  add [bx+si],al
0000:0b33  add [bx+si],al
0000:0b35  add [bx+si],al
0000:0b37  add [bx+si],al
0000:0b39  add [bx+si],al
0000:0b3b  add [bx+si],al
0000:0b3d  add [bx+si],al
0000:0b3f  add [bx+si],al
0000:0b41  add [bx+si],al
0000:0b43  add [bx+si],al
0000:0b45  add [bx+si],al
0000:0b47  add [bx+si],al
0000:0b49  add [bx+si],al
0000:0b4b  add [bx+si],al
0000:0b4d  add [bx+si],al
0000:0b4f  add [bx+si],al
0000:0b51  add [bx+si],al
0000:0b53  add [bx+si],al
0000:0b55  add [bx+si],al
0000:0b57  add [bx+si],al
0000:0b59  add [bx+si],al
0000:0b5b  add [bx+si],al
0000:0b5d  add [bx+si],al
0000:0b5f  add [bx+si],al
0000:0b61  add [bx+si],al
0000:0b63  add [bx+si],al
0000:0b65  add [bx+si],al
0000:0b67  add [bx+si],al
0000:0b69  add [bx+si],al
0000:0b6b  add [bx+si],al
0000:0b6d  add [bx+si],al
0000:0b6f  add [bx+si],al
0000:0b71  add [bx+si],al
0000:0b73  add [bx+si],al
0000:0b75  add [bx+si],al
0000:0b77  add [bx+si],al
0000:0b79  add [bx+si],al
0000:0b7b  add [bx+si],al
0000:0b7d  add [bx+si],al
0000:0b7f  add [bx+si],al
0000:0b81  add [bx+si],al
0000:0b83  add [bx+si],al
0000:0b85  add [bx+si],al
0000:0b87  add [bx+si],al
0000:0b89  add [bx+si],al
0000:0b8b  add [bx+si],al
0000:0b8d  add [bx+si],al
0000:0b8f  add [bx+si],al
0000:0b91  add [bx+si],al
0000:0b93  add [bx+si],al
0000:0b95  add [bx+si],al
0000:0b97  add [bx+si],al
0000:0b99  add [bx+si],al
0000:0b9b  add [bx+si],al
0000:0b9d  add [bx+si],al
0000:0b9f  add [bx+si],al
0000:0ba1  add [bx+si],al
0000:0ba3  add [bx+si],al
0000:0ba5  add [bx+si],al
0000:0ba7  add [bx+si],al
0000:0ba9  add [bx+si],al
0000:0bab  add [bx+si],al
0000:0bad  add [bx+si],al
0000:0baf  add [bx+si],al
0000:0bb1  add [bx+si],al
0000:0bb3  add [bx+si],al
0000:0bb5  add [bx+si],al
0000:0bb7  add [bx+si],al
0000:0bb9  add [bx+si],al
0000:0bbb  add [bx+si],al
0000:0bbd  add [bx+si],al
0000:0bbf  add [bx+si],al
0000:0bc1  add [bx+si],al
0000:0bc3  add [bx+si],al
0000:0bc5  add [bx+si],al
0000:0bc7  add [bx+si],al
0000:0bc9  add [bx+si],al
0000:0bcb  add [bx+si],al
0000:0bcd  add [bx+si],al
0000:0bcf  add [bx+si],al
0000:0bd1  add [bx+si],al
0000:0bd3  add [bx+si],al
0000:0bd5  add [bx+si],al
0000:0bd7  add [bx+si],al
0000:0bd9  add [bx+si],al
0000:0bdb  add [bx+si],al
0000:0bdd  add [bx+si],al
0000:0bdf  add [bx+si],al
0000:0be1  add [bx+si],al
0000:0be3  add [bx+si],al
0000:0be5  add [bx+si],al
0000:0be7  add [bx+si],al
0000:0be9  add [bx+si],al
0000:0beb  add [bx+si],al
0000:0bed  add [bx+si],al
0000:0bef  add [bx+si],al
0000:0bf1  add [bx+si],al
0000:0bf3  add [bx+si],al
0000:0bf5  add [bx+si],al
0000:0bf7  add [bx+si],al
0000:0bf9  add [bx+si],al
0000:0bfb  add [bx+si],al
0000:0bfd  add [bx+si],al
0000:0bff  add [bx+si],al
0000:0c01  add [bx+si],al
0000:0c03  add [bx+si],al
0000:0c05  add [bx+si],al
0000:0c07  add [bx+si],al
0000:0c09  add [bx+si],al
0000:0c0b  add [bx+si],al
0000:0c0d  add [bx+si],al
0000:0c0f  add [bx+si],al
0000:0c11  add [bx+si],al
0000:0c13  add [bx+si],al
0000:0c15  add [bx+si],al
0000:0c17  add [bx+si],al
0000:0c19  add [bx+si],al
0000:0c1b  add [bx+si],al
0000:0c1d  add [bx+si],al
0000:0c1f  add [bx+si],al
0000:0c21  add [bx+si],al
0000:0c23  add [bx+si],al
0000:0c25  add [bx+si],al
0000:0c27  add [bx+si],al
0000:0c29  add [bx+si],al
0000:0c2b  add [bx+si],al
0000:0c2d  add [bx+si],al
0000:0c2f  add [bx+si],al
0000:0c31  add [bx+si],al
0000:0c33  add [bx+si],al
0000:0c35  add [bx+si],al
0000:0c37  add [bx+si],al
0000:0c39  add [bx+si],al
0000:0c3b  add [bx+si],al
0000:0c3d  add [bx+si],al
0000:0c3f  add [bx+si],al
0000:0c41  add [bx+si],al
0000:0c43  add [bx+si],al
0000:0c45  add [bx+si],al
0000:0c47  add [bx+si],al
0000:0c49  add [bx+si],al
0000:0c4b  add [bx+si],al
0000:0c4d  add [bx+si],al
0000:0c4f  add [bx+si],al
0000:0c51  add [bx+si],al
0000:0c53  add [bx+si],al
0000:0c55  add [bx+si],al
0000:0c57  add [bx+si],al
0000:0c59  add [bx+si],al
0000:0c5b  add [bx+si],al
0000:0c5d  add [bx+si],al
0000:0c5f  add [bx+si],al
0000:0c61  add [bx+si],al
0000:0c63  add [bx+si],al
0000:0c65  add [bx+si],al
0000:0c67  add [bx+si],al
0000:0c69  add [bx+si],al
0000:0c6b  add [bx+si],al
0000:0c6d  add [bx+si],al
0000:0c6f  add [bx+si],al
0000:0c71  add [bx+si],al
0000:0c73  add [bx+si],al
0000:0c75  add [bx+si],al
0000:0c77  add [bx+si],al
0000:0c79  add [bx+si],al
0000:0c7b  add [bx+si],al
0000:0c7d  add [bx+si],al
0000:0c7f  add [bx+si],al
0000:0c81  add [bx+si],al
0000:0c83  add [bx+si],al
0000:0c85  add [bx+si],al
0000:0c87  add [bx+si],al
0000:0c89  add [bx+si],al
0000:0c8b  add [bx+si],al
0000:0c8d  add [bx+si],al
0000:0c8f  add [bx+si],al
0000:0c91  add [bx+si],al
0000:0c93  add [bx+si],al
0000:0c95  add [bx+si],al
0000:0c97  add [bx+si],al
0000:0c99  add [bx+si],al
0000:0c9b  add [bx+si],al
0000:0c9d  add [bx+si],al
0000:0c9f  add [bx+si],al
0000:0ca1  add [bx+si],al
0000:0ca3  add [bx+si],al
0000:0ca5  add [bx+si],al
0000:0ca7  add [bx+si],al
0000:0ca9  add [bx+si],al
0000:0cab  add [bx+si],al
0000:0cad  add [bx+si],al
0000:0caf  add [bx+si],al
0000:0cb1  add [bx+si],al
0000:0cb3  add [bx+si],al
0000:0cb5  add [bx+si],al
0000:0cb7  add [bx+si],al
0000:0cb9  add [bx+si],al
0000:0cbb  add [bx+si],al
0000:0cbd  add [bx+si],al
0000:0cbf  add [bx+si],al
0000:0cc1  add [bx+si],al
0000:0cc3  add [bx+si],al
0000:0cc5  add [bx+si],al
0000:0cc7  add [bx+si],al
0000:0cc9  add [bx+si],al
0000:0ccb  add [bx+si],al
0000:0ccd  add [bx+si],al
0000:0ccf  add [bx+si],al
0000:0cd1  add [bx+si],al
0000:0cd3  add [bx+si],al
0000:0cd5  add [bx+si],al
0000:0cd7  add [bx+si],al
0000:0cd9  add [bx+si],al
0000:0cdb  add [bx+si],al
0000:0cdd  add [bx+si],al
0000:0cdf  add [bx+si],al
0000:0ce1  add [bx+si],al
0000:0ce3  add [bx+si],al
0000:0ce5  add [bx+si],al
0000:0ce7  add [bx+si],al
0000:0ce9  add [bx+si],al
0000:0ceb  add [bx+si],al
0000:0ced  add [bx+si],al
0000:0cef  add [bx+si],al
0000:0cf1  add [bx+si],al
0000:0cf3  add [bx+si],al
0000:0cf5  add [bx+si],al
0000:0cf7  add [bx+si],al
0000:0cf9  add [bx+si],al
0000:0cfb  add [bx+si],al
0000:0cfd  add [bx+si],al
0000:0cff  add [bx+si],al
0000:0d01  add [bx+si],al
0000:0d03  add [bx+si],al
0000:0d05  add [bx+si],al
0000:0d07  add [bx+si],al
0000:0d09  add [bx+si],al
0000:0d0b  add [bx+si],al
0000:0d0d  add [bx+si],al
0000:0d0f  add [bx+si],al
0000:0d11  add [bx+si],al
0000:0d13  add [bx+si],al
0000:0d15  add [bx+si],al
0000:0d17  add [bx+si],al
0000:0d19  add [bx+si],al
0000:0d1b  add [bx+si],al
0000:0d1d  add [bx+si],al
0000:0d1f  add [bx+si],al
0000:0d21  add [bx+si],al
0000:0d23  add [bx+si],al
0000:0d25  add [bx+si],al
0000:0d27  add [bx+si],al
0000:0d29  add [bx+si],al
0000:0d2b  add [bx+si],al
0000:0d2d  add [bx+si],al
0000:0d2f  add [bx+si],al
0000:0d31  add [bx+si],al
0000:0d33  add [bx+si],al
0000:0d35  add [bx+si],al
0000:0d37  add [bx+si],al
0000:0d39  add [bx+si],al
0000:0d3b  add [bx+si],al
0000:0d3d  add [bx+si],al
0000:0d3f  add [bx+si],al
0000:0d41  add [bx+si],al
0000:0d43  add [bx+si],al
0000:0d45  add [bx+si],al
0000:0d47  add [bx+si],al
0000:0d49  add [bx+si],al
0000:0d4b  add [bx+si],al
0000:0d4d  add [bx+si],al
0000:0d4f  add [bx+si],al
0000:0d51  add [bx+si],al
0000:0d53  add [bx+si],al
0000:0d55  add [bx+si],al
0000:0d57  add [bx+si],al
0000:0d59  add [bx+si],al
0000:0d5b  add [bx+si],al
0000:0d5d  add [bx+si],al
0000:0d5f  add [bx+si],al
0000:0d61  add [bx+si],al
0000:0d63  add [bx+si],al
0000:0d65  add [bx+si],al
0000:0d67  add [bx+si],al
0000:0d69  add [bx+si],al
0000:0d6b  add [bx+si],al
0000:0d6d  add [bx+si],al
0000:0d6f  add [bx+si],al
0000:0d71  add [bx+si],al
0000:0d73  add [bx+si],al
0000:0d75  add [bx+si],al
0000:0d77  add [bx+si],al
0000:0d79  add [bx+si],al
0000:0d7b  add [bx+si],al
0000:0d7d  add [bx+si],al
0000:0d7f  add [bx+si],al
0000:0d81  add [bx+si],al
0000:0d83  add [bx+si],al
0000:0d85  add [bx+si],al
0000:0d87  add [bx+si],al
0000:0d89  add [bx+si],al
0000:0d8b  add [bx+si],al
0000:0d8d  add [bx+si],al
0000:0d8f  add [bx+si],al
0000:0d91  add [bx+si],al
0000:0d93  add [bx+si],al
0000:0d95  add [bx+si],al
0000:0d97  add [bx+si],al
0000:0d99  add [bx+si],al
0000:0d9b  add [bx+si],al
0000:0d9d  add [bx+si],al
0000:0d9f  add [bx+si],al
0000:0da1  add [bx+si],al
0000:0da3  add [bx+si],al
0000:0da5  add [bx+si],al
0000:0da7  add [bx+si],al
0000:0da9  add [bx+si],al
0000:0dab  add [bx+si],al
0000:0dad  add [bx+si],al
0000:0daf  add [bx+si],al
0000:0db1  add [bx+si],al
0000:0db3  add [bx+si],al
0000:0db5  add [bx+si],al
0000:0db7  add [bx+si],al
0000:0db9  add [bx+si],al
0000:0dbb  add [bx+si],al
0000:0dbd  add [bx+si],al
0000:0dbf  add [bx+si],al
0000:0dc1  add [bx+si],al
0000:0dc3  add [bx+si],al
0000:0dc5  add [bx+si],al
0000:0dc7  add [bx+si],al
0000:0dc9  add [bx+si],al
0000:0dcb  add [bx+si],al
0000:0dcd  add [bx+si],al
0000:0dcf  add [bx+si],al
0000:0dd1  add [bx+si],al
0000:0dd3  add [bx+si],al
0000:0dd5  add [bx+si],al
0000:0dd7  add [bx+si],al
0000:0dd9  add [bx+si],al
0000:0ddb  add [bx+si],al
0000:0ddd  add [bx+si],al
0000:0ddf  add [bx+si],al
0000:0de1  add [bx+si],al
0000:0de3  add [bx+si],al
0000:0de5  add [bx+si],al
0000:0de7  add [bx+si],al
0000:0de9  add [bx+si],al
0000:0deb  add [bx+si],al
0000:0ded  add [bx+si],al
0000:0def  add [bx+si],al
0000:0df1  add [bx+si],al
0000:0df3  add [bx+si],al
0000:0df5  add [bx+si],al
0000:0df7  add [bx+si],al
0000:0df9  add [bx+si],al
0000:0dfb  add [bx+si],al
0000:0dfd  add [bx+si],al
0000:0dff  add [bx+si],al
0000:0e01  add [bx+si],al
0000:0e03  add [bx+si],al
0000:0e05  add [bx+si],al
0000:0e07  add [bx+si],al
0000:0e09  add [bx+si],al
0000:0e0b  add [bx+si],al
0000:0e0d  add [bx+si],al
0000:0e0f  add [bx+si],al
0000:0e11  add [bx+si],al
0000:0e13  add [bx+si],al
0000:0e15  add [bx+si],al
0000:0e17  add [bx+si],al
0000:0e19  add [bx+si],al
0000:0e1b  add [bx+si],al
0000:0e1d  add [bx+si],al
0000:0e1f  add [bx+si],al
0000:0e21  add [bx+si],al
0000:0e23  add [bx+si],al
0000:0e25  add [bx+si],al
0000:0e27  add [bx+si],al
0000:0e29  add [bx+si],al
0000:0e2b  add [bx+si],al
0000:0e2d  add [bx+si],al
0000:0e2f  add [bx+si],al
0000:0e31  add [bx+si],al
0000:0e33  add [bx+si],al
0000:0e35  add [bx+si],al
0000:0e37  add [bx+si],al
0000:0e39  add [bx+si],al
0000:0e3b  add [bx+si],al
0000:0e3d  add [bx+si],al
0000:0e3f  add [bx+si],al
0000:0e41  add [bx+si],al
0000:0e43  add [bx+si],al
0000:0e45  add [bx+si],al
0000:0e47  add [bx+si],al
0000:0e49  add [bx+si],al
0000:0e4b  add [bx+si],al
0000:0e4d  add [bx+si],al
0000:0e4f  add [bx+si],al
0000:0e51  add [bx+si],al
0000:0e53  add [bx+si],al
0000:0e55  add [bx+si],al
0000:0e57  add [bx+si],al
0000:0e59  add [bx+si],al
0000:0e5b  add [bx+si],al
0000:0e5d  add [bx+si],al
0000:0e5f  add [bx+si],al
0000:0e61  add [bx+si],al
0000:0e63  add [bx+si],al
0000:0e65  add [bx+si],al
0000:0e67  add [bx+si],al
0000:0e69  add [bx+si],al
0000:0e6b  add [bx+si],al
0000:0e6d  add [bx+si],al
0000:0e6f  add [bx+si],al
0000:0e71  add [bx+si],al
0000:0e73  add [bx+si],al
0000:0e75  add [bx+si],al
0000:0e77  add [bx+si],al
0000:0e79  add [bx+si],al
0000:0e7b  add [bx+si],al
0000:0e7d  add [bx+si],al
0000:0e7f  add [bx+si],al
0000:0e81  add [bx+si],al
0000:0e83  add [bx+si],al
0000:0e85  add [bx+si],al
0000:0e87  add [bx+si],al
0000:0e89  add [bx+si],al
0000:0e8b  add [bx+si],al
0000:0e8d  add [bx+si],al
0000:0e8f  add [bx+si],al
0000:0e91  add [bx+si],al
0000:0e93  add [bx+si],al
0000:0e95  add [bx+si],al
0000:0e97  add [bx+si],al
0000:0e99  add [bx+si],al
0000:0e9b  add [bx+si],al
0000:0e9d  add [bx+si],al
0000:0e9f  add [bx+si],al
0000:0ea1  add [bx+si],al
0000:0ea3  add [bx+si],al
0000:0ea5  add [bx+si],al
0000:0ea7  add [bx+si],al
0000:0ea9  add [bx+si],al
0000:0eab  add [bx+si],al
0000:0ead  add [bx+si],al
0000:0eaf  add [bx+si],al
0000:0eb1  add [bx+si],al
0000:0eb3  add [bx+si],al
0000:0eb5  add [bx+si],al
0000:0eb7  add [bx+si],al
0000:0eb9  add [bx+si],al
0000:0ebb  add [bx+si],al
0000:0ebd  add [bx+si],al
0000:0ebf  add [bx+si],al
0000:0ec1  add [bx+si],al
0000:0ec3  add [bx+si],al
0000:0ec5  add [bx+si],al
0000:0ec7  add [bx+si],al
0000:0ec9  add [bx+si],al
0000:0ecb  add [bx+si],al
0000:0ecd  add [bx+si],al
0000:0ecf  add [bx+si],al
0000:0ed1  add [bx+si],al
0000:0ed3  add [bx+si],al
0000:0ed5  add [bx+si],al
0000:0ed7  add [bx+si],al
0000:0ed9  add [bx+si],al
0000:0edb  add [bx+si],al
0000:0edd  add [bx+si],al
0000:0edf  add [bx+si],al
0000:0ee1  add [bx+si],al
0000:0ee3  add [bx+si],al
0000:0ee5  add [bx+si],al
0000:0ee7  add [bx+si],al
0000:0ee9  add [bx+si],al
0000:0eeb  add [bx+si],al
0000:0eed  add [bx+si],al
0000:0eef  add [bx+si],al
0000:0ef1  add [bx+si],al
0000:0ef3  add [bx+si],al
0000:0ef5  add [bx+si],al
0000:0ef7  add [bx+si],al
0000:0ef9  add [bx+si],al
0000:0efb  add [bx+si],al
0000:0efd  add [bx+si],al
0000:0eff  add [bx+si],al
0000:0f01  add [bx+si],al
0000:0f03  add [bx+si],al
0000:0f05  add [bx+si],al
0000:0f07  add [bx+si],al
0000:0f09  add [bx+si],al
0000:0f0b  add [bx+si],al
0000:0f0d  add [bx+si],al
0000:0f0f  add [bx+si],al
0000:0f11  add [bx+si],al
0000:0f13  add [bx+si],al
0000:0f15  add [bx+si],al
0000:0f17  add [bx+si],al
0000:0f19  add [bx+si],al
0000:0f1b  add [bx+si],al
0000:0f1d  add [bx+si],al
0000:0f1f  add [bx+si],al
0000:0f21  add [bx+si],al
0000:0f23  add [bx+si],al
0000:0f25  add [bx+si],al
0000:0f27  add [bx+si],al
0000:0f29  add [bx+si],al
0000:0f2b  add [bx+si],al
0000:0f2d  add [bx+si],al
0000:0f2f  add [bx+si],al
0000:0f31  add [bx+si],al
0000:0f33  add [bx+si],al
0000:0f35  add [bx+si],al
0000:0f37  add [bx+si],al
0000:0f39  add [bx+si],al
0000:0f3b  add [bx+si],al
0000:0f3d  add [bx+si],al
0000:0f3f  add [bx+si],al
0000:0f41  add [bx+si],al
0000:0f43  add [bx+si],al
0000:0f45  add [bx+si],al
0000:0f47  add [bx+si],al
0000:0f49  add [bx+si],al
0000:0f4b  add [bx+si],al
0000:0f4d  add [bx+si],al
0000:0f4f  add [bx+si],al
0000:0f51  add [bx+si],al
0000:0f53  add [bx+si],al
0000:0f55  add [bx+si],al
0000:0f57  add [bx+si],al
0000:0f59  add [bx+si],al
0000:0f5b  add [bx+si],al
0000:0f5d  add [bx+si],al
0000:0f5f  add [bx+si],al
0000:0f61  add [bx+si],al
0000:0f63  add [bx+si],al
0000:0f65  add [bx+si],al
0000:0f67  add [bx+si],al
0000:0f69  add [bx+si],al
0000:0f6b  add [bx+si],al
0000:0f6d  add [bx+si],al
0000:0f6f  add [bx+si],al
0000:0f71  add [bx+si],al
0000:0f73  add [bx+si],al
0000:0f75  add [bx+si],al
0000:0f77  add [bx+si],al
0000:0f79  add [bx+si],al
0000:0f7b  add [bx+si],al
0000:0f7d  add [bx+si],al
0000:0f7f  add [bx+si],al
0000:0f81  add [bx+si],al
0000:0f83  add [bx+si],al
0000:0f85  add [bx+si],al
0000:0f87  add [bx+si],al
0000:0f89  add [bx+si],al
0000:0f8b  add [bx+si],al
0000:0f8d  add [bx+si],al
0000:0f8f  add [bx+si],al
0000:0f91  add [bx+si],al
0000:0f93  add [bx+si],al
0000:0f95  add [bx+si],al
0000:0f97  add [bx+si],al
0000:0f99  add [bx+si],al
0000:0f9b  add [bx+si],al
0000:0f9d  add [bx+si],al
0000:0f9f  add [bx+si],al
0000:0fa1  add [bx+si],al
0000:0fa3  add [bx+si],al
0000:0fa5  add [bx+si],al
0000:0fa7  add [bx+si],al
0000:0fa9  add [bx+si],al
0000:0fab  add [bx+si],al
0000:0fad  add [bx+si],al
0000:0faf  add [bx+si],al
0000:0fb1  add [bx+si],al
0000:0fb3  add [bx+si],al
0000:0fb5  add [bx+si],al
0000:0fb7  add [bx+si],al
0000:0fb9  add [bx+si],al
0000:0fbb  add [bx+si],al
0000:0fbd  add [bx+si],al
0000:0fbf  add [bx+si],al
0000:0fc1  add [bx+si],al
0000:0fc3  add [bx+si],al
0000:0fc5  add [bx+si],al
0000:0fc7  add [bx+si],al
0000:0fc9  add [bx+si],al
0000:0fcb  add [bx+si],al
0000:0fcd  add [bx+si],al
0000:0fcf  add [bx+si],al
0000:0fd1  add [bx+si],al
0000:0fd3  add [bx+si],al
0000:0fd5  add [bx+si],al
0000:0fd7  add [bx+si],al
0000:0fd9  add [bx+si],al
0000:0fdb  add [bx+si],al
0000:0fdd  add [bx+si],al
0000:0fdf  add [bx+si],al
0000:0fe1  add [bx+si],al
0000:0fe3  add [bx+si],al
0000:0fe5  add [bx+si],al
0000:0fe7  add [bx+si],al
0000:0fe9  add [bx+si],al
0000:0feb  add [bx+si],al
0000:0fed  add [bx+si],al
0000:0fef  add [bx+si],al
0000:0ff1  add [bx+si],al
0000:0ff3  add [bx+si],al
0000:0ff5  add [bx+si],al
0000:0ff7  add [bx+si],al
0000:0ff9  add [bx+si],al
0000:0ffb  add [bx+si],al
0000:0ffd  add [bx+si],al
0000:0fff  add [bx+si],al
0000:1001  add [bx+si],al
0000:1003  add [bx+si],al
0000:1005  add [bx+si],al
0000:1007  add [bx+si],al
0000:1009  add [bx+si],al
0000:100b  add [bx+si],al
0000:100d  add [bx+si],al
0000:100f  add [bx+si],al
0000:1011  add [bx+si],al
0000:1013  add [bx+si],al
0000:1015  add [bx+si],al
0000:1017  add [bx+si],al
0000:1019  add [bx+si],al
0000:101b  add [bx+si],al
0000:101d  add [bx+si],al
0000:101f  add [bx+si],al
0000:1021  add [bx+si],al
0000:1023  add [bx+si],al
0000:1025  add [bx+si],al
0000:1027  add [bx+si],al

; Candidate 0000:47f1, file offset 0x79f1
0000:47f1  push ds
0000:47f2  push es
0000:47f3  push si
0000:47f4  push di
0000:47f5  mov ax,cs
0000:47f7  mov ds,ax
0000:47f9  xor bx,bx
0000:47fb  mov bx,[bx+24Ch]
0000:47ff  mov [43DEh],bx
0000:4803  cli
0000:4804  mov ax,3508h
0000:4807  int 21h
0000:4809  mov [43E2h],es
0000:480d  mov [43E0h],bx
0000:4811  mov dx,46E0h
0000:4814  mov ax,2508h
0000:4817  int 21h
0000:4819  call 49B5h
0000:481c  mov al,36h
0000:481e  out 43h,al
0000:4820  jmp short 4822h
0000:4822  mov al,55h
0000:4824  out 40h,al
0000:4826  jmp short 4828h
0000:4828  mov al,5
0000:482a  out 40h,al
0000:482c  in al,61h
0000:482e  and al,0FEh
0000:4830  out 61h,al
0000:4832  mov word ptr [43FBh],0
0000:4838  mov word ptr [43F9h],0
0000:483e  sti
0000:483f  pop di
0000:4840  pop si
0000:4841  pop es
0000:4842  pop ds
0000:4843  ret far

; Candidate 0000:4844, file offset 0x7a44
0000:4844  push ds
0000:4845  mov ax,cs
0000:4847  mov ds,ax
0000:4849  push ds
0000:484a  cli
0000:484b  mov dx,[43E0h]
0000:484f  mov ax,[43E2h]
0000:4852  mov ds,ax
0000:4854  mov ax,2508h
0000:4857  int 21h
0000:4859  sti
0000:485a  pop ds
0000:485b  call 49B5h
0000:485e  mov al,36h
0000:4860  out 43h,al
0000:4862  jmp short 4864h
0000:4864  mov al,0
0000:4866  out 40h,al
0000:4868  jmp short 486Ah
0000:486a  out 40h,al
0000:486c  pop ds
0000:486d  ret far

; Candidate 0000:4886, file offset 0x7a86
0000:4886  push bp
0000:4887  mov bp,sp
0000:4889  push ds
0000:488a  mov bx,cs
0000:488c  mov ds,bx
0000:488e  mov bx,[43F9h]
0000:4892  mov ax,[bp+6]
0000:4895  mov [bx+43FDh],ax
0000:4899  inc bx
0000:489a  and bx,0Fh
0000:489d  mov [43F9h],bx
0000:48a1  pop ds
0000:48a2  mov sp,bp
0000:48a4  pop bp
0000:48a5  ret far

; Candidate 0000:5a5f, file offset 0x8c5f
0000:5a5f  push bp
0000:5a60  mov bp,sp
0000:5a62  push si
0000:5a63  mov si,[bp+6]
0000:5a66  or si,si
0000:5a68  jl short 5A6Fh
0000:5a6a  cmp si,14h
0000:5a6d  jl short 5A78h
0000:5a6f  mov ax,6
0000:5a72  push ax
0000:5a73  call 6F51h
0000:5a76  jmp short 5A89h
0000:5a78  mov bx,si
0000:5a7a  shl bx,1
0000:5a7c  mov word ptr [bx+6934h],0FFFFh
0000:5a82  push si
0000:5a83  call far 6C2Ch,0
0000:5a88  pop cx
0000:5a89  pop si
0000:5a8a  pop bp
0000:5a8b  ret far

; Candidate 0000:5a8d, file offset 0x8c8d
0000:5a8d  push bp
0000:5a8e  mov bp,sp
0000:5a90  jmp short 5A9Eh
0000:5a92  mov bx,[6692h]
0000:5a96  shl bx,1
0000:5a98  shl bx,1
0000:5a9a  call far dword ptr [bx-0DAAh]
0000:5a9e  mov ax,[6692h]
0000:5aa1  dec word ptr [6692h]
0000:5aa5  or ax,ax
0000:5aa7  jne short 5A92h
0000:5aa9  push word ptr [bp+6]
0000:5aac  call 0107h
0000:5aaf  pop cx
0000:5ab0  pop bp
0000:5ab1  ret far

; Candidate 0000:5bde, file offset 0x8dde
0000:5bde  push bp
0000:5bdf  mov bp,sp
0000:5be1  sub sp,4
0000:5be4  mov word ptr [bp-2],0
0000:5be9  mov word ptr [bp-4],0
0000:5bee  mov dx,[8Fh]
0000:5bf2  mov ax,[8Dh]
0000:5bf5  mov cx,[8Bh]
0000:5bf9  mov bx,[89h]
0000:5bfd  call 869Eh
0000:5c00  mov [bp-2],dx
0000:5c03  mov [bp-4],ax
0000:5c06  cmp word ptr [bp-2],0
0000:5c0a  jb short 5C1Ch
0000:5c0c  ja short 5C14h
0000:5c0e  cmp word ptr [bp-4],10h
0000:5c12  jbe short 5C1Ch
0000:5c14  sub word ptr [bp-4],10h
0000:5c18  sbb word ptr [bp-2],0
0000:5c1c  and word ptr [bp-4],0FFF0h
0000:5c21  and word ptr [bp-2],0FFFFh
0000:5c26  mov dx,[bp-2]
0000:5c29  mov ax,[bp-4]
0000:5c2c  mov sp,bp
0000:5c2e  pop bp
0000:5c2f  ret far

; Candidate 0000:5c30, file offset 0x8e30
0000:5c30  push bp
0000:5c31  mov bp,sp
0000:5c33  push si
0000:5c34  mov ax,[bp+6]
0000:5c37  or ax,[bp+8]
0000:5c3a  jne short 5C44h
0000:5c3c  call far 5CFBh,0
0000:5c41  jmp 5CF6h
0000:5c44  les bx,[bp+6]
0000:5c47  mov ax,es:[bx+12h]
0000:5c4b  cmp ax,[bp+6]
0000:5c4e  je short 5C56h
0000:5c50  mov ax,0FFFFh
0000:5c53  jmp 5CF8h
0000:5c56  les bx,[bp+6]
0000:5c59  cmp word ptr es:[bx],0
0000:5c5d  jl short 5CADh
0000:5c5f  test word ptr es:[bx+2],8
0000:5c65  jne short 5C7Ch
0000:5c67  mov ax,es:[bx+0Eh]
0000:5c6b  mov dx,[bp+6]
0000:5c6e  add dx,5
0000:5c71  cmp ax,[bp+8]
0000:5c74  jne short 5CABh
0000:5c76  cmp es:[bx+0Ch],dx
0000:5c7a  jne short 5CABh
0000:5c7c  les bx,[bp+6]
0000:5c7f  mov word ptr es:[bx],0
0000:5c84  mov ax,es:[bx+0Eh]
0000:5c88  mov dx,[bp+6]
0000:5c8b  add dx,5
0000:5c8e  cmp ax,[bp+8]
0000:5c91  jne short 5CABh
0000:5c93  cmp es:[bx+0Ch],dx
0000:5c97  jne short 5CABh
0000:5c99  mov ax,es:[bx+0Ah]
0000:5c9d  mov dx,es:[bx+8]
0000:5ca1  mov es:[bx+0Eh],ax
0000:5ca5  mov es:[bx+0Ch],dx
0000:5ca9  jmp short 5CF6h
0000:5cab  jmp short 5CF6h
0000:5cad  les bx,[bp+6]
0000:5cb0  mov ax,es:[bx+6]
0000:5cb4  add ax,es:[bx]
0000:5cb7  inc ax
0000:5cb8  mov si,ax
0000:5cba  sub es:[bx],si
0000:5cbd  push si
0000:5cbe  mov ax,es:[bx+0Ah]
0000:5cc2  mov dx,es:[bx+8]
0000:5cc6  mov es:[bx+0Eh],ax
0000:5cca  mov es:[bx+0Ch],dx
0000:5cce  push ax
0000:5ccf  push dx
0000:5cd0  mov al,es:[bx+4]
0000:5cd4  cbw
0000:5cd5  push ax
0000:5cd6  call far 691Fh,0
0000:5cdb  add sp,8
0000:5cde  cmp ax,si
0000:5ce0  je short 5CF6h
0000:5ce2  les bx,[bp+6]
0000:5ce5  test word ptr es:[bx+2],200h
0000:5ceb  jne short 5CF6h
0000:5ced  or word ptr es:[bx+2],10h
0000:5cf3  jmp 5C50h
0000:5cf6  xor ax,ax
0000:5cf8  pop si
0000:5cf9  pop bp
0000:5cfa  ret far

; Candidate 0000:5cfb, file offset 0x8efb
0000:5cfb  push bp
0000:5cfc  mov bp,sp
0000:5cfe  sub sp,4
0000:5d01  push si
0000:5d02  push di
0000:5d03  xor di,di
0000:5d05  mov si,14h
0000:5d08  mov [bp-2],ds
0000:5d0b  mov word ptr [bp-4],67A4h
0000:5d10  jmp short 5D2Fh
0000:5d12  les bx,[bp-4]
0000:5d15  test word ptr es:[bx+2],3
0000:5d1b  je short 5D2Bh
0000:5d1d  push word ptr [bp-2]
0000:5d20  push word ptr [bp-4]
0000:5d23  call far 5C30h,0
0000:5d28  pop cx
0000:5d29  pop cx
0000:5d2a  inc di
0000:5d2b  add word ptr [bp-4],14h
0000:5d2f  mov ax,si
0000:5d31  dec si
0000:5d32  or ax,ax
0000:5d34  jne short 5D12h
0000:5d36  mov ax,di
0000:5d38  pop di
0000:5d39  pop si
0000:5d3a  mov sp,bp
0000:5d3c  pop bp
0000:5d3d  ret far

; Candidate 0000:5dc2, file offset 0x8fc2
0000:5dc2  push bp
0000:5dc3  mov bp,sp
0000:5dc5  push si
0000:5dc6  mov si,[bp+0Eh]
0000:5dc9  push word ptr [bp+8]
0000:5dcc  push word ptr [bp+6]
0000:5dcf  call far 5C30h,0
0000:5dd4  pop cx
0000:5dd5  pop cx
0000:5dd6  or ax,ax
0000:5dd8  je short 5DDFh
0000:5dda  mov ax,0FFFFh
0000:5ddd  jmp short 5E41h
0000:5ddf  cmp si,1
0000:5de2  jne short 5DFDh
0000:5de4  les bx,[bp+6]
0000:5de7  cmp word ptr es:[bx],0
0000:5deb  jle short 5DFDh
0000:5ded  push word ptr [bp+8]
0000:5df0  push word ptr [bp+6]
0000:5df3  call 5D3Eh
0000:5df6  cwd
0000:5df7  sub [bp+0Ah],ax
0000:5dfa  sbb [bp+0Ch],dx
0000:5dfd  les bx,[bp+6]
0000:5e00  and word ptr es:[bx+2],0FE5Fh
0000:5e06  mov word ptr es:[bx],0
0000:5e0b  mov ax,es:[bx+0Ah]
0000:5e0f  mov dx,es:[bx+8]
0000:5e13  mov es:[bx+0Eh],ax
0000:5e17  mov es:[bx+0Ch],dx
0000:5e1b  push si
0000:5e1c  push word ptr [bp+0Ch]
0000:5e1f  push word ptr [bp+0Ah]
0000:5e22  mov al,es:[bx+4]
0000:5e26  cbw
0000:5e27  push ax
0000:5e28  call far 6F9Fh,0
0000:5e2d  add sp,8
0000:5e30  cmp dx,0FFFFh
0000:5e33  jne short 5E3Fh
0000:5e35  cmp ax,0FFFFh
0000:5e38  jne short 5E3Fh
0000:5e3a  mov ax,0FFFFh
0000:5e3d  jmp short 5E41h
0000:5e3f  xor ax,ax
0000:5e41  pop si
0000:5e42  pop bp
0000:5e43  ret far

; Candidate 0000:5e94, file offset 0x9094
0000:5e94  push bp
0000:5e95  mov bp,sp
0000:5e97  sub sp,44h
0000:5e9a  push si
0000:5e9b  mov si,[bp+0Ah]
0000:5e9e  call far 6B35h,0
0000:5ea3  add al,41h
0000:5ea5  mov [bp-44h],al
0000:5ea8  mov byte ptr [bp-43h],3Ah
0000:5eac  mov byte ptr [bp-42h],5Ch
0000:5eb0  push ss
0000:5eb1  lea ax,[bp-41h]
0000:5eb4  push ax
0000:5eb5  xor ax,ax
0000:5eb7  push ax
0000:5eb8  call far 6D08h,0
0000:5ebd  add sp,6
0000:5ec0  cmp ax,0FFFFh
0000:5ec3  jne short 5ECBh
0000:5ec5  xor dx,dx
0000:5ec7  xor ax,ax
0000:5ec9  jmp short 5F1Dh
0000:5ecb  push ss
0000:5ecc  lea ax,[bp-44h]
0000:5ecf  push ax
0000:5ed0  call far 7599h,0
0000:5ed5  pop cx
0000:5ed6  pop cx
0000:5ed7  cmp ax,si
0000:5ed9  jb short 5EE3h
0000:5edb  mov word ptr [7Fh],22h
0000:5ee1  jmp short 5EC5h
0000:5ee3  mov ax,[bp+6]
0000:5ee6  or ax,[bp+8]
0000:5ee9  jne short 5F04h
0000:5eeb  push si
0000:5eec  call far 80D8h,0
0000:5ef1  pop cx
0000:5ef2  mov [bp+8],dx
0000:5ef5  mov [bp+6],ax
0000:5ef8  or ax,dx
0000:5efa  jne short 5F04h
0000:5efc  mov word ptr [7Fh],8
0000:5f02  jmp short 5EC5h
0000:5f04  push ss
0000:5f05  lea ax,[bp-44h]
0000:5f08  push ax
0000:5f09  push word ptr [bp+8]
0000:5f0c  push word ptr [bp+6]
0000:5f0f  call far 7570h,0
0000:5f14  add sp,8
0000:5f17  mov dx,[bp+8]
0000:5f1a  mov ax,[bp+6]
0000:5f1d  pop si
0000:5f1e  mov sp,bp
0000:5f20  pop bp
0000:5f21  ret far

; Candidate 0000:5f22, file offset 0x9122
0000:5f22  push bp
0000:5f23  mov bp,sp
0000:5f25  mov ah,2Ah
0000:5f27  int 21h
0000:5f29  les bx,[bp+6]
0000:5f2c  mov es:[bx],cx
0000:5f2f  mov es:[bx+2],dx
0000:5f33  pop bp
0000:5f34  ret far

; Candidate 0000:5f35, file offset 0x9135
0000:5f35  push bp
0000:5f36  mov bp,sp
0000:5f38  mov ah,2Ch
0000:5f3a  int 21h
0000:5f3c  les bx,[bp+6]
0000:5f3f  mov es:[bx],cx
0000:5f42  mov es:[bx+2],dx
0000:5f46  pop bp
0000:5f47  ret far

; Candidate 0000:5f48, file offset 0x9148
0000:5f48  push bp
0000:5f49  mov bp,sp
0000:5f4b  mov ax,60F0h
0000:5f4e  push ax
0000:5f4f  push ds
0000:5f50  mov ax,67B8h
0000:5f53  push ax
0000:5f54  push word ptr [bp+8]
0000:5f57  push word ptr [bp+6]
0000:5f5a  lea ax,[bp+0Ah]
0000:5f5d  push ax
0000:5f5e  call 799Ah
0000:5f61  pop bp
0000:5f62  ret far

; Candidate 0000:5f81, file offset 0x9181
0000:5f81  push bp
0000:5f82  mov bp,sp
0000:5f84  push si
0000:5f85  mov al,[bp+6]
0000:5f88  mov [0F2D6h],al
0000:5f8b  les bx,[bp+8]
0000:5f8e  cmp word ptr es:[bx],0FFFFh
0000:5f92  jge short 5FDFh
0000:5f94  inc word ptr es:[bx]
0000:5f97  mov ax,es:[bx+0Eh]
0000:5f9b  mov si,es:[bx+0Ch]
0000:5f9f  inc word ptr es:[bx+0Ch]
0000:5fa3  mov dl,[0F2D6h]
0000:5fa7  mov es,ax
0000:5fa9  mov es:[si],dl
0000:5fac  mov es,[bp+0Ah]
0000:5faf  test word ptr es:[bx+2],8
0000:5fb5  je short 5FDCh
0000:5fb7  cmp byte ptr [0F2D6h],0Ah
0000:5fbc  je short 5FC5h
0000:5fbe  cmp byte ptr [0F2D6h],0Dh
0000:5fc3  jne short 5FDCh
0000:5fc5  push word ptr [bp+0Ah]
0000:5fc8  push word ptr [bp+8]
0000:5fcb  call far 5C30h,0
0000:5fd0  pop cx
0000:5fd1  pop cx
0000:5fd2  or ax,ax
0000:5fd4  je short 5FDCh
0000:5fd6  mov ax,0FFFFh
0000:5fd9  jmp 60D6h
0000:5fdc  jmp 60D1h
0000:5fdf  les bx,[bp+8]
0000:5fe2  test word ptr es:[bx+2],90h
0000:5fe8  jne short 5FF2h
0000:5fea  test word ptr es:[bx+2],2
0000:5ff0  jne short 5FFDh
0000:5ff2  les bx,[bp+8]
0000:5ff5  or word ptr es:[bx+2],10h
0000:5ffb  jmp short 5FD6h
0000:5ffd  les bx,[bp+8]
0000:6000  or word ptr es:[bx+2],100h
0000:6006  cmp word ptr es:[bx+6],0
0000:600b  je short 6076h
0000:600d  cmp word ptr es:[bx],0
0000:6011  je short 6026h
0000:6013  push word ptr [bp+0Ah]
0000:6016  push word ptr [bp+8]
0000:6019  call far 5C30h,0
0000:601e  pop cx
0000:601f  pop cx
0000:6020  or ax,ax
0000:6022  je short 6026h
0000:6024  jmp short 5FD6h
0000:6026  les bx,[bp+8]
0000:6029  mov ax,es:[bx+6]
0000:602d  neg ax
0000:602f  mov es:[bx],ax
0000:6032  mov ax,es:[bx+0Eh]
0000:6036  mov si,es:[bx+0Ch]
0000:603a  inc word ptr es:[bx+0Ch]
0000:603e  mov dl,[0F2D6h]
0000:6042  mov es,ax
0000:6044  mov es:[si],dl
0000:6047  mov es,[bp+0Ah]
0000:604a  test word ptr es:[bx+2],8
0000:6050  je short 6074h
0000:6052  cmp byte ptr [0F2D6h],0Ah
0000:6057  je short 6060h
0000:6059  cmp byte ptr [0F2D6h],0Dh
0000:605e  jne short 6074h
0000:6060  push word ptr [bp+0Ah]
0000:6063  push word ptr [bp+8]
0000:6066  call far 5C30h,0
0000:606b  pop cx
0000:606c  pop cx
0000:606d  or ax,ax
0000:606f  je short 6074h
0000:6071  jmp 5FD6h
0000:6074  jmp short 60D1h
0000:6076  cmp byte ptr [0F2D6h],0Ah
0000:607b  jne short 60A4h
0000:607d  les bx,[bp+8]
0000:6080  test word ptr es:[bx+2],40h
0000:6086  jne short 60A4h
0000:6088  mov ax,1
0000:608b  push ax
0000:608c  push ds
0000:608d  mov ax,6960h
0000:6090  push ax
0000:6091  mov al,es:[bx+4]
0000:6095  cbw
0000:6096  push ax
0000:6097  call far 7E69h,0
0000:609c  add sp,8
0000:609f  cmp ax,1
0000:60a2  jne short 60C3h
0000:60a4  mov ax,1
0000:60a7  push ax
0000:60a8  push ds
0000:60a9  mov ax,0F2D6h
0000:60ac  push ax
0000:60ad  les bx,[bp+8]
0000:60b0  mov al,es:[bx+4]
0000:60b4  cbw
0000:60b5  push ax
0000:60b6  call far 7E69h,0
0000:60bb  add sp,8
0000:60be  cmp ax,1
0000:60c1  je short 60D1h
0000:60c3  les bx,[bp+8]
0000:60c6  test word ptr es:[bx+2],200h
0000:60cc  jne short 60D1h
0000:60ce  jmp 5FF2h
0000:60d1  mov al,[0F2D6h]
0000:60d4  mov ah,0
0000:60d6  pop si
0000:60d7  pop bp
0000:60d8  ret far

; Candidate 0000:6292, file offset 0x9492
0000:6292  push bp
0000:6293  mov bp,sp
0000:6295  mov ax,[bp+6]
0000:6298  mov word ptr [6964h],0
0000:629e  mov [6962h],ax
0000:62a1  pop bp
0000:62a2  ret far

; Candidate 0000:62a3, file offset 0x94a3
0000:62a3  mov cx,[6964h]
0000:62a7  mov bx,[6962h]
0000:62ab  mov dx,15Ah
0000:62ae  mov ax,4E35h
0000:62b1  call 86E5h
0000:62b4  add ax,1
0000:62b7  adc dx,0
0000:62ba  mov [6964h],dx
0000:62be  mov [6962h],ax
0000:62c1  mov ax,[6964h]
0000:62c4  cwd
0000:62c5  and ax,7FFFh
0000:62c8  ret far

; Candidate 0000:6342, file offset 0x9542
0000:6342  push bp
0000:6343  mov bp,sp
0000:6345  push si
0000:6346  push di
0000:6347  mov di,[bp+0Eh]
0000:634a  mov si,[bp+10h]
0000:634d  les bx,[bp+6]
0000:6350  mov ax,es:[bx+12h]
0000:6354  cmp ax,[bp+6]
0000:6357  jne short 6364h
0000:6359  cmp di,2
0000:635c  jg short 6364h
0000:635e  cmp si,7FFFh
0000:6362  jbe short 636Ah
0000:6364  mov ax,0FFFFh
0000:6367  jmp 645Dh
0000:636a  cmp word ptr [6968h],0
0000:636f  jne short 6380h
0000:6371  cmp word ptr [bp+6],67B8h
0000:6376  jne short 6380h
0000:6378  mov word ptr [6968h],1
0000:637e  jmp short 6394h
0000:6380  cmp word ptr [6966h],0
0000:6385  jne short 6394h
0000:6387  cmp word ptr [bp+6],67A4h
0000:638c  jne short 6394h
0000:638e  mov word ptr [6966h],1
0000:6394  les bx,[bp+6]
0000:6397  cmp word ptr es:[bx],0
0000:639b  je short 63B5h
0000:639d  mov ax,1
0000:63a0  push ax
0000:63a1  xor ax,ax
0000:63a3  xor dx,dx
0000:63a5  push ax
0000:63a6  push dx
0000:63a7  push word ptr [bp+8]
0000:63aa  push word ptr [bp+6]
0000:63ad  call far 5DC2h,0
0000:63b2  add sp,0Ah
0000:63b5  les bx,[bp+6]
0000:63b8  test word ptr es:[bx+2],4
0000:63be  je short 63CFh
0000:63c0  push word ptr es:[bx+0Ah]
0000:63c4  push word ptr es:[bx+8]
0000:63c8  call far 7FF2h,0
0000:63cd  pop cx
0000:63ce  pop cx
0000:63cf  les bx,[bp+6]
0000:63d2  and word ptr es:[bx+2],0FFF3h
0000:63d8  mov word ptr es:[bx+6],0
0000:63de  mov ax,[bp+8]
0000:63e1  mov dx,[bp+6]
0000:63e4  add dx,5
0000:63e7  mov es:[bx+0Ah],ax
0000:63eb  mov es:[bx+8],dx
0000:63ef  mov es:[bx+0Eh],ax
0000:63f3  mov es:[bx+0Ch],dx
0000:63f7  cmp di,2
0000:63fa  je short 645Bh
0000:63fc  or si,si
0000:63fe  jbe short 645Bh
0000:6400  mov word ptr [6798h],0
0000:6406  mov word ptr [6796h],6A4Dh
0000:640c  mov ax,[bp+0Ah]
0000:640f  or ax,[bp+0Ch]
0000:6412  jne short 6433h
0000:6414  push si
0000:6415  call far 80D8h,0
0000:641a  pop cx
0000:641b  mov [bp+0Ch],dx
0000:641e  mov [bp+0Ah],ax
0000:6421  or ax,dx
0000:6423  je short 6430h
0000:6425  les bx,[bp+6]
0000:6428  or word ptr es:[bx+2],4
0000:642e  jmp short 6433h
0000:6430  jmp 6364h
0000:6433  les bx,[bp+6]
0000:6436  mov ax,[bp+0Ch]
0000:6439  mov dx,[bp+0Ah]
0000:643c  mov es:[bx+0Eh],ax
0000:6440  mov es:[bx+0Ch],dx
0000:6444  mov es:[bx+0Ah],ax
0000:6448  mov es:[bx+8],dx
0000:644c  mov es:[bx+6],si
0000:6450  cmp di,1
0000:6453  jne short 645Bh
0000:6455  or word ptr es:[bx+2],8
0000:645b  xor ax,ax
0000:645d  pop di
0000:645e  pop si
0000:645f  pop bp
0000:6460  ret far

; Candidate 0000:64a1, file offset 0x96a1
0000:64a1  push bp
0000:64a2  mov bp,sp
0000:64a4  les bx,[bp+6]
0000:64a7  mov byte ptr es:[bx],0
0000:64ab  mov ax,6461h
0000:64ae  push ax
0000:64af  push ss
0000:64b0  lea ax,[bp+6]
0000:64b3  push ax
0000:64b4  push word ptr [bp+0Ch]
0000:64b7  push word ptr [bp+0Ah]
0000:64ba  lea ax,[bp+0Eh]
0000:64bd  push ax
0000:64be  call 799Ah
0000:64c1  pop bp
0000:64c2  ret far

; Candidate 0000:6524, file offset 0x9724
0000:6524  push bp
0000:6525  mov bp,sp
0000:6527  sub sp,0Ch
0000:652a  push ss
0000:652b  lea ax,[bp-4]
0000:652e  push ax
0000:652f  call far 5F22h,0
0000:6534  pop cx
0000:6535  pop cx
0000:6536  push ss
0000:6537  lea ax,[bp-8]
0000:653a  push ax
0000:653b  call far 5F35h,0
0000:6540  pop cx
0000:6541  pop cx
0000:6542  push ss
0000:6543  lea ax,[bp-8]
0000:6546  push ax
0000:6547  push ss
0000:6548  lea ax,[bp-4]
0000:654b  push ax
0000:654c  call far 6596h,0
0000:6551  add sp,8
0000:6554  mov [bp-0Ah],dx
0000:6557  mov [bp-0Ch],ax
0000:655a  mov ax,[bp+6]
0000:655d  or ax,[bp+8]
0000:6560  je short 6572h
0000:6562  les bx,[bp+6]
0000:6565  mov ax,[bp-0Ah]
0000:6568  mov dx,[bp-0Ch]
0000:656b  mov es:[bx+2],ax
0000:656f  mov es:[bx],dx
0000:6572  mov dx,[bp-0Ah]
0000:6575  mov ax,[bp-0Ch]
0000:6578  mov sp,bp
0000:657a  pop bp
0000:657b  ret far

; Candidate 0000:657c, file offset 0x977c
0000:657c  push bp
0000:657d  mov bp,sp
0000:657f  mov ax,1
0000:6582  push ax
0000:6583  xor ax,ax
0000:6585  xor dx,dx
0000:6587  push ax
0000:6588  push dx
0000:6589  push word ptr [bp+6]
0000:658c  call far 6F9Fh,0
0000:6591  add sp,8
0000:6594  pop bp
0000:6595  ret far

; Candidate 0000:6596, file offset 0x9796
0000:6596  push bp
0000:6597  mov bp,sp
0000:6599  sub sp,6
0000:659c  push si
0000:659d  push di
0000:659e  call far 769Fh,0
0000:65a3  mov ax,[69F8h]
0000:65a6  mov dx,[69F6h]
0000:65aa  add dx,0A600h
0000:65ae  adc ax,12CEh
0000:65b1  mov [bp-2],ax
0000:65b4  mov [bp-4],dx
0000:65b7  les bx,[bp+6]
0000:65ba  mov ax,es:[bx]
0000:65bd  add ax,0F844h
0000:65c0  mov si,ax
0000:65c2  sar ax,1
0000:65c4  sar ax,1
0000:65c6  cwd
0000:65c7  push ax
0000:65c8  push dx
0000:65c9  mov dx,786h
0000:65cc  mov ax,1F80h
0000:65cf  pop cx
0000:65d0  pop bx
0000:65d1  call 86E5h
0000:65d4  add [bp-4],ax
0000:65d7  adc [bp-2],dx
0000:65da  mov ax,si
0000:65dc  and ax,3
0000:65df  cwd
0000:65e0  push ax
0000:65e1  push dx
0000:65e2  mov dx,1E1h
0000:65e5  mov ax,3380h
0000:65e8  pop cx
0000:65e9  pop bx
0000:65ea  call 86E5h
0000:65ed  add [bp-4],ax
0000:65f0  adc [bp-2],dx
0000:65f3  test si,3
0000:65f7  je short 6602h
0000:65f9  add word ptr [bp-4],5180h
0000:65fe  adc word ptr [bp-2],1
0000:6602  xor di,di
0000:6604  les bx,[bp+6]
0000:6607  mov al,es:[bx+3]
0000:660b  cbw
0000:660c  dec ax
0000:660d  mov si,ax
0000:660f  jmp short 6619h
0000:6611  dec si
0000:6612  mov al,[si+696Ch]
0000:6616  cbw
0000:6617  add di,ax
0000:6619  or si,si
0000:661b  jg short 6611h
0000:661d  les bx,[bp+6]
0000:6620  mov al,es:[bx+2]
0000:6624  cbw
0000:6625  dec ax
0000:6626  add di,ax
0000:6628  cmp byte ptr es:[bx+3],2
0000:662d  jle short 6637h
0000:662f  test word ptr es:[bx],3
0000:6634  jne short 6637h
0000:6636  inc di
0000:6637  mov ax,di
0000:6639  mov dx,18h
0000:663c  imul dx
0000:663e  les bx,[bp+0Ah]
0000:6641  mov dl,es:[bx+1]
0000:6645  mov dh,0
0000:6647  add ax,dx
0000:6649  mov [bp-6],ax
0000:664c  cmp word ptr [69FAh],0
0000:6651  je short 6672h
0000:6653  mov al,es:[bx+1]
0000:6657  mov ah,0
0000:6659  push ax
0000:665a  push di
0000:665b  xor ax,ax
0000:665d  push ax
0000:665e  les bx,[bp+6]
0000:6661  mov ax,es:[bx]
0000:6664  add ax,0F84Eh
0000:6667  push ax
0000:6668  call 788Bh
0000:666b  or ax,ax
0000:666d  je short 6672h
0000:666f  dec word ptr [bp-6]
0000:6672  mov ax,[bp-6]
0000:6675  cwd
0000:6676  push ax
0000:6677  push dx
0000:6678  xor dx,dx
0000:667a  mov ax,0E10h
0000:667d  pop cx
0000:667e  pop bx
0000:667f  call 86E5h
0000:6682  add [bp-4],ax
0000:6685  adc [bp-2],dx
0000:6688  les bx,[bp+0Ah]
0000:668b  mov al,es:[bx]
0000:668e  mov ah,0
0000:6690  cwd
0000:6691  push ax
0000:6692  push dx
0000:6693  xor dx,dx
0000:6695  mov ax,3Ch
0000:6698  pop cx
0000:6699  pop bx
0000:669a  call 86E5h
0000:669d  les bx,[bp+0Ah]
0000:66a0  mov bl,es:[bx+3]
0000:66a4  mov bh,0
0000:66a6  push ax
0000:66a7  mov ax,bx
0000:66a9  push dx
0000:66aa  cwd
0000:66ab  pop bx
0000:66ac  pop cx
0000:66ad  add cx,ax
0000:66af  adc bx,dx
0000:66b1  add [bp-4],cx
0000:66b4  adc [bp-2],bx
0000:66b7  mov dx,[bp-2]
0000:66ba  mov ax,[bp-4]
0000:66bd  pop di
0000:66be  pop si
0000:66bf  mov sp,bp
0000:66c1  pop bp
0000:66c2  ret far

; Candidate 0000:66c3, file offset 0x98c3
0000:66c3  push bp
0000:66c4  mov bp,sp
0000:66c6  call far 769Fh,0
0000:66cb  mov ax,[69F8h]
0000:66ce  mov dx,[69F6h]
0000:66d2  add dx,0A600h
0000:66d6  adc ax,12CEh
0000:66d9  sub [bp+6],dx
0000:66dc  sbb [bp+8],ax
0000:66df  les bx,[bp+0Eh]
0000:66e2  mov byte ptr es:[bx+2],0
0000:66e7  xor ax,ax
0000:66e9  mov dx,3Ch
0000:66ec  push ax
0000:66ed  push dx
0000:66ee  push word ptr [bp+8]
0000:66f1  push word ptr [bp+6]
0000:66f4  call 855Dh
0000:66f7  les bx,[bp+0Eh]
0000:66fa  mov es:[bx+3],al
0000:66fe  xor ax,ax
0000:6700  mov dx,3Ch
0000:6703  push ax
0000:6704  push dx
0000:6705  push word ptr [bp+8]
0000:6708  push word ptr [bp+6]
0000:670b  call 854Eh
0000:670e  mov [bp+8],dx
0000:6711  mov [bp+6],ax
0000:6714  xor ax,ax
0000:6716  mov dx,3Ch
0000:6719  push ax
0000:671a  push dx
0000:671b  push word ptr [bp+8]
0000:671e  push word ptr [bp+6]
0000:6721  call 855Dh
0000:6724  les bx,[bp+0Eh]
0000:6727  mov es:[bx],al
0000:672a  xor ax,ax
0000:672c  mov dx,3Ch
0000:672f  push ax
0000:6730  push dx
0000:6731  push word ptr [bp+8]
0000:6734  push word ptr [bp+6]
0000:6737  call 854Eh
0000:673a  mov [bp+8],dx
0000:673d  mov [bp+6],ax
0000:6740  xor ax,ax
0000:6742  mov dx,88F8h
0000:6745  push ax
0000:6746  push dx
0000:6747  push word ptr [bp+8]
0000:674a  push word ptr [bp+6]
0000:674d  call 854Eh
0000:6750  shl ax,1
0000:6752  shl ax,1
0000:6754  add ax,7BCh
0000:6757  les bx,[bp+0Ah]
0000:675a  mov es:[bx],ax
0000:675d  xor ax,ax
0000:675f  mov dx,88F8h
0000:6762  push ax
0000:6763  push dx
0000:6764  push word ptr [bp+8]
0000:6767  push word ptr [bp+6]
0000:676a  call 855Dh
0000:676d  mov [bp+8],dx
0000:6770  mov [bp+6],ax
0000:6773  cmp word ptr [bp+8],0
0000:6777  jl short 67BDh
0000:6779  jg short 6782h
0000:677b  cmp word ptr [bp+6],2250h
0000:6780  jbe short 67BDh
0000:6782  sub word ptr [bp+6],2250h
0000:6787  sbb word ptr [bp+8],0
0000:678b  les bx,[bp+0Ah]
0000:678e  inc word ptr es:[bx]
0000:6791  xor ax,ax
0000:6793  mov dx,2238h
0000:6796  push ax
0000:6797  push dx
0000:6798  push word ptr [bp+8]
0000:679b  push word ptr [bp+6]
0000:679e  call 854Eh
0000:67a1  les bx,[bp+0Ah]
0000:67a4  add es:[bx],ax
0000:67a7  xor ax,ax
0000:67a9  mov dx,2238h
0000:67ac  push ax
0000:67ad  push dx
0000:67ae  push word ptr [bp+8]
0000:67b1  push word ptr [bp+6]
0000:67b4  call 855Dh
0000:67b7  mov [bp+8],dx
0000:67ba  mov [bp+6],ax
0000:67bd  cmp word ptr [69FAh],0
0000:67c2  je short 6802h
0000:67c4  xor ax,ax
0000:67c6  mov dx,18h
0000:67c9  push ax
0000:67ca  push dx
0000:67cb  push word ptr [bp+8]
0000:67ce  push word ptr [bp+6]
0000:67d1  call 855Dh
0000:67d4  push ax
0000:67d5  xor ax,ax
0000:67d7  mov dx,18h
0000:67da  push ax
0000:67db  push dx
0000:67dc  push word ptr [bp+8]
0000:67df  push word ptr [bp+6]
0000:67e2  call 854Eh
0000:67e5  push ax
0000:67e6  xor ax,ax
0000:67e8  push ax
0000:67e9  les bx,[bp+0Ah]
0000:67ec  mov ax,es:[bx]
0000:67ef  add ax,0F84Eh
0000:67f2  push ax
0000:67f3  call 788Bh
0000:67f6  or ax,ax
0000:67f8  je short 6802h
0000:67fa  add word ptr [bp+6],1
0000:67fe  adc word ptr [bp+8],0
0000:6802  xor ax,ax
0000:6804  mov dx,18h
0000:6807  push ax
0000:6808  push dx
0000:6809  push word ptr [bp+8]
0000:680c  push word ptr [bp+6]
0000:680f  call 855Dh
0000:6812  les bx,[bp+0Eh]
0000:6815  mov es:[bx+1],al
0000:6819  xor ax,ax
0000:681b  mov dx,18h
0000:681e  push ax
0000:681f  push dx
0000:6820  push word ptr [bp+8]
0000:6823  push word ptr [bp+6]
0000:6826  call 854Eh
0000:6829  mov [bp+8],dx
0000:682c  mov [bp+6],ax
0000:682f  add word ptr [bp+6],1
0000:6833  adc word ptr [bp+8],0
0000:6837  les bx,[bp+0Ah]
0000:683a  test word ptr es:[bx],3
0000:683f  jne short 6874h
0000:6841  cmp word ptr [bp+8],0
0000:6845  jl short 6859h
0000:6847  jg short 684Fh
0000:6849  cmp word ptr [bp+6],3Ch
0000:684d  jbe short 6859h
0000:684f  sub word ptr [bp+6],1
0000:6853  sbb word ptr [bp+8],0
0000:6857  jmp short 6874h
0000:6859  cmp word ptr [bp+8],0
0000:685d  jne short 6874h
0000:685f  cmp word ptr [bp+6],3Ch
0000:6863  jne short 6874h
0000:6865  les bx,[bp+0Ah]
0000:6868  mov byte ptr es:[bx+3],2
0000:686d  mov byte ptr es:[bx+2],1Dh
0000:6872  jmp short 68C5h
0000:6874  les bx,[bp+0Ah]
0000:6877  mov byte ptr es:[bx+3],0
0000:687c  jmp short 689Bh
0000:687e  les bx,[bp+0Ah]
0000:6881  mov al,es:[bx+3]
0000:6885  cbw
0000:6886  mov bx,ax
0000:6888  mov al,[bx+696Ch]
0000:688c  cbw
0000:688d  cwd
0000:688e  sub [bp+6],ax
0000:6891  sbb [bp+8],dx
0000:6894  mov bx,[bp+0Ah]
0000:6897  inc byte ptr es:[bx+3]
0000:689b  les bx,[bp+0Ah]
0000:689e  mov al,es:[bx+3]
0000:68a2  cbw
0000:68a3  mov bx,ax
0000:68a5  mov al,[bx+696Ch]
0000:68a9  cbw
0000:68aa  cwd
0000:68ab  cmp dx,[bp+8]
0000:68ae  jl short 687Eh
0000:68b0  jne short 68B7h
0000:68b2  cmp ax,[bp+6]
0000:68b5  jb short 687Eh
0000:68b7  les bx,[bp+0Ah]
0000:68ba  inc byte ptr es:[bx+3]
0000:68be  mov al,[bp+6]
0000:68c1  mov es:[bx+2],al
0000:68c5  pop bp
0000:68c6  ret far

; Candidate 0000:68c7, file offset 0x9ac7
0000:68c7  push bp
0000:68c8  mov bp,sp
0000:68ca  mov dx,[bp+6]
0000:68cd  cmp dx,0FFFFh
0000:68d0  jne short 68D7h
0000:68d2  mov ax,0FFFFh
0000:68d5  jmp short 68F1h
0000:68d7  mov al,dl
0000:68d9  mov ah,0
0000:68db  mov bx,ax
0000:68dd  test byte ptr [bx+6695h],4
0000:68e2  je short 68EDh
0000:68e4  mov al,dl
0000:68e6  mov ah,0
0000:68e8  add ax,20h
0000:68eb  jmp short 68F1h
0000:68ed  mov al,dl
0000:68ef  mov ah,0
0000:68f1  pop bp
0000:68f2  ret far

; Candidate 0000:68f3, file offset 0x9af3
0000:68f3  push bp
0000:68f4  mov bp,sp
0000:68f6  mov dx,[bp+6]
0000:68f9  cmp dx,0FFFFh
0000:68fc  jne short 6903h
0000:68fe  mov ax,0FFFFh
0000:6901  jmp short 691Dh
0000:6903  mov al,dl
0000:6905  mov ah,0
0000:6907  mov bx,ax
0000:6909  test byte ptr [bx+6695h],8
0000:690e  je short 6919h
0000:6910  mov al,dl
0000:6912  mov ah,0
0000:6914  add ax,0FFE0h
0000:6917  jmp short 691Dh
0000:6919  mov al,dl
0000:691b  mov ah,0
0000:691d  pop bp
0000:691e  ret far

; Candidate 0000:691f, file offset 0x9b1f
0000:691f  push bp
0000:6920  mov bp,sp
0000:6922  sub sp,90h
0000:6926  push si
0000:6927  push di
0000:6928  mov di,[bp+0Ch]
0000:692b  mov ax,di
0000:692d  inc ax
0000:692e  cmp ax,2
0000:6931  jae short 6938h
0000:6933  xor ax,ax
0000:6935  jmp 6A47h
0000:6938  mov bx,[bp+6]
0000:693b  shl bx,1
0000:693d  test word ptr [bx+6934h],8000h
0000:6943  je short 695Ah
0000:6945  push di
0000:6946  push word ptr [bp+0Ah]
0000:6949  push word ptr [bp+8]
0000:694c  push word ptr [bp+6]
0000:694f  call far 7E69h,0
0000:6954  add sp,8
0000:6957  jmp 6A47h
0000:695a  mov bx,[bp+6]
0000:695d  shl bx,1
0000:695f  and word ptr [bx+6934h],0FDFFh
0000:6965  mov ax,[bp+0Ah]
0000:6968  mov dx,[bp+8]
0000:696b  mov [bp-0Ch],ax
0000:696e  mov [bp-0Eh],dx
0000:6971  mov [bp-8],di
0000:6974  jmp short 69F2h
0000:6976  dec word ptr [bp-8]
0000:6979  les bx,[bp-0Eh]
0000:697c  inc word ptr [bp-0Eh]
0000:697f  mov al,es:[bx]
0000:6982  mov [bp-9],al
0000:6985  cmp al,0Ah
0000:6987  jne short 6993h
0000:6989  les bx,[bp-6]
0000:698c  mov byte ptr es:[bx],0Dh
0000:6990  inc word ptr [bp-6]
0000:6993  les bx,[bp-6]
0000:6996  mov al,[bp-9]
0000:6999  mov es:[bx],al
0000:699c  inc word ptr [bp-6]
0000:699f  lea ax,[bp-90h]
0000:69a3  mov dx,[bp-6]
0000:69a6  xor bx,bx
0000:69a8  sub dx,ax
0000:69aa  sbb bx,0
0000:69ad  or bx,bx
0000:69af  jl short 69FCh
0000:69b1  jne short 69B9h
0000:69b3  cmp dx,80h
0000:69b7  jb short 69FCh
0000:69b9  lea ax,[bp-90h]
0000:69bd  mov dx,[bp-6]
0000:69c0  xor bx,bx
0000:69c2  sub dx,ax
0000:69c4  sbb bx,0
0000:69c7  mov si,dx
0000:69c9  push si
0000:69ca  push ss
0000:69cb  push ax
0000:69cc  push word ptr [bp+6]
0000:69cf  call far 7E69h,0
0000:69d4  add sp,8
0000:69d7  mov [bp-2],ax
0000:69da  cmp ax,si
0000:69dc  je short 69F2h
0000:69de  cmp word ptr [bp-2],0
0000:69e2  jae short 69E9h
0000:69e4  mov ax,0FFFFh
0000:69e7  jmp short 6A43h
0000:69e9  mov ax,di
0000:69eb  sub ax,[bp-8]
0000:69ee  jmp short 6A3Eh
0000:69f0  jmp short 6A43h
0000:69f2  lea ax,[bp-90h]
0000:69f6  mov [bp-4],ss
0000:69f9  mov [bp-6],ax
0000:69fc  cmp word ptr [bp-8],0
0000:6a00  je short 6A05h
0000:6a02  jmp 6976h
0000:6a05  lea ax,[bp-90h]
0000:6a09  mov dx,[bp-6]
0000:6a0c  xor bx,bx
0000:6a0e  sub dx,ax
0000:6a10  sbb bx,0
0000:6a13  mov si,dx
0000:6a15  mov ax,dx
0000:6a17  or ax,ax
0000:6a19  jbe short 6A45h
0000:6a1b  push si
0000:6a1c  push ss
0000:6a1d  lea ax,[bp-90h]
0000:6a21  push ax
0000:6a22  push word ptr [bp+6]
0000:6a25  call far 7E69h,0
0000:6a2a  add sp,8
0000:6a2d  mov [bp-2],ax
0000:6a30  cmp ax,si
0000:6a32  je short 6A45h
0000:6a34  cmp word ptr [bp-2],0
0000:6a38  jae short 6A3Ch
0000:6a3a  jmp short 69E4h
0000:6a3c  mov ax,di
0000:6a3e  add ax,[bp-2]
0000:6a41  sub ax,si
0000:6a43  jmp short 6A47h
0000:6a45  mov ax,di
0000:6a47  pop di
0000:6a48  pop si
0000:6a49  mov sp,bp
0000:6a4b  pop bp
0000:6a4c  ret far

; Candidate 0000:6a87, file offset 0x9c87
0000:6a87  push bp
0000:6a88  mov bp,sp
0000:6a8a  push si
0000:6a8b  push di
0000:6a8c  push es
0000:6a8d  push bp
0000:6a8e  les si,[bp+6]
0000:6a91  cld
0000:6a92  sub ax,ax
0000:6a94  cwd
0000:6a95  mov cx,0Ah
0000:6a98  mov bh,0
0000:6a9a  mov di,6695h
0000:6a9d  mov bl,es:[si]
0000:6aa0  inc si
0000:6aa1  test byte ptr [bx+di],1
0000:6aa4  jne short 6A9Dh
0000:6aa6  mov bp,0
0000:6aa9  cmp bl,2Bh
0000:6aac  je short 6AB4h
0000:6aae  cmp bl,2Dh
0000:6ab1  jne short 6AB8h
0000:6ab3  inc bp
0000:6ab4  mov bl,es:[si]
0000:6ab7  inc si
0000:6ab8  cmp bl,39h
0000:6abb  ja short 6AECh
0000:6abd  sub bl,30h
0000:6ac0  jb short 6AECh
0000:6ac2  mul cx
0000:6ac4  add ax,bx
0000:6ac6  adc dl,dh
0000:6ac8  je short 6AB4h
0000:6aca  jmp short 6ADEh
0000:6acc  mov di,dx
0000:6ace  mov cx,0Ah
0000:6ad1  mul cx
0000:6ad3  xchg di,ax
0000:6ad4  xchg cx,dx
0000:6ad6  mul dx
0000:6ad8  xchg dx,ax
0000:6ad9  xchg di,ax
0000:6ada  add ax,bx
0000:6adc  adc dx,cx
0000:6ade  mov bl,es:[si]
0000:6ae1  inc si
0000:6ae2  cmp bl,39h
0000:6ae5  ja short 6AECh
0000:6ae7  sub bl,30h
0000:6aea  jae short 6ACCh
0000:6aec  dec bp
0000:6aed  jl short 6AF6h
0000:6aef  neg dx
0000:6af1  neg ax
0000:6af3  sbb dx,0
0000:6af6  pop bp
0000:6af7  pop es
0000:6af8  pop di
0000:6af9  pop si
0000:6afa  pop bp
0000:6afb  ret far

; Candidate 0000:6b0d, file offset 0x9d0d
0000:6b0d  push bp
0000:6b0e  mov bp,sp
0000:6b10  mov ah,[bp+6]
0000:6b13  mov al,[bp+0Ah]
0000:6b16  mov dx,[bp+8]
0000:6b19  int 21h
0000:6b1b  pop bp
0000:6b1c  ret far

; Candidate 0000:6b35, file offset 0x9d35
0000:6b35  mov ah,19h
0000:6b37  int 21h
0000:6b39  cbw
0000:6b3a  ret far

; Candidate 0000:6b3b, file offset 0x9d3b
0000:6b3b  push bp
0000:6b3c  mov bp,sp
0000:6b3e  mov ah,0Eh
0000:6b40  mov dl,[bp+6]
0000:6b43  int 21h
0000:6b45  cbw
0000:6b46  pop bp
0000:6b47  ret far

; Candidate 0000:6b48, file offset 0x9d48
0000:6b48  push bp
0000:6b49  mov bp,sp
0000:6b4b  push ds
0000:6b4c  mov cx,[bp+0Ch]
0000:6b4f  mov ah,43h
0000:6b51  mov al,[bp+0Ah]
0000:6b54  lds dx,[bp+6]
0000:6b57  int 21h
0000:6b59  pop ds
0000:6b5a  jb short 6B5Fh
0000:6b5c  xchg cx,ax
0000:6b5d  jmp short 6B63h
0000:6b5f  push ax
0000:6b60  call 6F51h
0000:6b63  pop bp
0000:6b64  ret far

; Candidate 0000:6b65, file offset 0x9d65
0000:6b65  push bp
0000:6b66  mov bp,sp
0000:6b68  sub sp,84h
0000:6b6c  push si
0000:6b6d  push di
0000:6b6e  mov ax,4201h
0000:6b71  mov bx,[bp+6]
0000:6b74  sub cx,cx
0000:6b76  mov dx,cx
0000:6b78  int 21h
0000:6b7a  jb short 6BEDh
0000:6b7c  mov [bp-4],ax
0000:6b7f  mov [bp-2],dx
0000:6b82  mov ax,4202h
0000:6b85  sub cx,cx
0000:6b87  mov dx,cx
0000:6b89  int 21h
0000:6b8b  jb short 6BEDh
0000:6b8d  cmp dx,[bp+0Ah]
0000:6b90  ja short 6BF3h
0000:6b92  jb short 6B99h
0000:6b94  cmp ax,[bp+8]
0000:6b97  jae short 6BF3h
0000:6b99  sub [bp+8],ax
0000:6b9c  sbb [bp+0Ah],dx
0000:6b9f  mov cx,dx
0000:6ba1  xchg dx,ax
0000:6ba2  mov ax,4200h
0000:6ba5  int 21h
0000:6ba7  jb short 6BEDh
0000:6ba9  push ss
0000:6baa  pop es
0000:6bab  lea di,[bp-84h]
0000:6baf  xor ax,ax
0000:6bb1  mov cx,40h
0000:6bb4  cld
0000:6bb5  rep stosw [di]
0000:6bb7  mov cx,80h
0000:6bba  cmp word ptr [bp+0Ah],0
0000:6bbe  jne short 6BC8h
0000:6bc0  cmp cx,[bp+8]
0000:6bc3  jbe short 6BC8h
0000:6bc5  mov cx,[bp+8]
0000:6bc8  sub [bp+8],cx
0000:6bcb  sbb word ptr [bp+0Ah],0
0000:6bcf  lea dx,[bp-84h]
0000:6bd3  push ds
0000:6bd4  push ss
0000:6bd5  pop ds
0000:6bd6  push cx
0000:6bd7  mov ah,40h
0000:6bd9  int 21h
0000:6bdb  pop cx
0000:6bdc  pop ds
0000:6bdd  jb short 6BEDh
0000:6bdf  cmp ax,cx
0000:6be1  jne short 6BEDh
0000:6be3  mov ax,[bp+8]
0000:6be6  or ax,[bp+0Ah]
0000:6be9  jne short 6BB7h
0000:6beb  jmp short 6C0Bh
0000:6bed  push ax
0000:6bee  call 6F51h
0000:6bf1  jmp short 6C26h
0000:6bf3  mov ax,4200h
0000:6bf6  mov bx,[bp+6]
0000:6bf9  mov dx,[bp+8]
0000:6bfc  mov cx,[bp+0Ah]
0000:6bff  int 21h
0000:6c01  jb short 6BEDh
0000:6c03  mov ah,40h
0000:6c05  sub cx,cx
0000:6c07  int 21h
0000:6c09  jb short 6BEDh
0000:6c0b  mov dx,[bp-4]
0000:6c0e  mov cx,[bp-2]
0000:6c11  xchg si,ax
0000:6c12  mov ax,4200h
0000:6c15  int 21h
0000:6c17  jb short 6BEDh
0000:6c19  mov bx,[bp+6]
0000:6c1c  shl bx,1
0000:6c1e  or word ptr [bx+6934h],1000h
0000:6c24  xor ax,ax
0000:6c26  pop di
0000:6c27  pop si
0000:6c28  mov sp,bp
0000:6c2a  pop bp
0000:6c2b  ret far

; Candidate 0000:6c2c, file offset 0x9e2c
0000:6c2c  push bp
0000:6c2d  mov bp,sp
0000:6c2f  mov ah,3Eh
0000:6c31  mov bx,[bp+6]
0000:6c34  int 21h
0000:6c36  jb short 6C44h
0000:6c38  shl bx,1
0000:6c3a  mov word ptr [bx+6934h],0FFFFh
0000:6c40  xor ax,ax
0000:6c42  jmp short 6C48h
0000:6c44  push ax
0000:6c45  call 6F51h
0000:6c48  pop bp
0000:6c49  ret far

; Candidate 0000:6c86, file offset 0x9e86
0000:6c86  push bp
0000:6c87  mov bp,sp
0000:6c89  sub sp,8
0000:6c8c  push cs
0000:6c8d  call 6C4Ah
0000:6c90  mov [bp-2],dx
0000:6c93  mov [bp-4],ax
0000:6c96  mov bx,[bp+6]
0000:6c99  xor cx,cx
0000:6c9b  xor dx,dx
0000:6c9d  mov ax,4A9h
0000:6ca0  call 86E5h
0000:6ca3  mov bx,[bp-2]
0000:6ca6  mov cx,[bp-4]
0000:6ca9  add cx,ax
0000:6cab  adc bx,dx
0000:6cad  mov [bp-6],bx
0000:6cb0  mov [bp-8],cx
0000:6cb3  push cs
0000:6cb4  call 6C4Ah
0000:6cb7  cmp dx,[bp-6]
0000:6cba  jb short 6CB3h
0000:6cbc  jne short 6CC3h
0000:6cbe  cmp ax,[bp-8]
0000:6cc1  jb short 6CB3h
0000:6cc3  mov sp,bp
0000:6cc5  pop bp
0000:6cc6  ret far

; Candidate 0000:6cc7, file offset 0x9ec7
0000:6cc7  push bp
0000:6cc8  mov bp,sp
0000:6cca  sub sp,4
0000:6ccd  mov ax,4201h
0000:6cd0  mov bx,[bp+6]
0000:6cd3  xor cx,cx
0000:6cd5  xor dx,dx
0000:6cd7  int 21h
0000:6cd9  jb short 6CFFh
0000:6cdb  push dx
0000:6cdc  push ax
0000:6cdd  mov ax,4202h
0000:6ce0  xor cx,cx
0000:6ce2  xor dx,dx
0000:6ce4  int 21h
0000:6ce6  mov [bp-4],ax
0000:6ce9  mov [bp-2],dx
0000:6cec  pop dx
0000:6ced  pop cx
0000:6cee  jb short 6CFFh
0000:6cf0  mov ax,4200h
0000:6cf3  int 21h
0000:6cf5  jb short 6CFFh
0000:6cf7  mov dx,[bp-2]
0000:6cfa  mov ax,[bp-4]
0000:6cfd  jmp short 6D04h
0000:6cff  push ax
0000:6d00  call 6F51h
0000:6d03  cwd
0000:6d04  mov sp,bp
0000:6d06  pop bp
0000:6d07  ret far

; Candidate 0000:6d08, file offset 0x9f08
0000:6d08  push bp
0000:6d09  mov bp,sp
0000:6d0b  push si
0000:6d0c  push ds
0000:6d0d  mov ah,47h
0000:6d0f  mov dl,[bp+6]
0000:6d12  lds si,[bp+8]
0000:6d15  int 21h
0000:6d17  pop ds
0000:6d18  jb short 6D1Eh
0000:6d1a  xor ax,ax
0000:6d1c  jmp short 6D22h
0000:6d1e  push ax
0000:6d1f  call 6F51h
0000:6d22  pop si
0000:6d23  pop bp
0000:6d24  ret far

; Candidate 0000:6d25, file offset 0x9f25
0000:6d25  push bp
0000:6d26  mov bp,sp
0000:6d28  sub sp,4
0000:6d2b  push si
0000:6d2c  push di
0000:6d2d  les di,[bp+6]
0000:6d30  mov ax,es
0000:6d32  or ax,di
0000:6d34  je short 6D56h
0000:6d36  mov al,0
0000:6d38  mov ah,es:[di]
0000:6d3b  mov cx,0FFFFh
0000:6d3e  cld
0000:6d3f  repne scasb [di]
0000:6d41  not cx
0000:6d43  dec cx
0000:6d44  je short 6D56h
0000:6d46  les di,[6A80h]
0000:6d4a  mov [bp-2],es
0000:6d4d  mov bx,es
0000:6d4f  or bx,di
0000:6d51  mov [bp-4],di
0000:6d54  jne short 6D63h
0000:6d56  xor dx,dx
0000:6d58  xor ax,ax
0000:6d5a  jmp short 6D8Fh
0000:6d5c  add word ptr [bp-4],4
0000:6d60  les di,[bp-4]
0000:6d63  les di,es:[di]
0000:6d66  mov bx,es
0000:6d68  or bx,di
0000:6d6a  je short 6D56h
0000:6d6c  mov al,es:[di]
0000:6d6f  or al,al
0000:6d71  je short 6D56h
0000:6d73  cmp ah,al
0000:6d75  jne short 6D5Ch
0000:6d77  mov bx,cx
0000:6d79  cmp byte ptr es:[bx+di],3Dh
0000:6d7d  jne short 6D5Ch
0000:6d7f  push ds
0000:6d80  lds si,[bp+6]
0000:6d83  repe cmpsb [si],[di]
0000:6d85  pop ds
0000:6d86  xchg bx,cx
0000:6d88  jne short 6D5Ch
0000:6d8a  inc di
0000:6d8b  mov ax,di
0000:6d8d  mov dx,es
0000:6d8f  pop di
0000:6d90  pop si
0000:6d91  mov sp,bp
0000:6d93  pop bp
0000:6d94  ret far

; Candidate 0000:6d95, file offset 0x9f95
0000:6d95  push bp
0000:6d96  mov bp,sp
0000:6d98  mov ah,35h
0000:6d9a  mov al,[bp+6]
0000:6d9d  int 21h
0000:6d9f  xchg bx,ax
0000:6da0  mov dx,es
0000:6da2  pop bp
0000:6da3  ret far

; Candidate 0000:6da4, file offset 0x9fa4
0000:6da4  push bp
0000:6da5  mov bp,sp
0000:6da7  mov ah,25h
0000:6da9  mov al,[bp+6]
0000:6dac  push ds
0000:6dad  lds dx,[bp+8]
0000:6db0  int 21h
0000:6db2  pop ds
0000:6db3  pop bp
0000:6db4  ret far

; Candidate 0000:6ded, file offset 0x9fed
0000:6ded  push bp
0000:6dee  mov bp,sp
0000:6df0  mov ax,[bp+8]
0000:6df3  mov dx,[bp+6]
0000:6df6  mov [0F2DAh],ax
0000:6df9  mov [0F2D8h],dx
0000:6dfd  push cs
0000:6dfe  mov ax,6DB5h
0000:6e01  push ax
0000:6e02  mov ax,24h
0000:6e05  push ax
0000:6e06  call far 6DA4h,0
0000:6e0b  add sp,6
0000:6e0e  pop bp
0000:6e0f  ret far

; Candidate 0000:6e2b, file offset 0xa02b
0000:6e2b  push bp
0000:6e2c  mov bp,sp
0000:6e2e  push si
0000:6e2f  push di
0000:6e30  xor ax,ax
0000:6e32  push ax
0000:6e33  push ax
0000:6e34  mov ax,54h
0000:6e37  push ax
0000:6e38  call far 6B0Dh,0
0000:6e3d  add sp,6
0000:6e40  mov ax,[bp+6]
0000:6e43  mov ax,[0F2DCh]
0000:6e46  add ax,1Ah
0000:6e49  mov sp,ax
0000:6e4b  mov bp,ax
0000:6e4d  or byte ptr [bp+14h],1
0000:6e51  pop bx
0000:6e52  pop cx
0000:6e53  pop dx
0000:6e54  pop si
0000:6e55  pop di
0000:6e56  pop bp
0000:6e57  pop ds
0000:6e58  pop es
0000:6e59  iret

; Candidate 0000:6e5e, file offset 0xa05e
0000:6e5e  push bp
0000:6e5f  mov bp,sp
0000:6e61  sub sp,8
0000:6e64  push ss
0000:6e65  lea ax,[bp-8]
0000:6e68  push ax
0000:6e69  call far 745Eh,0
0000:6e6e  pop cx
0000:6e6f  pop cx
0000:6e70  push ss
0000:6e71  lea ax,[bp-8]
0000:6e74  push ax
0000:6e75  push word ptr [bp+0Eh]
0000:6e78  push word ptr [bp+0Ch]
0000:6e7b  push word ptr [bp+0Ah]
0000:6e7e  push word ptr [bp+8]
0000:6e81  push word ptr [bp+6]
0000:6e84  push cs
0000:6e85  call 6E8Fh
0000:6e88  add sp,0Eh
0000:6e8b  mov sp,bp
0000:6e8d  pop bp
0000:6e8e  ret far

; Candidate 0000:6f28, file offset 0xa128
0000:6f28  push bp
0000:6f29  mov bp,sp
0000:6f2b  push ds
0000:6f2c  mov ah,44h
0000:6f2e  mov al,[bp+8]
0000:6f31  mov bx,[bp+6]
0000:6f34  mov cx,[bp+0Eh]
0000:6f37  lds dx,[bp+0Ah]
0000:6f3a  int 21h
0000:6f3c  pop ds
0000:6f3d  jb short 6F4Bh
0000:6f3f  cmp word ptr [bp+8],0
0000:6f43  jne short 6F49h
0000:6f45  mov ax,dx
0000:6f47  jmp short 6F4Fh
0000:6f49  jmp short 6F4Fh
0000:6f4b  push ax
0000:6f4c  call 6F51h
0000:6f4f  pop bp
0000:6f50  ret far

; Candidate 0000:6f8e, file offset 0xa18e
0000:6f8e  push bp
0000:6f8f  mov bp,sp
0000:6f91  mov ax,4400h
0000:6f94  mov bx,[bp+6]
0000:6f97  int 21h
0000:6f99  xchg dx,ax
0000:6f9a  and ax,80h
0000:6f9d  pop bp
0000:6f9e  ret far

; Candidate 0000:6f9f, file offset 0xa19f
0000:6f9f  push bp
0000:6fa0  mov bp,sp
0000:6fa2  mov bx,[bp+6]
0000:6fa5  shl bx,1
0000:6fa7  and word ptr [bx+6934h],0FDFFh
0000:6fad  mov ah,42h
0000:6faf  mov al,[bp+0Ch]
0000:6fb2  mov bx,[bp+6]
0000:6fb5  mov cx,[bp+0Ah]
0000:6fb8  mov dx,[bp+8]
0000:6fbb  int 21h
0000:6fbd  jb short 6FC1h
0000:6fbf  jmp short 6FC6h
0000:6fc1  push ax
0000:6fc2  call 6F51h
0000:6fc5  cwd
0000:6fc6  pop bp
0000:6fc7  ret far

; Candidate 0000:704a, file offset 0xa24a
0000:704a  push bp
0000:704b  mov bp,sp
0000:704d  push si
0000:704e  push di
0000:704f  mov si,[bp+6]
0000:7052  mov di,[bp+0Ch]
0000:7055  cmp di,0Ah
0000:7058  jne short 705Fh
0000:705a  mov ax,si
0000:705c  cwd
0000:705d  jmp short 7063h
0000:705f  mov ax,si
0000:7061  xor dx,dx
0000:7063  push dx
0000:7064  push ax
0000:7065  push word ptr [bp+0Ah]
0000:7068  push word ptr [bp+8]
0000:706b  push di
0000:706c  mov al,1
0000:706e  push ax
0000:706f  mov al,61h
0000:7071  push ax
0000:7072  call 6FC8h
0000:7075  pop di
0000:7076  pop si
0000:7077  pop bp
0000:7078  ret far

; Candidate 0000:7096, file offset 0xa296
0000:7096  push bp
0000:7097  mov bp,sp
0000:7099  push si
0000:709a  mov si,[bp+0Eh]
0000:709d  push word ptr [bp+8]
0000:70a0  push word ptr [bp+6]
0000:70a3  push word ptr [bp+0Ch]
0000:70a6  push word ptr [bp+0Ah]
0000:70a9  push si
0000:70aa  cmp si,0Ah
0000:70ad  jne short 70B4h
0000:70af  mov ax,1
0000:70b2  jmp short 70B6h
0000:70b4  xor ax,ax
0000:70b6  push ax
0000:70b7  mov al,61h
0000:70b9  push ax
0000:70ba  call 6FC8h
0000:70bd  pop si
0000:70be  pop bp
0000:70bf  ret far

; Candidate 0000:70c0, file offset 0xa2c0
0000:70c0  push bp
0000:70c1  mov bp,sp
0000:70c3  push di
0000:70c4  les di,[bp+6]
0000:70c7  mov cx,[bp+0Ch]
0000:70ca  jcxz 70D4h
0000:70cc  mov al,[bp+0Ah]
0000:70cf  cld
0000:70d0  repne scasb [di]
0000:70d2  je short 70DBh
0000:70d4  xor di,di
0000:70d6  mov es,di
0000:70d8  mov di,1
0000:70db  dec di
0000:70dc  mov ax,di
0000:70de  mov dx,es
0000:70e0  pop di
0000:70e1  pop bp
0000:70e2  ret far

; Candidate 0000:70e3, file offset 0xa2e3
0000:70e3  push bp
0000:70e4  mov bp,sp
0000:70e6  push si
0000:70e7  push di
0000:70e8  mov dx,ds
0000:70ea  les di,[bp+6]
0000:70ed  lds si,[bp+0Ah]
0000:70f0  mov cx,[bp+0Eh]
0000:70f3  shr cx,1
0000:70f5  cld
0000:70f6  rep movsw [di],[si]
0000:70f8  jae short 70FBh
0000:70fa  movsb [di],[si]
0000:70fb  mov ds,dx
0000:70fd  mov dx,[bp+8]
0000:7100  mov ax,[bp+6]
0000:7103  pop di
0000:7104  pop si
0000:7105  pop bp
0000:7106  ret far

; Candidate 0000:7107, file offset 0xa307
0000:7107  push bp
0000:7108  mov bp,sp
0000:710a  push di
0000:710b  les di,[bp+6]
0000:710e  mov cx,[bp+0Ah]
0000:7111  mov al,[bp+0Ch]
0000:7114  mov ah,al
0000:7116  cld
0000:7117  test di,1
0000:711b  je short 7121h
0000:711d  jcxz 7128h
0000:711f  stosb [di]
0000:7120  dec cx
0000:7121  shr cx,1
0000:7123  rep stosw [di]
0000:7125  jae short 7128h
0000:7127  stosb [di]
0000:7128  pop di
0000:7129  pop bp
0000:712a  ret far

; Candidate 0000:712b, file offset 0xa32b
0000:712b  push bp
0000:712c  mov bp,sp
0000:712e  mov al,[bp+0Ah]
0000:7131  push ax
0000:7132  push word ptr [bp+0Ch]
0000:7135  push word ptr [bp+8]
0000:7138  push word ptr [bp+6]
0000:713b  push cs
0000:713c  call 7107h
0000:713f  add sp,8
0000:7142  mov dx,[bp+8]
0000:7145  mov ax,[bp+6]
0000:7148  pop bp
0000:7149  ret far

; Candidate 0000:714a, file offset 0xa34a
0000:714a  push bp
0000:714b  mov bp,sp
0000:714d  push si
0000:714e  push di
0000:714f  push ds
0000:7150  mov cx,[bp+0Ch]
0000:7153  mov bx,[bp+0Ah]
0000:7156  mov dx,[bp+8]
0000:7159  mov ax,[bp+6]
0000:715c  call 86FCh
0000:715f  jae short 7167h
0000:7161  std
0000:7162  mov ax,1
0000:7165  jmp short 716Ah
0000:7167  cld
0000:7168  xor ax,ax
0000:716a  lds si,[bp+6]
0000:716d  les di,[bp+0Ah]
0000:7170  mov cx,[bp+0Eh]
0000:7173  or ax,ax
0000:7175  je short 717Dh
0000:7177  add si,cx
0000:7179  dec si
0000:717a  add di,cx
0000:717c  dec di
0000:717d  test di,1
0000:7181  je short 7187h
0000:7183  jcxz 7196h
0000:7185  movsb [di],[si]
0000:7186  dec cx
0000:7187  sub si,ax
0000:7189  sub di,ax
0000:718b  shr cx,1
0000:718d  rep movsw [di],[si]
0000:718f  jae short 7196h
0000:7191  add si,ax
0000:7193  add di,ax
0000:7195  movsb [di],[si]
0000:7196  cld
0000:7197  pop ds
0000:7198  pop di
0000:7199  pop si
0000:719a  pop bp
0000:719b  ret far

; Candidate 0000:719c, file offset 0xa39c
0000:719c  push bp
0000:719d  mov bp,sp
0000:719f  push word ptr [bp+0Eh]
0000:71a2  push word ptr [bp+8]
0000:71a5  push word ptr [bp+6]
0000:71a8  push word ptr [bp+0Ch]
0000:71ab  push word ptr [bp+0Ah]
0000:71ae  push cs
0000:71af  call 714Ah
0000:71b2  add sp,0Ah
0000:71b5  mov dx,[bp+8]
0000:71b8  mov ax,[bp+6]
0000:71bb  pop bp
0000:71bc  ret far

; Candidate 0000:71ea, file offset 0xa3ea
0000:71ea  push bp
0000:71eb  mov bp,sp
0000:71ed  sub sp,4
0000:71f0  push si
0000:71f1  push di
0000:71f2  mov si,[bp+0Ah]
0000:71f5  test si,0C000h
0000:71f9  jne short 7203h
0000:71fb  mov ax,[695Ch]
0000:71fe  and ax,0C000h
0000:7201  or si,ax
0000:7203  test si,100h
0000:7207  jne short 720Ch
0000:7209  jmp 7294h
0000:720c  mov ax,[695Eh]
0000:720f  and [bp+0Ch],ax
0000:7212  mov ax,[bp+0Ch]
0000:7215  test ax,180h
0000:7218  jne short 7221h
0000:721a  mov ax,1
0000:721d  push ax
0000:721e  call 6F51h
0000:7221  xor ax,ax
0000:7223  push ax
0000:7224  push word ptr [bp+8]
0000:7227  push word ptr [bp+6]
0000:722a  call far 6B48h,0
0000:722f  add sp,6
0000:7232  mov [bp-2],ax
0000:7235  cmp ax,0FFFFh
0000:7238  jne short 7266h
0000:723a  test word ptr [bp+0Ch],80h
0000:723f  je short 7245h
0000:7241  xor ax,ax
0000:7243  jmp short 7248h
0000:7245  mov ax,1
0000:7248  mov [bp-2],ax
0000:724b  test si,0F0h
0000:724f  je short 727Fh
0000:7251  push word ptr [bp+8]
0000:7254  push word ptr [bp+6]
0000:7257  xor ax,ax
0000:7259  push ax
0000:725a  call 71BDh
0000:725d  mov di,ax
0000:725f  or ax,ax
0000:7261  jge short 7276h
0000:7263  jmp 732Eh
0000:7266  test si,400h
0000:726a  je short 7294h
0000:726c  mov ax,50h
0000:726f  push ax
0000:7270  call 6F51h
0000:7273  jmp 7330h
0000:7276  push di
0000:7277  call far 6C2Ch,0
0000:727c  pop cx
0000:727d  jmp short 7299h
0000:727f  push word ptr [bp+8]
0000:7282  push word ptr [bp+6]
0000:7285  push word ptr [bp-2]
0000:7288  call 71BDh
0000:728b  mov di,ax
0000:728d  or ax,ax
0000:728f  jge short 730Dh
0000:7291  jmp 732Eh
0000:7294  mov word ptr [bp-2],0
0000:7299  push si
0000:729a  push word ptr [bp+8]
0000:729d  push word ptr [bp+6]
0000:72a0  call far 7336h,0
0000:72a5  add sp,6
0000:72a8  mov di,ax
0000:72aa  or ax,ax
0000:72ac  jl short 730Dh
0000:72ae  xor ax,ax
0000:72b0  push ax
0000:72b1  push di
0000:72b2  call far 6F28h,0
0000:72b7  pop cx
0000:72b8  pop cx
0000:72b9  mov [bp-4],ax
0000:72bc  test ax,80h
0000:72bf  je short 72E4h
0000:72c1  or si,2000h
0000:72c5  test si,8000h
0000:72c9  je short 72EEh
0000:72cb  and ax,0FFh
0000:72ce  or ax,20h
0000:72d1  xor dx,dx
0000:72d3  push dx
0000:72d4  push ax
0000:72d5  mov ax,1
0000:72d8  push ax
0000:72d9  push di
0000:72da  call far 6F28h,0
0000:72df  add sp,8
0000:72e2  jmp short 72EEh
0000:72e4  test si,200h
0000:72e8  je short 72EEh
0000:72ea  push di
0000:72eb  call 71D8h
0000:72ee  cmp word ptr [bp-2],0
0000:72f2  je short 730Dh
0000:72f4  test si,0F0h
0000:72f8  je short 730Dh
0000:72fa  mov ax,1
0000:72fd  push ax
0000:72fe  push ax
0000:72ff  push word ptr [bp+8]
0000:7302  push word ptr [bp+6]
0000:7305  call far 6B48h,0
0000:730a  add sp,8
0000:730d  or di,di
0000:730f  jl short 732Eh
0000:7311  test si,300h
0000:7315  je short 731Ch
0000:7317  mov ax,1000h
0000:731a  jmp short 731Eh
0000:731c  xor ax,ax
0000:731e  mov dx,si
0000:7320  and dx,0F8FFh
0000:7324  or dx,ax
0000:7326  mov bx,di
0000:7328  shl bx,1
0000:732a  mov [bx+6934h],dx
0000:732e  mov ax,di
0000:7330  pop di
0000:7331  pop si
0000:7332  mov sp,bp
0000:7334  pop bp
0000:7335  ret far

; Candidate 0000:7336, file offset 0xa536
0000:7336  push bp
0000:7337  mov bp,sp
0000:7339  dec sp
0000:733a  dec sp
0000:733b  mov al,1
0000:733d  mov cx,[bp+0Ah]
0000:7340  test cx,2
0000:7344  jne short 7350h
0000:7346  mov al,2
0000:7348  test cx,4
0000:734c  jne short 7350h
0000:734e  mov al,0
0000:7350  push ds
0000:7351  lds dx,[bp+6]
0000:7354  mov cl,0F0h
0000:7356  and cl,[bp+0Ah]
0000:7359  or al,cl
0000:735b  mov ah,3Dh
0000:735d  int 21h
0000:735f  pop ds
0000:7360  jb short 737Ch
0000:7362  mov [bp-2],ax
0000:7365  mov bx,[bp-2]
0000:7368  shl bx,1
0000:736a  mov ax,[bp+0Ah]
0000:736d  and ax,0F8FFh
0000:7370  or ax,8000h
0000:7373  mov [bx+6934h],ax
0000:7377  mov ax,[bp-2]
0000:737a  jmp short 7380h
0000:737c  push ax
0000:737d  call 6F51h
0000:7380  mov sp,bp
0000:7382  pop bp
0000:7383  ret far

; Candidate 0000:7384, file offset 0xa584
0000:7384  push bp
0000:7385  mov bp,sp
0000:7387  sub sp,4
0000:738a  push si
0000:738b  push di
0000:738c  mov ax,[bp+0Ch]
0000:738f  inc ax
0000:7390  cmp ax,2
0000:7393  jb short 73A2h
0000:7395  mov bx,[bp+6]
0000:7398  shl bx,1
0000:739a  test word ptr [bx+6934h],200h
0000:73a0  je short 73A7h
0000:73a2  xor ax,ax
0000:73a4  jmp 743Ch
0000:73a7  push word ptr [bp+0Ch]
0000:73aa  push word ptr [bp+0Ah]
0000:73ad  push word ptr [bp+8]
0000:73b0  push word ptr [bp+6]
0000:73b3  call far 7442h,0
0000:73b8  add sp,8
0000:73bb  mov [bp-2],ax
0000:73be  inc ax
0000:73bf  cmp ax,2
0000:73c2  jb short 73D1h
0000:73c4  mov bx,[bp+6]
0000:73c7  shl bx,1
0000:73c9  test word ptr [bx+6934h],8000h
0000:73cf  je short 73D6h
0000:73d1  mov ax,[bp-2]
0000:73d4  jmp short 743Ch
0000:73d6  mov cx,[bp-2]
0000:73d9  les si,[bp+8]
0000:73dc  mov di,si
0000:73de  mov bx,si
0000:73e0  cld
0000:73e1  lodsb es:[si]
0000:73e3  cmp al,1Ah
0000:73e5  je short 7417h
0000:73e7  cmp al,0Dh
0000:73e9  je short 73F0h
0000:73eb  stosb [di]
0000:73ec  loop 73E1h
0000:73ee  jmp short 740Fh
0000:73f0  loop 73E1h
0000:73f2  push es
0000:73f3  push bx
0000:73f4  mov ax,1
0000:73f7  push ax
0000:73f8  lea ax,[bp-3]
0000:73fb  push ss
0000:73fc  push ax
0000:73fd  push word ptr [bp+6]
0000:7400  call far 7442h,0
0000:7405  add sp,8
0000:7408  pop bx
0000:7409  pop es
0000:740a  cld
0000:740b  mov al,[bp-3]
0000:740e  stosb [di]
0000:740f  cmp di,bx
0000:7411  jne short 7415h
0000:7413  jmp short 73A7h
0000:7415  jmp short 7439h
0000:7417  push bx
0000:7418  mov ax,1
0000:741b  push ax
0000:741c  neg cx
0000:741e  sbb ax,ax
0000:7420  push ax
0000:7421  push cx
0000:7422  push word ptr [bp+6]
0000:7425  call far 6F9Fh,0
0000:742a  add sp,8
0000:742d  mov bx,[bp+6]
0000:7430  shl bx,1
0000:7432  or word ptr [bx+6934h],200h
0000:7438  pop bx
0000:7439  sub di,bx
0000:743b  xchg di,ax
0000:743c  pop di
0000:743d  pop si
0000:743e  mov sp,bp
0000:7440  pop bp
0000:7441  ret far

; Candidate 0000:7442, file offset 0xa642
0000:7442  push bp
0000:7443  mov bp,sp
0000:7445  push ds
0000:7446  mov ah,3Fh
0000:7448  mov bx,[bp+6]
0000:744b  mov cx,[bp+0Ch]
0000:744e  lds dx,[bp+8]
0000:7451  int 21h
0000:7453  pop ds
0000:7454  jb short 7458h
0000:7456  jmp short 745Ch
0000:7458  push ax
0000:7459  call 6F51h
0000:745c  pop bp
0000:745d  ret far

; Candidate 0000:745e, file offset 0xa65e
0000:745e  push bp
0000:745f  mov bp,sp
0000:7461  push si
0000:7462  mov bx,es
0000:7464  les si,[bp+6]
0000:7467  mov es:[si],bx
0000:746a  mov ax,[bp+4]
0000:746d  mov es:[si+2],ax
0000:7471  mov es:[si+4],ss
0000:7475  mov es:[si+6],ds
0000:7479  mov es,bx
0000:747b  pop si
0000:747c  pop bp
0000:747d  ret far

; Candidate 0000:747e, file offset 0xa67e
0000:747e  push bp
0000:747f  mov bp,sp
0000:7481  mov ah,4Ah
0000:7483  mov bx,[bp+8]
0000:7486  mov es,[bp+6]
0000:7489  int 21h
0000:748b  jb short 7492h
0000:748d  mov ax,0FFFFh
0000:7490  jmp short 7498h
0000:7492  push bx
0000:7493  push ax
0000:7494  call 6F51h
0000:7497  pop ax
0000:7498  pop bp
0000:7499  ret far

; Candidate 0000:749a, file offset 0xa69a
0000:749a  push bp
0000:749b  mov bp,sp
0000:749d  push si
0000:749e  mov ah,2Bh
0000:74a0  les si,[bp+6]
0000:74a3  mov cx,es:[si]
0000:74a6  mov dx,es:[si+2]
0000:74aa  int 21h
0000:74ac  pop si
0000:74ad  pop bp
0000:74ae  ret far

; Candidate 0000:74af, file offset 0xa6af
0000:74af  push bp
0000:74b0  mov bp,sp
0000:74b2  push si
0000:74b3  mov ah,2Dh
0000:74b5  les si,[bp+6]
0000:74b8  mov cx,es:[si]
0000:74bb  mov dx,es:[si+2]
0000:74bf  int 21h
0000:74c1  pop si
0000:74c2  pop bp
0000:74c3  ret far

; Candidate 0000:74c4, file offset 0xa6c4
0000:74c4  push bp
0000:74c5  mov bp,sp
0000:74c7  push si
0000:74c8  push di
0000:74c9  cld
0000:74ca  push ds
0000:74cb  les di,[bp+6]
0000:74ce  mov dx,di
0000:74d0  xor al,al
0000:74d2  mov cx,0FFFFh
0000:74d5  repne scasb [di]
0000:74d7  push es
0000:74d8  lea si,[di-1]
0000:74db  les di,[bp+0Ah]
0000:74de  mov cx,0FFFFh
0000:74e1  repne scasb [di]
0000:74e3  not cx
0000:74e5  sub di,cx
0000:74e7  push es
0000:74e8  pop ds
0000:74e9  pop es
0000:74ea  xchg di,si
0000:74ec  test si,1
0000:74f0  je short 74F4h
0000:74f2  movsb [di],[si]
0000:74f3  dec cx
0000:74f4  shr cx,1
0000:74f6  rep movsw [di],[si]
0000:74f8  jae short 74FBh
0000:74fa  movsb [di],[si]
0000:74fb  xchg dx,ax
0000:74fc  mov dx,es
0000:74fe  pop ds
0000:74ff  pop di
0000:7500  pop si
0000:7501  pop bp
0000:7502  ret far

; Candidate 0000:7503, file offset 0xa703
0000:7503  push bp
0000:7504  mov bp,sp
0000:7506  push si
0000:7507  cld
0000:7508  push ds
0000:7509  lds si,[bp+6]
0000:750c  mov bl,[bp+0Ah]
0000:750f  test si,1
0000:7513  je short 751Eh
0000:7515  lodsb [si]
0000:7516  cmp al,bl
0000:7518  je short 7536h
0000:751a  and al,al
0000:751c  je short 752Fh
0000:751e  lodsw [si]
0000:751f  cmp al,bl
0000:7521  je short 7537h
0000:7523  and al,al
0000:7525  je short 752Fh
0000:7527  cmp ah,bl
0000:7529  je short 7536h
0000:752b  and ah,ah
0000:752d  jne short 751Eh
0000:752f  pop ds
0000:7530  xor dx,dx
0000:7532  xor ax,ax
0000:7534  jmp short 753Dh
0000:7536  inc si
0000:7537  lea ax,[si-2]
0000:753a  mov dx,ds
0000:753c  pop ds
0000:753d  pop si
0000:753e  pop bp
0000:753f  ret far

; Candidate 0000:7540, file offset 0xa740
0000:7540  push bp
0000:7541  mov bp,sp
0000:7543  push si
0000:7544  push di
0000:7545  mov dx,ds
0000:7547  cld
0000:7548  xor ax,ax
0000:754a  mov bx,ax
0000:754c  les di,[bp+0Ah]
0000:754f  mov si,di
0000:7551  xor al,al
0000:7553  mov cx,0FFFFh
0000:7556  repne scasb [di]
0000:7558  not cx
0000:755a  mov di,si
0000:755c  lds si,[bp+6]
0000:755f  repe cmpsb [si],[di]
0000:7561  mov al,[si-1]
0000:7564  mov bl,es:[di-1]
0000:7568  sub ax,bx
0000:756a  mov ds,dx
0000:756c  pop di
0000:756d  pop si
0000:756e  pop bp
0000:756f  ret far

; Candidate 0000:7570, file offset 0xa770
0000:7570  push bp
0000:7571  mov bp,sp
0000:7573  push si
0000:7574  push di
0000:7575  cld
0000:7576  les di,[bp+0Ah]
0000:7579  mov si,di
0000:757b  xor al,al
0000:757d  mov cx,0FFFFh
0000:7580  repne scasb [di]
0000:7582  not cx
0000:7584  push ds
0000:7585  mov ax,es
0000:7587  mov ds,ax
0000:7589  les di,[bp+6]
0000:758c  rep movsb [di],[si]
0000:758e  pop ds
0000:758f  mov dx,[bp+8]
0000:7592  mov ax,[bp+6]
0000:7595  pop di
0000:7596  pop si
0000:7597  pop bp
0000:7598  ret far

; Candidate 0000:7599, file offset 0xa799
0000:7599  push bp
0000:759a  mov bp,sp
0000:759c  push di
0000:759d  les di,[bp+6]
0000:75a0  xor ax,ax
0000:75a2  cmp ax,[bp+8]
0000:75a5  jne short 75ABh
0000:75a7  cmp ax,di
0000:75a9  je short 75B5h
0000:75ab  cld
0000:75ac  mov cx,0FFFFh
0000:75af  repne scasb [di]
0000:75b1  xchg cx,ax
0000:75b2  not ax
0000:75b4  dec ax
0000:75b5  pop di
0000:75b6  pop bp
0000:75b7  ret far

; Candidate 0000:75b8, file offset 0xa7b8
0000:75b8  push bp
0000:75b9  mov bp,sp
0000:75bb  push si
0000:75bc  cld
0000:75bd  push ds
0000:75be  lds si,[bp+6]
0000:75c1  mov dx,si
0000:75c3  jmp short 75D0h
0000:75c5  sub al,41h
0000:75c7  cmp al,19h
0000:75c9  ja short 75D0h
0000:75cb  add al,61h
0000:75cd  mov [si-1],al
0000:75d0  lodsb [si]
0000:75d1  and al,al
0000:75d3  jne short 75C5h
0000:75d5  xchg dx,ax
0000:75d6  mov dx,ds
0000:75d8  pop ds
0000:75d9  pop si
0000:75da  pop bp
0000:75db  ret far

; Candidate 0000:75dc, file offset 0xa7dc
0000:75dc  push bp
0000:75dd  mov bp,sp
0000:75df  push si
0000:75e0  push di
0000:75e1  cld
0000:75e2  les di,[bp+0Ah]
0000:75e5  mov si,di
0000:75e7  xor al,al
0000:75e9  mov bx,[bp+0Eh]
0000:75ec  mov cx,bx
0000:75ee  repne scasb [di]
0000:75f0  sub bx,cx
0000:75f2  push ds
0000:75f3  mov di,es
0000:75f5  mov ds,di
0000:75f7  les di,[bp+6]
0000:75fa  xchg bx,cx
0000:75fc  rep movsb [di],[si]
0000:75fe  mov cx,bx
0000:7600  rep stosb [di]
0000:7602  pop ds
0000:7603  mov dx,[bp+8]
0000:7606  mov ax,[bp+6]
0000:7609  pop di
0000:760a  pop si
0000:760b  pop bp
0000:760c  ret far

; Candidate 0000:760d, file offset 0xa80d
0000:760d  push bp
0000:760e  mov bp,sp
0000:7610  push si
0000:7611  push di
0000:7612  les bx,[bp+0Ah]
0000:7615  mov al,es:[bx]
0000:7618  cbw
0000:7619  or ax,ax
0000:761b  jne short 7625h
0000:761d  mov dx,[bp+8]
0000:7620  mov ax,[bp+6]
0000:7623  jmp short 7677h
0000:7625  push ds
0000:7626  cld
0000:7627  les di,[bp+6]
0000:762a  push es
0000:762b  mov bx,di
0000:762d  xor ax,ax
0000:762f  mov cx,0FFFFh
0000:7632  repne scasb [di]
0000:7634  not cx
0000:7636  xchg dx,cx
0000:7638  les di,[bp+0Ah]
0000:763b  push es
0000:763c  mov bp,di
0000:763e  xor ax,ax
0000:7640  mov cx,0FFFFh
0000:7643  repne scasb [di]
0000:7645  inc cx
0000:7646  not cx
0000:7648  pop ds
0000:7649  pop es
0000:764a  mov si,bp
0000:764c  lodsb [si]
0000:764d  xchg bx,di
0000:764f  xchg dx,cx
0000:7651  repne scasb [di]
0000:7653  mov bx,di
0000:7655  jne short 765Bh
0000:7657  cmp cx,dx
0000:7659  jae short 7664h
0000:765b  xor bx,bx
0000:765d  mov es,bx
0000:765f  mov bx,1
0000:7662  jmp short 7671h
0000:7664  xchg dx,cx
0000:7666  jcxz 7671h
0000:7668  mov ax,cx
0000:766a  dec cx
0000:766b  repe cmpsb [si],[di]
0000:766d  mov cx,ax
0000:766f  jne short 764Ah
0000:7671  pop ds
0000:7672  mov ax,bx
0000:7674  dec ax
0000:7675  mov dx,es
0000:7677  pop di
0000:7678  pop si
0000:7679  pop bp
0000:767a  ret far

; Candidate 0000:767b, file offset 0xa87b
0000:767b  push bp
0000:767c  mov bp,sp
0000:767e  push si
0000:767f  cld
0000:7680  push ds
0000:7681  lds si,[bp+6]
0000:7684  mov dx,si
0000:7686  jmp short 7693h
0000:7688  sub al,61h
0000:768a  cmp al,19h
0000:768c  ja short 7693h
0000:768e  add al,41h
0000:7690  mov [si-1],al
0000:7693  lodsb [si]
0000:7694  and al,al
0000:7696  jne short 7688h
0000:7698  xchg dx,ax
0000:7699  mov dx,ds
0000:769b  pop ds
0000:769c  pop si
0000:769d  pop bp
0000:769e  ret far

; Candidate 0000:769f, file offset 0xa89f
0000:769f  push bp
0000:76a0  mov bp,sp
0000:76a2  sub sp,4
0000:76a5  push si
0000:76a6  push ds
0000:76a7  mov ax,69FCh
0000:76aa  push ax
0000:76ab  call far 6D25h,0
0000:76b0  pop cx
0000:76b1  pop cx
0000:76b2  mov [bp-2],dx
0000:76b5  mov [bp-4],ax
0000:76b8  or ax,dx
0000:76ba  jne short 76BFh
0000:76bc  jmp 7756h
0000:76bf  push word ptr [bp-2]
0000:76c2  push word ptr [bp-4]
0000:76c5  call far 7599h,0
0000:76ca  pop cx
0000:76cb  pop cx
0000:76cc  cmp ax,4
0000:76cf  jae short 76D4h
0000:76d1  jmp 7756h
0000:76d4  les bx,[bp-4]
0000:76d7  mov al,es:[bx]
0000:76da  cbw
0000:76db  mov bx,ax
0000:76dd  mov al,[bx+6695h]
0000:76e1  cbw
0000:76e2  test ax,0Ch
0000:76e5  je short 7756h
0000:76e7  mov bx,[bp-4]
0000:76ea  mov al,es:[bx+1]
0000:76ee  cbw
0000:76ef  mov bx,ax
0000:76f1  mov al,[bx+6695h]
0000:76f5  cbw
0000:76f6  test ax,0Ch
0000:76f9  je short 7756h
0000:76fb  mov bx,[bp-4]
0000:76fe  mov al,es:[bx+2]
0000:7702  cbw
0000:7703  mov bx,ax
0000:7705  mov al,[bx+6695h]
0000:7709  cbw
0000:770a  test ax,0Ch
0000:770d  je short 7756h
0000:770f  mov bx,[bp-4]
0000:7712  cmp byte ptr es:[bx+3],2Dh
0000:7717  je short 772Eh
0000:7719  cmp byte ptr es:[bx+3],2Bh
0000:771e  je short 772Eh
0000:7720  mov al,es:[bx+3]
0000:7724  cbw
0000:7725  mov bx,ax
0000:7727  test byte ptr [bx+6695h],2
0000:772c  je short 7756h
0000:772e  les bx,[bp-4]
0000:7731  mov al,es:[bx+3]
0000:7735  cbw
0000:7736  mov bx,ax
0000:7738  mov al,[bx+6695h]
0000:773c  cbw
0000:773d  test ax,2
0000:7740  jne short 7795h
0000:7742  mov bx,[bp-4]
0000:7745  mov al,es:[bx+4]
0000:7749  cbw
0000:774a  mov bx,ax
0000:774c  mov al,[bx+6695h]
0000:7750  cbw
0000:7751  test ax,2
0000:7754  jne short 7795h
0000:7756  mov word ptr [69FAh],1
0000:775c  mov word ptr [69F8h],0
0000:7762  mov word ptr [69F6h],4650h
0000:7768  push ds
0000:7769  mov ax,69FFh
0000:776c  push ax
0000:776d  push word ptr [69F0h]
0000:7771  push word ptr [69EEh]
0000:7775  call far 7570h,0
0000:777a  add sp,8
0000:777d  push ds
0000:777e  mov ax,6A03h
0000:7781  push ax
0000:7782  push word ptr [69F4h]
0000:7786  push word ptr [69F2h]
0000:778a  call far 7570h,0
0000:778f  add sp,8
0000:7792  jmp 7886h
0000:7795  mov ax,4
0000:7798  push ax
0000:7799  xor ax,ax
0000:779b  push ax
0000:779c  push word ptr [69F4h]
0000:77a0  push word ptr [69F2h]
0000:77a4  call far 712Bh,0
0000:77a9  add sp,8
0000:77ac  mov ax,3
0000:77af  push ax
0000:77b0  push word ptr [bp-2]
0000:77b3  push word ptr [bp-4]
0000:77b6  push word ptr [69F0h]
0000:77ba  push word ptr [69EEh]
0000:77be  call far 75DCh,0
0000:77c3  add sp,0Ah
0000:77c6  les bx,[69EEh]
0000:77ca  mov byte ptr es:[bx+3],0
0000:77cf  mov ax,[bp-4]
0000:77d2  add ax,3
0000:77d5  push word ptr [bp-2]
0000:77d8  push ax
0000:77d9  call far 6A87h,0
0000:77de  pop cx
0000:77df  pop cx
0000:77e0  push ax
0000:77e1  push dx
0000:77e2  xor dx,dx
0000:77e4  mov ax,0E10h
0000:77e7  pop cx
0000:77e8  pop bx
0000:77e9  call 86E5h
0000:77ec  mov [69F8h],dx
0000:77f0  mov [69F6h],ax
0000:77f3  mov word ptr [69FAh],0
0000:77f9  mov si,3
0000:77fc  jmp short 787Ah
0000:77fe  les bx,[bp-4]
0000:7801  mov al,es:[bx+si]
0000:7804  cbw
0000:7805  mov bx,ax
0000:7807  test byte ptr [bx+6695h],0Ch
0000:780c  je short 7879h
0000:780e  mov ax,[bp-4]
0000:7811  add ax,si
0000:7813  push word ptr [bp-2]
0000:7816  push ax
0000:7817  call far 7599h,0
0000:781c  pop cx
0000:781d  pop cx
0000:781e  cmp ax,3
0000:7821  jb short 7886h
0000:7823  les bx,[bp-4]
0000:7826  mov al,es:[bx+si+1]
0000:782a  cbw
0000:782b  mov bx,ax
0000:782d  mov al,[bx+6695h]
0000:7831  cbw
0000:7832  test ax,0Ch
0000:7835  je short 7886h
0000:7837  mov bx,[bp-4]
0000:783a  mov al,es:[bx+si+2]
0000:783e  cbw
0000:783f  mov bx,ax
0000:7841  mov al,[bx+6695h]
0000:7845  cbw
0000:7846  test ax,0Ch
0000:7849  je short 7886h
0000:784b  mov ax,3
0000:784e  push ax
0000:784f  mov ax,[bp-4]
0000:7852  add ax,si
0000:7854  push word ptr [bp-2]
0000:7857  push ax
0000:7858  push word ptr [69F4h]
0000:785c  push word ptr [69F2h]
0000:7860  call far 75DCh,0
0000:7865  add sp,0Ah
0000:7868  les bx,[69F2h]
0000:786c  mov byte ptr es:[bx+3],0
0000:7871  mov word ptr [69FAh],1
0000:7877  jmp short 7886h
0000:7879  inc si
0000:787a  les bx,[bp-4]
0000:787d  cmp byte ptr es:[bx+si],0
0000:7881  je short 7886h
0000:7883  jmp 77FEh
0000:7886  pop si
0000:7887  mov sp,bp
0000:7889  pop bp
0000:788a  ret far

; Candidate 0000:796a, file offset 0xab6a
0000:796a  push bp
0000:796b  mov bp,sp
0000:796d  push ds
0000:796e  mov ah,41h
0000:7970  lds dx,[bp+6]
0000:7973  int 21h
0000:7975  pop ds
0000:7976  jb short 797Ch
0000:7978  xor ax,ax
0000:797a  jmp short 7980h
0000:797c  push ax
0000:797d  call 6F51h
0000:7980  pop bp
0000:7981  ret far

; Candidate 0000:7e69, file offset 0xb069
0000:7e69  push bp
0000:7e6a  mov bp,sp
0000:7e6c  mov bx,[bp+6]
0000:7e6f  shl bx,1
0000:7e71  test word ptr [bx+6934h],800h
0000:7e77  je short 7E8Eh
0000:7e79  mov ax,2
0000:7e7c  push ax
0000:7e7d  xor ax,ax
0000:7e7f  xor dx,dx
0000:7e81  push ax
0000:7e82  push dx
0000:7e83  push word ptr [bp+6]
0000:7e86  call far 6F9Fh,0
0000:7e8b  add sp,8
0000:7e8e  push ds
0000:7e8f  mov ah,40h
0000:7e91  mov bx,[bp+6]
0000:7e94  mov cx,[bp+0Ch]
0000:7e97  lds dx,[bp+8]
0000:7e9a  int 21h
0000:7e9c  pop ds
0000:7e9d  jb short 7EAEh
0000:7e9f  push ax
0000:7ea0  mov bx,[bp+6]
0000:7ea3  shl bx,1
0000:7ea5  or word ptr [bx+6934h],1000h
0000:7eab  pop ax
0000:7eac  jmp short 7EB2h
0000:7eae  push ax
0000:7eaf  call 6F51h
0000:7eb2  pop bp
0000:7eb3  ret far

; Candidate 0000:7ff2, file offset 0xb1f2
0000:7ff2  push bp
0000:7ff3  mov bp,sp
0000:7ff5  push si
0000:7ff6  push di
0000:7ff7  mov cs:[7EBAh],ds
0000:7ffc  mov dx,[bp+8]
0000:7fff  or dx,dx
0000:8001  je short 8012h
0000:8003  cmp dx,cs:[7EB6h]
0000:8008  jne short 800Fh
0000:800a  call 7EC0h
0000:800d  jmp short 8012h
0000:800f  call 7F22h
0000:8012  mov ds,cs:[7EBAh]
0000:8017  pop di
0000:8018  pop si
0000:8019  pop bp
0000:801a  ret far

; Candidate 0000:80d8, file offset 0xb2d8
0000:80d8  push bp
0000:80d9  mov bp,sp
0000:80db  xor dx,dx
0000:80dd  mov ax,[bp+6]
0000:80e0  jmp short 80EBh
0000:80e2  push bp
0000:80e3  mov bp,sp
0000:80e5  mov dx,[bp+8]
0000:80e8  mov ax,[bp+6]
0000:80eb  push si
0000:80ec  push di
0000:80ed  mov cs:[7EBAh],ds
0000:80f2  mov cx,ax
0000:80f4  or cx,dx
0000:80f6  je short 8156h
0000:80f8  add ax,13h
0000:80fb  adc dx,0
0000:80fe  jb short 8141h
0000:8100  test dx,0FFF0h
0000:8104  jne short 8141h
0000:8106  mov cl,4
0000:8108  shr ax,cl
0000:810a  shl dx,cl
0000:810c  or ah,dl
0000:810e  mov dx,cs:[7EB4h]
0000:8113  or dx,dx
0000:8115  je short 8137h
0000:8117  mov dx,cs:[7EB8h]
0000:811c  or dx,dx
0000:811e  je short 8132h
0000:8120  mov bx,dx
0000:8122  mov ds,dx
0000:8124  cmp [0],ax
0000:8128  jae short 8146h
0000:812a  mov dx,[6]
0000:812e  cmp dx,bx
0000:8130  jne short 8122h
0000:8132  call 807Ch
0000:8135  jmp short 8156h
0000:8137  call 801Bh
0000:813a  jmp short 8156h
0000:813c  call 80B5h
0000:813f  jmp short 8156h
0000:8141  xor ax,ax
0000:8143  cwd
0000:8144  jmp short 8156h
0000:8146  ja short 813Ch
0000:8148  call 7F93h
0000:814b  mov bx,[8]
0000:814f  mov [2],bx
0000:8153  mov ax,4
0000:8156  mov ds,cs:[7EBAh]
0000:815b  pop di
0000:815c  pop si
0000:815d  pop bp
0000:815e  ret far

; Candidate 0000:80e2, file offset 0xb2e2
0000:80e2  push bp
0000:80e3  mov bp,sp
0000:80e5  mov dx,[bp+8]
0000:80e8  mov ax,[bp+6]
0000:80eb  push si
0000:80ec  push di
0000:80ed  mov cs:[7EBAh],ds
0000:80f2  mov cx,ax
0000:80f4  or cx,dx
0000:80f6  je short 8156h
0000:80f8  add ax,13h
0000:80fb  adc dx,0
0000:80fe  jb short 8141h
0000:8100  test dx,0FFF0h
0000:8104  jne short 8141h
0000:8106  mov cl,4
0000:8108  shr ax,cl
0000:810a  shl dx,cl
0000:810c  or ah,dl
0000:810e  mov dx,cs:[7EB4h]
0000:8113  or dx,dx
0000:8115  je short 8137h
0000:8117  mov dx,cs:[7EB8h]
0000:811c  or dx,dx
0000:811e  je short 8132h
0000:8120  mov bx,dx
0000:8122  mov ds,dx
0000:8124  cmp [0],ax
0000:8128  jae short 8146h
0000:812a  mov dx,[6]
0000:812e  cmp dx,bx
0000:8130  jne short 8122h
0000:8132  call 807Ch
0000:8135  jmp short 8156h
0000:8137  call 801Bh
0000:813a  jmp short 8156h
0000:813c  call 80B5h
0000:813f  jmp short 8156h
0000:8141  xor ax,ax
0000:8143  cwd
0000:8144  jmp short 8156h
0000:8146  ja short 813Ch
0000:8148  call 7F93h
0000:814b  mov bx,[8]
0000:814f  mov [2],bx
0000:8153  mov ax,4
0000:8156  mov ds,cs:[7EBAh]
0000:815b  pop di
0000:815c  pop si
0000:815d  pop bp
0000:815e  ret far

; Candidate 0000:823b, file offset 0xb43b
0000:823b  push bp
0000:823c  mov bp,sp
0000:823e  xor dx,dx
0000:8240  jmp short 8248h
0000:8242  push bp
0000:8243  mov bp,sp
0000:8245  mov dx,[bp+0Ch]
0000:8248  mov ax,[bp+0Ah]
0000:824b  mov bx,[bp+8]
0000:824e  push si
0000:824f  push di
0000:8250  mov cs:[7EBAh],ds
0000:8255  mov cs:[7EBCh],dx
0000:825a  mov cs:[7EBEh],ax
0000:825e  or bx,bx
0000:8260  je short 8294h
0000:8262  mov cx,ax
0000:8264  or cx,dx
0000:8266  je short 829Ch
0000:8268  add ax,13h
0000:826b  adc dx,0
0000:826e  mov cl,4
0000:8270  shr ax,cl
0000:8272  shl dx,cl
0000:8274  or ah,dl
0000:8276  mov es,bx
0000:8278  mov cx,es:[0]
0000:827d  cmp cx,ax
0000:827f  jb short 828Fh
0000:8281  ja short 828Ah
0000:8283  mov dx,bx
0000:8285  mov ax,4
0000:8288  jmp short 82A7h
0000:828a  call 81D9h
0000:828d  jmp short 82A7h
0000:828f  call 815Fh
0000:8292  jmp short 82A7h
0000:8294  push dx
0000:8295  push ax
0000:8296  push cs
0000:8297  call 80E2h
0000:829a  jmp short 82A5h
0000:829c  push bx
0000:829d  push ax
0000:829e  push cs
0000:829f  call 7FF2h
0000:82a2  xor ax,ax
0000:82a4  cwd
0000:82a5  pop di
0000:82a6  pop di
0000:82a7  mov ds,cs:[7EBAh]
0000:82ac  pop di
0000:82ad  pop si
0000:82ae  pop bp
0000:82af  ret far

; Candidate 0000:82b0, file offset 0xb4b0
0000:82b0  push si
0000:82b1  push di
0000:82b2  push bp
0000:82b3  push ds
0000:82b4  mov ax,cs:[7EB4h]
0000:82b8  or ax,ax
0000:82ba  jne short 82BFh
0000:82bc  jmp 839Ah
0000:82bf  xor bx,bx
0000:82c1  push bx
0000:82c2  push bx
0000:82c3  call 5B71h
0000:82c6  add sp,4
0000:82c9  or ax,ax
0000:82cb  je short 82D0h
0000:82cd  jmp 8395h
0000:82d0  mov bx,cs:[7EB6h]
0000:82d5  mov ds,bx
0000:82d7  add bx,[0]
0000:82db  cmp bx,dx
0000:82dd  je short 82E2h
0000:82df  jmp 8395h
0000:82e2  mov ax,cs:[7EB4h]
0000:82e6  xor cx,cx
0000:82e8  mov dx,cx
0000:82ea  mov ds,ax
0000:82ec  add ax,[0]
0000:82f0  mov es,ax
0000:82f2  cmp word ptr [2],0
0000:82f7  jne short 8311h
0000:82f9  add cx,[0]
0000:82fd  mov si,ds
0000:82ff  cmp si,cs:[7EB6h]
0000:8304  je short 8355h
0000:8306  cmp word ptr es:[2],0
0000:830c  jne short 8311h
0000:830e  jmp 8395h
0000:8311  mov si,ds
0000:8313  mov di,es
0000:8315  cmp si,cs:[7EB6h]
0000:831a  je short 8355h
0000:831c  cmp si,di
0000:831e  je short 8395h
0000:8320  cmp word ptr [0],0
0000:8325  je short 8395h
0000:8327  cmp di,cs:[7EB4h]
0000:832c  jbe short 8395h
0000:832e  cmp di,cs:[7EB6h]
0000:8333  ja short 8395h
0000:8335  cmp word ptr es:[2],0
0000:833b  je short 8344h
0000:833d  cmp es:[2],si
0000:8342  jmp short 8349h
0000:8344  cmp es:[8],si
0000:8349  jne short 8395h
0000:834b  mov ds,di
0000:834d  add di,[0]
0000:8351  mov es,di
0000:8353  jmp short 82F2h
0000:8355  mov ax,cs:[7EB8h]
0000:8359  or ax,ax
0000:835b  je short 839Fh
0000:835d  mov ds,ax
0000:835f  mov si,ax
0000:8361  cmp word ptr [2],0
0000:8366  jne short 8395h
0000:8368  cmp si,cs:[7EB4h]
0000:836d  jb short 8395h
0000:836f  cmp si,cs:[7EB6h]
0000:8374  jae short 8395h
0000:8376  add dx,[0]
0000:837a  mov es,[6]
0000:837e  mov di,es
0000:8380  cmp di,ax
0000:8382  je short 839Fh
0000:8384  cmp si,di
0000:8386  je short 8395h
0000:8388  cmp es:[4],si
0000:838d  jne short 8395h
0000:838f  mov si,es
0000:8391  mov ds,si
0000:8393  jmp short 8361h
0000:8395  mov ax,0FFFFh
0000:8398  jmp short 83A6h
0000:839a  mov ax,1
0000:839d  jmp short 83A6h
0000:839f  cmp cx,dx
0000:83a1  jne short 8395h
0000:83a3  mov ax,2
0000:83a6  pop ds
0000:83a7  pop bp
0000:83a8  pop di
0000:83a9  pop si
0000:83aa  ret far

; Candidate 0000:84c0, file offset 0xb6c0
0000:84c0  push bp
0000:84c1  mov bp,sp
0000:84c3  push si
0000:84c4  push di
0000:84c5  mov di,[bp+6]
0000:84c8  push ds
0000:84c9  mov bx,[bp+8]
0000:84cc  cmp di,0FFF0h
0000:84cf  jb short 84D5h
0000:84d1  inc bx
0000:84d2  sub di,10h
0000:84d5  mov ds,bx
0000:84d7  mov bx,[di+2]
0000:84da  or bx,bx
0000:84dc  je short 84E9h
0000:84de  cmp bx,cs:[7EB6h]
0000:84e3  je short 852Fh
0000:84e5  or bx,bx
0000:84e7  jne short 84F6h
0000:84e9  mov bx,cs:[7EB4h]
0000:84ee  or bx,bx
0000:84f0  je short 852Ah
0000:84f2  mov es,bx
0000:84f4  jmp short 84FFh
0000:84f6  mov es,bx
0000:84f8  add bx,es:[0]
0000:84fd  mov es,bx
0000:84ff  mov [di+2],es
0000:8502  mov word ptr [di],4
0000:8506  mov ax,es:[0]
0000:850a  mov bx,10h
0000:850d  mul bx
0000:850f  mov [di+4],ax
0000:8512  mov [di+6],dx
0000:8515  mov word ptr [di+8],0
0000:851a  cmp word ptr es:[2],0
0000:8520  je short 8525h
0000:8522  inc word ptr [di+8]
0000:8525  mov ax,2
0000:8528  jmp short 8532h
0000:852a  mov ax,1
0000:852d  jmp short 8532h
0000:852f  mov ax,5
0000:8532  pop ds
0000:8533  pop di
0000:8534  pop si
0000:8535  pop bp
0000:8536  ret far

; Candidate 0000:8537, file offset 0xb737
0000:8537  push si
0000:8538  xchg si,ax
0000:8539  xchg dx,ax
0000:853a  test ax,ax
0000:853c  je short 8540h
0000:853e  mul bx
0000:8540  jcxz 8547h
0000:8542  xchg cx,ax
0000:8543  mul si
0000:8545  add ax,cx
0000:8547  xchg si,ax
0000:8548  mul bx
0000:854a  add dx,si
0000:854c  pop si
0000:854d  ret far

; Candidate 0000:8551, file offset 0xb751
0000:8551  xor cx,cx
0000:8553  jmp short 856Bh
0000:8555  pop cx
0000:8556  push cs
0000:8557  push cx
0000:8558  mov cx,1
0000:855b  jmp short 856Bh
0000:855d  pop cx
0000:855e  push cs
0000:855f  push cx
0000:8560  mov cx,2
0000:8563  jmp short 856Bh
0000:8565  pop cx
0000:8566  push cs
0000:8567  push cx
0000:8568  mov cx,3
0000:856b  push bp
0000:856c  push si
0000:856d  push di
0000:856e  mov bp,sp
0000:8570  mov di,cx
0000:8572  mov ax,[bp+0Ah]
0000:8575  mov dx,[bp+0Ch]
0000:8578  mov bx,[bp+0Eh]
0000:857b  mov cx,[bp+10h]
0000:857e  or cx,cx
0000:8580  jne short 858Ah
0000:8582  or dx,dx
0000:8584  je short 85EFh
0000:8586  or bx,bx
0000:8588  je short 85EFh
0000:858a  test di,1
0000:858e  jne short 85ACh
0000:8590  or dx,dx
0000:8592  jns short 859Eh
0000:8594  neg dx
0000:8596  neg ax
0000:8598  sbb dx,0
0000:859b  or di,0Ch
0000:859e  or cx,cx
0000:85a0  jns short 85ACh
0000:85a2  neg cx
0000:85a4  neg bx
0000:85a6  sbb cx,0
0000:85a9  xor di,4
0000:85ac  mov bp,cx
0000:85ae  mov cx,20h
0000:85b1  push di
0000:85b2  xor di,di
0000:85b4  xor si,si
0000:85b6  shl ax,1
0000:85b8  rcl dx,1
0000:85ba  rcl si,1
0000:85bc  rcl di,1
0000:85be  cmp di,bp
0000:85c0  jb short 85CDh
0000:85c2  ja short 85C8h
0000:85c4  cmp si,bx
0000:85c6  jb short 85CDh
0000:85c8  sub si,bx
0000:85ca  sbb di,bp
0000:85cc  inc ax
0000:85cd  loop 85B6h
0000:85cf  pop bx
0000:85d0  test bx,2
0000:85d4  je short 85DCh
0000:85d6  mov ax,si
0000:85d8  mov dx,di
0000:85da  shr bx,1
0000:85dc  test bx,4
0000:85e0  je short 85E9h
0000:85e2  neg dx
0000:85e4  neg ax
0000:85e6  sbb dx,0
0000:85e9  pop di
0000:85ea  pop si
0000:85eb  pop bp
0000:85ec  ret far 8

; Candidate 0000:8558, file offset 0xb758
0000:8558  mov cx,1
0000:855b  jmp short 856Bh
0000:855d  pop cx
0000:855e  push cs
0000:855f  push cx
0000:8560  mov cx,2
0000:8563  jmp short 856Bh
0000:8565  pop cx
0000:8566  push cs
0000:8567  push cx
0000:8568  mov cx,3
0000:856b  push bp
0000:856c  push si
0000:856d  push di
0000:856e  mov bp,sp
0000:8570  mov di,cx
0000:8572  mov ax,[bp+0Ah]
0000:8575  mov dx,[bp+0Ch]
0000:8578  mov bx,[bp+0Eh]
0000:857b  mov cx,[bp+10h]
0000:857e  or cx,cx
0000:8580  jne short 858Ah
0000:8582  or dx,dx
0000:8584  je short 85EFh
0000:8586  or bx,bx
0000:8588  je short 85EFh
0000:858a  test di,1
0000:858e  jne short 85ACh
0000:8590  or dx,dx
0000:8592  jns short 859Eh
0000:8594  neg dx
0000:8596  neg ax
0000:8598  sbb dx,0
0000:859b  or di,0Ch
0000:859e  or cx,cx
0000:85a0  jns short 85ACh
0000:85a2  neg cx
0000:85a4  neg bx
0000:85a6  sbb cx,0
0000:85a9  xor di,4
0000:85ac  mov bp,cx
0000:85ae  mov cx,20h
0000:85b1  push di
0000:85b2  xor di,di
0000:85b4  xor si,si
0000:85b6  shl ax,1
0000:85b8  rcl dx,1
0000:85ba  rcl si,1
0000:85bc  rcl di,1
0000:85be  cmp di,bp
0000:85c0  jb short 85CDh
0000:85c2  ja short 85C8h
0000:85c4  cmp si,bx
0000:85c6  jb short 85CDh
0000:85c8  sub si,bx
0000:85ca  sbb di,bp
0000:85cc  inc ax
0000:85cd  loop 85B6h
0000:85cf  pop bx
0000:85d0  test bx,2
0000:85d4  je short 85DCh
0000:85d6  mov ax,si
0000:85d8  mov dx,di
0000:85da  shr bx,1
0000:85dc  test bx,4
0000:85e0  je short 85E9h
0000:85e2  neg dx
0000:85e4  neg ax
0000:85e6  sbb dx,0
0000:85e9  pop di
0000:85ea  pop si
0000:85eb  pop bp
0000:85ec  ret far 8

; Candidate 0000:85ff, file offset 0xb7ff
0000:85ff  cmp cl,10h
0000:8602  jae short 8614h
0000:8604  mov bx,ax
0000:8606  shl ax,cl
0000:8608  shl dx,cl
0000:860a  neg cl
0000:860c  add cl,10h
0000:860f  shr bx,cl
0000:8611  or dx,bx
0000:8613  ret far

; Candidate 0000:8620, file offset 0xb820
0000:8620  cmp cl,10h
0000:8623  jae short 8635h
0000:8625  mov bx,dx
0000:8627  shr ax,cl
0000:8629  shr dx,cl
0000:862b  neg cl
0000:862d  add cl,10h
0000:8630  shl bx,cl
0000:8632  or ax,bx
0000:8634  ret far

; Candidate 0000:86c9, file offset 0xb8c9
0000:86c9  push bp
0000:86ca  mov bp,sp
0000:86cc  push si
0000:86cd  push di
0000:86ce  push ds
0000:86cf  lds si,[bp+6]
0000:86d2  les di,[bp+0Ah]
0000:86d5  cld
0000:86d6  shr cx,1
0000:86d8  rep movsw [di],[si]
0000:86da  adc cx,cx
0000:86dc  rep movsb [di],[si]
0000:86de  pop ds
0000:86df  pop di
0000:86e0  pop si
0000:86e1  pop bp
0000:86e2  ret far 8

; Candidate 0889:000a, file offset 0xba9a
0889:000a  push bp
0889:000b  mov bp,sp
0889:000d  sub sp,10h
0889:0010  push si
0889:0011  push di
0889:0012  mov di,[bp+6]
0889:0015  mov ax,[6A70h]
0889:0018  mov [6A70h],ax
0889:001b  les bx,[6A72h]
0889:001f  mov ax,es:[bx+2]
0889:0023  mov dx,es:[bx]
0889:0026  mov es:[bx+2],ax
0889:002a  mov es:[bx],dx
0889:002d  mov word ptr [bp-2],1
0889:0032  cmp di,1
0889:0035  jle short 0058h
0889:0037  push ds
0889:0038  mov ax,1CE0h
0889:003b  push ax
0889:003c  les bx,[bp+8]
0889:003f  push word ptr es:[bx+6]
0889:0043  push word ptr es:[bx+4]
0889:0047  call far 7540h,0
0889:004c  add sp,8
0889:004f  or ax,ax
0889:0051  jne short 0058h
0889:0053  mov word ptr [bp-2],0
0889:0058  mov ax,8001h
0889:005b  push ax
0889:005c  push ds
0889:005d  mov ax,1CE3h
0889:0060  push ax
0889:0061  call far 71EAh,0
0889:0066  add sp,6
0889:0069  mov si,ax
0889:006b  cmp si,0FFFFh
0889:006e  je short 00BFh
0889:0070  mov ax,2
0889:0073  push ax
0889:0074  push ds
0889:0075  mov ax,628Ah
0889:0078  push ax
0889:0079  push si
0889:007a  call far 7384h,0
0889:007f  add sp,8
0889:0082  mov ax,2
0889:0085  push ax
0889:0086  push ds
0889:0087  mov ax,638Ah
0889:008a  push ax
0889:008b  push si
0889:008c  call far 7384h,0
0889:0091  add sp,8
0889:0094  cmp word ptr [638Ah],0
0889:0099  je short 00A0h
0889:009b  mov ax,1
0889:009e  jmp short 00A2h
0889:00a0  xor ax,ax
0889:00a2  mov [65FAh],ax
0889:00a5  mov ax,2
0889:00a8  push ax
0889:00a9  push ss
0889:00aa  lea ax,[bp-4]
0889:00ad  push ax
0889:00ae  push si
0889:00af  call far 7384h,0
0889:00b4  add sp,8
0889:00b7  push si
0889:00b8  call far 5A5Fh,0
0889:00bd  jmp short 00D7h
0889:00bf  push word ptr [2634h]
0889:00c3  push word ptr [2632h]
0889:00c7  call far 6,2246h
0889:00cc  add sp,4
0889:00cf  xor ax,ax
0889:00d1  push ax
0889:00d2  call far 5A8Dh,0
0889:00d7  inc sp
0889:00d8  inc sp
0889:00d9  mov ax,[7Bh]
0889:00dc  dec ax
0889:00dd  mov [bp-6],ax
0889:00e0  mov word ptr [bp-8],3
0889:00e5  cmp word ptr [628Ah],3
0889:00ea  jne short 00F8h
0889:00ec  mov word ptr [bp-0Eh],8
0889:00f1  mov word ptr [bp-10h],9F08h
0889:00f6  jmp short 0102h
0889:00f8  mov word ptr [bp-0Eh],8
0889:00fd  mov word ptr [bp-10h],0B290h
0889:0102  les bx,[bp-8]
0889:0105  mov ax,es:[bx]
0889:0108  xor dx,dx
0889:010a  mov cl,4
0889:010c  call far 85FFh,0
0889:0111  mov bx,[bp-0Eh]
0889:0114  mov cx,[bp-10h]
0889:0117  sub cx,ax
0889:0119  sbb bx,dx
0889:011b  mov [bp-0Ah],bx
0889:011e  mov [bp-0Ch],cx
0889:0121  push word ptr [bp-2]
0889:0124  push word ptr [bp-0Ah]
0889:0127  push word ptr [bp-0Ch]
0889:012a  push word ptr [1CCAh]
0889:012e  push word ptr [1CC8h]
0889:0132  call far 2,216Dh
0889:0137  add sp,0Ah
0889:013a  or ax,ax
0889:013c  je short 015Ah
0889:013e  push word ptr [bp-0Eh]
0889:0141  push word ptr [bp-10h]
0889:0144  push word ptr [2630h]
0889:0148  push word ptr [262Eh]
0889:014c  call far 5F48h,0
0889:0151  add sp,8
0889:0154  mov ax,1
0889:0157  jmp 024Fh
0889:015a  xor ax,ax
0889:015c  mov dx,0FBF4h
0889:015f  mov [62EDh],ax
0889:0162  mov [62EBh],dx
0889:0166  mov [62E9h],ax
0889:0169  mov [62E7h],dx
0889:016d  xor ax,ax
0889:016f  mov dx,0FBF4h
0889:0172  mov [62F5h],ax
0889:0175  mov [62F3h],dx
0889:0179  mov [62F1h],ax
0889:017c  mov [62EFh],dx
0889:0180  xor ax,ax
0889:0182  mov dx,7D00h
0889:0185  mov [62FDh],ax
0889:0188  mov [62FBh],dx
0889:018c  mov [62F9h],ax
0889:018f  mov [62F7h],dx
0889:0193  xor ax,ax
0889:0195  mov dx,0FC58h
0889:0198  mov [6305h],ax
0889:019b  mov [6303h],dx
0889:019f  mov [6301h],ax
0889:01a2  mov [62FFh],dx
0889:01a6  mov word ptr [6296h],1A37h
0889:01ac  mov word ptr [6294h],286h
0889:01b2  mov word ptr [62A3h],1A37h
0889:01b8  mov word ptr [62A1h],66h
0889:01be  mov word ptr [629Ch],1F39h
0889:01c4  mov word ptr [629Ah],1
0889:01ca  push word ptr [1CC6h]
0889:01ce  push word ptr [1CC4h]
0889:01d2  push word ptr [628Ah]
0889:01d6  call far 000Bh,212Dh
0889:01db  add sp,6
0889:01de  or ax,ax
0889:01e0  je short 0248h
0889:01e2  push word ptr [638Ah]
0889:01e6  call far 020Bh,1C9Fh
0889:01eb  inc sp
0889:01ec  inc sp
0889:01ed  xor ax,ax
0889:01ef  mov dx,300h
0889:01f2  push ax
0889:01f3  push dx
0889:01f4  push word ptr [0F16Ah]
0889:01f8  push word ptr [0F168h]
0889:01fc  push ds
0889:01fd  mov ax,1CF0h
0889:0200  push ax
0889:0201  call far 0,2069h
0889:0206  add sp,0Ch
0889:0209  push word ptr [0F16Ah]
0889:020d  push word ptr [0F168h]
0889:0211  call far 000Dh,2111h
0889:0216  add sp,4
0889:0219  mov al,[6654h]
0889:021c  mov ah,0
0889:021e  or ax,ax
0889:0220  jne short 0229h
0889:0222  mov byte ptr [6655h],1
0889:0227  jmp short 0234h
0889:0229  mov ax,[bp-4]
0889:022c  neg ax
0889:022e  sbb ax,ax
0889:0230  inc ax
0889:0231  mov [6655h],al
0889:0234  push word ptr [bp+0Ah]
0889:0237  push word ptr [bp+8]
0889:023a  push di
0889:023b  call far 5,08AEh
0889:0240  add sp,6
0889:0243  call far 024Eh,1C9Fh
0889:0248  call far 0,215Fh
0889:024d  xor ax,ax
0889:024f  pop di
0889:0250  pop si
0889:0251  mov sp,bp
0889:0253  pop bp
0889:0254  ret far

; Candidate 08ae:0005, file offset 0xbce5
08ae:0005  push bp
08ae:0006  mov bp,sp
08ae:0008  mov byte ptr [0E4C5h],1
08ae:000d  call far 0129h,21B0h
08ae:0012  cmp word ptr [bp+6],0
08ae:0016  jne short 0024h
08ae:0018  les bx,[bp+8]
08ae:001b  les bx,es:[bx+4]
08ae:001f  cmp byte ptr es:[bx+1],0
08ae:0024  mov byte ptr [0EE3Bh],0
08ae:0029  xor ax,ax
08ae:002b  xor dx,dx
08ae:002d  push ax
08ae:002e  push dx
08ae:002f  push ax
08ae:0030  call far 0D9Ch,1F86h
08ae:0035  add sp,6
08ae:0038  or word ptr [65FEh],1
08ae:003e  mov ax,6
08ae:0041  push ax
08ae:0042  push ds
08ae:0043  mov ax,2FD6h
08ae:0046  push ax
08ae:0047  call far 5,208Ch
08ae:004c  add sp,6
08ae:004f  mov [9344h],dx
08ae:0053  mov [9342h],ax
08ae:0056  mov ax,7
08ae:0059  push ax
08ae:005a  call far 9,1F3Eh
08ae:005f  inc sp
08ae:0060  inc sp
08ae:0061  mov [0CB74h],dx
08ae:0065  mov [0CB72h],ax
08ae:0068  mov ax,5
08ae:006b  push ax
08ae:006c  call far 9,1F3Eh
08ae:0071  inc sp
08ae:0072  inc sp
08ae:0073  mov [0D0AEh],dx
08ae:0077  mov [0D0ACh],ax
08ae:007a  mov ax,3
08ae:007d  push ax
08ae:007e  call far 9,1F3Eh
08ae:0083  inc sp
08ae:0084  inc sp
08ae:0085  mov [0DF3Ch],dx
08ae:0089  mov [0DF3Ah],ax
08ae:008c  mov ax,[0CB74h]
08ae:008f  mov dx,[0CB72h]
08ae:0093  add dx,0B98Ch
08ae:0097  adc ax,0
08ae:009a  push ax
08ae:009b  push dx
08ae:009c  call far 0071h,2374h
08ae:00a1  add sp,4
08ae:00a4  mov [71C6h],dx
08ae:00a8  mov [71C4h],ax
08ae:00ab  add ax,1D54h
08ae:00ae  push word ptr [71C6h]
08ae:00b2  push ax
08ae:00b3  call far 0071h,2374h
08ae:00b8  add sp,4
08ae:00bb  mov [0E4D0h],dx
08ae:00bf  mov [0E4CEh],ax
08ae:00c2  mov ax,[0E4D0h]
08ae:00c5  mov dx,[0E4CEh]
08ae:00c9  add dx,1770h
08ae:00cd  mov [0EEE6h],ax
08ae:00d0  mov [0EEE4h],dx
08ae:00d4  mov ax,[0EEE6h]
08ae:00d7  add dx,100h
08ae:00db  mov [0EE32h],ax
08ae:00de  mov [0EE30h],dx
08ae:00e2  mov ax,[0EE32h]
08ae:00e5  add dx,100h
08ae:00e9  mov [0CD14h],ax
08ae:00ec  mov [0CD12h],dx
08ae:00f0  mov ax,[0CD14h]
08ae:00f3  add dx,100h
08ae:00f7  mov [0EEEAh],ax
08ae:00fa  mov [0EEE8h],dx
08ae:00fe  mov ax,[0EEEAh]
08ae:0101  add dx,100h
08ae:0105  mov [0CC28h],ax
08ae:0108  mov [0CC26h],dx
08ae:010c  mov ax,[0CC28h]
08ae:010f  add dx,100h
08ae:0113  mov [0D0A8h],ax
08ae:0116  mov [0D0A6h],dx
08ae:011a  mov ax,[0D0A8h]
08ae:011d  add dx,1F4h
08ae:0121  mov [0E63Fh],ax
08ae:0124  mov [0E63Dh],dx
08ae:0128  mov ax,[0E63Fh]
08ae:012b  mov [0D1C6h],ax
08ae:012e  mov [0D1C4h],dx
08ae:0132  mov ax,[0E63Fh]
08ae:0135  mov dx,[0E63Dh]
08ae:0139  add dx,578h
08ae:013d  mov [931Ah],ax
08ae:0140  mov [9318h],dx
08ae:0144  call far 025Ah,0
08ae:0149  add ax,2AF8h
08ae:014c  mov [0CBC6h],dx
08ae:0150  mov [0CBC4h],ax
08ae:0153  push ds
08ae:0154  mov ax,2FE0h
08ae:0157  push ax
08ae:0158  call far 9,1C9Fh
08ae:015d  add sp,4
08ae:0160  mov ax,0FC00h
08ae:0163  push ax
08ae:0164  push word ptr [62B5h]
08ae:0168  call far 0230h,2069h
08ae:016d  add sp,4
08ae:0170  call far 004Dh,2ADDh
08ae:0175  call far 002Fh,2ADDh
08ae:017a  push word ptr [9344h]
08ae:017e  push word ptr [9342h]
08ae:0182  call far 000Ah,2166h
08ae:0187  add sp,4
08ae:018a  and word ptr [65FEh],0FFFEh
08ae:0190  call far 0EACh,0BB3h
08ae:0195  pop bp
08ae:0196  ret far

; Candidate 08ae:0197, file offset 0xbe77
08ae:0197  push bp
08ae:0198  mov bp,sp
08ae:019a  dec sp
08ae:019b  dec sp
08ae:019c  push si
08ae:019d  mov si,[bp+6]
08ae:01a0  push si
08ae:01a1  call far 037Ch,0E24h
08ae:01a6  inc sp
08ae:01a7  inc sp
08ae:01a8  or si,si
08ae:01aa  je short 01E1h
08ae:01ac  call far 0352h,0E24h
08ae:01b1  cmp ax,si
08ae:01b3  jne short 01E1h
08ae:01b5  cmp word ptr [636Fh],7
08ae:01ba  jne short 01D1h
08ae:01bc  push si
08ae:01bd  call far 05D1h,0CBEh
08ae:01c2  inc sp
08ae:01c3  inc sp
08ae:01c4  push ds
08ae:01c5  mov ax,2FE6h
08ae:01c8  push ax
08ae:01c9  call far 0284h,21B0h
08ae:01ce  add sp,4
08ae:01d1  mov ax,si
08ae:01d3  mov dx,0Eh
08ae:01d6  imul dx
08ae:01d8  mov bx,ax
08ae:01da  mov al,[bx+71CDh]
08ae:01de  cbw
08ae:01df  mov si,ax
08ae:01e1  mov al,[6655h]
08ae:01e4  mov ah,0
08ae:01e6  or ax,ax
08ae:01e8  je short 01EDh
08ae:01ea  jmp 028Fh
08ae:01ed  mov ax,[6DD6h]
08ae:01f0  mov dx,0Eh
08ae:01f3  imul dx
08ae:01f5  mov bx,ax
08ae:01f7  test byte ptr [bx+71CCh],80h
08ae:01fc  je short 020Eh
08ae:01fe  mov ax,[6DDCh]
08ae:0201  and ax,2
08ae:0204  or ax,0
08ae:0207  je short 020Eh
08ae:0209  mov ax,1
08ae:020c  jmp short 0210h
08ae:020e  xor ax,ax
08ae:0210  mov [bp-1],al
08ae:0213  or si,si
08ae:0215  je short 025Dh
08ae:0217  cmp byte ptr [bp-1],0
08ae:021b  je short 025Dh
08ae:021d  xor ax,ax
08ae:021f  mov dx,12Ch
08ae:0222  push ax
08ae:0223  push dx
08ae:0224  push word ptr [0D0A8h]
08ae:0228  push word ptr [0D0A6h]
08ae:022c  mov bx,si
08ae:022e  shl bx,1
08ae:0230  shl bx,1
08ae:0232  push word ptr [bx-3118h]
08ae:0236  push word ptr [bx-311Ah]
08ae:023a  call far 4,2374h
08ae:023f  add sp,0Ch
08ae:0242  push word ptr [0CC28h]
08ae:0246  push word ptr [0CC26h]
08ae:024a  push word ptr [0D0A8h]
08ae:024e  push word ptr [0D0A6h]
08ae:0252  call far 10FEh,1A68h
08ae:0257  add sp,8
08ae:025a  mov si,70h
08ae:025d  or si,si
08ae:025f  jle short 0275h
08ae:0261  mov bx,si
08ae:0263  shl bx,1
08ae:0265  shl bx,1
08ae:0267  push word ptr [bx-3118h]
08ae:026b  push word ptr [bx-311Ah]
08ae:026f  mov ax,8
08ae:0272  push ax
08ae:0273  jmp short 0286h
08ae:0275  mov bx,si
08ae:0277  shl bx,1
08ae:0279  shl bx,1
08ae:027b  push word ptr [bx-3118h]
08ae:027f  push word ptr [bx-311Ah]
08ae:0283  xor ax,ax
08ae:0285  push ax
08ae:0286  push ax
08ae:0287  call far 0,237Dh
08ae:028c  add sp,8
08ae:028f  pop si
08ae:0290  mov sp,bp
08ae:0292  pop bp
08ae:0293  ret far

; Candidate 08d7:04d2, file offset 0xc442
08d7:04d2  push bp
08d7:04d3  mov bp,sp
08d7:04d5  sub sp,4
08d7:04d8  mov ax,[bp+6]
08d7:04db  cwd
08d7:04dc  mov bx,[667Eh]
08d7:04e0  mov cx,[667Ch]
08d7:04e4  add cx,ax
08d7:04e6  adc bx,dx
08d7:04e8  mov [bp-2],bx
08d7:04eb  mov [bp-4],cx
08d7:04ee  mov ax,[667Eh]
08d7:04f1  mov dx,[667Ch]
08d7:04f5  cmp ax,[bp-2]
08d7:04f8  jb short 04EEh
08d7:04fa  jne short 0501h
08d7:04fc  cmp dx,[bp-4]
08d7:04ff  jb short 04EEh
08d7:0501  mov sp,bp
08d7:0503  pop bp
08d7:0504  ret far

; Candidate 08d7:0505, file offset 0xc475
08d7:0505  push bp
08d7:0506  mov bp,sp
08d7:0508  dec sp
08d7:0509  dec sp
08d7:050a  push si
08d7:050b  push di
08d7:050c  mov word ptr [bp-2],0
08d7:0511  cmp byte ptr [bp+8],0
08d7:0515  jle short 0560h
08d7:0517  cmp byte ptr [bp+6],0
08d7:051b  jle short 0560h
08d7:051d  xor di,di
08d7:051f  jmp short 0558h
08d7:0521  xor ax,ax
08d7:0523  mov dx,8000h
08d7:0526  push ax
08d7:0527  push dx
08d7:0528  call far 62A3h,0
08d7:052d  cwd
08d7:052e  push ax
08d7:052f  mov al,[bp+8]
08d7:0532  cbw
08d7:0533  push dx
08d7:0534  cwd
08d7:0535  pop cx
08d7:0536  pop bx
08d7:0537  call far 8537h,0
08d7:053c  push dx
08d7:053d  push ax
08d7:053e  call far 8551h,0
08d7:0543  inc ax
08d7:0544  mov si,ax
08d7:0546  mov al,[bp+8]
08d7:0549  cbw
08d7:054a  cmp ax,si
08d7:054c  jge short 0554h
08d7:054e  mov al,[bp+8]
08d7:0551  cbw
08d7:0552  sub si,ax
08d7:0554  add [bp-2],si
08d7:0557  inc di
08d7:0558  mov al,[bp+6]
08d7:055b  cbw
08d7:055c  cmp ax,di
08d7:055e  jg short 0521h
08d7:0560  mov al,[bp+0Ah]
08d7:0563  cbw
08d7:0564  push ax
08d7:0565  mov ax,[bp-2]
08d7:0568  pop dx
08d7:0569  add ax,dx
08d7:056b  pop di
08d7:056c  pop si
08d7:056d  mov sp,bp
08d7:056f  pop bp
08d7:0570  ret far

; Candidate 08d7:0571, file offset 0xc4e1
08d7:0571  push bp
08d7:0572  mov bp,sp
08d7:0574  push si
08d7:0575  push di
08d7:0576  mov si,[bp+6]
08d7:0579  mov di,[bp+8]
08d7:057c  push word ptr [bp+0Eh]
08d7:057f  push di
08d7:0580  push word ptr [bp+0Ah]
08d7:0583  push di
08d7:0584  push si
08d7:0585  call far dword ptr [6566h]
08d7:0589  add sp,0Ah
08d7:058c  push word ptr [bp+0Eh]
08d7:058f  push word ptr [bp+0Ch]
08d7:0592  push word ptr [bp+0Ah]
08d7:0595  push word ptr [bp+0Ch]
08d7:0598  push si
08d7:0599  call far dword ptr [6566h]
08d7:059d  add sp,0Ah
08d7:05a0  push word ptr [bp+0Eh]
08d7:05a3  push word ptr [bp+0Ch]
08d7:05a6  push si
08d7:05a7  push di
08d7:05a8  push si
08d7:05a9  call far dword ptr [6566h]
08d7:05ad  add sp,0Ah
08d7:05b0  push word ptr [bp+0Eh]
08d7:05b3  push word ptr [bp+0Ch]
08d7:05b6  push word ptr [bp+0Ah]
08d7:05b9  push di
08d7:05ba  push word ptr [bp+0Ah]
08d7:05bd  call far dword ptr [6566h]
08d7:05c1  add sp,0Ah
08d7:05c4  pop di
08d7:05c5  pop si
08d7:05c6  pop bp
08d7:05c7  ret far

; Candidate 08d7:067f, file offset 0xc5ef
08d7:067f  push bp
08d7:0680  mov bp,sp
08d7:0682  push si
08d7:0683  push di
08d7:0684  mov si,[bp+6]
08d7:0687  mov di,[bp+8]
08d7:068a  cmp si,[bp+0Ah]
08d7:068d  jl short 0694h
08d7:068f  cmp si,[bp+0Eh]
08d7:0692  jle short 0698h
08d7:0694  xor ax,ax
08d7:0696  jmp short 06A9h
08d7:0698  cmp di,[bp+0Ch]
08d7:069b  jl short 06A2h
08d7:069d  cmp di,[bp+10h]
08d7:06a0  jle short 06A6h
08d7:06a2  xor ax,ax
08d7:06a4  jmp short 06A9h
08d7:06a6  mov ax,1
08d7:06a9  pop di
08d7:06aa  pop si
08d7:06ab  pop bp
08d7:06ac  ret far

; Candidate 08d7:06ad, file offset 0xc61d
08d7:06ad  push bp
08d7:06ae  mov bp,sp
08d7:06b0  push si
08d7:06b1  push di
08d7:06b2  mov si,[bp+0Ch]
08d7:06b5  mov di,[bp+0Eh]
08d7:06b8  mov bx,[bp+10h]
08d7:06bb  mov cl,4
08d7:06bd  shl bx,cl
08d7:06bf  mov ax,[bx+1CFCh]
08d7:06c3  shl ax,1
08d7:06c5  shl ax,1
08d7:06c7  shl ax,1
08d7:06c9  sub si,ax
08d7:06cb  mov bx,[bp+10h]
08d7:06ce  shl bx,cl
08d7:06d0  sub di,[bx+1CFEh]
08d7:06d4  push word ptr [bp+10h]
08d7:06d7  push di
08d7:06d8  push si
08d7:06d9  push word ptr [bp+0Ah]
08d7:06dc  push word ptr [bp+8]
08d7:06df  push word ptr [bp+6]
08d7:06e2  call far 004Ah,1DA3h
08d7:06e7  add sp,0Ch
08d7:06ea  pop di
08d7:06eb  pop si
08d7:06ec  pop bp
08d7:06ed  ret far

; Candidate 08d7:06ee, file offset 0xc65e
08d7:06ee  push bp
08d7:06ef  mov bp,sp
08d7:06f1  push si
08d7:06f2  push di
08d7:06f3  mov si,[bp+0Ch]
08d7:06f6  mov di,[bp+0Eh]
08d7:06f9  mov bx,[bp+10h]
08d7:06fc  mov cl,4
08d7:06fe  shl bx,cl
08d7:0700  mov ax,[bx+1CFCh]
08d7:0704  shl ax,1
08d7:0706  shl ax,1
08d7:0708  shl ax,1
08d7:070a  sub si,ax
08d7:070c  mov bx,[bp+10h]
08d7:070f  shl bx,cl
08d7:0711  sub di,[bx+1CFEh]
08d7:0715  push word ptr [bp+10h]
08d7:0718  push di
08d7:0719  push si
08d7:071a  push word ptr [bp+0Ah]
08d7:071d  push word ptr [bp+8]
08d7:0720  push word ptr [bp+6]
08d7:0723  call far 008Ah,1DA3h
08d7:0728  add sp,0Ch
08d7:072b  pop di
08d7:072c  pop si
08d7:072d  pop bp
08d7:072e  ret far

; Candidate 08d7:0808, file offset 0xc778
08d7:0808  push bp
08d7:0809  mov bp,sp
08d7:080b  dec sp
08d7:080c  dec sp
08d7:080d  les bx,[bp+6]
08d7:0810  mov al,es:[bx]
08d7:0813  mov [bp-1],al
08d7:0816  les bx,[bp+0Ah]
08d7:0819  mov al,es:[bx]
08d7:081c  les bx,[bp+6]
08d7:081f  mov es:[bx],al
08d7:0822  les bx,[bp+0Ah]
08d7:0825  mov al,[bp-1]
08d7:0828  mov es:[bx],al
08d7:082b  mov sp,bp
08d7:082d  pop bp
08d7:082e  ret far

; Candidate 08d7:082f, file offset 0xc79f
08d7:082f  push bp
08d7:0830  mov bp,sp
08d7:0832  push si
08d7:0833  mov si,[bp+12h]
08d7:0836  mov ax,si
08d7:0838  cwd
08d7:0839  push dx
08d7:083a  push ax
08d7:083b  push word ptr [bp+10h]
08d7:083e  push word ptr [bp+0Eh]
08d7:0841  push word ptr [bp+8]
08d7:0844  push word ptr [bp+6]
08d7:0847  call far 4,2374h
08d7:084c  add sp,0Ch
08d7:084f  mov ax,si
08d7:0851  cwd
08d7:0852  push dx
08d7:0853  push ax
08d7:0854  push word ptr [bp+8]
08d7:0857  push word ptr [bp+6]
08d7:085a  push word ptr [bp+0Ch]
08d7:085d  push word ptr [bp+0Ah]
08d7:0860  call far 4,2374h
08d7:0865  add sp,0Ch
08d7:0868  mov ax,si
08d7:086a  cwd
08d7:086b  push dx
08d7:086c  push ax
08d7:086d  push word ptr [bp+0Ch]
08d7:0870  push word ptr [bp+0Ah]
08d7:0873  push word ptr [bp+10h]
08d7:0876  push word ptr [bp+0Eh]
08d7:0879  call far 4,2374h
08d7:087e  add sp,0Ch
08d7:0881  pop si
08d7:0882  pop bp
08d7:0883  ret far

; Candidate 08d7:0908, file offset 0xc878
08d7:0908  push bp
08d7:0909  mov bp,sp
08d7:090b  push si
08d7:090c  push di
08d7:090d  mov si,[bp+0Ah]
08d7:0910  mov di,[bp+0Ch]
08d7:0913  push word ptr [bp+10h]
08d7:0916  mov ax,0Ch
08d7:0919  push ax
08d7:091a  push di
08d7:091b  mov ax,si
08d7:091d  dec ax
08d7:091e  push ax
08d7:091f  push word ptr [bp+8]
08d7:0922  push word ptr [bp+6]
08d7:0925  call far dword ptr [65F2h]
08d7:0929  add sp,0Ch
08d7:092c  xor ax,ax
08d7:092e  push ax
08d7:092f  mov ax,0Ch
08d7:0932  push ax
08d7:0933  mov ax,di
08d7:0935  inc ax
08d7:0936  push ax
08d7:0937  push si
08d7:0938  push word ptr [bp+8]
08d7:093b  push word ptr [bp+6]
08d7:093e  call far dword ptr [65F2h]
08d7:0942  add sp,0Ch
08d7:0945  xor ax,ax
08d7:0947  push ax
08d7:0948  mov ax,0Ch
08d7:094b  push ax
08d7:094c  mov ax,di
08d7:094e  inc ax
08d7:094f  push ax
08d7:0950  mov ax,si
08d7:0952  dec ax
08d7:0953  push ax
08d7:0954  push word ptr [bp+8]
08d7:0957  push word ptr [bp+6]
08d7:095a  call far dword ptr [65F2h]
08d7:095e  add sp,0Ch
08d7:0961  xor ax,ax
08d7:0963  push ax
08d7:0964  push word ptr [bp+0Eh]
08d7:0967  push di
08d7:0968  push si
08d7:0969  push word ptr [bp+8]
08d7:096c  push word ptr [bp+6]
08d7:096f  call far dword ptr [65F2h]
08d7:0973  add sp,0Ch
08d7:0976  pop di
08d7:0977  pop si
08d7:0978  pop bp
08d7:0979  ret far

; Candidate 08d7:09e2, file offset 0xc952
08d7:09e2  push bp
08d7:09e3  mov bp,sp
08d7:09e5  sub sp,14h
08d7:09e8  mov ax,0Ah
08d7:09eb  push ax
08d7:09ec  push ss
08d7:09ed  lea ax,[bp-14h]
08d7:09f0  push ax
08d7:09f1  push word ptr [bp+8]
08d7:09f4  push word ptr [bp+6]
08d7:09f7  call far 7096h,0
08d7:09fc  add sp,0Ah
08d7:09ff  push ss
08d7:0a00  lea ax,[bp-14h]
08d7:0a03  push ax
08d7:0a04  call far 7599h,0
08d7:0a09  add sp,4
08d7:0a0c  mov dx,3
08d7:0a0f  imul dx
08d7:0a11  mov sp,bp
08d7:0a13  pop bp
08d7:0a14  ret far

; Candidate 08d7:0a15, file offset 0xc985
08d7:0a15  push bp
08d7:0a16  mov bp,sp
08d7:0a18  sub sp,14h
08d7:0a1b  mov ax,0Ah
08d7:0a1e  push ax
08d7:0a1f  push ss
08d7:0a20  lea ax,[bp-14h]
08d7:0a23  push ax
08d7:0a24  push word ptr [bp+6]
08d7:0a27  call far 704Ah,0
08d7:0a2c  add sp,8
08d7:0a2f  push ss
08d7:0a30  lea ax,[bp-14h]
08d7:0a33  push ax
08d7:0a34  call far 7599h,0
08d7:0a39  add sp,4
08d7:0a3c  mov dx,3
08d7:0a3f  imul dx
08d7:0a41  mov sp,bp
08d7:0a43  pop bp
08d7:0a44  ret far

; Candidate 08d7:0a45, file offset 0xc9b5
08d7:0a45  push bp
08d7:0a46  mov bp,sp
08d7:0a48  push si
08d7:0a49  push di
08d7:0a4a  mov si,[bp+6]
08d7:0a4d  mov di,[bp+8]
08d7:0a50  cmp word ptr [bp+12h],0FFFFh
08d7:0a54  je short 0A72h
08d7:0a56  push word ptr [bp+12h]
08d7:0a59  mov ax,[bp+0Ch]
08d7:0a5c  dec ax
08d7:0a5d  push ax
08d7:0a5e  mov ax,[bp+0Ah]
08d7:0a61  dec ax
08d7:0a62  push ax
08d7:0a63  mov ax,di
08d7:0a65  inc ax
08d7:0a66  push ax
08d7:0a67  mov ax,si
08d7:0a69  inc ax
08d7:0a6a  push ax
08d7:0a6b  call far dword ptr [657Ah]
08d7:0a6f  add sp,0Ah
08d7:0a72  push word ptr [bp+0Eh]
08d7:0a75  push di
08d7:0a76  push word ptr [bp+0Ah]
08d7:0a79  push di
08d7:0a7a  mov ax,si
08d7:0a7c  inc ax
08d7:0a7d  push ax
08d7:0a7e  call far dword ptr [6566h]
08d7:0a82  add sp,0Ah
08d7:0a85  push word ptr [bp+0Eh]
08d7:0a88  mov ax,[bp+0Ch]
08d7:0a8b  dec ax
08d7:0a8c  push ax
08d7:0a8d  push word ptr [bp+0Ah]
08d7:0a90  push di
08d7:0a91  push word ptr [bp+0Ah]
08d7:0a94  call far dword ptr [6566h]
08d7:0a98  add sp,0Ah
08d7:0a9b  push word ptr [bp+10h]
08d7:0a9e  push word ptr [bp+0Ch]
08d7:0aa1  push si
08d7:0aa2  push di
08d7:0aa3  push si
08d7:0aa4  call far dword ptr [6566h]
08d7:0aa8  add sp,0Ah
08d7:0aab  push word ptr [bp+10h]
08d7:0aae  push word ptr [bp+0Ch]
08d7:0ab1  push word ptr [bp+0Ah]
08d7:0ab4  push word ptr [bp+0Ch]
08d7:0ab7  push si
08d7:0ab8  call far dword ptr [6566h]
08d7:0abc  add sp,0Ah
08d7:0abf  pop di
08d7:0ac0  pop si
08d7:0ac1  pop bp
08d7:0ac2  ret far

; Candidate 08d7:0ad7, file offset 0xca47
08d7:0ad7  push bp
08d7:0ad8  mov bp,sp
08d7:0ada  push word ptr [bp+0Ch]
08d7:0add  push word ptr [bp+0Ah]
08d7:0ae0  push word ptr [bp+8]
08d7:0ae3  push word ptr [bp+6]
08d7:0ae6  push word ptr [6624h]
08d7:0aea  push word ptr [6622h]
08d7:0aee  push cs
08d7:0aef  call 067Fh
08d7:0af2  add sp,0Ch
08d7:0af5  pop bp
08d7:0af6  ret far

; Candidate 08d7:0b2f, file offset 0xca9f
08d7:0b2f  push bp
08d7:0b30  mov bp,sp
08d7:0b32  push si
08d7:0b33  push di
08d7:0b34  mov si,[bp+6]
08d7:0b37  mov di,[bp+8]
08d7:0b3a  mov dx,[bp+0Ah]
08d7:0b3d  mov bx,[bp+0Ch]
08d7:0b40  cmp si,di
08d7:0b42  jge short 0B4Eh
08d7:0b44  or bx,bx
08d7:0b46  je short 0B4Ch
08d7:0b48  mov si,dx
08d7:0b4a  jmp short 0B4Eh
08d7:0b4c  mov si,di
08d7:0b4e  cmp si,dx
08d7:0b50  jle short 0B5Ch
08d7:0b52  or bx,bx
08d7:0b54  jne short 0B5Ah
08d7:0b56  mov si,dx
08d7:0b58  jmp short 0B5Ch
08d7:0b5a  mov si,di
08d7:0b5c  mov ax,si
08d7:0b5e  pop di
08d7:0b5f  pop si
08d7:0b60  pop bp
08d7:0b61  ret far

; Candidate 08d7:0be6, file offset 0xcb56
08d7:0be6  push bp
08d7:0be7  mov bp,sp
08d7:0be9  push word ptr [bp+8]
08d7:0bec  push word ptr [bp+6]
08d7:0bef  call far 0284h,21B0h
08d7:0bf4  add sp,4
08d7:0bf7  mov ax,4Fh
08d7:0bfa  push ax
08d7:0bfb  call far 00AAh,1C9Fh
08d7:0c00  inc sp
08d7:0c01  inc sp
08d7:0c02  pop bp
08d7:0c03  ret far

; Candidate 0997:01d9, file offset 0xcd49
0997:01d9  push bp
0997:01da  mov bp,sp
0997:01dc  dec sp
0997:01dd  dec sp
0997:01de  les bx,[bp+6]
0997:01e1  cmp byte ptr es:[bx+8],7
0997:01e6  je short 0238h
0997:01e8  cmp byte ptr es:[bx+8],8
0997:01ed  je short 0238h
0997:01ef  cmp byte ptr es:[bx+8],0Ah
0997:01f4  je short 0238h
0997:01f6  les bx,[bp+6]
0997:01f9  mov byte ptr es:[bx+8],0
0997:01fe  mov byte ptr es:[bx+0Bh],14h
0997:0203  push word ptr [6DD2h]
0997:0207  push word ptr es:[bx+2]
0997:020b  call far 0316h,1A68h
0997:0210  add sp,4
0997:0213  xor ax,4
0997:0216  sar ax,1
0997:0218  mov [bp-2],ax
0997:021b  les bx,[bp+6]
0997:021e  or byte ptr es:[bx+16h],8
0997:0223  push word ptr [bp-2]
0997:0226  mov ax,0FFFFh
0997:0229  push ax
0997:022a  push word ptr [bp+8]
0997:022d  push word ptr [bp+6]
0997:0230  call far 0585h,0997h
0997:0235  add sp,8
0997:0238  mov sp,bp
0997:023a  pop bp
0997:023b  ret far

; Candidate 0997:033d, file offset 0xcead
0997:033d  push bp
0997:033e  mov bp,sp
0997:0340  sub sp,4
0997:0343  push si
0997:0344  mov [bp-2],ds
0997:0347  mov word ptr [bp-4],6E2Ah
0997:034c  xor si,si
0997:034e  jmp short 0362h
0997:0350  push word ptr [bp-2]
0997:0353  push word ptr [bp-4]
0997:0356  push cs
0997:0357  call 02AAh
0997:035a  add sp,4
0997:035d  inc si
0997:035e  add word ptr [bp-4],1Eh
0997:0362  cmp si,1Eh
0997:0365  jl short 0350h
0997:0367  pop si
0997:0368  mov sp,bp
0997:036a  pop bp
0997:036b  ret far

; Candidate 0997:04ea, file offset 0xd05a
0997:04ea  push bp
0997:04eb  mov bp,sp
0997:04ed  push si
0997:04ee  mov si,[bp+0Ah]
0997:04f1  cmp si,0FFFFh
0997:04f4  je short 0566h
0997:04f6  les bx,[bp+6]
0997:04f9  push word ptr es:[bx+2]
0997:04fd  call far 5,0E24h
0997:0502  inc sp
0997:0503  inc sp
0997:0504  les bx,[bp+6]
0997:0507  mov ax,es:[bx+2]
0997:050b  mov dx,0Ah
0997:050e  imul dx
0997:0510  mov bx,ax
0997:0512  test word ptr [bx-5C9Ch],7
0997:0518  je short 053Fh
0997:051a  mov bx,[bp+6]
0997:051d  mov ax,es:[bx+2]
0997:0521  mov dx,0Ah
0997:0524  imul dx
0997:0526  mov bx,ax
0997:0528  dec word ptr [bx-5C9Ch]
0997:052c  mov ax,400h
0997:052f  push ax
0997:0530  mov bx,[bp+6]
0997:0533  push word ptr es:[bx+2]
0997:0537  call far 2BE9h,14ECh
0997:053c  add sp,4
0997:053f  les bx,[bp+6]
0997:0542  mov es:[bx+2],si
0997:0546  mov ax,si
0997:0548  mov dx,0Ah
0997:054b  imul dx
0997:054d  mov bx,ax
0997:054f  inc word ptr [bx-5C9Ch]
0997:0553  mov ax,200h
0997:0556  push ax
0997:0557  mov bx,[bp+6]
0997:055a  push word ptr es:[bx+2]
0997:055e  call far 2BE9h,14ECh
0997:0563  add sp,4
0997:0566  cmp word ptr [bp+0Ch],0FFFFh
0997:056a  je short 057Ah
0997:056c  les bx,[bp+6]
0997:056f  mov al,[bp+0Ch]
0997:0572  mov es:[bx+5],al
0997:0576  mov si,es:[bx+2]
0997:057a  push si
0997:057b  call far 5,0E24h
0997:0580  inc sp
0997:0581  inc sp
0997:0582  pop si
0997:0583  pop bp
0997:0584  ret far

; Candidate 0997:0585, file offset 0xd0f5
0997:0585  push bp
0997:0586  mov bp,sp
0997:0588  sub sp,0Ah
0997:058b  push si
0997:058c  push di
0997:058d  mov si,[bp+0Ah]
0997:0590  les bx,[bp+6]
0997:0593  mov di,es:[bx+2]
0997:0597  mov al,es:[bx]
0997:059a  cbw
0997:059b  mov dx,2Eh
0997:059e  imul dx
0997:05a0  add ax,0CD1Ah
0997:05a3  mov [bp-2],ds
0997:05a6  mov [bp-4],ax
0997:05a9  cmp si,di
0997:05ab  jne short 05B0h
0997:05ad  jmp 0708h
0997:05b0  cmp si,0FFFFh
0997:05b3  jne short 05B8h
0997:05b5  jmp 0708h
0997:05b8  test byte ptr es:[bx+16h],8
0997:05bd  je short 05EAh
0997:05bf  push word ptr [6DD2h]
0997:05c3  push si
0997:05c4  call far 0FD8h,1A68h
0997:05c9  add sp,4
0997:05cc  push ax
0997:05cd  push word ptr [6DD2h]
0997:05d1  les bx,[bp+6]
0997:05d4  push word ptr es:[bx+2]
0997:05d8  call far 0FD8h,1A68h
0997:05dd  add sp,4
0997:05e0  pop dx
0997:05e1  cmp dx,ax
0997:05e3  jge short 05EAh
0997:05e5  xor ax,ax
0997:05e7  jmp 075Fh
0997:05ea  cmp si,[6DD2h]
0997:05ee  jne short 05F5h
0997:05f0  xor ax,ax
0997:05f2  jmp 075Fh
0997:05f5  mov ax,si
0997:05f7  mov dx,0Ah
0997:05fa  imul dx
0997:05fc  add ax,0A360h
0997:05ff  mov [bp-6],ds
0997:0602  mov [bp-8],ax
0997:0605  cmp word ptr [bp+0Ch],0FFFFh
0997:0609  jne short 0616h
0997:060b  les bx,[bp+6]
0997:060e  mov al,es:[bx+5]
0997:0612  cbw
0997:0613  mov [bp+0Ch],ax
0997:0616  mov ax,[bp+0Ch]
0997:0619  xor ax,2
0997:061c  les bx,[bp-8]
0997:061f  add bx,ax
0997:0621  mov al,es:[bx]
0997:0624  mov [bp-9],al
0997:0627  cbw
0997:0628  mov bx,ax
0997:062a  test byte ptr [bx+2268h],4
0997:062f  je short 0634h
0997:0631  jmp 06BEh
0997:0634  les bx,[bp-4]
0997:0637  mov ax,es:[bx+12h]
0997:063b  and ax,1000h
0997:063e  or ax,0
0997:0641  je short 06B9h
0997:0643  mov al,[bp-9]
0997:0646  cbw
0997:0647  mov bx,ax
0997:0649  cmp byte ptr [bx+21C8h],0FFh
0997:064e  jne short 06B9h
0997:0650  mov al,[bp-9]
0997:0653  cbw
0997:0654  mov bx,ax
0997:0656  test byte ptr [bx+2268h],20h
0997:065b  je short 0698h
0997:065d  mov bx,[bp-4]
0997:0660  mov ax,es:[bx+12h]
0997:0664  and ax,4
0997:0667  or ax,0
0997:066a  je short 0690h
0997:066c  les bx,[bp+6]
0997:066f  cmp byte ptr es:[bx],1
0997:0673  jne short 0690h
0997:0675  les bx,[bp-8]
0997:0678  add bx,[bp+0Ch]
0997:067b  mov byte ptr es:[bx],48h
0997:067f  mov ax,[bp+0Ch]
0997:0682  xor ax,2
0997:0685  mov bx,[bp-8]
0997:0688  add bx,ax
0997:068a  mov byte ptr es:[bx],48h
0997:068e  jmp short 0698h
0997:0690  push si
0997:0691  call far 0426h,14ECh
0997:0696  inc sp
0997:0697  inc sp
0997:0698  cmp word ptr [bp+0Ch],0FFFFh
0997:069c  je short 06B6h
0997:069e  les bx,[bp+6]
0997:06a1  mov al,[bp+0Ch]
0997:06a4  mov es:[bx+5],al
0997:06a8  push word ptr es:[bx+2]
0997:06ac  call far 5,0E24h
0997:06b1  inc sp
0997:06b2  inc sp
0997:06b3  jmp 075Ch
0997:06b6  jmp 075Ch
0997:06b9  xor ax,ax
0997:06bb  jmp 075Fh
0997:06be  les bx,[bp-8]
0997:06c1  test word ptr es:[bx+4],7
0997:06c7  je short 06F2h
0997:06c9  or si,si
0997:06cb  je short 06F2h
0997:06cd  push si
0997:06ce  push word ptr [bp+8]
0997:06d1  push word ptr [bp+6]
0997:06d4  push cs
0997:06d5  call 0437h
0997:06d8  add sp,6
0997:06db  mov [bp-0Ah],al
0997:06de  cmp byte ptr [bp-0Ah],0FFh
0997:06e2  jne short 06E8h
0997:06e4  xor ax,ax
0997:06e6  jmp short 075Fh
0997:06e8  les bx,[bp+6]
0997:06eb  mov al,[bp-0Ah]
0997:06ee  mov es:[bx+4],al
0997:06f2  push word ptr [bp+0Ch]
0997:06f5  push si
0997:06f6  push word ptr [bp+8]
0997:06f9  push word ptr [bp+6]
0997:06fc  push cs
0997:06fd  call 04EAh
0997:0700  add sp,8
0997:0703  mov word ptr [bp+0Ch],0FFFFh
0997:0708  cmp word ptr [bp+0Ch],0FFFFh
0997:070c  je short 0718h
0997:070e  les bx,[bp+6]
0997:0711  mov al,[bp+0Ch]
0997:0714  mov es:[bx+5],al
0997:0718  push di
0997:0719  call far 5,0E24h
0997:071e  inc sp
0997:071f  inc sp
0997:0720  cmp word ptr [0E4D2h],0
0997:0725  jne short 075Ch
0997:0727  les bx,[bp+6]
0997:072a  mov al,es:[bx]
0997:072d  cbw
0997:072e  mov dx,2Eh
0997:0731  imul dx
0997:0733  mov bx,ax
0997:0735  cmp byte ptr [bx-32C6h],0
0997:073a  je short 075Ch
0997:073c  mov bx,[bp+6]
0997:073f  push word ptr es:[bx+2]
0997:0743  mov al,es:[bx]
0997:0746  cbw
0997:0747  mov dx,2Eh
0997:074a  imul dx
0997:074c  mov bx,ax
0997:074e  mov al,[bx-32C6h]
0997:0752  cbw
0997:0753  push ax
0997:0754  call far 0014h,1A30h
0997:0759  add sp,4
0997:075c  mov ax,1
0997:075f  pop di
0997:0760  pop si
0997:0761  mov sp,bp
0997:0763  pop bp
0997:0764  ret far

; Candidate 0997:0f1c, file offset 0xda8c
0997:0f1c  push bp
0997:0f1d  mov bp,sp
0997:0f1f  sub sp,4
0997:0f22  push si
0997:0f23  push di
0997:0f24  mov di,[bp+6]
0997:0f27  mov [bp-2],ds
0997:0f2a  mov word ptr [bp-4],6E2Ah
0997:0f2f  xor si,si
0997:0f31  jmp 1045h
0997:0f34  les bx,[bp-4]
0997:0f37  mov al,es:[bx+1]
0997:0f3b  cbw
0997:0f3c  cmp ax,di
0997:0f3e  je short 0F43h
0997:0f40  jmp 1017h
0997:0f43  cmp word ptr es:[bx+0Eh],0
0997:0f48  jg short 0F4Dh
0997:0f4a  jmp 1040h
0997:0f4d  test byte ptr es:[bx+16h],20h
0997:0f52  je short 0F57h
0997:0f54  jmp 1040h
0997:0f57  les bx,[bp-4]
0997:0f5a  cmp byte ptr es:[bx+1Bh],0
0997:0f5f  je short 0F69h
0997:0f61  mov byte ptr es:[bx+1Bh],0
0997:0f66  jmp 1040h
0997:0f69  push word ptr [bp-2]
0997:0f6c  push word ptr [bp-4]
0997:0f6f  push cs
0997:0f70  call 02AAh
0997:0f73  add sp,4
0997:0f76  les bx,[bp-4]
0997:0f79  cmp byte ptr es:[bx+8],0
0997:0f7e  jle short 0F8Dh
0997:0f80  push word ptr [bp-2]
0997:0f83  push word ptr [bp-4]
0997:0f86  push cs
0997:0f87  call 0765h
0997:0f8a  add sp,4
0997:0f8d  les bx,[bp-4]
0997:0f90  mov al,es:[bx+8]
0997:0f94  cbw
0997:0f95  mov bx,ax
0997:0f97  cmp bx,0Ah
0997:0f9a  ja short 0FFAh
0997:0f9c  shl bx,1
0997:0f9e  jmp word ptr cs:[bx+1058h]
0997:0fa3  push word ptr [bp-2]
0997:0fa6  push word ptr [bp-4]
0997:0fa9  push cs
0997:0faa  call 0C33h
0997:0fad  jmp short 0FF7h
0997:0faf  les bx,[bp-4]
0997:0fb2  mov al,es:[bx+8]
0997:0fb6  cbw
0997:0fb7  mov bx,ax
0997:0fb9  mov al,[bx+3082h]
0997:0fbd  cbw
0997:0fbe  push ax
0997:0fbf  push word ptr [bp-2]
0997:0fc2  push word ptr [bp-4]
0997:0fc5  push cs
0997:0fc6  call 0D33h
0997:0fc9  add sp,6
0997:0fcc  jmp short 0FFAh
0997:0fce  les bx,[bp-4]
0997:0fd1  mov al,es:[bx+8]
0997:0fd5  cbw
0997:0fd6  mov bx,ax
0997:0fd8  mov al,[bx+307Fh]
0997:0fdc  cbw
0997:0fdd  push ax
0997:0fde  push word ptr [bp-2]
0997:0fe1  push word ptr [bp-4]
0997:0fe4  push cs
0997:0fe5  call 0D96h
0997:0fe8  add sp,6
0997:0feb  jmp short 0FFAh
0997:0fed  push word ptr [bp-2]
0997:0ff0  push word ptr [bp-4]
0997:0ff3  push cs
0997:0ff4  call 0EB3h
0997:0ff7  add sp,4
0997:0ffa  les bx,[bp-4]
0997:0ffd  cmp byte ptr es:[bx+8],4
0997:1002  je short 1017h
0997:1004  cmp byte ptr es:[bx+8],7
0997:1009  je short 1017h
0997:100b  cmp byte ptr es:[bx+8],8
0997:1010  je short 1017h
0997:1012  xor byte ptr es:[bx+6],1
0997:1017  les bx,[bp-4]
0997:101a  mov al,es:[bx]
0997:101d  cbw
0997:101e  mov dx,2Eh
0997:1021  imul dx
0997:1023  mov bx,ax
0997:1025  cmp byte ptr [bx-32C8h],1
0997:102a  jne short 1040h
0997:102c  mov bx,[bp-4]
0997:102f  mov al,es:[bx+5]
0997:1033  cbw
0997:1034  push ax
0997:1035  push word ptr es:[bx+2]
0997:1039  push cs
0997:103a  call 0ED5h
0997:103d  add sp,4
0997:1040  inc si
0997:1041  add word ptr [bp-4],1Eh
0997:1045  cmp si,1Eh
0997:1048  jge short 104Dh
0997:104a  jmp 0F34h
0997:104d  call far 0EC1h,17B7h
0997:1052  pop di
0997:1053  pop si
0997:1054  mov sp,bp
0997:1056  pop bp
0997:1057  ret far

; Candidate 0997:106e, file offset 0xdbde
0997:106e  push bp
0997:106f  mov bp,sp
0997:1071  mov ax,2
0997:1074  push ax
0997:1075  call far 003Dh,2187h
0997:107a  inc sp
0997:107b  inc sp
0997:107c  cmp word ptr [628Ah],0
0997:1081  jne short 1089h
0997:1083  push ds
0997:1084  mov ax,23C8h
0997:1087  jmp short 108Dh
0997:1089  push ds
0997:108a  mov ax,23A8h
0997:108d  push ax
0997:108e  call far dword ptr [654Eh]
0997:1092  add sp,4
0997:1095  mov word ptr [668Eh],0
0997:109b  mov word ptr [668Ch],0
0997:10a1  mov ax,1
0997:10a4  push ax
0997:10a5  call far 007Ah,2ABAh
0997:10aa  inc sp
0997:10ab  inc sp
0997:10ac  les bx,[bp+6]
0997:10af  and byte ptr es:[bx+16h],0FDh
0997:10b4  mov word ptr [668Eh],0
0997:10ba  mov word ptr [668Ch],1
0997:10c0  mov ax,2
0997:10c3  push ax
0997:10c4  call far 9,2187h
0997:10c9  inc sp
0997:10ca  inc sp
0997:10cb  mov byte ptr [0D0AAh],1
0997:10d0  pop bp
0997:10d1  ret far

; Candidate 0997:10d2, file offset 0xdc42
0997:10d2  push bp
0997:10d3  mov bp,sp
0997:10d5  sub sp,4
0997:10d8  push si
0997:10d9  push di
0997:10da  mov [bp-2],ds
0997:10dd  mov word ptr [bp-4],6E2Ah
0997:10e2  mov ax,1
0997:10e5  push ax
0997:10e6  call far 007Ah,2ABAh
0997:10eb  inc sp
0997:10ec  inc sp
0997:10ed  xor si,si
0997:10ef  jmp short 1121h
0997:10f1  les bx,[bp-4]
0997:10f4  test byte ptr es:[bx+16h],2
0997:10f9  je short 111Ch
0997:10fb  and byte ptr es:[bx+16h],0FDh
0997:1100  mov di,1
0997:1103  cmp word ptr es:[bx+0Eh],0
0997:1108  jg short 111Ch
0997:110a  mov ax,1
0997:110d  push ax
0997:110e  push word ptr [bp-2]
0997:1111  push word ptr [bp-4]
0997:1114  call far 114Eh,0997h
0997:1119  add sp,6
0997:111c  inc si
0997:111d  add word ptr [bp-4],1Eh
0997:1121  cmp si,1Eh
0997:1124  jl short 10F1h
0997:1126  or di,di
0997:1128  je short 113Dh
0997:112a  mov byte ptr [0D0AAh],1
0997:112f  mov word ptr [668Eh],0
0997:1135  mov word ptr [668Ch],1
0997:113b  jmp short 1142h
0997:113d  mov byte ptr [0D0AAh],0
0997:1142  mov word ptr [0E5A2h],0
0997:1148  pop di
0997:1149  pop si
0997:114a  mov sp,bp
0997:114c  pop bp
0997:114d  ret far

; Candidate 0997:114e, file offset 0xdcbe
0997:114e  push bp
0997:114f  mov bp,sp
0997:1151  push si
0997:1152  push di
0997:1153  les bx,[bp+6]
0997:1156  mov word ptr es:[bx+0Eh],0FFFFh
0997:115c  mov al,es:[bx+4]
0997:1160  cbw
0997:1161  mov si,ax
0997:1163  cmp ax,4
0997:1166  jne short 117Bh
0997:1168  mov al,0FFh
0997:116a  push ax
0997:116b  mov al,4
0997:116d  push ax
0997:116e  mov al,1
0997:1170  push ax
0997:1171  call far 0505h,08D7h
0997:1176  add sp,6
0997:1179  mov si,ax
0997:117b  les bx,[bp+6]
0997:117e  cmp word ptr es:[bx+12h],0
0997:1183  je short 11CAh
0997:1185  mov al,0
0997:1187  push ax
0997:1188  mov al,0Ah
0997:118a  push ax
0997:118b  mov al,1
0997:118d  push ax
0997:118e  call far 0505h,08D7h
0997:1193  add sp,6
0997:1196  cmp ax,1
0997:1199  jne short 11CAh
0997:119b  les bx,[bp+6]
0997:119e  push word ptr es:[bx+12h]
0997:11a2  call far 092Bh,0CBEh
0997:11a7  inc sp
0997:11a8  inc sp
0997:11a9  mov di,ax
0997:11ab  push si
0997:11ac  push di
0997:11ad  les bx,[bp+6]
0997:11b0  push word ptr es:[bx+2]
0997:11b4  push ds
0997:11b5  mov ax,es:[bx+2]
0997:11b9  mov dx,0Ah
0997:11bc  imul dx
0997:11be  add ax,0A366h
0997:11c1  push ax
0997:11c2  call far 01D4h,0CBEh
0997:11c7  add sp,0Ah
0997:11ca  les bx,[bp+6]
0997:11cd  cmp word ptr es:[bx+14h],0
0997:11d2  je short 1200h
0997:11d4  push word ptr es:[bx+14h]
0997:11d8  call far 092Bh,0CBEh
0997:11dd  inc sp
0997:11de  inc sp
0997:11df  mov di,ax
0997:11e1  push si
0997:11e2  push di
0997:11e3  les bx,[bp+6]
0997:11e6  push word ptr es:[bx+2]
0997:11ea  push ds
0997:11eb  mov ax,es:[bx+2]
0997:11ef  mov dx,0Ah
0997:11f2  imul dx
0997:11f4  add ax,0A366h
0997:11f7  push ax
0997:11f8  call far 01D4h,0CBEh
0997:11fd  add sp,0Ah
0997:1200  cmp word ptr [bp+0Ah],0
0997:1204  je short 121Fh
0997:1206  les bx,[bp+6]
0997:1209  mov al,es:[bx]
0997:120c  cbw
0997:120d  mov dx,2Eh
0997:1210  imul dx
0997:1212  mov bx,ax
0997:1214  push word ptr [bx-32CCh]
0997:1218  call far 0C0Fh,0F55h
0997:121d  inc sp
0997:121e  inc sp
0997:121f  cmp word ptr [6DCEh],10h
0997:1224  jne short 1289h
0997:1226  cmp word ptr [6DD0h],1
0997:122b  jne short 1289h
0997:122d  les bx,[bp+6]
0997:1230  mov al,es:[bx]
0997:1233  cbw
0997:1234  mov dx,2Eh
0997:1237  imul dx
0997:1239  mov bx,ax
0997:123b  mov ax,[bx-32D4h]
0997:123f  and ax,4
0997:1242  or ax,0
0997:1245  je short 1289h
0997:1247  mov bx,[bp+6]
0997:124a  cmp byte ptr es:[bx],0
0997:124e  jne short 126Eh
0997:1250  mov word ptr es:[bx+0Eh],96h
0997:1256  mov byte ptr es:[bx+18h],0
0997:125b  mov byte ptr es:[bx+19h],0FFh
0997:1260  inc byte ptr es:[bx+7]
0997:1264  inc byte ptr es:[bx]
0997:1267  call far 0039h,2AD7h
0997:126c  jmp short 12ABh
0997:126e  call far 0034h,2B10h
0997:1273  call far 0025h,2B10h
0997:1278  call far 0,215Fh
0997:127d  xor ax,ax
0997:127f  push ax
0997:1280  call far 5A8Dh,0
0997:1285  inc sp
0997:1286  inc sp
0997:1287  jmp short 12ABh
0997:1289  mov ax,0FFFFh
0997:128c  push ax
0997:128d  xor ax,ax
0997:128f  push ax
0997:1290  push word ptr [bp+8]
0997:1293  push word ptr [bp+6]
0997:1296  push cs
0997:1297  call 04EAh
0997:129a  add sp,8
0997:129d  les bx,[bp+6]
0997:12a0  cmp byte ptr es:[bx+8],8
0997:12a5  jne short 12ABh
0997:12a7  push cs
0997:12a8  call 023Ch
0997:12ab  pop di
0997:12ac  pop si
0997:12ad  pop bp
0997:12ae  ret far

; Candidate 0997:12af, file offset 0xde1f
0997:12af  push bp
0997:12b0  mov bp,sp
0997:12b2  les bx,[bp+6]
0997:12b5  cmp byte ptr es:[bx+4],4
0997:12ba  je short 12CEh
0997:12bc  mov al,es:[bx]
0997:12bf  cbw
0997:12c0  mov dx,2Eh
0997:12c3  imul dx
0997:12c5  mov bx,ax
0997:12c7  cmp byte ptr [bx-32C8h],1
0997:12cc  jne short 12D3h
0997:12ce  mov ax,1
0997:12d1  jmp short 12EDh
0997:12d3  les bx,[bp+6]
0997:12d6  mov al,es:[bx+5]
0997:12da  cbw
0997:12db  shl ax,1
0997:12dd  shl ax,1
0997:12df  push ax
0997:12e0  mov al,es:[bx+4]
0997:12e4  cbw
0997:12e5  pop bx
0997:12e6  add bx,ax
0997:12e8  mov al,[bx+3086h]
0997:12ec  cbw
0997:12ed  pop bp
0997:12ee  ret far

; Candidate 0997:12ef, file offset 0xde5f
0997:12ef  push bp
0997:12f0  mov bp,sp
0997:12f2  sub sp,4
0997:12f5  push si
0997:12f6  push di
0997:12f7  mov di,[bp+0Ah]
0997:12fa  les bx,[bp+6]
0997:12fd  mov al,es:[bx]
0997:1300  cbw
0997:1301  mov [bp-2],ax
0997:1304  mov al,0
0997:1306  push ax
0997:1307  mov al,14h
0997:1309  push ax
0997:130a  mov al,1
0997:130c  push ax
0997:130d  call far 0505h,08D7h
0997:1312  add sp,6
0997:1315  mov si,ax
0997:1317  cmp si,14h
0997:131a  je short 1356h
0997:131c  mov ax,di
0997:131e  mov dx,159h
0997:1321  imul dx
0997:1323  mov bx,ax
0997:1325  mov ax,[bx-18AFh]
0997:1329  and ax,800h
0997:132c  or ax,0
0997:132f  je short 1333h
0997:1331  dec si
0997:1332  dec si
0997:1333  mov ax,di
0997:1335  mov dx,159h
0997:1338  imul dx
0997:133a  mov bx,ax
0997:133c  mov ax,[bx-18AFh]
0997:1340  and ax,10h
0997:1343  or ax,0
0997:1346  je short 134Ah
0997:1348  dec si
0997:1349  dec si
0997:134a  mov ax,[6DDCh]
0997:134d  and ax,8000h
0997:1350  or ax,0
0997:1353  je short 1356h
0997:1355  dec si
0997:1356  mov ax,di
0997:1358  mov dx,159h
0997:135b  imul dx
0997:135d  mov bx,ax
0997:135f  mov al,[bx-19D9h]
0997:1363  cbw
0997:1364  push ax
0997:1365  mov ax,[bp-2]
0997:1368  mov dx,2Eh
0997:136b  imul dx
0997:136d  mov bx,ax
0997:136f  mov al,[bx-32E5h]
0997:1373  cbw
0997:1374  push ax
0997:1375  call far 05D3h,0B54h
0997:137a  add sp,4
0997:137d  mov [bp-4],ax
0997:1380  cmp si,[bp-4]
0997:1383  jge short 138Ah
0997:1385  cmp si,14h
0997:1388  jne short 138Fh
0997:138a  mov ax,1
0997:138d  jmp short 1391h
0997:138f  xor ax,ax
0997:1391  pop di
0997:1392  pop si
0997:1393  mov sp,bp
0997:1395  pop bp
0997:1396  ret far

; Candidate 0997:153d, file offset 0xe0ad
0997:153d  push bp
0997:153e  mov bp,sp
0997:1540  sub sp,0Ah
0997:1543  push si
0997:1544  push di
0997:1545  mov bx,[6DD4h]
0997:1549  shl bx,1
0997:154b  shl bx,1
0997:154d  mov es,[bp+8]
0997:1550  push bx
0997:1551  mov bx,[bp+6]
0997:1554  mov al,es:[bx+5]
0997:1558  cbw
0997:1559  pop bx
0997:155a  add bx,ax
0997:155c  mov al,[bx+3096h]
0997:1560  cbw
0997:1561  mov [bp-2],ax
0997:1564  mov dx,0Ch
0997:1567  imul dx
0997:1569  mov di,ax
0997:156b  mov bx,[bp+6]
0997:156e  cmp byte ptr es:[bx+4],4
0997:1573  je short 158Eh
0997:1575  mov al,es:[bx+5]
0997:1579  cbw
0997:157a  shl ax,1
0997:157c  shl ax,1
0997:157e  push ax
0997:157f  mov al,es:[bx+4]
0997:1583  cbw
0997:1584  pop bx
0997:1585  add bx,ax
0997:1587  mov al,[bx+30D6h]
0997:158b  cbw
0997:158c  jmp short 159Fh
0997:158e  mov al,0FFh
0997:1590  push ax
0997:1591  mov al,2
0997:1593  push ax
0997:1594  mov al,1
0997:1596  push ax
0997:1597  call far 0505h,08D7h
0997:159c  add sp,6
0997:159f  mov [bp-4],ax
0997:15a2  cmp word ptr [bp-4],0
0997:15a6  je short 15ABh
0997:15a8  add di,6
0997:15ab  mov ax,di
0997:15ad  add ax,6
0997:15b0  mov [bp-6],ax
0997:15b3  mov si,di
0997:15b5  jmp short 1634h
0997:15b7  mov al,[si+30A6h]
0997:15bb  cbw
0997:15bc  mov dx,159h
0997:15bf  imul dx
0997:15c1  add ax,0E608h
0997:15c4  mov [bp-8],ds
0997:15c7  mov [bp-0Ah],ax
0997:15ca  mov ax,3
0997:15cd  push ax
0997:15ce  mov al,[si+30A6h]
0997:15d2  cbw
0997:15d3  push ax
0997:15d4  call far 06E9h,0E24h
0997:15d9  add sp,4
0997:15dc  or ax,ax
0997:15de  je short 1633h
0997:15e0  les bx,[bp-0Ah]
0997:15e3  mov ax,es:[bx+149h]
0997:15e8  and ax,140h
0997:15eb  or ax,0
0997:15ee  je short 1606h
0997:15f0  mov al,0
0997:15f2  push ax
0997:15f3  mov al,14h
0997:15f5  push ax
0997:15f6  mov al,1
0997:15f8  push ax
0997:15f9  call far 0505h,08D7h
0997:15fe  add sp,6
0997:1601  cmp ax,5
0997:1604  jge short 1633h
0997:1606  push word ptr [bp+8]
0997:1609  push word ptr [bp+6]
0997:160c  mov al,[si+30A6h]
0997:1610  cbw
0997:1611  push ax
0997:1612  push cs
0997:1613  call 1397h
0997:1616  add sp,6
0997:1619  les bx,[bp+6]
0997:161c  mov al,es:[bx]
0997:161f  cbw
0997:1620  mov dx,2Eh
0997:1623  imul dx
0997:1625  mov bx,ax
0997:1627  mov ax,[bx-32D4h]
0997:162b  and ax,4000h
0997:162e  or ax,0
0997:1631  je short 163Ch
0997:1633  inc si
0997:1634  cmp si,[bp-6]
0997:1637  jge short 163Ch
0997:1639  jmp 15B7h
0997:163c  pop di
0997:163d  pop si
0997:163e  mov sp,bp
0997:1640  pop bp
0997:1641  ret far

; Candidate 0997:1754, file offset 0xe2c4
0997:1754  push bp
0997:1755  mov bp,sp
0997:1757  cmp word ptr [0EE1Eh],0
0997:175c  je short 177Ch
0997:175e  mov ax,[0E5C8h]
0997:1761  cmp ax,[0EE1Eh]
0997:1765  jle short 177Ch
0997:1767  mov ax,20h
0997:176a  push ax
0997:176b  xor ax,ax
0997:176d  push ax
0997:176e  call far 2BE9h,14ECh
0997:1773  add sp,4
0997:1776  mov word ptr [0E5C8h],0
0997:177c  pop bp
0997:177d  ret far

; Candidate 0997:177e, file offset 0xe2ee
0997:177e  push bp
0997:177f  mov bp,sp
0997:1781  sub sp,6
0997:1784  push si
0997:1785  push di
0997:1786  mov ax,[bp+8]
0997:1789  mov dx,0Ah
0997:178c  imul dx
0997:178e  mov bx,ax
0997:1790  mov ax,[bx-5C9Ch]
0997:1794  and ax,7
0997:1797  mov [bp-6],ax
0997:179a  cmp word ptr [bp-6],7
0997:179e  jne short 17A3h
0997:17a0  jmp 18CCh
0997:17a3  mov ax,[6DD2h]
0997:17a6  cmp ax,[bp+8]
0997:17a9  jne short 17AEh
0997:17ab  jmp 18CCh
0997:17ae  cmp word ptr [bp-6],0
0997:17b2  je short 17D1h
0997:17b4  mov ax,[bp+0Eh]
0997:17b7  mov dx,2Eh
0997:17ba  imul dx
0997:17bc  mov bx,ax
0997:17be  cmp byte ptr [bx-32C8h],0
0997:17c3  je short 17C8h
0997:17c5  jmp 18CCh
0997:17c8  cmp word ptr [bp+0Ah],4
0997:17cc  jne short 17D1h
0997:17ce  jmp 18CCh
0997:17d1  xor si,si
0997:17d3  jmp short 181Ah
0997:17d5  mov ax,si
0997:17d7  mov dx,1Eh
0997:17da  imul dx
0997:17dc  mov bx,ax
0997:17de  mov ax,[bx+6E2Ch]
0997:17e2  cmp ax,[bp+8]
0997:17e5  jne short 1819h
0997:17e7  mov ax,si
0997:17e9  mov dx,1Eh
0997:17ec  imul dx
0997:17ee  mov bx,ax
0997:17f0  cmp byte ptr [bx+6E2Eh],4
0997:17f5  jne short 17FAh
0997:17f7  jmp 18CCh
0997:17fa  mov ax,si
0997:17fc  mov dx,1Eh
0997:17ff  imul dx
0997:1801  mov bx,ax
0997:1803  mov al,[bx+6E2Ah]
0997:1807  cbw
0997:1808  mov dx,2Eh
0997:180b  imul dx
0997:180d  mov bx,ax
0997:180f  cmp byte ptr [bx-32C8h],0
0997:1814  je short 1819h
0997:1816  jmp 18CCh
0997:1819  inc si
0997:181a  cmp si,1Eh
0997:181d  jl short 17D5h
0997:181f  mov di,0FFFFh
0997:1822  xor ax,ax
0997:1824  mov si,ax
0997:1826  mov [bp-2],ax
0997:1829  jmp short 1876h
0997:182b  mov ax,si
0997:182d  mov dx,1Eh
0997:1830  imul dx
0997:1832  mov bx,ax
0997:1834  cmp word ptr [bx+6E38h],0
0997:1839  jg short 183Fh
0997:183b  mov di,si
0997:183d  jmp short 187Bh
0997:183f  mov ax,si
0997:1841  mov dx,1Eh
0997:1844  imul dx
0997:1846  mov bx,ax
0997:1848  test byte ptr [bx+6E40h],40h
0997:184d  jne short 1875h
0997:184f  push word ptr [6DD2h]
0997:1853  mov ax,si
0997:1855  mov dx,1Eh
0997:1858  imul dx
0997:185a  mov bx,ax
0997:185c  push word ptr [bx+6E2Ch]
0997:1860  call far 0FD8h,1A68h
0997:1865  add sp,4
0997:1868  mov [bp-4],ax
0997:186b  cmp ax,[bp-2]
0997:186e  jle short 1875h
0997:1870  mov [bp-2],ax
0997:1873  mov di,si
0997:1875  inc si
0997:1876  cmp si,1Eh
0997:1879  jl short 182Bh
0997:187b  cmp di,0FFFFh
0997:187e  je short 18CCh
0997:1880  mov ax,di
0997:1882  mov dx,1Eh
0997:1885  imul dx
0997:1887  mov bx,ax
0997:1889  cmp word ptr [bx+6E38h],0
0997:188e  jle short 18A6h
0997:1890  xor ax,ax
0997:1892  push ax
0997:1893  push ds
0997:1894  mov ax,di
0997:1896  mov dx,1Eh
0997:1899  imul dx
0997:189b  add ax,6E2Ah
0997:189e  push ax
0997:189f  push cs
0997:18a0  call 114Eh
0997:18a3  add sp,6
0997:18a6  push word ptr [bp+18h]
0997:18a9  push word ptr [bp+16h]
0997:18ac  push word ptr [bp+14h]
0997:18af  push word ptr [bp+12h]
0997:18b2  push word ptr [bp+10h]
0997:18b5  push word ptr [bp+0Eh]
0997:18b8  push word ptr [bp+0Ch]
0997:18bb  push word ptr [bp+0Ah]
0997:18be  push word ptr [bp+8]
0997:18c1  push word ptr [bp+6]
0997:18c4  push di
0997:18c5  push cs
0997:18c6  call 1642h
0997:18c9  add sp,16h
0997:18cc  pop di
0997:18cd  pop si
0997:18ce  mov sp,bp
0997:18d0  pop bp
0997:18d1  ret far

; Candidate 0997:1929, file offset 0xe499
0997:1929  push bp
0997:192a  mov bp,sp
0997:192c  sub sp,10h
0997:192f  push si
0997:1930  push word ptr [bp+8]
0997:1933  push ss
0997:1934  lea ax,[bp-10h]
0997:1937  push ax
0997:1938  push cs
0997:1939  call 18D2h
0997:193c  add sp,6
0997:193f  cmp word ptr [bp-8],0FFFFh
0997:1943  je short 194Ah
0997:1945  mov ax,[bp-8]
0997:1948  jmp short 19A4h
0997:194a  mov ax,[6DD4h]
0997:194d  shl ax,1
0997:194f  shl ax,1
0997:1951  shl ax,1
0997:1953  push ax
0997:1954  mov al,[bp+6]
0997:1957  cbw
0997:1958  and ax,1
0997:195b  shl ax,1
0997:195d  shl ax,1
0997:195f  pop dx
0997:1960  add dx,ax
0997:1962  add dx,30E6h
0997:1966  mov [bp-2],ds
0997:1969  mov [bp-4],dx
0997:196c  xor si,si
0997:196e  jmp short 199Ch
0997:1970  les bx,[bp-4]
0997:1973  mov al,es:[bx]
0997:1976  cbw
0997:1977  shl ax,1
0997:1979  lea dx,[bp-10h]
0997:197c  add ax,dx
0997:197e  mov bx,ax
0997:1980  cmp word ptr ss:[bx],0FFFFh
0997:1984  je short 1998h
0997:1986  mov bx,[bp-4]
0997:1989  mov al,es:[bx]
0997:198c  cbw
0997:198d  shl ax,1
0997:198f  add ax,dx
0997:1991  mov bx,ax
0997:1993  mov ax,ss:[bx]
0997:1996  jmp short 19A4h
0997:1998  inc si
0997:1999  inc word ptr [bp-4]
0997:199c  cmp si,4
0997:199f  jl short 1970h
0997:19a1  mov ax,0FFFFh
0997:19a4  pop si
0997:19a5  mov sp,bp
0997:19a7  pop bp
0997:19a8  ret far

; Candidate 0997:19a9, file offset 0xe519
0997:19a9  push bp
0997:19aa  mov bp,sp
0997:19ac  sub sp,10h
0997:19af  push si
0997:19b0  push word ptr [bp+6]
0997:19b3  push ss
0997:19b4  lea ax,[bp-10h]
0997:19b7  push ax
0997:19b8  push cs
0997:19b9  call 18D2h
0997:19bc  add sp,6
0997:19bf  mov word ptr [0E5A2h],1
0997:19c5  mov word ptr [bp-6],0FFFFh
0997:19ca  mov ax,[6DD4h]
0997:19cd  shl ax,1
0997:19cf  shl ax,1
0997:19d1  shl ax,1
0997:19d3  add ax,0
0997:19d6  mov word ptr [bp-2],2A14h
0997:19db  mov [bp-4],ax
0997:19de  xor si,si
0997:19e0  jmp short 1A3Ch
0997:19e2  les bx,[bp-4]
0997:19e5  mov al,es:[bx]
0997:19e8  cbw
0997:19e9  shl ax,1
0997:19eb  lea dx,[bp-10h]
0997:19ee  add ax,dx
0997:19f0  mov bx,ax
0997:19f2  cmp word ptr ss:[bx],0FFFFh
0997:19f6  je short 1A38h
0997:19f8  mov al,[bp+12h]
0997:19fb  cbw
0997:19fc  push ax
0997:19fd  mov al,[bp+10h]
0997:1a00  cbw
0997:1a01  push ax
0997:1a02  mov al,[bp+0Eh]
0997:1a05  cbw
0997:1a06  push ax
0997:1a07  mov al,[bp+0Ch]
0997:1a0a  cbw
0997:1a0b  push ax
0997:1a0c  mov al,[bp+0Ah]
0997:1a0f  cbw
0997:1a10  push ax
0997:1a11  mov al,[bp+8]
0997:1a14  cbw
0997:1a15  push ax
0997:1a16  push ds
0997:1a17  mov bx,[bp-4]
0997:1a1a  mov al,es:[bx]
0997:1a1d  cbw
0997:1a1e  shl ax,1
0997:1a20  add ax,dx
0997:1a22  mov bx,ax
0997:1a24  mov ax,ss:[bx]
0997:1a27  mov dx,1Eh
0997:1a2a  imul dx
0997:1a2c  add ax,6E2Ah
0997:1a2f  push ax
0997:1a30  call far 12B8h,0F55h
0997:1a35  add sp,10h
0997:1a38  inc si
0997:1a39  inc word ptr [bp-4]
0997:1a3c  cmp si,6
0997:1a3f  jl short 19E2h
0997:1a41  push cs
0997:1a42  call 10D2h
0997:1a45  pop si
0997:1a46  mov sp,bp
0997:1a48  pop bp
0997:1a49  ret far

; Candidate 0997:1ad2, file offset 0xe642
0997:1ad2  push bp
0997:1ad3  mov bp,sp
0997:1ad5  sub sp,6
0997:1ad8  push si
0997:1ad9  push di
0997:1ada  mov di,[bp+0Ah]
0997:1add  cmp word ptr [bp+0Ch],4
0997:1ae1  jge short 1B00h
0997:1ae3  mov al,[bp+0Eh]
0997:1ae6  cbw
0997:1ae7  shl ax,1
0997:1ae9  shl ax,1
0997:1aeb  add ax,[bp+0Ch]
0997:1aee  mov dx,2A16h
0997:1af1  mov bx,ax
0997:1af3  mov es,dx
0997:1af5  mov al,es:[bx]
0997:1afa  cbw
0997:1afb  mov [bp-6],ax
0997:1afe  jmp short 1B05h
0997:1b00  mov word ptr [bp-6],1
0997:1b05  cmp byte ptr [bp+10h],0
0997:1b09  je short 1B43h
0997:1b0b  xor si,si
0997:1b0d  mov [bp-2],ds
0997:1b10  mov word ptr [bp-4],6E2Ah
0997:1b15  jmp short 1B3Ch
0997:1b17  les bx,[bp-4]
0997:1b1a  cmp es:[bx+2],di
0997:1b1e  jne short 1B37h
0997:1b20  cmp byte ptr es:[bx+4],4
0997:1b25  jne short 1B2Dh
0997:1b27  cmp word ptr [bp-6],0
0997:1b2b  je short 1B37h
0997:1b2d  les bx,[bp+6]
0997:1b30  mov es:[bx],si
0997:1b33  add word ptr [bp+6],2
0997:1b37  inc si
0997:1b38  add word ptr [bp-4],1Eh
0997:1b3c  cmp si,1Eh
0997:1b3f  jl short 1B17h
0997:1b41  jmp short 1BA0h
0997:1b43  cmp byte ptr [bp+12h],0
0997:1b47  je short 1B65h
0997:1b49  mov al,[bp+0Eh]
0997:1b4c  cbw
0997:1b4d  push ax
0997:1b4e  push word ptr [bp+0Ch]
0997:1b51  push di
0997:1b52  push cs
0997:1b53  call 1A4Ah
0997:1b56  add sp,6
0997:1b59  les bx,[bp+6]
0997:1b5c  mov es:[bx],ax
0997:1b5f  add word ptr [bp+6],2
0997:1b63  jmp short 1BA0h
0997:1b65  xor si,si
0997:1b67  mov [bp-2],ds
0997:1b6a  mov word ptr [bp-4],6E2Ah
0997:1b6f  jmp short 1B9Bh
0997:1b71  push word ptr [bp-6]
0997:1b74  push word ptr [bp+0Ch]
0997:1b77  push di
0997:1b78  push word ptr [bp-2]
0997:1b7b  push word ptr [bp-4]
0997:1b7e  call far 1BAEh,0997h
0997:1b83  add sp,0Ah
0997:1b86  or ax,ax
0997:1b88  je short 1B96h
0997:1b8a  les bx,[bp+6]
0997:1b8d  mov es:[bx],si
0997:1b90  add word ptr [bp+6],2
0997:1b94  jmp short 1BA0h
0997:1b96  inc si
0997:1b97  add word ptr [bp-4],1Eh
0997:1b9b  cmp si,1Eh
0997:1b9e  jl short 1B71h
0997:1ba0  les bx,[bp+6]
0997:1ba3  mov word ptr es:[bx],0FFFFh
0997:1ba8  pop di
0997:1ba9  pop si
0997:1baa  mov sp,bp
0997:1bac  pop bp
0997:1bad  ret far

; Candidate 0997:1bae, file offset 0xe71e
0997:1bae  push bp
0997:1baf  mov bp,sp
0997:1bb1  les bx,[bp+6]
0997:1bb4  mov ax,es:[bx+2]
0997:1bb8  cmp ax,[bp+0Ah]
0997:1bbb  jne short 1BD9h
0997:1bbd  mov al,es:[bx+4]
0997:1bc1  cbw
0997:1bc2  cmp ax,[bp+0Ch]
0997:1bc5  je short 1BD4h
0997:1bc7  cmp byte ptr es:[bx+4],4
0997:1bcc  jne short 1BD9h
0997:1bce  cmp word ptr [bp+0Eh],0
0997:1bd2  je short 1BD9h
0997:1bd4  mov ax,1
0997:1bd7  jmp short 1BDBh
0997:1bd9  xor ax,ax
0997:1bdb  pop bp
0997:1bdc  ret far

; Candidate 0b54:000d, file offset 0xe74d
0b54:000d  push bp
0b54:000e  mov bp,sp
0b54:0010  sub sp,4
0b54:0013  mov cl,[bp+8]
0b54:0016  mov al,[bp+6]
0b54:0019  cbw
0b54:001a  shl ax,1
0b54:001c  shl ax,1
0b54:001e  mov bx,ax
0b54:0020  mov ax,[bx+323Ah]
0b54:0024  mov dx,[bx+3238h]
0b54:0028  mov [bp-2],ax
0b54:002b  mov [bp-4],dx
0b54:002e  mov al,[bp+6]
0b54:0031  cbw
0b54:0032  mov bx,ax
0b54:0034  mov al,[bx+3250h]
0b54:0038  cmp al,cl
0b54:003a  jge short 0048h
0b54:003c  mov al,[bp+6]
0b54:003f  cbw
0b54:0040  mov bx,ax
0b54:0042  mov al,[bx+3250h]
0b54:0046  mov cl,al
0b54:0048  mov al,[bp+6]
0b54:004b  cbw
0b54:004c  push ax
0b54:004d  mov al,cl
0b54:004f  cbw
0b54:0050  pop bx
0b54:0051  idiv byte ptr [bx+3256h]
0b54:0055  mov cl,al
0b54:0057  mov al,[bp+6]
0b54:005a  cbw
0b54:005b  mov bx,ax
0b54:005d  mov al,[bx+325Ch]
0b54:0061  cbw
0b54:0062  push ax
0b54:0063  mov al,[bp+0Ah]
0b54:0066  cbw
0b54:0067  mov dx,ax
0b54:0069  pop ax
0b54:006a  imul dx
0b54:006c  mov dl,cl
0b54:006e  add dl,al
0b54:0070  mov cl,dl
0b54:0072  mov al,cl
0b54:0074  cbw
0b54:0075  les bx,[bp-4]
0b54:0078  add bx,ax
0b54:007a  mov al,es:[bx]
0b54:007d  cbw
0b54:007e  mov sp,bp
0b54:0080  pop bp
0b54:0081  ret far

; Candidate 0b54:0082, file offset 0xe7c2
0b54:0082  push bp
0b54:0083  mov bp,sp
0b54:0085  mov al,[bp+6]
0b54:0088  cbw
0b54:0089  mov dx,3
0b54:008c  imul dx
0b54:008e  push ax
0b54:008f  mov al,[bp+8]
0b54:0092  cbw
0b54:0093  pop bx
0b54:0094  add bx,ax
0b54:0096  mov al,[bx+3262h]
0b54:009a  pop bp
0b54:009b  ret far

; Candidate 0b54:009c, file offset 0xe7dc
0b54:009c  push bp
0b54:009d  mov bp,sp
0b54:009f  push si
0b54:00a0  mov si,[bp+6]
0b54:00a3  mov al,0
0b54:00a5  push ax
0b54:00a6  mov al,[bp+8]
0b54:00a9  push ax
0b54:00aa  push cs
0b54:00ab  call 0082h
0b54:00ae  add sp,4
0b54:00b1  cbw
0b54:00b2  cmp ax,si
0b54:00b4  jne short 00BAh
0b54:00b6  xor ax,ax
0b54:00b8  jmp short 00EDh
0b54:00ba  mov al,1
0b54:00bc  push ax
0b54:00bd  mov al,[bp+8]
0b54:00c0  push ax
0b54:00c1  push cs
0b54:00c2  call 0082h
0b54:00c5  add sp,4
0b54:00c8  cbw
0b54:00c9  cmp ax,si
0b54:00cb  jne short 00D2h
0b54:00cd  mov ax,1
0b54:00d0  jmp short 00EDh
0b54:00d2  mov al,2
0b54:00d4  push ax
0b54:00d5  mov al,[bp+8]
0b54:00d8  push ax
0b54:00d9  push cs
0b54:00da  call 0082h
0b54:00dd  add sp,4
0b54:00e0  cbw
0b54:00e1  cmp ax,si
0b54:00e3  jne short 00EAh
0b54:00e5  mov ax,2
0b54:00e8  jmp short 00EDh
0b54:00ea  mov ax,0FFFFh
0b54:00ed  pop si
0b54:00ee  pop bp
0b54:00ef  ret far

; Candidate 0b54:00f0, file offset 0xe830
0b54:00f0  push bp
0b54:00f1  mov bp,sp
0b54:00f3  push si
0b54:00f4  push di
0b54:00f5  mov di,[bp+6]
0b54:00f8  mov ax,di
0b54:00fa  mov dx,159h
0b54:00fd  imul dx
0b54:00ff  mov bx,ax
0b54:0101  mov al,[bx-19EBh]
0b54:0105  cbw
0b54:0106  mov bx,ax
0b54:0108  mov al,[bx+3298h]
0b54:010c  cbw
0b54:010d  mov cx,ax
0b54:010f  mov ax,di
0b54:0111  mov dx,159h
0b54:0114  imul dx
0b54:0116  mov bx,ax
0b54:0118  cmp byte ptr [bx-19E9h],0
0b54:011d  je short 0143h
0b54:011f  xor si,si
0b54:0121  jmp short 013Eh
0b54:0123  mov ax,di
0b54:0125  mov dx,159h
0b54:0128  imul dx
0b54:012a  mov bx,ax
0b54:012c  mov al,[bx-19E9h]
0b54:0130  cmp al,[si+328Fh]
0b54:0134  jl short 013Dh
0b54:0136  mov al,[si+3294h]
0b54:013a  cbw
0b54:013b  mov cx,ax
0b54:013d  inc si
0b54:013e  cmp si,5
0b54:0141  jl short 0123h
0b54:0143  mov ax,cx
0b54:0145  pop di
0b54:0146  pop si
0b54:0147  pop bp
0b54:0148  ret far

; Candidate 0b54:0149, file offset 0xe889
0b54:0149  push bp
0b54:014a  mov bp,sp
0b54:014c  push si
0b54:014d  push di
0b54:014e  mov di,[bp+6]
0b54:0151  mov ax,di
0b54:0153  mov dx,159h
0b54:0156  imul dx
0b54:0158  mov bx,ax
0b54:015a  mov al,[bx-19EBh]
0b54:015e  cbw
0b54:015f  mov bx,ax
0b54:0161  mov al,[bx+32BBh]
0b54:0165  cbw
0b54:0166  mov cx,ax
0b54:0168  mov ax,di
0b54:016a  mov dx,159h
0b54:016d  imul dx
0b54:016f  mov bx,ax
0b54:0171  cmp byte ptr [bx-19E9h],0
0b54:0176  je short 019Ch
0b54:0178  xor si,si
0b54:017a  jmp short 0197h
0b54:017c  mov ax,di
0b54:017e  mov dx,159h
0b54:0181  imul dx
0b54:0183  mov bx,ax
0b54:0185  mov al,[bx-19E9h]
0b54:0189  cmp al,[si+32B2h]
0b54:018d  jl short 0196h
0b54:018f  mov al,[si+32B7h]
0b54:0193  cbw
0b54:0194  mov cx,ax
0b54:0196  inc si
0b54:0197  cmp si,5
0b54:019a  jl short 017Ch
0b54:019c  mov ax,cx
0b54:019e  pop di
0b54:019f  pop si
0b54:01a0  pop bp
0b54:01a1  ret far

; Candidate 0b54:01a2, file offset 0xe8e2
0b54:01a2  push bp
0b54:01a3  mov bp,sp
0b54:01a5  mov ax,[bp+6]
0b54:01a8  mov dx,159h
0b54:01ab  imul dx
0b54:01ad  mov bx,ax
0b54:01af  mov al,[bx-19E3h]
0b54:01b3  cbw
0b54:01b4  mov bx,ax
0b54:01b6  mov al,[bx+32D4h]
0b54:01ba  cbw
0b54:01bb  pop bp
0b54:01bc  ret far

; Candidate 0b54:01bd, file offset 0xe8fd
0b54:01bd  push bp
0b54:01be  mov bp,sp
0b54:01c0  mov al,[bp+6]
0b54:01c3  cbw
0b54:01c4  shl ax,1
0b54:01c6  mov bx,ax
0b54:01c8  mov ax,[bx+32E8h]
0b54:01cc  pop bp
0b54:01cd  ret far

; Candidate 0b54:01fb, file offset 0xe93b
0b54:01fb  push bp
0b54:01fc  mov bp,sp
0b54:01fe  sub sp,8
0b54:0201  push si
0b54:0202  push di
0b54:0203  mov al,[bp+6]
0b54:0206  cbw
0b54:0207  mov dx,159h
0b54:020a  imul dx
0b54:020c  add ax,0E608h
0b54:020f  mov [bp-6],ds
0b54:0212  mov [bp-8],ax
0b54:0215  xor si,si
0b54:0217  les bx,[bp-8]
0b54:021a  mov al,es:[bx+17h]
0b54:021e  push ax
0b54:021f  mov al,es:[bx+22h]
0b54:0223  push ax
0b54:0224  push cs
0b54:0225  call 01CEh
0b54:0228  add sp,4
0b54:022b  mov [bp-2],ax
0b54:022e  mov word ptr [bp-4],0
0b54:0233  jmp short 028Fh
0b54:0235  mov ax,1
0b54:0238  mov cl,[bp-4]
0b54:023b  shl ax,cl
0b54:023d  push ax
0b54:023e  mov al,[bp+8]
0b54:0241  cbw
0b54:0242  pop dx
0b54:0243  test ax,dx
0b54:0245  je short 028Ch
0b54:0247  mov al,[bp-4]
0b54:024a  push ax
0b54:024b  les bx,[bp-8]
0b54:024e  mov al,es:[bx+22h]
0b54:0252  push ax
0b54:0253  push cs
0b54:0254  call 0082h
0b54:0257  add sp,4
0b54:025a  cbw
0b54:025b  mov di,ax
0b54:025d  les bx,[bp-8]
0b54:0260  add bx,[bp-4]
0b54:0263  mov al,es:[bx+26h]
0b54:0267  cmp al,[di+31A0h]
0b54:026b  jle short 0274h
0b54:026d  mov al,[di+31A6h]
0b54:0271  cbw
0b54:0272  jmp short 0287h
0b54:0274  mov al,0
0b54:0276  push ax
0b54:0277  mov al,[di+319Ah]
0b54:027b  push ax
0b54:027c  mov al,1
0b54:027e  push ax
0b54:027f  call far 0505h,08D7h
0b54:0284  add sp,6
0b54:0287  add si,ax
0b54:0289  add si,[bp-2]
0b54:028c  inc word ptr [bp-4]
0b54:028f  cmp word ptr [bp-4],3
0b54:0293  jl short 0235h
0b54:0295  les bx,[bp-8]
0b54:0298  mov al,es:[bx+22h]
0b54:029c  cbw
0b54:029d  mov bx,ax
0b54:029f  mov al,[bx+1EC8h]
0b54:02a3  cbw
0b54:02a4  push ax
0b54:02a5  mov ax,si
0b54:02a7  cwd
0b54:02a8  pop bx
0b54:02a9  idiv bx
0b54:02ab  mov si,ax
0b54:02ad  cmp si,1
0b54:02b0  jge short 02B5h
0b54:02b2  mov si,1
0b54:02b5  mov ax,si
0b54:02b7  pop di
0b54:02b8  pop si
0b54:02b9  mov sp,bp
0b54:02bb  pop bp
0b54:02bc  ret far

; Candidate 0b54:04c6, file offset 0xec06
0b54:04c6  push bp
0b54:04c7  mov bp,sp
0b54:04c9  cmp byte ptr [bp+8],0
0b54:04cd  jle short 04F7h
0b54:04cf  cmp byte ptr [bp+8],64h
0b54:04d3  jne short 04D9h
0b54:04d5  mov byte ptr [bp+8],0
0b54:04d9  mov al,[bp+8]
0b54:04dc  cbw
0b54:04dd  push ax
0b54:04de  mov al,[bp+6]
0b54:04e1  cbw
0b54:04e2  push ax
0b54:04e3  push ds
0b54:04e4  mov ax,34F6h
0b54:04e7  push ax
0b54:04e8  push ds
0b54:04e9  mov ax,0EF20h
0b54:04ec  push ax
0b54:04ed  call far 64A1h,0
0b54:04f2  add sp,0Ch
0b54:04f5  jmp short 050Eh
0b54:04f7  mov al,[bp+6]
0b54:04fa  cbw
0b54:04fb  push ax
0b54:04fc  push ds
0b54:04fd  mov ax,34FEh
0b54:0500  push ax
0b54:0501  push ds
0b54:0502  mov ax,0EF20h
0b54:0505  push ax
0b54:0506  call far 64A1h,0
0b54:050b  add sp,0Ah
0b54:050e  mov dx,ds
0b54:0510  mov ax,0EF20h
0b54:0513  pop bp
0b54:0514  ret far

; Candidate 0b54:0515, file offset 0xec55
0b54:0515  push bp
0b54:0516  mov bp,sp
0b54:0518  sub sp,4
0b54:051b  mov al,[bp+8]
0b54:051e  push ax
0b54:051f  mov al,[bp+6]
0b54:0522  push ax
0b54:0523  push cs
0b54:0524  call 0082h
0b54:0527  add sp,4
0b54:052a  mov [bp+6],al
0b54:052d  cmp byte ptr [bp+6],0FFh
0b54:0531  je short 055Fh
0b54:0533  cbw
0b54:0534  shl ax,1
0b54:0536  shl ax,1
0b54:0538  mov bx,ax
0b54:053a  mov ax,[bx+344Ch]
0b54:053e  mov dx,[bx+344Ah]
0b54:0542  mov [bp-2],ax
0b54:0545  mov [bp-4],dx
0b54:0548  mov al,[bp+0Ah]
0b54:054b  cbw
0b54:054c  shl ax,1
0b54:054e  shl ax,1
0b54:0550  les bx,[bp-4]
0b54:0553  add bx,ax
0b54:0555  mov dx,es:[bx-2]
0b54:0559  mov ax,es:[bx-4]
0b54:055d  jmp short 0565h
0b54:055f  mov dx,0FFFFh
0b54:0562  mov ax,0FFFFh
0b54:0565  mov sp,bp
0b54:0567  pop bp
0b54:0568  ret far

; Candidate 0b54:0569, file offset 0xeca9
0b54:0569  push bp
0b54:056a  mov bp,sp
0b54:056c  dec sp
0b54:056d  dec sp
0b54:056e  mov al,[bp+6]
0b54:0571  cbw
0b54:0572  mov dx,159h
0b54:0575  imul dx
0b54:0577  mov bx,ax
0b54:0579  mov al,[bx-19D2h]
0b54:057d  dec al
0b54:057f  mov [bp-1],al
0b54:0582  mov al,[bp+6]
0b54:0585  cbw
0b54:0586  mov dx,159h
0b54:0589  imul dx
0b54:058b  mov bx,ax
0b54:058d  mov al,[bx-19D6h]
0b54:0591  cbw
0b54:0592  mov bx,ax
0b54:0594  mov al,[bx+1ED7h]
0b54:0598  mov [bp-2],al
0b54:059b  mov al,[bp-1]
0b54:059e  cbw
0b54:059f  push ax
0b54:05a0  mov al,[bp-2]
0b54:05a3  cbw
0b54:05a4  mov bx,ax
0b54:05a6  mov al,[bx+3466h]
0b54:05aa  cbw
0b54:05ab  mov bx,ax
0b54:05ad  pop ax
0b54:05ae  cwd
0b54:05af  idiv bx
0b54:05b1  push ax
0b54:05b2  mov al,[bp-2]
0b54:05b5  cbw
0b54:05b6  mov bx,ax
0b54:05b8  mov al,[bx+3462h]
0b54:05bc  cbw
0b54:05bd  mov dx,ax
0b54:05bf  pop ax
0b54:05c0  imul dx
0b54:05c2  mov dl,14h
0b54:05c4  sub dl,al
0b54:05c6  mov cl,dl
0b54:05c8  mov al,[bp+8]
0b54:05cb  sub cl,al
0b54:05cd  mov al,cl
0b54:05cf  mov sp,bp
0b54:05d1  pop bp
0b54:05d2  ret far

; Candidate 0b54:05d3, file offset 0xed13
0b54:05d3  push bp
0b54:05d4  mov bp,sp
0b54:05d6  mov ax,[bp+6]
0b54:05d9  sub ax,[bp+8]
0b54:05dc  pop bp
0b54:05dd  ret far

; Candidate 0b54:05de, file offset 0xed1e
0b54:05de  push bp
0b54:05df  mov bp,sp
0b54:05e1  push si
0b54:05e2  mov si,[bp+6]
0b54:05e5  cmp si,0Eh
0b54:05e8  jle short 05EDh
0b54:05ea  mov si,0Eh
0b54:05ed  mov ax,[bp+8]
0b54:05f0  mov dx,0Eh
0b54:05f3  imul dx
0b54:05f5  mov bx,ax
0b54:05f7  mov al,[bx+si+346Ah]
0b54:05fb  cbw
0b54:05fc  pop si
0b54:05fd  pop bp
0b54:05fe  ret far

; Candidate 0bb3:01f2, file offset 0xef22
0bb3:01f2  push bp
0bb3:01f3  mov bp,sp
0bb3:01f5  call far 030Fh,238Bh
0bb3:01fa  mov word ptr [62A5h],2
0bb3:0200  push word ptr [0D0AEh]
0bb3:0204  push word ptr [0D0ACh]
0bb3:0208  mov ax,0A8h
0bb3:020b  push ax
0bb3:020c  mov ax,12h
0bb3:020f  push ax
0bb3:0210  xor ax,ax
0bb3:0212  push ax
0bb3:0213  push ax
0bb3:0214  call far dword ptr [6542h]
0bb3:0218  add sp,0Ch
0bb3:021b  cmp byte ptr [0E5A4h],1
0bb3:0220  jle short 0227h
0bb3:0222  mov byte ptr [0E5A4h],0
0bb3:0227  mov byte ptr [0EE3Ah],0
0bb3:022c  call far 0686h,0E24h
0bb3:0231  mov word ptr [62A5h],0
0bb3:0237  xor ax,ax
0bb3:0239  push ax
0bb3:023a  mov ax,2
0bb3:023d  push ax
0bb3:023e  mov ax,0A8h
0bb3:0241  push ax
0bb3:0242  mov ax,12h
0bb3:0245  push ax
0bb3:0246  xor ax,ax
0bb3:0248  push ax
0bb3:0249  mov ax,16h
0bb3:024c  push ax
0bb3:024d  xor ax,ax
0bb3:024f  push ax
0bb3:0250  push ax
0bb3:0251  call far 000Ah,1D92h
0bb3:0256  add sp,10h
0bb3:0259  call far 002Fh,0DFEh
0bb3:025e  call far 033Ah,238Bh
0bb3:0263  les bx,[bp+6]
0bb3:0266  mov ax,es:[bx+4]
0bb3:026a  pop bp
0bb3:026b  ret far

; Candidate 0bb3:07b1, file offset 0xf4e1
0bb3:07b1  push bp
0bb3:07b2  mov bp,sp
0bb3:07b4  sub sp,4
0bb3:07b7  push si
0bb3:07b8  push di
0bb3:07b9  mov di,[bp+6]
0bb3:07bc  mov ax,di
0bb3:07be  mov dx,159h
0bb3:07c1  imul dx
0bb3:07c3  add ax,0E608h
0bb3:07c6  mov [bp-2],ds
0bb3:07c9  mov [bp-4],ax
0bb3:07cc  mov ax,5
0bb3:07cf  push ax
0bb3:07d0  push di
0bb3:07d1  call far 06E9h,0E24h
0bb3:07d6  add sp,4
0bb3:07d9  or ax,ax
0bb3:07db  jne short 07FFh
0bb3:07dd  mov ax,[bp-4]
0bb3:07e0  inc ax
0bb3:07e1  inc ax
0bb3:07e2  push word ptr [bp-2]
0bb3:07e5  push ax
0bb3:07e6  push ds
0bb3:07e7  mov ax,35C6h
0bb3:07ea  push ax
0bb3:07eb  push ds
0bb3:07ec  mov ax,0F16Eh
0bb3:07ef  push ax
0bb3:07f0  call far 64A1h,0
0bb3:07f5  add sp,0Ch
0bb3:07f8  push ds
0bb3:07f9  mov ax,0F16Eh
0bb3:07fc  jmp 08A7h
0bb3:07ff  call far 0352h,0E24h
0bb3:0804  mov si,ax
0bb3:0806  mov dx,0Eh
0bb3:0809  imul dx
0bb3:080b  mov bx,ax
0bb3:080d  cmp byte ptr [bx+71CEh],1Fh
0bb3:0812  je short 0817h
0bb3:0814  jmp 089Fh
0bb3:0817  mov ax,si
0bb3:0819  mov dx,0Eh
0bb3:081c  imul dx
0bb3:081e  mov bx,ax
0bb3:0820  cmp byte ptr [bx+71D7h],0FFh
0bb3:0825  jne short 0833h
0bb3:0827  push ds
0bb3:0828  mov ax,35E8h
0bb3:082b  push ax
0bb3:082c  call far 0BE6h,08D7h
0bb3:0831  jmp short 08ADh
0bb3:0833  les bx,[bp-4]
0bb3:0836  mov al,es:[bx+25h]
0bb3:083a  mov ah,0
0bb3:083c  push ax
0bb3:083d  mov ax,si
0bb3:083f  mov dx,0Eh
0bb3:0842  imul dx
0bb3:0844  mov bx,ax
0bb3:0846  mov al,[bx+71D7h]
0bb3:084a  cbw
0bb3:084b  pop dx
0bb3:084c  add dx,ax
0bb3:084e  cmp dx,64h
0bb3:0851  jle short 085Dh
0bb3:0853  mov bx,[bp-4]
0bb3:0856  mov byte ptr es:[bx+25h],64h
0bb3:085b  jmp short 0871h
0bb3:085d  mov ax,si
0bb3:085f  mov dx,0Eh
0bb3:0862  imul dx
0bb3:0864  mov bx,ax
0bb3:0866  mov al,[bx+71D7h]
0bb3:086a  les bx,[bp-4]
0bb3:086d  add es:[bx+25h],al
0bb3:0871  mov ax,si
0bb3:0873  mov dx,0Eh
0bb3:0876  imul dx
0bb3:0878  mov bx,ax
0bb3:087a  mov word ptr [bx+71D0h],0FFFFh
0bb3:0880  xor ax,ax
0bb3:0882  push ax
0bb3:0883  call far 0197h,08AEh
0bb3:0888  inc sp
0bb3:0889  inc sp
0bb3:088a  push di
0bb3:088b  call far 0504h,1901h
0bb3:0890  inc sp
0bb3:0891  inc sp
0bb3:0892  mov ax,9
0bb3:0895  push ax
0bb3:0896  call far 00AAh,1C9Fh
0bb3:089b  inc sp
0bb3:089c  inc sp
0bb3:089d  jmp short 08B0h
0bb3:089f  or si,si
0bb3:08a1  je short 08B0h
0bb3:08a3  push ds
0bb3:08a4  mov ax,361Bh
0bb3:08a7  push ax
0bb3:08a8  call far 0284h,21B0h
0bb3:08ad  add sp,4
0bb3:08b0  pop di
0bb3:08b1  pop si
0bb3:08b2  mov sp,bp
0bb3:08b4  pop bp
0bb3:08b5  ret far

; Candidate 0bb3:0eac, file offset 0xfbdc
0bb3:0eac  push bp
0bb3:0ead  mov bp,sp
0bb3:0eaf  mov al,3
0bb3:0eb1  push ax
0bb3:0eb2  mov al,0Ah
0bb3:0eb4  push ax
0bb3:0eb5  mov al,1
0bb3:0eb7  push ax
0bb3:0eb8  call far 0505h,08D7h
0bb3:0ebd  add sp,6
0bb3:0ec0  mov dx,12h
0bb3:0ec3  imul dx
0bb3:0ec5  cwd
0bb3:0ec6  mov bx,[6686h]
0bb3:0eca  mov cx,[6684h]
0bb3:0ece  add cx,ax
0bb3:0ed0  adc bx,dx
0bb3:0ed2  mov [0EF2Ch],bx
0bb3:0ed6  mov [0EF2Ah],cx
0bb3:0eda  call far 0FC7h,0BB3h
0bb3:0edf  call far 033Ah,238Bh
0bb3:0ee4  mov ax,[6DD2h]
0bb3:0ee7  mov [0EF2Eh],ax
0bb3:0eea  mov word ptr [6616h],0
0bb3:0ef0  mov ax,[6DD2h]
0bb3:0ef3  mov [0EF2Eh],ax
0bb3:0ef6  mov ax,1
0bb3:0ef9  push ax
0bb3:0efa  call far 09FEh,0F55h
0bb3:0eff  inc sp
0bb3:0f00  inc sp
0bb3:0f01  push cs
0bb3:0f02  call 0E87h
0bb3:0f05  call far 05A6h,17B7h
0bb3:0f0a  cmp byte ptr [0D0AAh],0
0bb3:0f0f  je short 0F1Ch
0bb3:0f11  mov ax,1
0bb3:0f14  push ax
0bb3:0f15  call far 007Ah,2ABAh
0bb3:0f1a  inc sp
0bb3:0f1b  inc sp
0bb3:0f1c  mov ax,[0EF2Ch]
0bb3:0f1f  mov dx,[0EF2Ah]
0bb3:0f23  cmp ax,[6686h]
0bb3:0f27  jbe short 0F2Ch
0bb3:0f29  jmp 0FB8h
0bb3:0f2c  jb short 0F37h
0bb3:0f2e  cmp dx,[6684h]
0bb3:0f32  jb short 0F37h
0bb3:0f34  jmp 0FB8h
0bb3:0f37  mov al,3
0bb3:0f39  push ax
0bb3:0f3a  mov al,0Ah
0bb3:0f3c  push ax
0bb3:0f3d  mov al,1
0bb3:0f3f  push ax
0bb3:0f40  call far 0505h,08D7h
0bb3:0f45  add sp,6
0bb3:0f48  mov dx,12h
0bb3:0f4b  imul dx
0bb3:0f4d  cwd
0bb3:0f4e  mov bx,[6686h]
0bb3:0f52  mov cx,[6684h]
0bb3:0f56  add cx,ax
0bb3:0f58  adc bx,dx
0bb3:0f5a  mov [0EF2Ch],bx
0bb3:0f5e  mov [0EF2Ah],cx
0bb3:0f62  mov al,0FFh
0bb3:0f64  push ax
0bb3:0f65  mov al,2
0bb3:0f67  push ax
0bb3:0f68  mov al,1
0bb3:0f6a  push ax
0bb3:0f6b  call far 0505h,08D7h
0bb3:0f70  add sp,6
0bb3:0f73  or ax,ax
0bb3:0f75  je short 0F94h
0bb3:0f77  mov al,0FFh
0bb3:0f79  push ax
0bb3:0f7a  mov al,0Ch
0bb3:0f7c  push ax
0bb3:0f7d  mov al,1
0bb3:0f7f  push ax
0bb3:0f80  call far 0505h,08D7h
0bb3:0f85  add sp,6
0bb3:0f88  mov dx,[6DD2h]
0bb3:0f8c  add dx,ax
0bb3:0f8e  push dx
0bb3:0f8f  mov ax,1Bh
0bb3:0f92  jmp short 0FAFh
0bb3:0f94  mov al,0FFh
0bb3:0f96  push ax
0bb3:0f97  mov al,0Ch
0bb3:0f99  push ax
0bb3:0f9a  mov al,1
0bb3:0f9c  push ax
0bb3:0f9d  call far 0505h,08D7h
0bb3:0fa2  add sp,6
0bb3:0fa5  mov dx,[6DD2h]
0bb3:0fa9  add dx,ax
0bb3:0fab  push dx
0bb3:0fac  mov ax,1Ch
0bb3:0faf  push ax
0bb3:0fb0  call far 0014h,1A30h
0bb3:0fb5  add sp,4
0bb3:0fb8  xor ax,ax
0bb3:0fba  push ax
0bb3:0fbb  call far 0,1A30h
0bb3:0fc0  inc sp
0bb3:0fc1  inc sp
0bb3:0fc2  jmp 0EF0h
0bb3:0fc5  pop bp
0bb3:0fc6  ret far

; Candidate 0bb3:0fc7, file offset 0xfcf7
0bb3:0fc7  push bp
0bb3:0fc8  mov bp,sp
0bb3:0fca  mov al,[9316h]
0bb3:0fcd  cbw
0bb3:0fce  or ax,ax
0bb3:0fd0  jne short 0FD9h
0bb3:0fd2  call far 1076h,0BB3h
0bb3:0fd7  jmp short 1002h
0bb3:0fd9  mov al,[6655h]
0bb3:0fdc  mov ah,0
0bb3:0fde  or ax,ax
0bb3:0fe0  jne short 0FEDh
0bb3:0fe2  push word ptr [6DD6h]
0bb3:0fe6  call far 0197h,08AEh
0bb3:0feb  inc sp
0bb3:0fec  inc sp
0bb3:0fed  push word ptr [6DD0h]
0bb3:0ff1  push word ptr [6DCEh]
0bb3:0ff5  call far 007Fh,2AE3h
0bb3:0ffa  add sp,4
0bb3:0ffd  mov byte ptr [9316h],0
0bb3:1002  call far 005Ch,2ABAh
0bb3:1007  mov byte ptr [0E441h],0
0bb3:100c  mov byte ptr [9317h],0
0bb3:1011  mov ax,[667Eh]
0bb3:1014  mov dx,[667Ch]
0bb3:1018  mov [0EEF4h],ax
0bb3:101b  mov [0EEF2h],dx
0bb3:101f  mov byte ptr [0DF2Ch],0
0bb3:1024  mov byte ptr [0CB76h],1
0bb3:1029  call far 002Fh,0DFEh
0bb3:102e  mov word ptr [62A5h],0
0bb3:1034  xor ax,ax
0bb3:1036  push ax
0bb3:1037  call far 0061h,2AE3h
0bb3:103c  inc sp
0bb3:103d  inc sp
0bb3:103e  push word ptr [9344h]
0bb3:1042  push word ptr [9342h]
0bb3:1046  call far 000Ah,2166h
0bb3:104b  add sp,4
0bb3:104e  mov word ptr [62A5h],0
0bb3:1054  call far 0686h,0E24h
0bb3:1059  mov ax,1
0bb3:105c  push ax
0bb3:105d  call far 007Ah,2ABAh
0bb3:1062  inc sp
0bb3:1063  inc sp
0bb3:1064  call far 033Ah,238Bh
0bb3:1069  mov ax,7
0bb3:106c  push ax
0bb3:106d  call far 0133h,21B0h
0bb3:1072  inc sp
0bb3:1073  inc sp
0bb3:1074  pop bp
0bb3:1075  ret far

; Candidate 0bb3:1076, file offset 0xfda6
0bb3:1076  push bp
0bb3:1077  mov bp,sp
0bb3:1079  mov word ptr [6DCEh],4
0bb3:107f  mov word ptr [6DD0h],0
0bb3:1085  xor ax,ax
0bb3:1087  push ax
0bb3:1088  mov ax,4
0bb3:108b  push ax
0bb3:108c  call far 007Fh,2AE3h
0bb3:1091  add sp,4
0bb3:1094  mov word ptr [6DD2h],0ABh
0bb3:109a  mov word ptr [6DD4h],2
0bb3:10a0  mov al,[6655h]
0bb3:10a3  mov ah,0
0bb3:10a5  or ax,ax
0bb3:10a7  jne short 10B3h
0bb3:10a9  xor ax,ax
0bb3:10ab  push ax
0bb3:10ac  call far 0197h,08AEh
0bb3:10b1  inc sp
0bb3:10b2  inc sp
0bb3:10b3  pop bp
0bb3:10b4  ret far

; Candidate 0cbe:0005, file offset 0xfde5
0cbe:0005  push bp
0cbe:0006  mov bp,sp
0cbe:0008  sub sp,4
0cbe:000b  push si
0cbe:000c  push di
0cbe:000d  mov si,[bp+6]
0cbe:0010  mov al,0FFh
0cbe:0012  push ax
0cbe:0013  mov al,1Bh
0cbe:0015  push ax
0cbe:0016  mov al,1
0cbe:0018  push ax
0cbe:0019  call far 0505h,08D7h
0cbe:001e  add sp,6
0cbe:0021  mov di,ax
0cbe:0023  mov word ptr [bp-2],0
0cbe:0028  jmp 00EAh
0cbe:002b  mov ax,si
0cbe:002d  mov dx,159h
0cbe:0030  imul dx
0cbe:0032  mov dx,di
0cbe:0034  shl dx,1
0cbe:0036  add ax,dx
0cbe:0038  mov bx,ax
0cbe:003a  mov ax,[bx-191Bh]
0cbe:003e  mov [bp-4],ax
0cbe:0041  or ax,ax
0cbe:0043  jne short 0048h
0cbe:0045  jmp 00DDh
0cbe:0048  mov dx,0Eh
0cbe:004b  imul dx
0cbe:004d  mov bx,ax
0cbe:004f  mov al,[bx+71CEh]
0cbe:0053  cbw
0cbe:0054  mov cl,4
0cbe:0056  shl ax,cl
0cbe:0058  mov bx,ax
0cbe:005a  test word ptr [bx-6B84h],80h
0cbe:0060  je short 00DDh
0cbe:0062  mov ax,si
0cbe:0064  mov dx,159h
0cbe:0067  imul dx
0cbe:0069  mov dx,di
0cbe:006b  shl dx,1
0cbe:006d  add ax,dx
0cbe:006f  mov bx,ax
0cbe:0071  mov word ptr [bx-191Bh],0
0cbe:0077  mov ax,si
0cbe:0079  mov dx,159h
0cbe:007c  imul dx
0cbe:007e  mov bx,ax
0cbe:0080  test byte ptr [bx-19D7h],1
0cbe:0085  je short 0099h
0cbe:0087  push ds
0cbe:0088  mov ax,si
0cbe:008a  mov dx,159h
0cbe:008d  imul dx
0cbe:008f  add ax,0E60Ah
0cbe:0092  push ax
0cbe:0093  push ds
0cbe:0094  mov ax,3796h
0cbe:0097  jmp short 00A9h
0cbe:0099  push ds
0cbe:009a  mov ax,si
0cbe:009c  mov dx,159h
0cbe:009f  imul dx
0cbe:00a1  add ax,0E60Ah
0cbe:00a4  push ax
0cbe:00a5  push ds
0cbe:00a6  mov ax,37A7h
0cbe:00a9  push ax
0cbe:00aa  push ds
0cbe:00ab  mov ax,0F16Eh
0cbe:00ae  push ax
0cbe:00af  call far 64A1h,0
0cbe:00b4  add sp,0Ch
0cbe:00b7  push ds
0cbe:00b8  mov ax,0F16Eh
0cbe:00bb  push ax
0cbe:00bc  call far 0284h,21B0h
0cbe:00c1  add sp,4
0cbe:00c4  push word ptr [bp-4]
0cbe:00c7  call far 05D1h,0CBEh
0cbe:00cc  inc sp
0cbe:00cd  inc sp
0cbe:00ce  push ds
0cbe:00cf  mov ax,37B8h
0cbe:00d2  push ax
0cbe:00d3  call far 0284h,21B0h
0cbe:00d8  add sp,4
0cbe:00db  jmp short 00F3h
0cbe:00dd  inc di
0cbe:00de  mov ax,di
0cbe:00e0  cmp ax,1Bh
0cbe:00e3  jl short 00E7h
0cbe:00e5  xor di,di
0cbe:00e7  inc word ptr [bp-2]
0cbe:00ea  cmp word ptr [bp-2],1Bh
0cbe:00ee  jge short 00F3h
0cbe:00f0  jmp 002Bh
0cbe:00f3  push si
0cbe:00f4  call far 0AF9h,1901h
0cbe:00f9  inc sp
0cbe:00fa  inc sp
0cbe:00fb  pop di
0cbe:00fc  pop si
0cbe:00fd  mov sp,bp
0cbe:00ff  pop bp
0cbe:0100  ret far

; Candidate 0cbe:0101, file offset 0xfee1
0cbe:0101  push bp
0cbe:0102  mov bp,sp
0cbe:0104  dec sp
0cbe:0105  dec sp
0cbe:0106  push si
0cbe:0107  push di
0cbe:0108  mov di,[bp+6]
0cbe:010b  mov si,[bp+8]
0cbe:010e  cmp si,0FFFFh
0cbe:0111  jne short 011Ah
0cbe:0113  call far 0352h,0E24h
0cbe:0118  jmp short 012Dh
0cbe:011a  mov ax,di
0cbe:011c  mov dx,159h
0cbe:011f  imul dx
0cbe:0121  mov dx,si
0cbe:0123  shl dx,1
0cbe:0125  add ax,dx
0cbe:0127  mov bx,ax
0cbe:0129  mov ax,[bx-191Bh]
0cbe:012d  mov [bp-2],ax
0cbe:0130  mov ax,[bp-2]
0cbe:0133  mov dx,0Eh
0cbe:0136  imul dx
0cbe:0138  mov bx,ax
0cbe:013a  mov word ptr [bx+71D0h],0FFFFh
0cbe:0140  cmp si,0FFFFh
0cbe:0143  jne short 014Fh
0cbe:0145  xor ax,ax
0cbe:0147  push ax
0cbe:0148  call far 0197h,08AEh
0cbe:014d  jmp short 018Ah
0cbe:014f  mov ax,di
0cbe:0151  mov dx,159h
0cbe:0154  imul dx
0cbe:0156  mov dx,si
0cbe:0158  shl dx,1
0cbe:015a  add ax,dx
0cbe:015c  mov bx,ax
0cbe:015e  mov word ptr [bx-191Bh],0
0cbe:0164  cmp byte ptr [0EE3Ah],1
0cbe:0169  jne short 017Dh
0cbe:016b  xor ax,ax
0cbe:016d  push ax
0cbe:016e  mov ax,1
0cbe:0171  push ax
0cbe:0172  push si
0cbe:0173  call far 09A6h,0CBEh
0cbe:0178  add sp,6
0cbe:017b  jmp short 018Ch
0cbe:017d  cmp byte ptr [0EE3Ah],0
0cbe:0182  jne short 018Ch
0cbe:0184  push di
0cbe:0185  call far 0AF9h,1901h
0cbe:018a  inc sp
0cbe:018b  inc sp
0cbe:018c  mov ax,[bp-2]
0cbe:018f  mov dx,0Eh
0cbe:0192  imul dx
0cbe:0194  mov bx,ax
0cbe:0196  mov al,[bx+71D7h]
0cbe:019a  cbw
0cbe:019b  pop di
0cbe:019c  pop si
0cbe:019d  mov sp,bp
0cbe:019f  pop bp
0cbe:01a0  ret far

; Candidate 0cbe:01d4, file offset 0xffb4
0cbe:01d4  push bp
0cbe:01d5  mov bp,sp
0cbe:01d7  sub sp,10h
0cbe:01da  push si
0cbe:01db  push di
0cbe:01dc  mov di,[bp+0Ah]
0cbe:01df  mov si,[bp+0Ch]
0cbe:01e2  mov cx,[bp+0Eh]
0cbe:01e5  or si,si
0cbe:01e7  jne short 01ECh
0cbe:01e9  jmp 02B9h
0cbe:01ec  mov ax,si
0cbe:01ee  mov dx,0Eh
0cbe:01f1  imul dx
0cbe:01f3  add ax,71CAh
0cbe:01f6  mov [bp-6],ds
0cbe:01f9  mov [bp-8],ax
0cbe:01fc  les bx,[bp+6]
0cbe:01ff  cmp word ptr es:[bx],0
0cbe:0203  jne short 0238h
0cbe:0205  mov es:[bx],si
0cbe:0208  les bx,[bp-8]
0cbe:020b  mov ax,si
0cbe:020d  mov es:[bx+8],ax
0cbe:0211  mov es:[bx+0Ah],ax
0cbe:0215  mov al,cl
0cbe:0217  mov es:[bx+5],al
0cbe:021b  mov es:[bx+6],di
0cbe:021f  or di,di
0cbe:0221  jl short 022Dh
0cbe:0223  mov al,[6DCEh]
0cbe:0226  mov es:[bx+0Ch],al
0cbe:022a  jmp 02B9h
0cbe:022d  les bx,[bp-8]
0cbe:0230  mov byte ptr es:[bx+0Ch],0FFh
0cbe:0235  jmp 02B9h
0cbe:0238  les bx,[bp+6]
0cbe:023b  mov ax,es:[bx]
0cbe:023e  mov [bp-2],ax
0cbe:0241  mov dx,0Eh
0cbe:0244  imul dx
0cbe:0246  add ax,71CAh
0cbe:0249  mov [bp-0Eh],ds
0cbe:024c  mov [bp-10h],ax
0cbe:024f  mov ax,[bp-2]
0cbe:0252  mov dx,0Eh
0cbe:0255  imul dx
0cbe:0257  mov bx,ax
0cbe:0259  mov ax,[bx+71D2h]
0cbe:025d  mov [bp-4],ax
0cbe:0260  mov dx,0Eh
0cbe:0263  imul dx
0cbe:0265  add ax,71CAh
0cbe:0268  mov [bp-0Ah],ds
0cbe:026b  mov [bp-0Ch],ax
0cbe:026e  les bx,[bp-8]
0cbe:0271  mov es:[bx+6],di
0cbe:0275  mov al,cl
0cbe:0277  mov es:[bx+5],al
0cbe:027b  or di,di
0cbe:027d  jl short 0288h
0cbe:027f  mov al,[6DCEh]
0cbe:0282  mov es:[bx+0Ch],al
0cbe:0286  jmp short 0290h
0cbe:0288  les bx,[bp-8]
0cbe:028b  mov byte ptr es:[bx+0Ch],0FFh
0cbe:0290  les bx,[bp-0Ch]
0cbe:0293  mov ax,es:[bx+0Ah]
0cbe:0297  les bx,[bp-8]
0cbe:029a  mov es:[bx+0Ah],ax
0cbe:029e  mov ax,[bp-4]
0cbe:02a1  mov es:[bx+8],ax
0cbe:02a5  les bx,[bp-0Ch]
0cbe:02a8  mov es:[bx+0Ah],si
0cbe:02ac  les bx,[bp-10h]
0cbe:02af  mov es:[bx+8],si
0cbe:02b3  les bx,[bp+6]
0cbe:02b6  mov es:[bx],si
0cbe:02b9  pop di
0cbe:02ba  pop si
0cbe:02bb  mov sp,bp
0cbe:02bd  pop bp
0cbe:02be  ret far

; Candidate 0cbe:02bf, file offset 0x1009f
0cbe:02bf  push bp
0cbe:02c0  mov bp,sp
0cbe:02c2  sub sp,8
0cbe:02c5  push si
0cbe:02c6  push di
0cbe:02c7  les bx,[bp+6]
0cbe:02ca  mov si,es:[bx]
0cbe:02cd  or si,si
0cbe:02cf  jne short 02D4h
0cbe:02d1  jmp 037Fh
0cbe:02d4  mov word ptr [bp-4],0
0cbe:02d9  mov [bp-2],si
0cbe:02dc  jmp 036Eh
0cbe:02df  mov ax,si
0cbe:02e1  mov dx,0Eh
0cbe:02e4  imul dx
0cbe:02e6  add ax,71CAh
0cbe:02e9  mov [bp-6],ds
0cbe:02ec  mov [bp-8],ax
0cbe:02ef  cmp word ptr [bp+0Ch],0FFFFh
0cbe:02f3  jne short 0302h
0cbe:02f5  les bx,[bp-8]
0cbe:02f8  mov al,es:[bx+5]
0cbe:02fc  cbw
0cbe:02fd  cmp ax,[bp+0Ah]
0cbe:0300  je short 0307h
0cbe:0302  cmp [bp+0Ch],si
0cbe:0305  jne short 0364h
0cbe:0307  les bx,[bp-8]
0cbe:030a  mov ax,es:[bx+8]
0cbe:030e  mov cx,ax
0cbe:0310  mov di,es:[bx+0Ah]
0cbe:0314  mov dx,0Eh
0cbe:0317  imul dx
0cbe:0319  mov bx,ax
0cbe:031b  mov [bx+71D4h],di
0cbe:031f  mov ax,di
0cbe:0321  mov dx,0Eh
0cbe:0324  imul dx
0cbe:0326  mov dx,cx
0cbe:0328  mov bx,ax
0cbe:032a  mov [bx+71D2h],dx
0cbe:032e  mov bx,[bp-8]
0cbe:0331  mov word ptr es:[bx+0Ah],0
0cbe:0337  mov word ptr es:[bx+8],0
0cbe:033d  mov word ptr es:[bx+6],0
0cbe:0343  mov byte ptr es:[bx+0Ch],0
0cbe:0348  les bx,[bp+6]
0cbe:034b  cmp es:[bx],si
0cbe:034e  jne short 0353h
0cbe:0350  mov es:[bx],di
0cbe:0353  les bx,[bp+6]
0cbe:0356  cmp es:[bx],si
0cbe:0359  jne short 0360h
0cbe:035b  mov word ptr es:[bx],0
0cbe:0360  mov ax,si
0cbe:0362  jmp short 0381h
0cbe:0364  inc word ptr [bp-4]
0cbe:0367  les bx,[bp-8]
0cbe:036a  mov si,es:[bx+0Ah]
0cbe:036e  cmp si,[bp-2]
0cbe:0371  je short 0376h
0cbe:0373  jmp 02DFh
0cbe:0376  cmp word ptr [bp-4],0
0cbe:037a  jne short 037Fh
0cbe:037c  jmp 02DFh
0cbe:037f  xor ax,ax
0cbe:0381  pop di
0cbe:0382  pop si
0cbe:0383  mov sp,bp
0cbe:0385  pop bp
0cbe:0386  ret far

; Candidate 0cbe:0387, file offset 0x10167
0cbe:0387  push bp
0cbe:0388  mov bp,sp
0cbe:038a  sub sp,0Ah
0cbe:038d  push si
0cbe:038e  push di
0cbe:038f  mov di,[bp+0Ah]
0cbe:0392  mov cx,[bp+0Ch]
0cbe:0395  les bx,[bp+6]
0cbe:0398  mov si,es:[bx]
0cbe:039b  or si,si
0cbe:039d  jne short 03A4h
0cbe:039f  xor ax,ax
0cbe:03a1  jmp 0427h
0cbe:03a4  mov word ptr [bp-2],1
0cbe:03a9  mov word ptr [bp-6],0
0cbe:03ae  mov [bp-4],si
0cbe:03b1  jmp short 0419h
0cbe:03b3  mov ax,si
0cbe:03b5  mov dx,0Eh
0cbe:03b8  imul dx
0cbe:03ba  add ax,71CAh
0cbe:03bd  mov [bp-8],ds
0cbe:03c0  mov [bp-0Ah],ax
0cbe:03c3  cmp di,0FFFFh
0cbe:03c6  jne short 03CDh
0cbe:03c8  cmp cx,0FFFFh
0cbe:03cb  je short 03E7h
0cbe:03cd  cmp di,0FFFFh
0cbe:03d0  jne short 03DEh
0cbe:03d2  les bx,[bp-0Ah]
0cbe:03d5  mov al,es:[bx+4]
0cbe:03d9  cbw
0cbe:03da  cmp ax,cx
0cbe:03dc  je short 03E7h
0cbe:03de  cmp cx,0FFFFh
0cbe:03e1  jne short 040Dh
0cbe:03e3  cmp si,di
0cbe:03e5  jne short 040Dh
0cbe:03e7  cmp word ptr [bp+10h],0
0cbe:03eb  jne short 03FEh
0cbe:03ed  les bx,[bp-0Ah]
0cbe:03f0  cmp byte ptr es:[bx+5],4
0cbe:03f5  jl short 03FEh
0cbe:03f7  cmp byte ptr es:[bx+5],7
0cbe:03fc  jle short 040Dh
0cbe:03fe  cmp word ptr [bp+0Eh],0
0cbe:0402  je short 0409h
0cbe:0404  inc word ptr [bp-6]
0cbe:0407  jmp short 040Dh
0cbe:0409  mov ax,si
0cbe:040b  jmp short 0427h
0cbe:040d  mov word ptr [bp-2],0
0cbe:0412  les bx,[bp-0Ah]
0cbe:0415  mov si,es:[bx+0Ah]
0cbe:0419  cmp si,[bp-4]
0cbe:041c  jne short 03B3h
0cbe:041e  cmp word ptr [bp-2],0
0cbe:0422  jne short 03B3h
0cbe:0424  mov ax,[bp-6]
0cbe:0427  pop di
0cbe:0428  pop si
0cbe:0429  mov sp,bp
0cbe:042b  pop bp
0cbe:042c  ret far

; Candidate 0cbe:042d, file offset 0x1020d
0cbe:042d  push bp
0cbe:042e  mov bp,sp
0cbe:0430  sub sp,6
0cbe:0433  push si
0cbe:0434  push di
0cbe:0435  les bx,[bp+6]
0cbe:0438  mov si,es:[bx]
0cbe:043b  or si,si
0cbe:043d  je short 046Eh
0cbe:043f  mov di,1
0cbe:0442  mov [bp-2],si
0cbe:0445  jmp short 0465h
0cbe:0447  mov ax,si
0cbe:0449  mov dx,0Eh
0cbe:044c  imul dx
0cbe:044e  add ax,71CAh
0cbe:0451  mov [bp-4],ds
0cbe:0454  mov [bp-6],ax
0cbe:0457  les bx,[bp-6]
0cbe:045a  or byte ptr es:[bx+2],40h
0cbe:045f  xor di,di
0cbe:0461  mov si,es:[bx+0Ah]
0cbe:0465  cmp si,[bp-2]
0cbe:0468  jne short 0447h
0cbe:046a  or di,di
0cbe:046c  jne short 0447h
0cbe:046e  pop di
0cbe:046f  pop si
0cbe:0470  mov sp,bp
0cbe:0472  pop bp
0cbe:0473  ret far

; Candidate 0cbe:0474, file offset 0x10254
0cbe:0474  push bp
0cbe:0475  mov bp,sp
0cbe:0477  push si
0cbe:0478  push di
0cbe:0479  mov di,[bp+6]
0cbe:047c  mov si,[bp+8]
0cbe:047f  push word ptr [bp+0Ah]
0cbe:0482  push si
0cbe:0483  push di
0cbe:0484  push ds
0cbe:0485  mov ax,di
0cbe:0487  mov dx,0Ah
0cbe:048a  imul dx
0cbe:048c  add ax,0A366h
0cbe:048f  push ax
0cbe:0490  push cs
0cbe:0491  call 01D4h
0cbe:0494  add sp,0Ah
0cbe:0497  mov ax,si
0cbe:0499  mov dx,0Eh
0cbe:049c  imul dx
0cbe:049e  mov bx,ax
0cbe:04a0  cmp [bx+71D4h],si
0cbe:04a4  je short 04C2h
0cbe:04a6  mov ax,si
0cbe:04a8  mov dx,0Eh
0cbe:04ab  imul dx
0cbe:04ad  mov bx,ax
0cbe:04af  mov ax,[bx+71D4h]
0cbe:04b3  push ax
0cbe:04b4  mov ax,di
0cbe:04b6  mov dx,0Ah
0cbe:04b9  imul dx
0cbe:04bb  mov bx,ax
0cbe:04bd  pop ax
0cbe:04be  mov [bx-5C9Ah],ax
0cbe:04c2  pop di
0cbe:04c3  pop si
0cbe:04c4  pop bp
0cbe:04c5  ret far

; Candidate 0cbe:04c6, file offset 0x102a6
0cbe:04c6  push bp
0cbe:04c7  mov bp,sp
0cbe:04c9  sub sp,4
0cbe:04cc  push si
0cbe:04cd  push di
0cbe:04ce  mov ax,[bp+6]
0cbe:04d1  mov dx,0Ah
0cbe:04d4  imul dx
0cbe:04d6  mov bx,ax
0cbe:04d8  mov si,[bx-5C9Ah]
0cbe:04dc  or si,si
0cbe:04de  jne short 04E3h
0cbe:04e0  jmp 05CBh
0cbe:04e3  mov ax,[bp+6]
0cbe:04e6  mov dx,0Ah
0cbe:04e9  imul dx
0cbe:04eb  mov bx,ax
0cbe:04ed  mov word ptr [bx-5C9Ah],0
0cbe:04f3  mov word ptr [bp-4],0
0cbe:04f8  mov [bp-2],si
0cbe:04fb  jmp 05BAh
0cbe:04fe  mov ax,si
0cbe:0500  mov dx,0Eh
0cbe:0503  imul dx
0cbe:0505  mov bx,ax
0cbe:0507  mov al,[bx+71CEh]
0cbe:050b  cbw
0cbe:050c  cmp ax,[bp+8]
0cbe:050f  je short 0517h
0cbe:0511  cmp word ptr [bp+8],0FFFFh
0cbe:0515  jne short 0563h
0cbe:0517  mov ax,si
0cbe:0519  mov dx,0Eh
0cbe:051c  imul dx
0cbe:051e  mov bx,ax
0cbe:0520  mov word ptr [bx+71D0h],0FFFFh
0cbe:0526  mov ax,si
0cbe:0528  mov dx,0Eh
0cbe:052b  imul dx
0cbe:052d  mov bx,ax
0cbe:052f  mov byte ptr [bx+71D6h],0
0cbe:0534  mov di,si
0cbe:0536  mov ax,si
0cbe:0538  mov dx,0Eh
0cbe:053b  imul dx
0cbe:053d  mov bx,ax
0cbe:053f  mov si,[bx+71D4h]
0cbe:0543  mov ax,di
0cbe:0545  mov dx,0Eh
0cbe:0548  imul dx
0cbe:054a  mov bx,ax
0cbe:054c  mov word ptr [bx+71D4h],0
0cbe:0552  mov ax,di
0cbe:0554  mov dx,0Eh
0cbe:0557  imul dx
0cbe:0559  mov bx,ax
0cbe:055b  mov word ptr [bx+71D2h],0
0cbe:0561  jmp short 05B7h
0cbe:0563  mov di,si
0cbe:0565  mov ax,si
0cbe:0567  mov dx,0Eh
0cbe:056a  imul dx
0cbe:056c  mov bx,ax
0cbe:056e  mov si,[bx+71D4h]
0cbe:0572  mov ax,di
0cbe:0574  mov dx,0Eh
0cbe:0577  imul dx
0cbe:0579  mov bx,ax
0cbe:057b  mov word ptr [bx+71D4h],0
0cbe:0581  mov ax,di
0cbe:0583  mov dx,0Eh
0cbe:0586  imul dx
0cbe:0588  mov bx,ax
0cbe:058a  mov word ptr [bx+71D2h],0
0cbe:0590  mov ax,di
0cbe:0592  mov dx,0Eh
0cbe:0595  imul dx
0cbe:0597  mov bx,ax
0cbe:0599  mov al,[bx+71CFh]
0cbe:059d  cbw
0cbe:059e  push ax
0cbe:059f  push di
0cbe:05a0  push word ptr [bp+6]
0cbe:05a3  push ds
0cbe:05a4  mov ax,[bp+6]
0cbe:05a7  mov dx,0Ah
0cbe:05aa  imul dx
0cbe:05ac  add ax,0A366h
0cbe:05af  push ax
0cbe:05b0  push cs
0cbe:05b1  call 01D4h
0cbe:05b4  add sp,0Ah
0cbe:05b7  inc word ptr [bp-4]
0cbe:05ba  cmp si,[bp-2]
0cbe:05bd  je short 05C2h
0cbe:05bf  jmp 04FEh
0cbe:05c2  cmp word ptr [bp-4],0
0cbe:05c6  jne short 05CBh
0cbe:05c8  jmp 04FEh
0cbe:05cb  pop di
0cbe:05cc  pop si
0cbe:05cd  mov sp,bp
0cbe:05cf  pop bp
0cbe:05d0  ret far

; Candidate 0cbe:05d1, file offset 0x103b1
0cbe:05d1  push bp
0cbe:05d2  mov bp,sp
0cbe:05d4  sub sp,52h
0cbe:05d7  mov ax,[bp+6]
0cbe:05da  mov dx,0Eh
0cbe:05dd  imul dx
0cbe:05df  add ax,71CAh
0cbe:05e2  mov [bp-4],ds
0cbe:05e5  mov [bp-6],ax
0cbe:05e8  les bx,[bp-6]
0cbe:05eb  mov al,es:[bx]
0cbe:05ee  cbw
0cbe:05ef  mov dx,23h
0cbe:05f2  imul dx
0cbe:05f4  add ax,0
0cbe:05f7  mov word ptr [bp-8],27DAh
0cbe:05fc  mov [bp-0Ah],ax
0cbe:05ff  mov al,es:[bx+1]
0cbe:0603  cbw
0cbe:0604  mov dx,23h
0cbe:0607  imul dx
0cbe:0609  add ax,0
0cbe:060c  mov word ptr [bp-0Ch],27DAh
0cbe:0611  mov [bp-0Eh],ax
0cbe:0614  mov al,es:[bx+4]
0cbe:0618  cbw
0cbe:0619  mov cl,4
0cbe:061b  shl ax,cl
0cbe:061d  mov bx,ax
0cbe:061f  mov al,[bx-6B84h]
0cbe:0623  and al,7Fh
0cbe:0625  mov [bp-2],al
0cbe:0628  mov bx,[bp-6]
0cbe:062b  mov al,es:[bx+0Dh]
0cbe:062f  mov [bp-1],al
0cbe:0632  mov word ptr [bp-10h],0
0cbe:0637  mov word ptr [bp-12h],0
0cbe:063c  mov word ptr [bp-14h],0
0cbe:0641  mov word ptr [bp-16h],0
0cbe:0646  test byte ptr es:[bx+2],40h
0cbe:064b  jne short 0650h
0cbe:064d  jmp 080Eh
0cbe:0650  push word ptr [bp-0Ch]
0cbe:0653  push word ptr [bp-0Eh]
0cbe:0656  call far 7599h,0
0cbe:065b  add sp,4
0cbe:065e  or ax,ax
0cbe:0660  je short 0665h
0cbe:0662  jmp 080Eh
0cbe:0665  mov al,[bp-2]
0cbe:0668  cbw
0cbe:0669  and ax,7Fh
0cbe:066c  mov bx,ax
0cbe:066e  cmp bx,12h
0cbe:0671  jbe short 0676h
0cbe:0673  jmp 07A1h
0cbe:0676  shl bx,1
0cbe:0678  jmp word ptr cs:[bx+844h]
0cbe:067d  cmp byte ptr [bp-1],0
0cbe:0681  je short 06C9h
0cbe:0683  cmp byte ptr [bp-1],0
0cbe:0687  jge short 06A9h
0cbe:0689  push word ptr [bp-8]
0cbe:068c  push word ptr [bp-0Ah]
0cbe:068f  mov al,[bp-1]
0cbe:0692  cbw
0cbe:0693  push ax
0cbe:0694  push ds
0cbe:0695  mov ax,37BBh
0cbe:0698  push ax
0cbe:0699  push ss
0cbe:069a  lea ax,[bp-52h]
0cbe:069d  push ax
0cbe:069e  call far 64A1h,0
0cbe:06a3  add sp,0Eh
0cbe:06a6  jmp 07B4h
0cbe:06a9  push word ptr [bp-8]
0cbe:06ac  push word ptr [bp-0Ah]
0cbe:06af  mov al,[bp-1]
0cbe:06b2  cbw
0cbe:06b3  push ax
0cbe:06b4  push ds
0cbe:06b5  mov ax,37C8h
0cbe:06b8  push ax
0cbe:06b9  push ss
0cbe:06ba  lea ax,[bp-52h]
0cbe:06bd  push ax
0cbe:06be  call far 64A1h,0
0cbe:06c3  add sp,0Eh
0cbe:06c6  jmp 07B4h
0cbe:06c9  push word ptr [bp-8]
0cbe:06cc  push word ptr [bp-0Ah]
0cbe:06cf  push ss
0cbe:06d0  lea ax,[bp-52h]
0cbe:06d3  push ax
0cbe:06d4  call far 7570h,0
0cbe:06d9  add sp,8
0cbe:06dc  jmp 07B4h
0cbe:06df  mov [bp-10h],ds
0cbe:06e2  mov word ptr [bp-12h],37CFh
0cbe:06e7  mov al,[bp-1]
0cbe:06ea  cbw
0cbe:06eb  mov dx,19h
0cbe:06ee  imul dx
0cbe:06f0  mov dx,29A6h
0cbe:06f3  mov bx,ax
0cbe:06f5  mov es,dx
0cbe:06f7  mov ax,es:[bx+2]
0cbe:06fc  mov dx,es:[bx]
0cbe:0701  mov [bp-14h],ax
0cbe:0704  mov [bp-16h],dx
0cbe:0707  jmp 07B4h
0cbe:070a  mov [bp-10h],ds
0cbe:070d  mov word ptr [bp-12h],37DBh
0cbe:0712  mov al,[bp-1]
0cbe:0715  cbw
0cbe:0716  mov dx,19h
0cbe:0719  imul dx
0cbe:071b  mov dx,29A6h
0cbe:071e  mov bx,ax
0cbe:0720  mov es,dx
0cbe:0722  mov ax,es:[bx+2]
0cbe:0727  mov dx,es:[bx]
0cbe:072c  mov [bp-14h],ax
0cbe:072f  mov [bp-16h],dx
0cbe:0732  jmp 07B4h
0cbe:0735  mov [bp-10h],ds
0cbe:0738  mov word ptr [bp-12h],37E9h
0cbe:073d  mov al,[bp-1]
0cbe:0740  cbw
0cbe:0741  push ax
0cbe:0742  push ds
0cbe:0743  mov ax,3634h
0cbe:0746  push ax
0cbe:0747  call far 0869h,0E24h
0cbe:074c  add sp,6
0cbe:074f  mov [bp-14h],dx
0cbe:0752  mov [bp-16h],ax
0cbe:0755  jmp short 07B4h
0cbe:0757  mov [bp-10h],ds
0cbe:075a  mov word ptr [bp-12h],37EEh
0cbe:075f  mov al,[bp-1]
0cbe:0762  cbw
0cbe:0763  push ax
0cbe:0764  push ds
0cbe:0765  mov ax,3661h
0cbe:0768  push ax
0cbe:0769  call far 0869h,0E24h
0cbe:076e  add sp,6
0cbe:0771  mov [bp-14h],dx
0cbe:0774  mov [bp-16h],ax
0cbe:0777  jmp short 07B4h
0cbe:0779  cmp byte ptr [bp-1],5
0cbe:077d  je short 0787h
0cbe:077f  mov [bp-10h],ds
0cbe:0782  mov word ptr [bp-12h],37F5h
0cbe:0787  mov al,[bp-1]
0cbe:078a  cbw
0cbe:078b  push ax
0cbe:078c  push ds
0cbe:078d  mov ax,36B6h
0cbe:0790  push ax
0cbe:0791  call far 0869h,0E24h
0cbe:0796  add sp,6
0cbe:0799  mov [bp-14h],dx
0cbe:079c  mov [bp-16h],ax
0cbe:079f  jmp short 07B4h
0cbe:07a1  push word ptr [bp-8]
0cbe:07a4  push word ptr [bp-0Ah]
0cbe:07a7  push ss
0cbe:07a8  lea ax,[bp-52h]
0cbe:07ab  push ax
0cbe:07ac  call far 7570h,0
0cbe:07b1  add sp,8
0cbe:07b4  mov ax,[bp-12h]
0cbe:07b7  or ax,[bp-10h]
0cbe:07ba  jne short 07C4h
0cbe:07bc  mov ax,[bp-16h]
0cbe:07bf  or ax,[bp-14h]
0cbe:07c2  je short 0833h
0cbe:07c4  mov ax,[bp-12h]
0cbe:07c7  or ax,[bp-10h]
0cbe:07ca  jne short 07E6h
0cbe:07cc  push word ptr [bp-14h]
0cbe:07cf  push word ptr [bp-16h]
0cbe:07d2  push ds
0cbe:07d3  mov ax,37FAh
0cbe:07d6  push ax
0cbe:07d7  push ss
0cbe:07d8  lea ax,[bp-52h]
0cbe:07db  push ax
0cbe:07dc  call far 64A1h,0
0cbe:07e1  add sp,0Ch
0cbe:07e4  jmp short 0833h
0cbe:07e6  mov ax,[bp-16h]
0cbe:07e9  or ax,[bp-14h]
0cbe:07ec  je short 0833h
0cbe:07ee  push word ptr [bp-14h]
0cbe:07f1  push word ptr [bp-16h]
0cbe:07f4  push word ptr [bp-10h]
0cbe:07f7  push word ptr [bp-12h]
0cbe:07fa  push ds
0cbe:07fb  mov ax,37FDh
0cbe:07fe  push ax
0cbe:07ff  push ss
0cbe:0800  lea ax,[bp-52h]
0cbe:0803  push ax
0cbe:0804  call far 64A1h,0
0cbe:0809  add sp,10h
0cbe:080c  jmp short 0833h
0cbe:080e  les bx,[bp-6]
0cbe:0811  test byte ptr es:[bx+2],40h
0cbe:0816  je short 0820h
0cbe:0818  push word ptr [bp-0Ch]
0cbe:081b  push word ptr [bp-0Eh]
0cbe:081e  jmp short 0826h
0cbe:0820  push word ptr [bp-8]
0cbe:0823  push word ptr [bp-0Ah]
0cbe:0826  push ss
0cbe:0827  lea ax,[bp-52h]
0cbe:082a  push ax
0cbe:082b  call far 7570h,0
0cbe:0830  add sp,8
0cbe:0833  push ss
0cbe:0834  lea ax,[bp-52h]
0cbe:0837  push ax
0cbe:0838  call far 0284h,21B0h
0cbe:083d  add sp,4
0cbe:0840  mov sp,bp
0cbe:0842  pop bp
0cbe:0843  ret far

; Candidate 0cbe:086a, file offset 0x1064a
0cbe:086a  push bp
0cbe:086b  mov bp,sp
0cbe:086d  sub sp,4
0cbe:0870  push si
0cbe:0871  push di
0cbe:0872  mov di,[bp+0Ah]
0cbe:0875  mov [bp-2],ds
0cbe:0878  mov word ptr [bp-4],0CC5Ch
0cbe:087d  xor si,si
0cbe:087f  jmp short 088Fh
0cbe:0881  les bx,[bp-4]
0cbe:0884  cmp byte ptr es:[bx],0
0cbe:0888  je short 0894h
0cbe:088a  inc si
0cbe:088b  add word ptr [bp-4],12h
0cbe:088f  cmp si,0Ah
0cbe:0892  jl short 0881h
0cbe:0894  cmp si,0Ah
0cbe:0897  jne short 089Eh
0cbe:0899  xor ax,ax
0cbe:089b  jmp 0925h
0cbe:089e  mov ax,[bp+0Ch]
0cbe:08a1  or ax,4
0cbe:08a4  push ax
0cbe:08a5  push word ptr [bp+8]
0cbe:08a8  push di
0cbe:08a9  push ds
0cbe:08aa  mov ax,di
0cbe:08ac  mov dx,0Ah
0cbe:08af  imul dx
0cbe:08b1  add ax,0A366h
0cbe:08b4  push ax
0cbe:08b5  push cs
0cbe:08b6  call 01D4h
0cbe:08b9  add sp,0Ah
0cbe:08bc  les bx,[bp-4]
0cbe:08bf  mov byte ptr es:[bx],1
0cbe:08c3  mov word ptr es:[bx+2],1
0cbe:08c9  mov byte ptr es:[bx+0Ch],0
0cbe:08ce  mov al,[bp+0Eh]
0cbe:08d1  mov es:[bx+7],al
0cbe:08d5  mov byte ptr es:[bx+0Dh],0Ch
0cbe:08da  mov es:[bx+4],di
0cbe:08de  mov al,[bp+0Ch]
0cbe:08e1  mov es:[bx+6],al
0cbe:08e5  mov ax,[bp+8]
0cbe:08e8  mov es:[bx+8],ax
0cbe:08ec  mov al,[bp+10h]
0cbe:08ef  mov es:[bx+0Ah],al
0cbe:08f3  mov al,[bp+6]
0cbe:08f6  mov es:[bx+0Bh],al
0cbe:08fa  mov word ptr es:[bx+2],1
0cbe:0900  mov word ptr es:[bx+10h],0
0cbe:0906  mov word ptr es:[bx+0Eh],0
0cbe:090c  cmp word ptr [bp+10h],7
0cbe:0910  je short 0917h
0cbe:0912  mov ax,0Bh
0cbe:0915  jmp short 091Ah
0cbe:0917  mov ax,1Ah
0cbe:091a  push ax
0cbe:091b  call far 00AAh,1C9Fh
0cbe:0920  inc sp
0cbe:0921  inc sp
0cbe:0922  mov ax,1
0cbe:0925  pop di
0cbe:0926  pop si
0cbe:0927  mov sp,bp
0cbe:0929  pop bp
0cbe:092a  ret far

; Candidate 0cbe:092b, file offset 0x1070b
0cbe:092b  push bp
0cbe:092c  mov bp,sp
0cbe:092e  sub sp,8
0cbe:0931  push si
0cbe:0932  push di
0cbe:0933  mov ax,[bp+6]
0cbe:0936  mov dx,0Eh
0cbe:0939  imul dx
0cbe:093b  add ax,71CAh
0cbe:093e  mov [bp-6],ds
0cbe:0941  mov [bp-8],ax
0cbe:0944  les bx,[bp-8]
0cbe:0947  cmp word ptr es:[bx+6],0FFFFh
0cbe:094c  jne short 0952h
0cbe:094e  xor ax,ax
0cbe:0950  jmp short 09A0h
0cbe:0952  mov si,1
0cbe:0955  xor di,di
0cbe:0957  mov [bp-2],ds
0cbe:095a  mov word ptr [bp-4],71D8h
0cbe:095f  jmp short 0975h
0cbe:0961  les bx,[bp-4]
0cbe:0964  cmp word ptr es:[bx+6],0FFFFh
0cbe:0969  jne short 0970h
0cbe:096b  mov di,1
0cbe:096e  jmp short 097Bh
0cbe:0970  inc si
0cbe:0971  add word ptr [bp-4],0Eh
0cbe:0975  cmp si,258h
0cbe:0979  jl short 0961h
0cbe:097b  or di,di
0cbe:097d  jne short 0983h
0cbe:097f  xor ax,ax
0cbe:0981  jmp short 09A0h
0cbe:0983  xor ax,ax
0cbe:0985  mov dx,0Eh
0cbe:0988  push ax
0cbe:0989  push dx
0cbe:098a  push word ptr [bp-2]
0cbe:098d  push word ptr [bp-4]
0cbe:0990  push word ptr [bp-6]
0cbe:0993  push word ptr [bp-8]
0cbe:0996  call far 4,2374h
0cbe:099b  add sp,0Ch
0cbe:099e  mov ax,si
0cbe:09a0  pop di
0cbe:09a1  pop si
0cbe:09a2  mov sp,bp
0cbe:09a4  pop bp
0cbe:09a5  ret far

; Candidate 0cbe:09a6, file offset 0x10786
0cbe:09a6  push bp
0cbe:09a7  mov bp,sp
0cbe:09a9  sub sp,0Ah
0cbe:09ac  push si
0cbe:09ad  push di
0cbe:09ae  mov di,[bp+6]
0cbe:09b1  mov si,[bp+8]
0cbe:09b4  mov ax,[62A5h]
0cbe:09b7  mov [bp-0Ah],ax
0cbe:09ba  mov ax,[bp+0Ah]
0cbe:09bd  mov [62A5h],ax
0cbe:09c0  mov bx,di
0cbe:09c2  shl bx,1
0cbe:09c4  mov ax,[bx+2127h]
0cbe:09c8  mov [bp-2],ax
0cbe:09cb  mov al,[di+215Dh]
0cbe:09cf  mov ah,0
0cbe:09d1  mov [bp-4],ax
0cbe:09d4  mov al,[9317h]
0cbe:09d7  cbw
0cbe:09d8  mov dx,159h
0cbe:09db  imul dx
0cbe:09dd  mov dx,di
0cbe:09df  shl dx,1
0cbe:09e1  add ax,dx
0cbe:09e3  mov bx,ax
0cbe:09e5  mov ax,[bx-191Bh]
0cbe:09e9  mov [bp-6],ax
0cbe:09ec  or si,si
0cbe:09ee  jne short 09F3h
0cbe:09f0  jmp 0B17h
0cbe:09f3  mov al,[di+3702h]
0cbe:09f7  cbw
0cbe:09f8  mov si,ax
0cbe:09fa  cmp word ptr [628Ah],0
0cbe:09ff  jne short 0A1Ah
0cbe:0a01  cmp si,1
0cbe:0a04  je short 0A0Dh
0cbe:0a06  mov al,[0E606h]
0cbe:0a09  mov ah,0
0cbe:0a0b  jmp short 0A10h
0cbe:0a0d  mov ax,0FFFFh
0cbe:0a10  push ax
0cbe:0a11  mov ax,1
0cbe:0a14  push ax
0cbe:0a15  mov ax,3
0cbe:0a18  jmp short 0A35h
0cbe:0a1a  cmp si,1
0cbe:0a1d  je short 0A26h
0cbe:0a1f  mov al,[0E606h]
0cbe:0a22  mov ah,0
0cbe:0a24  jmp short 0A29h
0cbe:0a26  mov ax,0FFFFh
0cbe:0a29  push ax
0cbe:0a2a  mov al,[0E5C2h]
0cbe:0a2d  mov ah,0
0cbe:0a2f  push ax
0cbe:0a30  mov al,[0EEF0h]
0cbe:0a33  mov ah,0
0cbe:0a35  push ax
0cbe:0a36  mov al,[si+371Dh]
0cbe:0a3a  cbw
0cbe:0a3b  mov dx,[bp-4]
0cbe:0a3e  add dx,ax
0cbe:0a40  push dx
0cbe:0a41  mov al,[si+371Dh]
0cbe:0a45  cbw
0cbe:0a46  mov dx,[bp-2]
0cbe:0a49  add dx,ax
0cbe:0a4b  push dx
0cbe:0a4c  mov ax,[bp-4]
0cbe:0a4f  dec ax
0cbe:0a50  push ax
0cbe:0a51  mov ax,[bp-2]
0cbe:0a54  dec ax
0cbe:0a55  push ax
0cbe:0a56  call far 0A45h,08D7h
0cbe:0a5b  add sp,0Eh
0cbe:0a5e  cmp si,1
0cbe:0a61  jne short 0ADCh
0cbe:0a63  mov ax,0Ch
0cbe:0a66  push ax
0cbe:0a67  mov ax,45h
0cbe:0a6a  push ax
0cbe:0a6b  mov ax,0EEh
0cbe:0a6e  push ax
0cbe:0a6f  mov ax,41h
0cbe:0a72  push ax
0cbe:0a73  mov ax,0E3h
0cbe:0a76  push ax
0cbe:0a77  call far dword ptr [657Ah]
0cbe:0a7b  add sp,0Ah
0cbe:0a7e  mov ax,1
0cbe:0a81  push ax
0cbe:0a82  push ax
0cbe:0a83  mov ax,0FFFFh
0cbe:0a86  push ax
0cbe:0a87  push ax
0cbe:0a88  push ds
0cbe:0a89  mov al,[9317h]
0cbe:0a8c  cbw
0cbe:0a8d  mov dx,159h
0cbe:0a90  imul dx
0cbe:0a92  mov dx,di
0cbe:0a94  shl dx,1
0cbe:0a96  add ax,dx
0cbe:0a98  add ax,0E6E5h
0cbe:0a9b  push ax
0cbe:0a9c  push cs
0cbe:0a9d  call 0387h
0cbe:0aa0  add sp,0Ch
0cbe:0aa3  mov [bp-8],ax
0cbe:0aa6  cmp word ptr [bp-8],0Ah
0cbe:0aaa  jge short 0AB3h
0cbe:0aac  mov word ptr [bp-2],0E9h
0cbe:0ab1  jmp short 0AB8h
0cbe:0ab3  mov word ptr [bp-2],0E3h
0cbe:0ab8  xor ax,ax
0cbe:0aba  push ax
0cbe:0abb  mov ax,0Fh
0cbe:0abe  push ax
0cbe:0abf  mov ax,41h
0cbe:0ac2  push ax
0cbe:0ac3  push word ptr [bp-2]
0cbe:0ac6  push word ptr [bp-8]
0cbe:0ac9  call far 000Eh,2060h
0cbe:0ace  add sp,0Ah
0cbe:0ad1  mov bx,di
0cbe:0ad3  shl bx,1
0cbe:0ad5  mov ax,[bx+2127h]
0cbe:0ad9  mov [bp-2],ax
0cbe:0adc  cmp byte ptr [6655h],0
0cbe:0ae1  je short 0B17h
0cbe:0ae3  mov al,[0E5A4h]
0cbe:0ae6  cbw
0cbe:0ae7  cmp ax,di
0cbe:0ae9  jne short 0B17h
0cbe:0aeb  mov ax,0Fh
0cbe:0aee  push ax
0cbe:0aef  mov al,[si+371Dh]
0cbe:0af3  cbw
0cbe:0af4  mov dx,[bp-4]
0cbe:0af7  add dx,ax
0cbe:0af9  push dx
0cbe:0afa  mov al,[si+371Dh]
0cbe:0afe  cbw
0cbe:0aff  mov dx,[bp-2]
0cbe:0b02  add dx,ax
0cbe:0b04  push dx
0cbe:0b05  mov ax,[bp-4]
0cbe:0b08  dec ax
0cbe:0b09  push ax
0cbe:0b0a  mov ax,[bp-2]
0cbe:0b0d  dec ax
0cbe:0b0e  push ax
0cbe:0b0f  call far 0571h,08D7h
0cbe:0b14  add sp,0Ah
0cbe:0b17  cmp word ptr [bp-6],0
0cbe:0b1b  je short 0B4Fh
0cbe:0b1d  cmp byte ptr [di+3702h],1
0cbe:0b22  je short 0B4Fh
0cbe:0b24  cmp byte ptr [di+3702h],2
0cbe:0b29  je short 0B33h
0cbe:0b2b  push word ptr [bp-4]
0cbe:0b2e  push word ptr [bp-2]
0cbe:0b31  jmp short 0B41h
0cbe:0b33  mov ax,[bp-4]
0cbe:0b36  add ax,0FFFCh
0cbe:0b39  push ax
0cbe:0b3a  mov ax,[bp-2]
0cbe:0b3d  add ax,0FFFCh
0cbe:0b40  push ax
0cbe:0b41  push word ptr [bp-6]
0cbe:0b44  push word ptr [bp+0Ah]
0cbe:0b47  call far 07C8h,0E24h
0cbe:0b4c  add sp,8
0cbe:0b4f  mov ax,[bp-0Ah]
0cbe:0b52  mov [62A5h],ax
0cbe:0b55  pop di
0cbe:0b56  pop si
0cbe:0b57  mov sp,bp
0cbe:0b59  pop bp
0cbe:0b5a  ret far

; Candidate 0cbe:0b5b, file offset 0x1093b
0cbe:0b5b  push bp
0cbe:0b5c  mov bp,sp
0cbe:0b5e  cmp word ptr [bp+6],0
0cbe:0b62  je short 0B82h
0cbe:0b64  push word ptr [0D0AEh]
0cbe:0b68  push word ptr [0D0ACh]
0cbe:0b6c  mov ax,0A8h
0cbe:0b6f  push ax
0cbe:0b70  mov ax,12h
0cbe:0b73  push ax
0cbe:0b74  xor ax,ax
0cbe:0b76  push ax
0cbe:0b77  mov ax,16h
0cbe:0b7a  push ax
0cbe:0b7b  call far dword ptr [65D2h]
0cbe:0b7f  add sp,0Ch
0cbe:0b82  mov al,[9317h]
0cbe:0b85  cbw
0cbe:0b86  push ax
0cbe:0b87  call far 0AF9h,1901h
0cbe:0b8c  inc sp
0cbe:0b8d  inc sp
0cbe:0b8e  pop bp
0cbe:0b8f  ret far

; Candidate 0cbe:0b90, file offset 0x10970
0cbe:0b90  push bp
0cbe:0b91  mov bp,sp
0cbe:0b93  sub sp,4
0cbe:0b96  push si
0cbe:0b97  push di
0cbe:0b98  mov si,[bp+8]
0cbe:0b9b  mov di,[bp+0Ah]
0cbe:0b9e  cmp di,11h
0cbe:0ba1  jne short 0BE9h
0cbe:0ba3  cmp word ptr [bp+6],0
0cbe:0ba7  je short 0BE9h
0cbe:0ba9  push word ptr [bp+6]
0cbe:0bac  push si
0cbe:0bad  call far 13AFh,0CBEh
0cbe:0bb2  add sp,4
0cbe:0bb5  or ax,ax
0cbe:0bb7  jne short 0BE9h
0cbe:0bb9  push ds
0cbe:0bba  mov ax,si
0cbe:0bbc  mov dx,159h
0cbe:0bbf  imul dx
0cbe:0bc1  add ax,0E60Ah
0cbe:0bc4  push ax
0cbe:0bc5  push ds
0cbe:0bc6  mov ax,3806h
0cbe:0bc9  push ax
0cbe:0bca  push ds
0cbe:0bcb  mov ax,0F16Eh
0cbe:0bce  push ax
0cbe:0bcf  call far 64A1h,0
0cbe:0bd4  add sp,0Ch
0cbe:0bd7  push ds
0cbe:0bd8  mov ax,0F16Eh
0cbe:0bdb  push ax
0cbe:0bdc  call far 0284h,21B0h
0cbe:0be1  add sp,4
0cbe:0be4  xor ax,ax
0cbe:0be6  jmp 0CB1h
0cbe:0be9  cmp di,2
0cbe:0bec  jge short 0C67h
0cbe:0bee  mov ax,si
0cbe:0bf0  mov dx,159h
0cbe:0bf3  imul dx
0cbe:0bf5  mov dx,di
0cbe:0bf7  shl dx,1
0cbe:0bf9  add ax,dx
0cbe:0bfb  mov bx,ax
0cbe:0bfd  mov ax,[bx-191Bh]
0cbe:0c01  mov dx,0Eh
0cbe:0c04  imul dx
0cbe:0c06  mov bx,ax
0cbe:0c08  test byte ptr [bx+71CCh],20h
0cbe:0c0d  je short 0C67h
0cbe:0c0f  mov ax,si
0cbe:0c11  mov dx,159h
0cbe:0c14  imul dx
0cbe:0c16  mov dx,di
0cbe:0c18  shl dx,1
0cbe:0c1a  add ax,dx
0cbe:0c1c  mov bx,ax
0cbe:0c1e  mov ax,[bx-191Bh]
0cbe:0c22  mov dx,0Eh
0cbe:0c25  imul dx
0cbe:0c27  mov bx,ax
0cbe:0c29  mov al,[bx+71CEh]
0cbe:0c2d  cbw
0cbe:0c2e  mov cl,4
0cbe:0c30  shl ax,cl
0cbe:0c32  mov bx,ax
0cbe:0c34  mov ax,[bx-6B84h]
0cbe:0c38  and ax,7Fh
0cbe:0c3b  mov [bp-4],ax
0cbe:0c3e  cmp word ptr [bp-4],1
0cbe:0c42  jl short 0C63h
0cbe:0c44  cmp word ptr [bp-4],3
0cbe:0c48  jg short 0C63h
0cbe:0c4a  push ds
0cbe:0c4b  mov ax,si
0cbe:0c4d  mov dx,159h
0cbe:0c50  imul dx
0cbe:0c52  add ax,0E60Ah
0cbe:0c55  push ax
0cbe:0c56  push ds
0cbe:0c57  mov ax,3829h
0cbe:0c5a  push ax
0cbe:0c5b  call far 0284h,21B0h
0cbe:0c60  add sp,8
0cbe:0c63  xor ax,ax
0cbe:0c65  jmp short 0CB1h
0cbe:0c67  cmp word ptr [bp+6],0
0cbe:0c6b  je short 0C8Bh
0cbe:0c6d  mov ax,[bp+6]
0cbe:0c70  mov dx,0Eh
0cbe:0c73  imul dx
0cbe:0c75  mov bx,ax
0cbe:0c77  mov al,[bx+71CEh]
0cbe:0c7b  cbw
0cbe:0c7c  mov cl,4
0cbe:0c7e  shl ax,cl
0cbe:0c80  mov bx,ax
0cbe:0c82  mov ax,[bx-6B92h]
0cbe:0c86  mov [bp-2],ax
0cbe:0c89  jmp short 0C90h
0cbe:0c8b  mov word ptr [bp-2],0FFFFh
0cbe:0c90  mov bx,di
0cbe:0c92  shl bx,1
0cbe:0c94  mov ax,[bp-2]
0cbe:0c97  test [bx+2362h],ax
0cbe:0c9b  jne short 0CAEh
0cbe:0c9d  push ds
0cbe:0c9e  mov ax,3857h
0cbe:0ca1  push ax
0cbe:0ca2  call far 0284h,21B0h
0cbe:0ca7  add sp,4
0cbe:0caa  xor ax,ax
0cbe:0cac  jmp short 0CB1h
0cbe:0cae  mov ax,1
0cbe:0cb1  pop di
0cbe:0cb2  pop si
0cbe:0cb3  mov sp,bp
0cbe:0cb5  pop bp
0cbe:0cb6  ret far

; Candidate 0cbe:0cb7, file offset 0x10a97
0cbe:0cb7  push bp
0cbe:0cb8  mov bp,sp
0cbe:0cba  dec sp
0cbe:0cbb  dec sp
0cbe:0cbc  push si
0cbe:0cbd  push di
0cbe:0cbe  mov si,[bp+6]
0cbe:0cc1  mov al,[9317h]
0cbe:0cc4  cbw
0cbe:0cc5  mov dx,159h
0cbe:0cc8  imul dx
0cbe:0cca  mov dx,si
0cbe:0ccc  shl dx,1
0cbe:0cce  add ax,dx
0cbe:0cd0  mov bx,ax
0cbe:0cd2  mov ax,[bx-191Bh]
0cbe:0cd6  mov [bp-2],ax
0cbe:0cd9  call far 0352h,0E24h
0cbe:0cde  mov di,ax
0cbe:0ce0  push si
0cbe:0ce1  mov al,[9317h]
0cbe:0ce4  cbw
0cbe:0ce5  push ax
0cbe:0ce6  push di
0cbe:0ce7  push cs
0cbe:0ce8  call 0B90h
0cbe:0ceb  add sp,6
0cbe:0cee  or ax,ax
0cbe:0cf0  jne short 0CF5h
0cbe:0cf2  jmp 0DA1h
0cbe:0cf5  cmp si,10h
0cbe:0cf8  je short 0D34h
0cbe:0cfa  push word ptr [bp-2]
0cbe:0cfd  call far 0197h,08AEh
0cbe:0d02  inc sp
0cbe:0d03  inc sp
0cbe:0d04  mov al,[9317h]
0cbe:0d07  cbw
0cbe:0d08  mov dx,159h
0cbe:0d0b  imul dx
0cbe:0d0d  mov dx,si
0cbe:0d0f  shl dx,1
0cbe:0d11  add ax,dx
0cbe:0d13  mov bx,ax
0cbe:0d15  mov [bx-191Bh],di
0cbe:0d19  xor ax,ax
0cbe:0d1b  push ax
0cbe:0d1c  mov ax,1
0cbe:0d1f  push ax
0cbe:0d20  push si
0cbe:0d21  push cs
0cbe:0d22  call 09A6h
0cbe:0d25  add sp,6
0cbe:0d28  mov al,[9317h]
0cbe:0d2b  cbw
0cbe:0d2c  push ax
0cbe:0d2d  call far 0CF7h,0F55h
0cbe:0d32  jmp short 0D9Fh
0cbe:0d34  or di,di
0cbe:0d36  jne short 0D6Bh
0cbe:0d38  mov ax,0FFFFh
0cbe:0d3b  push ax
0cbe:0d3c  xor ax,ax
0cbe:0d3e  push ax
0cbe:0d3f  push ds
0cbe:0d40  mov al,[9317h]
0cbe:0d43  cbw
0cbe:0d44  mov dx,159h
0cbe:0d47  imul dx
0cbe:0d49  add ax,0E705h
0cbe:0d4c  push ax
0cbe:0d4d  push cs
0cbe:0d4e  call 02BFh
0cbe:0d51  add sp,8
0cbe:0d54  mov [bp-2],ax
0cbe:0d57  xor ax,ax
0cbe:0d59  push ax
0cbe:0d5a  mov ax,1
0cbe:0d5d  push ax
0cbe:0d5e  push si
0cbe:0d5f  push cs
0cbe:0d60  call 09A6h
0cbe:0d63  add sp,6
0cbe:0d66  push word ptr [bp-2]
0cbe:0d69  jmp short 0D9Ah
0cbe:0d6b  xor ax,ax
0cbe:0d6d  push ax
0cbe:0d6e  push di
0cbe:0d6f  mov ax,0FFFEh
0cbe:0d72  push ax
0cbe:0d73  push ds
0cbe:0d74  mov al,[9317h]
0cbe:0d77  cbw
0cbe:0d78  mov dx,159h
0cbe:0d7b  imul dx
0cbe:0d7d  add ax,0E705h
0cbe:0d80  push ax
0cbe:0d81  push cs
0cbe:0d82  call 01D4h
0cbe:0d85  add sp,0Ah
0cbe:0d88  xor ax,ax
0cbe:0d8a  push ax
0cbe:0d8b  mov ax,1
0cbe:0d8e  push ax
0cbe:0d8f  push si
0cbe:0d90  push cs
0cbe:0d91  call 09A6h
0cbe:0d94  add sp,6
0cbe:0d97  xor ax,ax
0cbe:0d99  push ax
0cbe:0d9a  call far 0197h,08AEh
0cbe:0d9f  inc sp
0cbe:0da0  inc sp
0cbe:0da1  pop di
0cbe:0da2  pop si
0cbe:0da3  mov sp,bp
0cbe:0da5  pop bp
0cbe:0da6  ret far

; Candidate 0cbe:0da7, file offset 0x10b87
0cbe:0da7  push bp
0cbe:0da8  mov bp,sp
0cbe:0daa  sub sp,8
0cbe:0dad  push si
0cbe:0dae  push di
0cbe:0daf  mov si,[bp+6]
0cbe:0db2  mov di,[bp+8]
0cbe:0db5  mov ax,si
0cbe:0db7  mov dx,159h
0cbe:0dba  imul dx
0cbe:0dbc  mov dx,di
0cbe:0dbe  shl dx,1
0cbe:0dc0  add ax,dx
0cbe:0dc2  mov bx,ax
0cbe:0dc4  mov ax,[bx-191Bh]
0cbe:0dc8  mov [bp-6],ax
0cbe:0dcb  mov dx,0Eh
0cbe:0dce  imul dx
0cbe:0dd0  mov bx,ax
0cbe:0dd2  test byte ptr [bx+71CCh],20h
0cbe:0dd7  jne short 0E49h
0cbe:0dd9  call far 0352h,0E24h
0cbe:0dde  mov [bp-2],ax
0cbe:0de1  mov dx,0Eh
0cbe:0de4  imul dx
0cbe:0de6  mov bx,ax
0cbe:0de8  mov al,[bx+71CEh]
0cbe:0dec  cbw
0cbe:0ded  mov [bp-4],ax
0cbe:0df0  cmp word ptr [bp-2],0
0cbe:0df4  je short 0E06h
0cbe:0df6  mov bx,[bp-4]
0cbe:0df9  mov cl,4
0cbe:0dfb  shl bx,cl
0cbe:0dfd  mov al,[bx-6B92h]
0cbe:0e01  mov [bp-7],al
0cbe:0e04  jmp short 0E0Ah
0cbe:0e06  mov byte ptr [bp-7],0FFh
0cbe:0e0a  mov bx,di
0cbe:0e0c  shl bx,1
0cbe:0e0e  mov al,[bp-7]
0cbe:0e11  mov ah,0
0cbe:0e13  test [bx+2362h],ax
0cbe:0e17  je short 0E41h
0cbe:0e19  push word ptr [bp-6]
0cbe:0e1c  call far 0197h,08AEh
0cbe:0e21  inc sp
0cbe:0e22  inc sp
0cbe:0e23  mov ax,si
0cbe:0e25  mov dx,159h
0cbe:0e28  imul dx
0cbe:0e2a  mov dx,di
0cbe:0e2c  shl dx,1
0cbe:0e2e  add ax,dx
0cbe:0e30  mov dx,[bp-2]
0cbe:0e33  mov bx,ax
0cbe:0e35  mov [bx-191Bh],dx
0cbe:0e39  push si
0cbe:0e3a  call far 0AF9h,1901h
0cbe:0e3f  inc sp
0cbe:0e40  inc sp
0cbe:0e41  push si
0cbe:0e42  call far 0CF7h,0F55h
0cbe:0e47  inc sp
0cbe:0e48  inc sp
0cbe:0e49  pop di
0cbe:0e4a  pop si
0cbe:0e4b  mov sp,bp
0cbe:0e4d  pop bp
0cbe:0e4e  ret far

; Candidate 0cbe:1140, file offset 0x10f20
0cbe:1140  push bp
0cbe:1141  mov bp,sp
0cbe:1143  sub sp,0Ch
0cbe:1146  push si
0cbe:1147  push di
0cbe:1148  mov si,[bp+6]
0cbe:114b  mov ax,si
0cbe:114d  mov dx,159h
0cbe:1150  imul dx
0cbe:1152  add ax,0E608h
0cbe:1155  mov [bp-0Ah],ds
0cbe:1158  mov [bp-0Ch],ax
0cbe:115b  mov ax,0Dh
0cbe:115e  push ax
0cbe:115f  push si
0cbe:1160  call far 06E9h,0E24h
0cbe:1165  add sp,4
0cbe:1168  or ax,ax
0cbe:116a  jne short 116Fh
0cbe:116c  jmp 137Fh
0cbe:116f  mov ax,[bp+8]
0cbe:1172  shl ax,1
0cbe:1174  les bx,[bp-0Ch]
0cbe:1177  add bx,ax
0cbe:1179  mov di,es:[bx+0DDh]
0cbe:117e  push word ptr [bp+8]
0cbe:1181  call far 13F8h,0CBEh
0cbe:1186  inc sp
0cbe:1187  inc sp
0cbe:1188  mov [bp-4],ax
0cbe:118b  cmp word ptr [bp-4],0FFFFh
0cbe:118f  je short 11C8h
0cbe:1191  push word ptr [bp-4]
0cbe:1194  push si
0cbe:1195  call far 08AEh,0E24h
0cbe:119a  add sp,4
0cbe:119d  or ax,ax
0cbe:119f  jne short 11A4h
0cbe:11a1  jmp 137Fh
0cbe:11a4  cmp byte ptr [0EE3Ah],0
0cbe:11a9  jne short 11C8h
0cbe:11ab  mov ax,si
0cbe:11ad  mov dx,159h
0cbe:11b0  imul dx
0cbe:11b2  mov bx,ax
0cbe:11b4  mov al,[bx-19D8h]
0cbe:11b8  cbw
0cbe:11b9  mov dx,1
0cbe:11bc  mov cl,[bp+8]
0cbe:11bf  shl dx,cl
0cbe:11c1  test dx,ax
0cbe:11c3  je short 11C8h
0cbe:11c5  jmp 137Fh
0cbe:11c8  push di
0cbe:11c9  push si
0cbe:11ca  call far 13AFh,0CBEh
0cbe:11cf  add sp,4
0cbe:11d2  or ax,ax
0cbe:11d4  jne short 11F7h
0cbe:11d6  mov ax,[bp-0Ch]
0cbe:11d9  inc ax
0cbe:11da  inc ax
0cbe:11db  push word ptr [bp-0Ah]
0cbe:11de  push ax
0cbe:11df  call far 0284h,21B0h
0cbe:11e4  add sp,4
0cbe:11e7  push ds
0cbe:11e8  mov ax,3951h
0cbe:11eb  push ax
0cbe:11ec  call far 0284h,21B0h
0cbe:11f1  add sp,4
0cbe:11f4  jmp 137Fh
0cbe:11f7  or di,di
0cbe:11f9  jne short 1204h
0cbe:11fb  cmp word ptr [bp-4],0FFFFh
0cbe:11ff  jne short 1204h
0cbe:1201  jmp 137Fh
0cbe:1204  mov ax,di
0cbe:1206  mov dx,0Eh
0cbe:1209  imul dx
0cbe:120b  mov bx,ax
0cbe:120d  mov al,[bx+71CEh]
0cbe:1211  cbw
0cbe:1212  mov [bp-2],ax
0cbe:1215  mov ax,di
0cbe:1217  mov dx,0Eh
0cbe:121a  imul dx
0cbe:121c  mov bx,ax
0cbe:121e  mov al,[bx+71D7h]
0cbe:1222  cbw
0cbe:1223  mov [bp-8],ax
0cbe:1226  mov bx,[bp-2]
0cbe:1229  mov cl,4
0cbe:122b  shl bx,cl
0cbe:122d  mov ax,[bx-6B84h]
0cbe:1231  and ax,7Fh
0cbe:1234  mov [bp-6],ax
0cbe:1237  mov bx,[bp-6]
0cbe:123a  cmp bx,14h
0cbe:123d  jbe short 1242h
0cbe:123f  jmp 134Dh
0cbe:1242  shl bx,1
0cbe:1244  jmp word ptr cs:[bx+1385h]
0cbe:1249  push ds
0cbe:124a  mov ax,396Ah
0cbe:124d  push ax
0cbe:124e  call far 0284h,21B0h
0cbe:1253  jmp 134Ah
0cbe:1256  cmp byte ptr [0EE3Ah],0
0cbe:125b  je short 1260h
0cbe:125d  jmp 134Dh
0cbe:1260  push di
0cbe:1261  push word ptr [bp+8]
0cbe:1264  push si
0cbe:1265  call far 0869h,0F55h
0cbe:126a  add sp,6
0cbe:126d  jmp 134Dh
0cbe:1270  cmp byte ptr [0EE3Ah],0
0cbe:1275  je short 127Ah
0cbe:1277  jmp 134Dh
0cbe:127a  cmp word ptr [bp-6],6
0cbe:127e  jne short 1285h
0cbe:1280  mov ax,1
0cbe:1283  jmp short 1287h
0cbe:1285  xor ax,ax
0cbe:1287  push ax
0cbe:1288  push si
0cbe:1289  call far 0EF6h,10E2h
0cbe:128e  add sp,4
0cbe:1291  jmp 134Dh
0cbe:1294  cmp byte ptr [6655h],0
0cbe:1299  jne short 129Eh
0cbe:129b  jmp 134Dh
0cbe:129e  push si
0cbe:129f  call far 07B1h,0BB3h
0cbe:12a4  inc sp
0cbe:12a5  inc sp
0cbe:12a6  jmp 134Dh
0cbe:12a9  push ds
0cbe:12aa  mov ax,3993h
0cbe:12ad  push ax
0cbe:12ae  call far 0284h,21B0h
0cbe:12b3  jmp 134Ah
0cbe:12b6  cmp byte ptr [0EE3Ah],0
0cbe:12bb  je short 12C0h
0cbe:12bd  jmp 134Dh
0cbe:12c0  push word ptr [bp-4]
0cbe:12c3  push word ptr [bp-8]
0cbe:12c6  push si
0cbe:12c7  call far 1C70h,10E2h
0cbe:12cc  add sp,6
0cbe:12cf  jmp short 134Dh
0cbe:12d1  cmp byte ptr [0EE3Ah],0
0cbe:12d6  jne short 134Dh
0cbe:12d8  push word ptr [bp-4]
0cbe:12db  push word ptr [bp-8]
0cbe:12de  push si
0cbe:12df  call far 1C70h,10E2h
0cbe:12e4  add sp,6
0cbe:12e7  jmp short 134Dh
0cbe:12e9  push word ptr [bp-8]
0cbe:12ec  call far 009Dh,2AF4h
0cbe:12f1  inc sp
0cbe:12f2  inc sp
0cbe:12f3  jmp short 134Dh
0cbe:12f5  push word ptr [bp+8]
0cbe:12f8  push si
0cbe:12f9  push cs
0cbe:12fa  call 0E4Fh
0cbe:12fd  jmp short 134Ah
0cbe:12ff  cmp byte ptr [0EE3Ah],0
0cbe:1304  jne short 134Dh
0cbe:1306  push word ptr [bp+8]
0cbe:1309  push si
0cbe:130a  push cs
0cbe:130b  call 1082h
0cbe:130e  add sp,4
0cbe:1311  jmp short 134Dh
0cbe:1313  push word ptr [bp+8]
0cbe:1316  push si
0cbe:1317  push cs
0cbe:1318  call 10ECh
0cbe:131b  jmp short 134Ah
0cbe:131d  cmp word ptr [bp-8],1
0cbe:1321  jne short 1332h
0cbe:1323  mov ax,0C8h
0cbe:1326  push ax
0cbe:1327  push si
0cbe:1328  call far 14ACh,0F55h
0cbe:132d  add sp,4
0cbe:1330  jmp short 1342h
0cbe:1332  push word ptr [bp+8]
0cbe:1335  mov ax,37h
0cbe:1338  push ax
0cbe:1339  push si
0cbe:133a  call far 1C70h,10E2h
0cbe:133f  add sp,6
0cbe:1342  push word ptr [bp+8]
0cbe:1345  push si
0cbe:1346  push cs
0cbe:1347  call 0101h
0cbe:134a  add sp,4
0cbe:134d  cmp word ptr [bp-6],1
0cbe:1351  jne short 1358h
0cbe:1353  cmp si,2
0cbe:1356  jge short 137Fh
0cbe:1358  mov [0CC32h],di
0cbe:135c  mov ax,100h
0cbe:135f  push ax
0cbe:1360  push word ptr [6DD4h]
0cbe:1364  push word ptr [6DD2h]
0cbe:1368  call far 012Fh,0E24h
0cbe:136d  add sp,4
0cbe:1370  push ax
0cbe:1371  call far 2BE9h,14ECh
0cbe:1376  add sp,4
0cbe:1379  mov word ptr [0CC32h],0
0cbe:137f  pop di
0cbe:1380  pop si
0cbe:1381  mov sp,bp
0cbe:1383  pop bp
0cbe:1384  ret far

; Candidate 0cbe:13af, file offset 0x1118f
0cbe:13af  push bp
0cbe:13b0  mov bp,sp
0cbe:13b2  push si
0cbe:13b3  push di
0cbe:13b4  mov si,[bp+8]
0cbe:13b7  or si,si
0cbe:13b9  je short 13EFh
0cbe:13bb  mov ax,si
0cbe:13bd  mov dx,0Eh
0cbe:13c0  imul dx
0cbe:13c2  mov bx,ax
0cbe:13c4  mov al,[bx+71CEh]
0cbe:13c8  cbw
0cbe:13c9  mov cl,4
0cbe:13cb  shl ax,cl
0cbe:13cd  mov bx,ax
0cbe:13cf  mov al,[bx-6B8Dh]
0cbe:13d3  push ax
0cbe:13d4  mov ax,[bp+6]
0cbe:13d7  mov dx,159h
0cbe:13da  imul dx
0cbe:13dc  mov bx,ax
0cbe:13de  mov al,[bx-19D6h]
0cbe:13e2  cbw
0cbe:13e3  mov bx,ax
0cbe:13e5  pop ax
0cbe:13e6  and al,[bx+1F9Ah]
0cbe:13ea  cbw
0cbe:13eb  mov di,ax
0cbe:13ed  jmp short 13F2h
0cbe:13ef  mov di,1
0cbe:13f2  mov ax,di
0cbe:13f4  pop di
0cbe:13f5  pop si
0cbe:13f6  pop bp
0cbe:13f7  ret far

; Candidate 0cbe:13f8, file offset 0x111d8
0cbe:13f8  push bp
0cbe:13f9  mov bp,sp
0cbe:13fb  push si
0cbe:13fc  mov si,[bp+6]
0cbe:13ff  cmp si,1
0cbe:1402  jle short 1409h
0cbe:1404  mov ax,0FFFFh
0cbe:1407  jmp short 140Bh
0cbe:1409  mov ax,si
0cbe:140b  pop si
0cbe:140c  pop bp
0cbe:140d  ret far

; Candidate 0dfe:002f, file offset 0x1120f
0dfe:002f  push bp
0dfe:0030  mov bp,sp
0dfe:0032  push si
0dfe:0033  cmp byte ptr [0E441h],0
0dfe:0038  je short 007Bh
0dfe:003a  push word ptr [50D2h]
0dfe:003e  push word ptr [50D0h]
0dfe:0042  push cs
0dfe:0043  call 000Eh
0dfe:0046  add sp,4
0dfe:0049  mov si,1
0dfe:004c  jmp short 0074h
0dfe:004e  mov bx,si
0dfe:0050  shl bx,1
0dfe:0052  shl bx,1
0dfe:0054  push word ptr [bx+50D2h]
0dfe:0058  push word ptr [bx+50D0h]
0dfe:005c  push word ptr [0EEE2h]
0dfe:0060  push word ptr [0EEE0h]
0dfe:0064  call far 9,1D3Dh
0dfe:0069  add sp,8
0dfe:006c  mov [0EEE2h],dx
0dfe:0070  mov [0EEE0h],ax
0dfe:0073  inc si
0dfe:0074  cmp si,36h
0dfe:0077  jl short 004Eh
0dfe:0079  jmp short 00BAh
0dfe:007b  push word ptr [503Ah]
0dfe:007f  push word ptr [5038h]
0dfe:0083  push cs
0dfe:0084  call 000Eh
0dfe:0087  add sp,4
0dfe:008a  mov si,1
0dfe:008d  jmp short 00B5h
0dfe:008f  mov bx,si
0dfe:0091  shl bx,1
0dfe:0093  shl bx,1
0dfe:0095  push word ptr [bx+503Ah]
0dfe:0099  push word ptr [bx+5038h]
0dfe:009d  push word ptr [0EEE2h]
0dfe:00a1  push word ptr [0EEE0h]
0dfe:00a5  call far 9,1D3Dh
0dfe:00aa  add sp,8
0dfe:00ad  mov [0EEE2h],dx
0dfe:00b1  mov [0EEE0h],ax
0dfe:00b4  inc si
0dfe:00b5  cmp si,26h
0dfe:00b8  jl short 008Fh
0dfe:00ba  pop si
0dfe:00bb  pop bp
0dfe:00bc  ret far

; Candidate 0dfe:00bd, file offset 0x1129d
0dfe:00bd  push bp
0dfe:00be  mov bp,sp
0dfe:00c0  push si
0dfe:00c1  cmp byte ptr [0E441h],0
0dfe:00c6  je short 0109h
0dfe:00c8  push word ptr [52B2h]
0dfe:00cc  push word ptr [52B0h]
0dfe:00d0  push cs
0dfe:00d1  call 000Eh
0dfe:00d4  add sp,4
0dfe:00d7  mov si,1
0dfe:00da  jmp short 0102h
0dfe:00dc  mov bx,si
0dfe:00de  shl bx,1
0dfe:00e0  shl bx,1
0dfe:00e2  push word ptr [bx+52B2h]
0dfe:00e6  push word ptr [bx+52B0h]
0dfe:00ea  push word ptr [0EEE2h]
0dfe:00ee  push word ptr [0EEE0h]
0dfe:00f2  call far 9,1D3Dh
0dfe:00f7  add sp,8
0dfe:00fa  mov [0EEE2h],dx
0dfe:00fe  mov [0EEE0h],ax
0dfe:0101  inc si
0dfe:0102  cmp si,3Ch
0dfe:0105  jl short 00DCh
0dfe:0107  jmp short 0148h
0dfe:0109  push word ptr [51AAh]
0dfe:010d  push word ptr [51A8h]
0dfe:0111  push cs
0dfe:0112  call 000Eh
0dfe:0115  add sp,4
0dfe:0118  mov si,1
0dfe:011b  jmp short 0143h
0dfe:011d  mov bx,si
0dfe:011f  shl bx,1
0dfe:0121  shl bx,1
0dfe:0123  push word ptr [bx+51AAh]
0dfe:0127  push word ptr [bx+51A8h]
0dfe:012b  push word ptr [0EEE2h]
0dfe:012f  push word ptr [0EEE0h]
0dfe:0133  call far 9,1D3Dh
0dfe:0138  add sp,8
0dfe:013b  mov [0EEE2h],dx
0dfe:013f  mov [0EEE0h],ax
0dfe:0142  inc si
0dfe:0143  cmp si,2Fh
0dfe:0146  jl short 011Dh
0dfe:0148  pop si
0dfe:0149  pop bp
0dfe:014a  ret far

; Candidate 0dfe:014b, file offset 0x1132b
0dfe:014b  push bp
0dfe:014c  mov bp,sp
0dfe:014e  push si
0dfe:014f  cmp byte ptr [0E441h],0
0dfe:0154  je short 0197h
0dfe:0156  push word ptr [53A2h]
0dfe:015a  push word ptr [53A0h]
0dfe:015e  push cs
0dfe:015f  call 000Eh
0dfe:0162  add sp,4
0dfe:0165  mov si,1
0dfe:0168  jmp short 0190h
0dfe:016a  mov bx,si
0dfe:016c  shl bx,1
0dfe:016e  shl bx,1
0dfe:0170  push word ptr [bx+53A2h]
0dfe:0174  push word ptr [bx+53A0h]
0dfe:0178  push word ptr [0EEE2h]
0dfe:017c  push word ptr [0EEE0h]
0dfe:0180  call far 9,1D3Dh
0dfe:0185  add sp,8
0dfe:0188  mov [0EEE2h],dx
0dfe:018c  mov [0EEE0h],ax
0dfe:018f  inc si
0dfe:0190  cmp si,21h
0dfe:0193  jl short 016Ah
0dfe:0195  jmp short 01D6h
0dfe:0197  push word ptr [5266h]
0dfe:019b  push word ptr [5264h]
0dfe:019f  push cs
0dfe:01a0  call 000Eh
0dfe:01a3  add sp,4
0dfe:01a6  mov si,1
0dfe:01a9  jmp short 01D1h
0dfe:01ab  mov bx,si
0dfe:01ad  shl bx,1
0dfe:01af  shl bx,1
0dfe:01b1  push word ptr [bx+5266h]
0dfe:01b5  push word ptr [bx+5264h]
0dfe:01b9  push word ptr [0EEE2h]
0dfe:01bd  push word ptr [0EEE0h]
0dfe:01c1  call far 9,1D3Dh
0dfe:01c6  add sp,8
0dfe:01c9  mov [0EEE2h],dx
0dfe:01cd  mov [0EEE0h],ax
0dfe:01d0  inc si
0dfe:01d1  cmp si,13h
0dfe:01d4  jl short 01ABh
0dfe:01d6  pop si
0dfe:01d7  pop bp
0dfe:01d8  ret far

; Candidate 0dfe:01d9, file offset 0x113b9
0dfe:01d9  push bp
0dfe:01da  mov bp,sp
0dfe:01dc  push si
0dfe:01dd  push word ptr [5426h]
0dfe:01e1  push word ptr [5424h]
0dfe:01e5  push cs
0dfe:01e6  call 000Eh
0dfe:01e9  add sp,4
0dfe:01ec  mov si,1
0dfe:01ef  jmp short 0217h
0dfe:01f1  mov bx,si
0dfe:01f3  shl bx,1
0dfe:01f5  shl bx,1
0dfe:01f7  push word ptr [bx+5426h]
0dfe:01fb  push word ptr [bx+5424h]
0dfe:01ff  push word ptr [0EEE2h]
0dfe:0203  push word ptr [0EEE0h]
0dfe:0207  call far 9,1D3Dh
0dfe:020c  add sp,8
0dfe:020f  mov [0EEE2h],dx
0dfe:0213  mov [0EEE0h],ax
0dfe:0216  inc si
0dfe:0217  cmp si,7
0dfe:021a  jl short 01F1h
0dfe:021c  pop si
0dfe:021d  pop bp
0dfe:021e  ret far

; Candidate 0dfe:021f, file offset 0x113ff
0dfe:021f  push bp
0dfe:0220  mov bp,sp
0dfe:0222  push si
0dfe:0223  push word ptr [5442h]
0dfe:0227  push word ptr [5440h]
0dfe:022b  push cs
0dfe:022c  call 000Eh
0dfe:022f  add sp,4
0dfe:0232  mov si,1
0dfe:0235  jmp short 025Dh
0dfe:0237  mov bx,si
0dfe:0239  shl bx,1
0dfe:023b  shl bx,1
0dfe:023d  push word ptr [bx+5442h]
0dfe:0241  push word ptr [bx+5440h]
0dfe:0245  push word ptr [0EEE2h]
0dfe:0249  push word ptr [0EEE0h]
0dfe:024d  call far 9,1D3Dh
0dfe:0252  add sp,8
0dfe:0255  mov [0EEE2h],dx
0dfe:0259  mov [0EEE0h],ax
0dfe:025c  inc si
0dfe:025d  cmp si,7
0dfe:0260  jl short 0237h
0dfe:0262  pop si
0dfe:0263  pop bp
0dfe:0264  ret far

; Candidate 0e24:0005, file offset 0x11445
0e24:0005  push bp
0e24:0006  mov bp,sp
0e24:0008  sub sp,4
0e24:000b  push si
0e24:000c  push di
0e24:000d  mov di,[bp+6]
0e24:0010  mov [bp-2],ds
0e24:0013  mov word ptr [bp-4],9446h
0e24:0018  xor si,si
0e24:001a  jmp short 0033h
0e24:001c  les bx,[bp-4]
0e24:001f  cmp es:[bx],di
0e24:0022  jne short 002Eh
0e24:0024  mov byte ptr [0D0AAh],1
0e24:0029  mov ax,1
0e24:002c  jmp short 003Ah
0e24:002e  inc si
0e24:002f  add word ptr [bp-4],2
0e24:0033  cmp si,0Fh
0e24:0036  jl short 001Ch
0e24:0038  xor ax,ax
0e24:003a  pop di
0e24:003b  pop si
0e24:003c  mov sp,bp
0e24:003e  pop bp
0e24:003f  ret far

; Candidate 0e24:0040, file offset 0x11480
0e24:0040  push bp
0e24:0041  mov bp,sp
0e24:0043  dec sp
0e24:0044  dec sp
0e24:0045  mov al,[9317h]
0e24:0048  cbw
0e24:0049  cmp ax,[bp+6]
0e24:004c  je short 0071h
0e24:004e  mov al,[9317h]
0e24:0051  cbw
0e24:0052  mov [bp-2],ax
0e24:0055  mov al,[bp+6]
0e24:0058  mov [9317h],al
0e24:005b  push word ptr [bp-2]
0e24:005e  call far 0AF9h,1901h
0e24:0063  inc sp
0e24:0064  inc sp
0e24:0065  mov al,[9317h]
0e24:0068  cbw
0e24:0069  push ax
0e24:006a  call far 0AF9h,1901h
0e24:006f  inc sp
0e24:0070  inc sp
0e24:0071  mov sp,bp
0e24:0073  pop bp
0e24:0074  ret far

; Candidate 0e24:0075, file offset 0x114b5
0e24:0075  push bp
0e24:0076  mov bp,sp
0e24:0078  push si
0e24:0079  push di
0e24:007a  mov si,[bp+6]
0e24:007d  mov di,[bp+8]
0e24:0080  inc si
0e24:0081  inc di
0e24:0082  pop di
0e24:0083  pop si
0e24:0084  pop bp
0e24:0085  ret far

; Candidate 0e24:0086, file offset 0x114c6
0e24:0086  push bp
0e24:0087  mov bp,sp
0e24:0089  push si
0e24:008a  mov si,[bp+6]
0e24:008d  inc si
0e24:008e  pop si
0e24:008f  pop bp
0e24:0090  ret far

; Candidate 0e24:0091, file offset 0x114d1
0e24:0091  push bp
0e24:0092  mov bp,sp
0e24:0094  sub sp,4
0e24:0097  push si
0e24:0098  push di
0e24:0099  mov al,[bp+8]
0e24:009c  cbw
0e24:009d  push ax
0e24:009e  push word ptr [bp+6]
0e24:00a1  call far 012Fh,0E24h
0e24:00a6  add sp,4
0e24:00a9  mov di,ax
0e24:00ab  mov dx,0Ah
0e24:00ae  imul dx
0e24:00b0  push ax
0e24:00b1  mov al,[bp+8]
0e24:00b4  cbw
0e24:00b5  xor ax,2
0e24:00b8  pop bx
0e24:00b9  add bx,ax
0e24:00bb  mov al,[bx-5CA0h]
0e24:00bf  cbw
0e24:00c0  mov [bp-4],ax
0e24:00c3  mov bx,[bp-4]
0e24:00c6  mov al,[bx+2268h]
0e24:00ca  cbw
0e24:00cb  mov [bp-2],ax
0e24:00ce  cmp word ptr [bp-4],4Ah
0e24:00d2  jne short 0105h
0e24:00d4  mov ax,[bp+6]
0e24:00d7  cmp ax,[6DD2h]
0e24:00db  jne short 0105h
0e24:00dd  xor si,si
0e24:00df  jmp short 0100h
0e24:00e1  mov ax,si
0e24:00e3  mov dx,6
0e24:00e6  imul dx
0e24:00e8  mov bx,ax
0e24:00ea  cmp [bx-6CBAh],di
0e24:00ee  jne short 00FFh
0e24:00f0  push si
0e24:00f1  call far 098Ch,13A7h
0e24:00f6  inc sp
0e24:00f7  inc sp
0e24:00f8  mov al,[2268h]
0e24:00fb  cbw
0e24:00fc  mov [bp-2],ax
0e24:00ff  inc si
0e24:0100  cmp si,5
0e24:0103  jl short 00E1h
0e24:0105  test word ptr [bp-2],1
0e24:010a  jne short 0111h
0e24:010c  mov ax,0FFFFh
0e24:010f  jmp short 0129h
0e24:0111  mov ax,di
0e24:0113  mov dx,0Ah
0e24:0116  imul dx
0e24:0118  mov bx,ax
0e24:011a  test word ptr [bx-5C9Ch],7
0e24:0120  je short 0127h
0e24:0122  mov ax,0FFFFh
0e24:0125  jmp short 0129h
0e24:0127  mov ax,di
0e24:0129  pop di
0e24:012a  pop si
0e24:012b  mov sp,bp
0e24:012d  pop bp
0e24:012e  ret far

; Candidate 0e24:012f, file offset 0x1156f
0e24:012f  push bp
0e24:0130  mov bp,sp
0e24:0132  push si
0e24:0133  mov si,[bp+8]
0e24:0136  mov al,[si+20E9h]
0e24:013a  cbw
0e24:013b  push ax
0e24:013c  mov ax,[bp+6]
0e24:013f  pop dx
0e24:0140  add ax,dx
0e24:0142  and ax,3FFh
0e24:0145  pop si
0e24:0146  pop bp
0e24:0147  ret far

; Candidate 0e24:01be, file offset 0x115fe
0e24:01be  push bp
0e24:01bf  mov bp,sp
0e24:01c1  push si
0e24:01c2  push di
0e24:01c3  mov cx,[bp+0Ah]
0e24:01c6  mov si,19h
0e24:01c9  jmp short 0207h
0e24:01cb  mov ax,si
0e24:01cd  shl ax,1
0e24:01cf  les bx,[bp+6]
0e24:01d2  add bx,ax
0e24:01d4  mov ax,es:[bx+0DDh]
0e24:01d9  mov di,ax
0e24:01db  or ax,ax
0e24:01dd  je short 0206h
0e24:01df  mov ax,di
0e24:01e1  mov dx,0Eh
0e24:01e4  imul dx
0e24:01e6  mov bx,ax
0e24:01e8  cmp byte ptr [bx+71CEh],2Fh
0e24:01ed  jne short 0206h
0e24:01ef  mov ax,di
0e24:01f1  mov dx,0Eh
0e24:01f4  imul dx
0e24:01f6  mov bx,ax
0e24:01f8  mov al,[bx+71D7h]
0e24:01fc  cbw
0e24:01fd  cmp ax,cx
0e24:01ff  jne short 0206h
0e24:0201  mov ax,1
0e24:0204  jmp short 020Eh
0e24:0206  inc si
0e24:0207  cmp si,1Ah
0e24:020a  jle short 01CBh
0e24:020c  xor ax,ax
0e24:020e  pop di
0e24:020f  pop si
0e24:0210  pop bp
0e24:0211  ret far

; Candidate 0e24:0212, file offset 0x11652
0e24:0212  push bp
0e24:0213  mov bp,sp
0e24:0215  sub sp,4
0e24:0218  push si
0e24:0219  push di
0e24:021a  xor ax,ax
0e24:021c  mov [bp-4],ax
0e24:021f  mov di,ax
0e24:0221  jmp 02E5h
0e24:0224  mov ax,1
0e24:0227  push ax
0e24:0228  push word ptr [bp-4]
0e24:022b  call far 06E9h,0E24h
0e24:0230  add sp,4
0e24:0233  or ax,ax
0e24:0235  je short 023Ah
0e24:0237  jmp 02C7h
0e24:023a  jmp 02E2h
0e24:023d  mov ax,[bp-4]
0e24:0240  mov dx,159h
0e24:0243  imul dx
0e24:0245  mov dx,[bp-2]
0e24:0248  shl dx,1
0e24:024a  add ax,dx
0e24:024c  mov bx,ax
0e24:024e  mov si,[bx-191Bh]
0e24:0252  mov ax,si
0e24:0254  mov dx,0Eh
0e24:0257  imul dx
0e24:0259  mov bx,ax
0e24:025b  mov word ptr [bx+71D0h],0FFFFh
0e24:0261  mov ax,[bp-4]
0e24:0264  mov dx,159h
0e24:0267  imul dx
0e24:0269  mov dx,[bp-2]
0e24:026c  shl dx,1
0e24:026e  add ax,dx
0e24:0270  mov bx,ax
0e24:0272  mov word ptr [bx-191Bh],0
0e24:0278  mov di,1
0e24:027b  cmp word ptr [0EE38h],0
0e24:0280  jne short 02C7h
0e24:0282  cmp byte ptr [0EE3Ah],0
0e24:0287  jne short 02A5h
0e24:0289  cmp word ptr [bp-2],2
0e24:028d  jge short 02A5h
0e24:028f  cmp word ptr [bp-4],5
0e24:0293  jge short 02A5h
0e24:0295  mov al,[bp-2]
0e24:0298  push ax
0e24:0299  mov al,[bp-4]
0e24:029c  push ax
0e24:029d  call far 091Fh,1901h
0e24:02a2  add sp,4
0e24:02a5  cmp byte ptr [0EE3Ah],1
0e24:02aa  jne short 02C7h
0e24:02ac  mov al,[9317h]
0e24:02af  cbw
0e24:02b0  cmp ax,[bp-4]
0e24:02b3  jne short 02C7h
0e24:02b5  mov ax,1
0e24:02b8  push ax
0e24:02b9  push word ptr [bp-2]
0e24:02bc  push word ptr [bp-4]
0e24:02bf  call far 09A6h,0CBEh
0e24:02c4  add sp,6
0e24:02c7  push word ptr [bp+8]
0e24:02ca  push word ptr [bp+6]
0e24:02cd  push word ptr [bp-4]
0e24:02d0  push cs
0e24:02d1  call 0148h
0e24:02d4  add sp,6
0e24:02d7  mov [bp-2],ax
0e24:02da  cmp ax,0FFFFh
0e24:02dd  je short 02E2h
0e24:02df  jmp 023Dh
0e24:02e2  inc word ptr [bp-4]
0e24:02e5  cmp word ptr [bp-4],6
0e24:02e9  jge short 02EEh
0e24:02eb  jmp 0224h
0e24:02ee  mov al,[6655h]
0e24:02f1  mov ah,0
0e24:02f3  or ax,ax
0e24:02f5  jne short 034Ah
0e24:02f7  call far 0352h,0E24h
0e24:02fc  mov si,ax
0e24:02fe  cmp word ptr [bp+6],0FFFFh
0e24:0302  je short 0315h
0e24:0304  mov dx,0Eh
0e24:0307  imul dx
0e24:0309  mov bx,ax
0e24:030b  mov al,[bx+71CEh]
0e24:030f  cbw
0e24:0310  cmp ax,[bp+6]
0e24:0313  jne short 034Ah
0e24:0315  cmp word ptr [bp+8],0FFFFh
0e24:0319  je short 032Eh
0e24:031b  mov ax,si
0e24:031d  mov dx,0Eh
0e24:0320  imul dx
0e24:0322  mov bx,ax
0e24:0324  mov al,[bx+71D7h]
0e24:0328  cbw
0e24:0329  cmp ax,[bp+8]
0e24:032c  jne short 034Ah
0e24:032e  xor ax,ax
0e24:0330  push ax
0e24:0331  call far 0197h,08AEh
0e24:0336  inc sp
0e24:0337  inc sp
0e24:0338  mov ax,si
0e24:033a  mov dx,0Eh
0e24:033d  imul dx
0e24:033f  mov bx,ax
0e24:0341  mov word ptr [bx+71D0h],0FFFFh
0e24:0347  mov di,1
0e24:034a  mov ax,di
0e24:034c  pop di
0e24:034d  pop si
0e24:034e  mov sp,bp
0e24:0350  pop bp
0e24:0351  ret far

; Candidate 0e24:0352, file offset 0x11792
0e24:0352  push bp
0e24:0353  mov bp,sp
0e24:0355  mov al,[6655h]
0e24:0358  mov ah,0
0e24:035a  or ax,ax
0e24:035c  jne short 0363h
0e24:035e  mov ax,[6DD6h]
0e24:0361  jmp short 037Ah
0e24:0363  mov al,[9317h]
0e24:0366  cbw
0e24:0367  mov dx,159h
0e24:036a  imul dx
0e24:036c  push ax
0e24:036d  mov al,[0E5A4h]
0e24:0370  cbw
0e24:0371  shl ax,1
0e24:0373  pop bx
0e24:0374  add bx,ax
0e24:0376  mov ax,[bx-191Bh]
0e24:037a  pop bp
0e24:037b  ret far

; Candidate 0e24:037c, file offset 0x117bc
0e24:037c  push bp
0e24:037d  mov bp,sp
0e24:037f  push si
0e24:0380  mov si,[bp+6]
0e24:0383  mov al,[6655h]
0e24:0386  mov ah,0
0e24:0388  or ax,ax
0e24:038a  jne short 0393h
0e24:038c  mov [6DD6h],si
0e24:0390  jmp 0439h
0e24:0393  mov al,[0E5A4h]
0e24:0396  cbw
0e24:0397  push ax
0e24:0398  mov al,[9317h]
0e24:039b  cbw
0e24:039c  push ax
0e24:039d  push si
0e24:039e  call far 0B90h,0CBEh
0e24:03a3  add sp,6
0e24:03a6  or ax,ax
0e24:03a8  je short 03ECh
0e24:03aa  mov al,[9317h]
0e24:03ad  cbw
0e24:03ae  mov dx,159h
0e24:03b1  imul dx
0e24:03b3  push ax
0e24:03b4  mov al,[0E5A4h]
0e24:03b7  cbw
0e24:03b8  shl ax,1
0e24:03ba  pop bx
0e24:03bb  add bx,ax
0e24:03bd  mov [bx-191Bh],si
0e24:03c1  cmp byte ptr [0EE3Ah],0
0e24:03c6  jne short 03D6h
0e24:03c8  mov al,[9317h]
0e24:03cb  cbw
0e24:03cc  push ax
0e24:03cd  call far 0AF9h,1901h
0e24:03d2  inc sp
0e24:03d3  inc sp
0e24:03d4  jmp short 0439h
0e24:03d6  xor ax,ax
0e24:03d8  push ax
0e24:03d9  mov ax,1
0e24:03dc  push ax
0e24:03dd  mov al,[0E5A4h]
0e24:03e0  cbw
0e24:03e1  push ax
0e24:03e2  call far 09A6h,0CBEh
0e24:03e7  add sp,6
0e24:03ea  jmp short 0439h
0e24:03ec  push ds
0e24:03ed  mov ax,5508h
0e24:03f0  push ax
0e24:03f1  call far 0284h,21B0h
0e24:03f6  add sp,4
0e24:03f9  mov al,0FFh
0e24:03fb  push ax
0e24:03fc  mov al,2
0e24:03fe  push ax
0e24:03ff  mov al,1
0e24:0401  push ax
0e24:0402  call far 0505h,08D7h
0e24:0407  add sp,6
0e24:040a  mov bx,[6DD4h]
0e24:040e  shl bx,1
0e24:0410  shl bx,1
0e24:0412  add bx,ax
0e24:0414  mov al,[bx+2342h]
0e24:0418  cbw
0e24:0419  push ax
0e24:041a  push si
0e24:041b  push word ptr [6DD2h]
0e24:041f  push ds
0e24:0420  mov ax,[6DD2h]
0e24:0423  mov dx,0Ah
0e24:0426  imul dx
0e24:0428  add ax,0A366h
0e24:042b  push ax
0e24:042c  call far 01D4h,0CBEh
0e24:0431  add sp,0Ah
0e24:0434  mov byte ptr [0D0AAh],1
0e24:0439  pop si
0e24:043a  pop bp
0e24:043b  ret far

; Candidate 0e24:0686, file offset 0x11ac6
0e24:0686  push bp
0e24:0687  mov bp,sp
0e24:0689  push si
0e24:068a  xor si,si
0e24:068c  jmp short 0697h
0e24:068e  push si
0e24:068f  call far 0AF9h,1901h
0e24:0694  inc sp
0e24:0695  inc sp
0e24:0696  inc si
0e24:0697  cmp si,6
0e24:069a  jl short 068Eh
0e24:069c  pop si
0e24:069d  pop bp
0e24:069e  ret far

; Candidate 0e24:069f, file offset 0x11adf
0e24:069f  push bp
0e24:06a0  mov bp,sp
0e24:06a2  sub sp,4
0e24:06a5  mov ax,[bp+6]
0e24:06a8  mov dx,159h
0e24:06ab  imul dx
0e24:06ad  add ax,0E608h
0e24:06b0  mov [bp-2],ds
0e24:06b3  mov [bp-4],ax
0e24:06b6  les bx,[bp-4]
0e24:06b9  mov al,es:[bx+21h]
0e24:06bd  cbw
0e24:06be  sar ax,1
0e24:06c0  push ax
0e24:06c1  push word ptr [bp+8]
0e24:06c4  mov al,es:[bx+26h]
0e24:06c8  cbw
0e24:06c9  push ax
0e24:06ca  mov al,es:[bx+22h]
0e24:06ce  cbw
0e24:06cf  mov bx,ax
0e24:06d1  mov al,[bx+1ED7h]
0e24:06d5  cbw
0e24:06d6  push ax
0e24:06d7  push word ptr [bp-2]
0e24:06da  push word ptr [bp-4]
0e24:06dd  call far 0F8Ah,0F55h
0e24:06e2  add sp,0Ch
0e24:06e5  mov sp,bp
0e24:06e7  pop bp
0e24:06e8  ret far

; Candidate 0e24:06e9, file offset 0x11b29
0e24:06e9  push bp
0e24:06ea  mov bp,sp
0e24:06ec  sub sp,4
0e24:06ef  push si
0e24:06f0  push di
0e24:06f1  mov di,[bp+8]
0e24:06f4  mov si,1
0e24:06f7  mov ax,[bp+6]
0e24:06fa  mov dx,159h
0e24:06fd  imul dx
0e24:06ff  add ax,0E608h
0e24:0702  mov [bp-2],ds
0e24:0705  mov [bp-4],ax
0e24:0708  test di,1
0e24:070c  je short 071Ch
0e24:070e  les bx,[bp-4]
0e24:0711  mov al,es:[bx+1]
0e24:0715  mov ah,0
0e24:0717  and ax,1
0e24:071a  and si,ax
0e24:071c  test di,2
0e24:0720  je short 073Ch
0e24:0722  les bx,[bp-4]
0e24:0725  cmp word ptr es:[bx+1Bh],0FFF6h
0e24:072a  jle short 0738h
0e24:072c  test byte ptr es:[bx+1],8
0e24:0731  jne short 0738h
0e24:0733  mov ax,1
0e24:0736  jmp short 073Ah
0e24:0738  xor ax,ax
0e24:073a  and si,ax
0e24:073c  test di,4
0e24:0740  je short 075Ch
0e24:0742  les bx,[bp-4]
0e24:0745  cmp word ptr es:[bx+1Bh],0
0e24:074a  jle short 0758h
0e24:074c  test byte ptr es:[bx+1],8
0e24:0751  jne short 0758h
0e24:0753  mov ax,1
0e24:0756  jmp short 075Ah
0e24:0758  xor ax,ax
0e24:075a  and si,ax
0e24:075c  test di,8
0e24:0760  je short 0775h
0e24:0762  les bx,[bp-4]
0e24:0765  test byte ptr es:[bx+1],0Ch
0e24:076a  jne short 0771h
0e24:076c  mov ax,1
0e24:076f  jmp short 0773h
0e24:0771  xor ax,ax
0e24:0773  and si,ax
0e24:0775  test di,20h
0e24:0779  je short 078Eh
0e24:077b  les bx,[bp-4]
0e24:077e  test byte ptr es:[bx+1],4
0e24:0783  jne short 078Ah
0e24:0785  mov ax,1
0e24:0788  jmp short 078Ch
0e24:078a  xor ax,ax
0e24:078c  and si,ax
0e24:078e  test di,10h
0e24:0792  je short 07A7h
0e24:0794  les bx,[bp-4]
0e24:0797  test byte ptr es:[bx+1],2
0e24:079c  jne short 07A3h
0e24:079e  mov ax,1
0e24:07a1  jmp short 07A5h
0e24:07a3  xor ax,ax
0e24:07a5  and si,ax
0e24:07a7  test di,40h
0e24:07ab  je short 07C0h
0e24:07ad  les bx,[bp-4]
0e24:07b0  cmp byte ptr es:[bx+25h],0
0e24:07b5  jbe short 07BCh
0e24:07b7  mov ax,1
0e24:07ba  jmp short 07BEh
0e24:07bc  xor ax,ax
0e24:07be  and si,ax
0e24:07c0  mov ax,si
0e24:07c2  pop di
0e24:07c3  pop si
0e24:07c4  mov sp,bp
0e24:07c6  pop bp
0e24:07c7  ret far

; Candidate 0e24:07c8, file offset 0x11c08
0e24:07c8  push bp
0e24:07c9  mov bp,sp
0e24:07cb  dec sp
0e24:07cc  dec sp
0e24:07cd  push si
0e24:07ce  push di
0e24:07cf  mov si,[bp+8]
0e24:07d2  mov ax,si
0e24:07d4  mov dx,0Eh
0e24:07d7  imul dx
0e24:07d9  mov bx,ax
0e24:07db  mov al,[bx+71CDh]
0e24:07df  cbw
0e24:07e0  mov [bp-2],ax
0e24:07e3  mov ax,[6DDCh]
0e24:07e6  and ax,2
0e24:07e9  or ax,0
0e24:07ec  je short 0803h
0e24:07ee  mov ax,si
0e24:07f0  mov dx,0Eh
0e24:07f3  imul dx
0e24:07f5  mov bx,ax
0e24:07f7  test byte ptr [bx+71CCh],80h
0e24:07fc  je short 0803h
0e24:07fe  mov ax,1
0e24:0801  jmp short 0805h
0e24:0803  xor ax,ax
0e24:0805  mov di,ax
0e24:0807  or di,di
0e24:0809  je short 0824h
0e24:080b  push word ptr [0CC28h]
0e24:080f  push word ptr [0CC26h]
0e24:0813  call far dword ptr [65DEh]
0e24:0817  add sp,4
0e24:081a  mov ax,1
0e24:081d  push ax
0e24:081e  call far dword ptr [6576h]
0e24:0822  inc sp
0e24:0823  inc sp
0e24:0824  xor ax,ax
0e24:0826  push ax
0e24:0827  push word ptr [bp+0Ch]
0e24:082a  push word ptr [bp+0Ah]
0e24:082d  mov bx,[bp-2]
0e24:0830  shl bx,1
0e24:0832  shl bx,1
0e24:0834  push word ptr [bx-3118h]
0e24:0838  push word ptr [bx-311Ah]
0e24:083c  push word ptr [bp+6]
0e24:083f  call far 004Ah,1DA3h
0e24:0844  add sp,0Ch
0e24:0847  or di,di
0e24:0849  je short 0863h
0e24:084b  push word ptr [0CD14h]
0e24:084f  push word ptr [0CD12h]
0e24:0853  call far dword ptr [65DEh]
0e24:0857  add sp,4
0e24:085a  xor ax,ax
0e24:085c  push ax
0e24:085d  call far dword ptr [6576h]
0e24:0861  inc sp
0e24:0862  inc sp
0e24:0863  pop di
0e24:0864  pop si
0e24:0865  mov sp,bp
0e24:0867  pop bp
0e24:0868  ret far

; Candidate 0e24:0869, file offset 0x11ca9
0e24:0869  push bp
0e24:086a  mov bp,sp
0e24:086c  sub sp,4
0e24:086f  push si
0e24:0870  mov si,[bp+0Ah]
0e24:0873  cmp si,0FFFFh
0e24:0876  jne short 0884h
0e24:0878  mov word ptr [bp-2],0
0e24:087d  mov word ptr [bp-4],0
0e24:0882  jmp short 08A3h
0e24:0884  mov ax,[bp+8]
0e24:0887  mov dx,[bp+6]
0e24:088a  mov [bp-2],ax
0e24:088d  mov [bp-4],dx
0e24:0890  jmp short 089Fh
0e24:0892  les bx,[bp-4]
0e24:0895  inc word ptr [bp-4]
0e24:0898  cmp byte ptr es:[bx],0
0e24:089c  jne short 0892h
0e24:089e  dec si
0e24:089f  or si,si
0e24:08a1  jne short 0892h
0e24:08a3  mov dx,[bp-2]
0e24:08a6  mov ax,[bp-4]
0e24:08a9  pop si
0e24:08aa  mov sp,bp
0e24:08ac  pop bp
0e24:08ad  ret far

; Candidate 0e24:08ae, file offset 0x11cee
0e24:08ae  push bp
0e24:08af  mov bp,sp
0e24:08b1  sub sp,0Ah
0e24:08b4  push si
0e24:08b5  push di
0e24:08b6  mov si,[bp+6]
0e24:08b9  mov ax,si
0e24:08bb  mov dx,159h
0e24:08be  imul dx
0e24:08c0  mov bx,ax
0e24:08c2  mov di,[bx-191Bh]
0e24:08c6  push di
0e24:08c7  push si
0e24:08c8  call far 13AFh,0CBEh
0e24:08cd  add sp,4
0e24:08d0  mov [bp-2],ax
0e24:08d3  mov ax,di
0e24:08d5  mov dx,0Eh
0e24:08d8  imul dx
0e24:08da  mov bx,ax
0e24:08dc  mov al,[bx+71CEh]
0e24:08e0  cbw
0e24:08e1  mov [bp-8],ax
0e24:08e4  cmp word ptr [bp+8],0
0e24:08e8  jne short 08FEh
0e24:08ea  or di,di
0e24:08ec  je short 08F4h
0e24:08ee  cmp word ptr [bp-2],0
0e24:08f2  je short 08F9h
0e24:08f4  mov ax,1
0e24:08f7  jmp short 08FBh
0e24:08f9  xor ax,ax
0e24:08fb  jmp 0985h
0e24:08fe  mov ax,si
0e24:0900  mov dx,159h
0e24:0903  imul dx
0e24:0905  mov bx,ax
0e24:0907  mov ax,[bx-1919h]
0e24:090b  mov [bp-4],ax
0e24:090e  push word ptr [bp-4]
0e24:0911  push si
0e24:0912  call far 13AFh,0CBEh
0e24:0917  add sp,4
0e24:091a  mov [bp-6],ax
0e24:091d  mov ax,[bp-4]
0e24:0920  mov dx,0Eh
0e24:0923  imul dx
0e24:0925  mov bx,ax
0e24:0927  mov al,[bx+71CEh]
0e24:092b  cbw
0e24:092c  mov [bp-0Ah],ax
0e24:092f  or di,di
0e24:0931  je short 0945h
0e24:0933  mov bx,[bp-8]
0e24:0936  mov cl,4
0e24:0938  shl bx,cl
0e24:093a  cmp byte ptr [bx-6B8Ch],2
0e24:093f  jne short 0945h
0e24:0941  xor ax,ax
0e24:0943  jmp short 0985h
0e24:0945  cmp word ptr [bp-4],0
0e24:0949  jne short 0950h
0e24:094b  mov ax,1
0e24:094e  jmp short 0985h
0e24:0950  mov bx,[bp-0Ah]
0e24:0953  mov cl,4
0e24:0955  shl bx,cl
0e24:0957  test word ptr [bx-6B84h],7Fh
0e24:095d  jle short 0982h
0e24:095f  mov bx,[bp-0Ah]
0e24:0962  shl bx,cl
0e24:0964  mov ax,[bx-6B84h]
0e24:0968  and ax,7Fh
0e24:096b  cmp ax,4
0e24:096e  jge short 0982h
0e24:0970  mov bx,[bp-0Ah]
0e24:0973  shl bx,cl
0e24:0975  cmp byte ptr [bx-6B8Ch],0
0e24:097a  jne short 097Eh
0e24:097c  jmp short 0982h
0e24:097e  xor ax,ax
0e24:0980  jmp short 0985h
0e24:0982  mov ax,[bp-6]
0e24:0985  pop di
0e24:0986  pop si
0e24:0987  mov sp,bp
0e24:0989  pop bp
0e24:098a  ret far

; Candidate 0e24:09df, file offset 0x11e1f
0e24:09df  push bp
0e24:09e0  mov bp,sp
0e24:09e2  dec sp
0e24:09e3  dec sp
0e24:09e4  push si
0e24:09e5  les bx,[bp+6]
0e24:09e8  mov al,es:[bx]
0e24:09eb  cbw
0e24:09ec  mov dx,2Eh
0e24:09ef  imul dx
0e24:09f1  mov bx,ax
0e24:09f3  mov al,[bx-32BDh]
0e24:09f7  cbw
0e24:09f8  mov [bp-2],ax
0e24:09fb  push word ptr [bp-2]
0e24:09fe  push word ptr [bp+0Ch]
0e24:0a01  call far 05DEh,0B54h
0e24:0a06  add sp,4
0e24:0a09  mov si,ax
0e24:0a0b  cmp si,0FFFFh
0e24:0a0e  je short 0A48h
0e24:0a10  cmp [bp+0Ah],si
0e24:0a13  jl short 0A6Fh
0e24:0a15  les bx,[bp+6]
0e24:0a18  mov byte ptr es:[bx+8],0
0e24:0a1d  or byte ptr es:[bx+16h],8
0e24:0a22  mov byte ptr es:[bx+0Bh],28h
0e24:0a27  push word ptr [6DD2h]
0e24:0a2b  push word ptr es:[bx+2]
0e24:0a2f  call far 0316h,1A68h
0e24:0a34  add sp,4
0e24:0a37  xor ax,4
0e24:0a3a  sar ax,1
0e24:0a3c  les bx,[bp+6]
0e24:0a3f  mov es:[bx+5],al
0e24:0a43  mov ax,1
0e24:0a46  jmp short 0A71h
0e24:0a48  mov ax,3
0e24:0a4b  push ax
0e24:0a4c  mov ax,5
0e24:0a4f  push ax
0e24:0a50  mov ax,200h
0e24:0a53  push ax
0e24:0a54  mov ax,1F4h
0e24:0a57  push ax
0e24:0a58  xor ax,ax
0e24:0a5a  push ax
0e24:0a5b  push ax
0e24:0a5c  push word ptr [bp+8]
0e24:0a5f  push word ptr [bp+6]
0e24:0a62  call far 12B8h,0F55h
0e24:0a67  add sp,10h
0e24:0a6a  mov ax,1
0e24:0a6d  jmp short 0A71h
0e24:0a6f  xor ax,ax
0e24:0a71  pop si
0e24:0a72  mov sp,bp
0e24:0a74  pop bp
0e24:0a75  ret far

; Candidate 0e24:0a76, file offset 0x11eb6
0e24:0a76  push bp
0e24:0a77  mov bp,sp
0e24:0a79  dec sp
0e24:0a7a  dec sp
0e24:0a7b  les bx,[bp+6]
0e24:0a7e  mov al,es:[bx]
0e24:0a81  cbw
0e24:0a82  mov dx,2Eh
0e24:0a85  imul dx
0e24:0a87  mov bx,ax
0e24:0a89  mov al,[bx-32BCh]
0e24:0a8d  cbw
0e24:0a8e  mov [bp-2],ax
0e24:0a91  mov al,0
0e24:0a93  push ax
0e24:0a94  mov al,64h
0e24:0a96  push ax
0e24:0a97  mov al,1
0e24:0a99  push ax
0e24:0a9a  call far 0505h,08D7h
0e24:0a9f  add sp,6
0e24:0aa2  cmp ax,[bp-2]
0e24:0aa5  jge short 0AACh
0e24:0aa7  mov ax,1
0e24:0aaa  jmp short 0AAEh
0e24:0aac  xor ax,ax
0e24:0aae  mov sp,bp
0e24:0ab0  pop bp
0e24:0ab1  ret far

; Candidate 0e24:0b5b, file offset 0x11f9b
0e24:0b5b  push bp
0e24:0b5c  mov bp,sp
0e24:0b5e  cmp byte ptr [0EE3Ah],0
0e24:0b63  je short 0B72h
0e24:0b65  push ds
0e24:0b66  mov ax,0E5CAh
0e24:0b69  push ax
0e24:0b6a  call far 01F2h,0BB3h
0e24:0b6f  add sp,4
0e24:0b72  cmp byte ptr [0E441h],0
0e24:0b77  je short 0B86h
0e24:0b79  push ds
0e24:0b7a  mov ax,0E5CAh
0e24:0b7d  push ax
0e24:0b7e  call far 14A7h,10E2h
0e24:0b83  add sp,4
0e24:0b86  pop bp
0e24:0b87  ret far

; Candidate 0e24:0b88, file offset 0x11fc8
0e24:0b88  push bp
0e24:0b89  mov bp,sp
0e24:0b8b  xor ax,ax
0e24:0b8d  xor dx,dx
0e24:0b8f  push ax
0e24:0b90  push dx
0e24:0b91  push ax
0e24:0b92  push dx
0e24:0b93  call far 0048h,2AE3h
0e24:0b98  add sp,8
0e24:0b9b  mov word ptr [62A5h],0
0e24:0ba1  call far 030Fh,238Bh
0e24:0ba6  mov ax,1
0e24:0ba9  push ax
0e24:0baa  call far 0061h,2AE3h
0e24:0baf  inc sp
0e24:0bb0  inc sp
0e24:0bb1  push cs
0e24:0bb2  call 0686h
0e24:0bb5  call far 033Ah,238Bh
0e24:0bba  pop bp
0e24:0bbb  ret far

; Candidate 0e24:0bbc, file offset 0x11ffc
0e24:0bbc  push bp
0e24:0bbd  mov bp,sp
0e24:0bbf  push si
0e24:0bc0  push di
0e24:0bc1  xor ax,ax
0e24:0bc3  mov di,ax
0e24:0bc5  mov si,ax
0e24:0bc7  jmp short 0BEEh
0e24:0bc9  mov ax,1
0e24:0bcc  push ax
0e24:0bcd  push si
0e24:0bce  push cs
0e24:0bcf  call 06E9h
0e24:0bd2  add sp,4
0e24:0bd5  or ax,ax
0e24:0bd7  je short 0BEDh
0e24:0bd9  push word ptr [bp+8]
0e24:0bdc  push word ptr [bp+6]
0e24:0bdf  push si
0e24:0be0  push cs
0e24:0be1  call 0148h
0e24:0be4  add sp,6
0e24:0be7  cmp ax,0FFFFh
0e24:0bea  je short 0BEDh
0e24:0bec  inc di
0e24:0bed  inc si
0e24:0bee  cmp si,6
0e24:0bf1  jl short 0BC9h
0e24:0bf3  mov ax,di
0e24:0bf5  pop di
0e24:0bf6  pop si
0e24:0bf7  pop bp
0e24:0bf8  ret far

; Candidate 0e24:1027, file offset 0x12467
0e24:1027  push bp
0e24:1028  mov bp,sp
0e24:102a  sub sp,18h
0e24:102d  push si
0e24:102e  push di
0e24:102f  mov di,[bp+0Ah]
0e24:1032  mov ax,[636Fh]
0e24:1035  mov [bp-2],ax
0e24:1038  mov ax,[0F092h]
0e24:103b  mov dx,[0F090h]
0e24:103f  mov [bp-16h],ax
0e24:1042  mov [bp-18h],dx
0e24:1045  push word ptr [0F09Ah]
0e24:1049  push word ptr [0F098h]
0e24:104d  call far 000Ah,2166h
0e24:1052  add sp,4
0e24:1055  push word ptr [bp+6]
0e24:1058  call far 0133h,21B0h
0e24:105d  inc sp
0e24:105e  inc sp
0e24:105f  push word ptr [bp+8]
0e24:1062  push word ptr [bp+6]
0e24:1065  push cs
0e24:1066  call 0D19h
0e24:1069  add sp,4
0e24:106c  mov ax,[0F104h]
0e24:106f  shl ax,1
0e24:1071  shl ax,1
0e24:1073  shl ax,1
0e24:1075  add ax,8
0e24:1078  mov [bp-0Ah],ax
0e24:107b  mov ax,[0F104h]
0e24:107e  shl ax,1
0e24:1080  shl ax,1
0e24:1082  shl ax,1
0e24:1084  mov dx,[0F102h]
0e24:1088  shl dx,1
0e24:108a  shl dx,1
0e24:108c  shl dx,1
0e24:108e  add ax,dx
0e24:1090  mov [bp-8],ax
0e24:1093  sub word ptr [bp-8],28h
0e24:1097  mov ax,[0F106h]
0e24:109a  add ax,[0F100h]
0e24:109e  add ax,0FFEBh
0e24:10a1  mov [bp-0Ch],ax
0e24:10a4  mov word ptr [bp-0Eh],20h
0e24:10a9  mov word ptr [bp-12h],0FFFFh
0e24:10ae  xor di,1
0e24:10b2  xor si,si
0e24:10b4  jmp short 10D8h
0e24:10b6  xor ax,ax
0e24:10b8  push ax
0e24:10b9  push ax
0e24:10ba  mov ax,0Eh
0e24:10bd  push ax
0e24:10be  push word ptr [bp-0Eh]
0e24:10c1  push word ptr [bp-0Ch]
0e24:10c4  mov bx,si
0e24:10c6  shl bx,1
0e24:10c8  lea ax,[bp-0Ah]
0e24:10cb  add bx,ax
0e24:10cd  push word ptr ss:[bx]
0e24:10d0  push cs
0e24:10d1  call 0AB2h
0e24:10d4  add sp,0Ch
0e24:10d7  inc si
0e24:10d8  cmp si,2
0e24:10db  jl short 10B6h
0e24:10dd  call far 0516h,2295h
0e24:10e2  mov word ptr [bp-6],1
0e24:10e7  mov al,[6655h]
0e24:10ea  mov ah,0
0e24:10ec  or ax,ax
0e24:10ee  jne short 1145h
0e24:10f0  mov ax,[bp-0Ch]
0e24:10f3  add ax,0Eh
0e24:10f6  push ax
0e24:10f7  mov ax,[bp-0Ah]
0e24:10fa  add ax,[bp-0Eh]
0e24:10fd  push ax
0e24:10fe  push word ptr [bp-0Ch]
0e24:1101  push word ptr [bp-0Ah]
0e24:1104  push word ptr [661Ch]
0e24:1108  push word ptr [661Ah]
0e24:110c  call far 067Fh,08D7h
0e24:1111  add sp,0Ch
0e24:1114  or ax,ax
0e24:1116  je short 111Ah
0e24:1118  xor di,di
0e24:111a  mov ax,[bp-0Ch]
0e24:111d  add ax,0Eh
0e24:1120  push ax
0e24:1121  mov ax,[bp-8]
0e24:1124  add ax,[bp-0Eh]
0e24:1127  push ax
0e24:1128  push word ptr [bp-0Ch]
0e24:112b  push word ptr [bp-8]
0e24:112e  push word ptr [661Ch]
0e24:1132  push word ptr [661Ah]
0e24:1136  call far 067Fh,08D7h
0e24:113b  add sp,0Ch
0e24:113e  or ax,ax
0e24:1140  je short 1145h
0e24:1142  mov di,1
0e24:1145  call far 041Eh,2295h
0e24:114a  or ax,ax
0e24:114c  jne short 1151h
0e24:114e  jmp 120Eh
0e24:1151  call far 066Dh,2295h
0e24:1156  and ax,8FFh
0e24:1159  mov [bp-4],ax
0e24:115c  cmp ax,41h
0e24:115f  je short 1199h
0e24:1161  jg short 1188h
0e24:1163  cmp ax,33h
0e24:1166  jne short 116Bh
0e24:1168  jmp 1206h
0e24:116b  jg short 1180h
0e24:116d  cmp ax,16h
0e24:1170  jne short 1175h
0e24:1172  jmp 1202h
0e24:1175  cmp ax,2Bh
0e24:1178  jne short 117Dh
0e24:117a  jmp 1200h
0e24:117d  jmp 120Eh
0e24:1180  cmp ax,3Dh
0e24:1183  je short 1200h
0e24:1185  jmp 120Eh
0e24:1188  cmp ax,42h
0e24:118b  je short 1199h
0e24:118d  cmp ax,5Ch
0e24:1190  je short 11FAh
0e24:1192  cmp ax,66h
0e24:1195  je short 11FAh
0e24:1197  jmp short 120Eh
0e24:1199  mov ax,[bp-0Ch]
0e24:119c  add ax,0Eh
0e24:119f  push ax
0e24:11a0  mov ax,[bp-0Ah]
0e24:11a3  add ax,[bp-0Eh]
0e24:11a6  push ax
0e24:11a7  push word ptr [bp-0Ch]
0e24:11aa  push word ptr [bp-0Ah]
0e24:11ad  push word ptr [6624h]
0e24:11b1  push word ptr [6622h]
0e24:11b5  call far 067Fh,08D7h
0e24:11ba  add sp,0Ch
0e24:11bd  or ax,ax
0e24:11bf  je short 11C8h
0e24:11c1  xor di,di
0e24:11c3  mov word ptr [bp-6],0
0e24:11c8  mov ax,[bp-0Ch]
0e24:11cb  add ax,0Eh
0e24:11ce  push ax
0e24:11cf  mov ax,[bp-8]
0e24:11d2  add ax,[bp-0Eh]
0e24:11d5  push ax
0e24:11d6  push word ptr [bp-0Ch]
0e24:11d9  push word ptr [bp-8]
0e24:11dc  push word ptr [6624h]
0e24:11e0  push word ptr [6622h]
0e24:11e4  call far 067Fh,08D7h
0e24:11e9  add sp,0Ch
0e24:11ec  or ax,ax
0e24:11ee  je short 120Eh
0e24:11f0  mov di,1
0e24:11f3  mov word ptr [bp-6],0
0e24:11f8  jmp short 120Eh
0e24:11fa  xor di,1
0e24:11fe  jmp short 120Eh
0e24:1200  jmp short 1209h
0e24:1202  xor di,di
0e24:1204  jmp short 1209h
0e24:1206  mov di,1
0e24:1209  mov word ptr [bp-6],0
0e24:120e  cmp di,[bp-12h]
0e24:1211  jne short 1216h
0e24:1213  jmp 1296h
0e24:1216  xor si,si
0e24:1218  jmp short 128Eh
0e24:121a  mov bx,si
0e24:121c  shl bx,1
0e24:121e  shl bx,1
0e24:1220  push word ptr [bx+5502h]
0e24:1224  push word ptr [bx+5500h]
0e24:1228  call far 7599h,0
0e24:122d  add sp,4
0e24:1230  shl ax,1
0e24:1232  shl ax,1
0e24:1234  mov bx,si
0e24:1236  shl bx,1
0e24:1238  lea dx,[bp-0Ah]
0e24:123b  add bx,dx
0e24:123d  mov dx,ss:[bx]
0e24:1240  mov bx,[bp-0Eh]
0e24:1243  sar bx,1
0e24:1245  add dx,bx
0e24:1247  sub dx,ax
0e24:1249  inc dx
0e24:124a  mov [bp-10h],dx
0e24:124d  cmp di,si
0e24:124f  jne short 1258h
0e24:1251  mov word ptr [bp-14h],6
0e24:1256  jmp short 125Dh
0e24:1258  mov word ptr [bp-14h],0Fh
0e24:125d  call far 030Fh,238Bh
0e24:1262  xor ax,ax
0e24:1264  push ax
0e24:1265  push word ptr [bp-14h]
0e24:1268  mov ax,[bp-0Ch]
0e24:126b  add ax,3
0e24:126e  push ax
0e24:126f  push word ptr [bp-10h]
0e24:1272  mov bx,si
0e24:1274  shl bx,1
0e24:1276  shl bx,1
0e24:1278  push word ptr [bx+5502h]
0e24:127c  push word ptr [bx+5500h]
0e24:1280  call far 0908h,08D7h
0e24:1285  add sp,0Ch
0e24:1288  call far 033Ah,238Bh
0e24:128d  inc si
0e24:128e  cmp si,2
0e24:1291  jl short 121Ah
0e24:1293  mov [bp-12h],di
0e24:1296  cmp word ptr [bp-6],0
0e24:129a  je short 129Fh
0e24:129c  jmp 10E2h
0e24:129f  mov ax,1
0e24:12a2  push ax
0e24:12a3  push ax
0e24:12a4  mov ax,0Eh
0e24:12a7  push ax
0e24:12a8  push word ptr [bp-0Eh]
0e24:12ab  push word ptr [bp-0Ch]
0e24:12ae  mov bx,di
0e24:12b0  shl bx,1
0e24:12b2  lea ax,[bp-0Ah]
0e24:12b5  add bx,ax
0e24:12b7  push word ptr ss:[bx]
0e24:12ba  push cs
0e24:12bb  call 0AB2h
0e24:12be  add sp,0Ch
0e24:12c1  mov ax,5
0e24:12c4  push ax
0e24:12c5  call far 6C86h,0
0e24:12ca  inc sp
0e24:12cb  inc sp
0e24:12cc  mov ax,1
0e24:12cf  push ax
0e24:12d0  xor ax,ax
0e24:12d2  push ax
0e24:12d3  mov ax,0Eh
0e24:12d6  push ax
0e24:12d7  push word ptr [bp-0Eh]
0e24:12da  push word ptr [bp-0Ch]
0e24:12dd  mov bx,di
0e24:12df  shl bx,1
0e24:12e1  lea ax,[bp-0Ah]
0e24:12e4  add bx,ax
0e24:12e6  push word ptr ss:[bx]
0e24:12e9  push cs
0e24:12ea  call 0AB2h
0e24:12ed  add sp,0Ch
0e24:12f0  push word ptr [bp-2]
0e24:12f3  call far 0133h,21B0h
0e24:12f8  inc sp
0e24:12f9  inc sp
0e24:12fa  push word ptr [bp-16h]
0e24:12fd  push word ptr [bp-18h]
0e24:1300  call far 000Ah,2166h
0e24:1305  add sp,4
0e24:1308  push word ptr [bp+6]
0e24:130b  push cs
0e24:130c  call 0E22h
0e24:130f  inc sp
0e24:1310  inc sp
0e24:1311  mov ax,di
0e24:1313  xor ax,1
0e24:1316  pop di
0e24:1317  pop si
0e24:1318  mov sp,bp
0e24:131a  pop bp
0e24:131b  ret far

; Candidate 0f55:000c, file offset 0x1275c
0f55:000c  push bp
0f55:000d  mov bp,sp
0f55:000f  sub sp,6
0f55:0012  push si
0f55:0013  push di
0f55:0014  cmp word ptr [bp+6],0
0f55:0018  jge short 0020h
0f55:001a  mov ax,1
0f55:001d  jmp 018Ch
0f55:0020  cmp word ptr [bp+0Ah],0
0f55:0024  je short 004Bh
0f55:0026  mov ax,[bp+0Ah]
0f55:0029  mov dx,0Eh
0f55:002c  imul dx
0f55:002e  mov bx,ax
0f55:0030  mov al,[bx+71CEh]
0f55:0034  cbw
0f55:0035  mov [bp-6],ax
0f55:0038  mov bx,[bp-6]
0f55:003b  mov cl,4
0f55:003d  shl bx,cl
0f55:003f  mov ax,[bx-6B84h]
0f55:0043  and ax,7Fh
0f55:0046  mov [bp-6],ax
0f55:0049  jmp short 0050h
0f55:004b  mov word ptr [bp-6],0
0f55:0050  mov ax,[bp+8]
0f55:0053  mov dx,1Eh
0f55:0056  imul dx
0f55:0058  mov bx,ax
0f55:005a  test byte ptr [bx+6E40h],20h
0f55:005f  je short 0067h
0f55:0061  mov ax,1
0f55:0064  jmp 018Ch
0f55:0067  mov ax,[bp+8]
0f55:006a  mov dx,1Eh
0f55:006d  imul dx
0f55:006f  mov bx,ax
0f55:0071  mov al,[bx+6E2Ah]
0f55:0075  cbw
0f55:0076  mov [bp-2],ax
0f55:0079  cmp word ptr [bp-6],1
0f55:007d  jl short 0098h
0f55:007f  cmp word ptr [bp-6],3
0f55:0083  jg short 0098h
0f55:0085  mov ax,[bp+0Ah]
0f55:0088  mov dx,0Eh
0f55:008b  imul dx
0f55:008d  mov bx,ax
0f55:008f  mov al,[bx+71D7h]
0f55:0093  cbw
0f55:0094  mov di,ax
0f55:0096  jmp short 009Ah
0f55:0098  xor di,di
0f55:009a  cmp word ptr [bp-6],1
0f55:009e  jl short 00A6h
0f55:00a0  cmp word ptr [bp-6],3
0f55:00a4  jle short 00ACh
0f55:00a6  cmp word ptr [bp+0Ah],0
0f55:00aa  jne short 00E3h
0f55:00ac  mov ax,[bp-2]
0f55:00af  mov dx,2Eh
0f55:00b2  imul dx
0f55:00b4  mov bx,ax
0f55:00b6  test word ptr [bx-32D6h],200h
0f55:00bc  je short 00C7h
0f55:00be  or di,di
0f55:00c0  jg short 00C7h
0f55:00c2  xor ax,ax
0f55:00c4  jmp 018Ch
0f55:00c7  mov ax,[bp-2]
0f55:00ca  mov dx,2Eh
0f55:00cd  imul dx
0f55:00cf  mov bx,ax
0f55:00d1  test word ptr [bx-32D6h],1000h
0f55:00d7  je short 00E3h
0f55:00d9  cmp di,1
0f55:00dc  jg short 00E3h
0f55:00de  xor ax,ax
0f55:00e0  jmp 018Ch
0f55:00e3  cmp word ptr [bp+0Ch],0
0f55:00e7  je short 00F3h
0f55:00e9  push word ptr [bp+6]
0f55:00ec  call far 00F0h,0B54h
0f55:00f1  jmp short 00FBh
0f55:00f3  push word ptr [bp+6]
0f55:00f6  call far 01A2h,0B54h
0f55:00fb  inc sp
0f55:00fc  inc sp
0f55:00fd  add di,ax
0f55:00ff  mov ax,[bp-2]
0f55:0102  mov dx,2Eh
0f55:0105  imul dx
0f55:0107  mov bx,ax
0f55:0109  mov al,[bx-32E6h]
0f55:010d  push ax
0f55:010e  mov al,[bp+6]
0f55:0111  push ax
0f55:0112  call far 0569h,0B54h
0f55:0117  add sp,4
0f55:011a  cbw
0f55:011b  sub ax,di
0f55:011d  mov [bp-4],ax
0f55:0120  mov al,0
0f55:0122  push ax
0f55:0123  mov al,14h
0f55:0125  push ax
0f55:0126  mov al,1
0f55:0128  push ax
0f55:0129  call far 0505h,08D7h
0f55:012e  add sp,6
0f55:0131  mov si,ax
0f55:0133  mov ax,[bp+8]
0f55:0136  mov dx,1Eh
0f55:0139  imul dx
0f55:013b  mov bx,ax
0f55:013d  or byte ptr [bx+6E40h],1
0f55:0142  mov ax,[6DDCh]
0f55:0145  and ax,8400h
0f55:0148  or ax,0
0f55:014b  je short 014Fh
0f55:014d  jmp short 0165h
0f55:014f  mov ax,[bp+6]
0f55:0152  mov dx,159h
0f55:0155  imul dx
0f55:0157  mov bx,ax
0f55:0159  mov ax,[bx-18AFh]
0f55:015d  and ax,1000h
0f55:0160  or ax,0
0f55:0163  je short 0166h
0f55:0165  inc si
0f55:0166  cmp si,14h
0f55:0169  jge short 016Fh
0f55:016b  mov ax,si
0f55:016d  jmp short 0172h
0f55:016f  mov ax,14h
0f55:0172  mov si,ax
0f55:0174  cmp si,1
0f55:0177  jle short 017Bh
0f55:0179  jmp short 017Eh
0f55:017b  mov ax,1
0f55:017e  mov si,ax
0f55:0180  cmp si,[bp-4]
0f55:0183  jl short 018Ah
0f55:0185  mov ax,1
0f55:0188  jmp short 018Ch
0f55:018a  xor ax,ax
0f55:018c  pop di
0f55:018d  pop si
0f55:018e  mov sp,bp
0f55:0190  pop bp
0f55:0191  ret far

; Candidate 0f55:0279, file offset 0x129c9
0f55:0279  push bp
0f55:027a  mov bp,sp
0f55:027c  sub sp,0Ah
0f55:027f  push si
0f55:0280  push di
0f55:0281  les bx,[bp+6]
0f55:0284  mov ax,es:[bx+8]
0f55:0288  mov [bp-2],ax
0f55:028b  mov dx,0Eh
0f55:028e  imul dx
0f55:0290  mov bx,ax
0f55:0292  mov al,[bx+71CFh]
0f55:0296  cbw
0f55:0297  and ax,3
0f55:029a  mov [bp-6],ax
0f55:029d  mov bx,[6DD4h]
0f55:02a1  shl bx,1
0f55:02a3  shl bx,1
0f55:02a5  add bx,[bp-6]
0f55:02a8  mov al,[bx+2352h]
0f55:02ac  cbw
0f55:02ad  mov [bp-6],ax
0f55:02b0  mov word ptr [bp-0Ah],0
0f55:02b5  mov bx,[bp+6]
0f55:02b8  mov al,es:[bx+7]
0f55:02bc  cbw
0f55:02bd  cmp ax,[6DD4h]
0f55:02c1  je short 02D4h
0f55:02c3  mov al,es:[bx+7]
0f55:02c7  cbw
0f55:02c8  mov dx,[6DD4h]
0f55:02cc  xor dx,2
0f55:02d0  cmp ax,dx
0f55:02d2  jne short 02DFh
0f55:02d4  cmp word ptr [bp-6],2
0f55:02d8  jle short 02DFh
0f55:02da  mov ax,1
0f55:02dd  jmp short 02E1h
0f55:02df  xor ax,ax
0f55:02e1  mov [bp-8],ax
0f55:02e4  mov ax,[bp-6]
0f55:02e7  shl ax,1
0f55:02e9  mov si,ax
0f55:02eb  cmp word ptr [bp-6],2
0f55:02ef  jle short 0304h
0f55:02f1  mov al,0FFh
0f55:02f3  push ax
0f55:02f4  mov al,2
0f55:02f6  push ax
0f55:02f7  mov al,1
0f55:02f9  push ax
0f55:02fa  call far 0505h,08D7h
0f55:02ff  add sp,6
0f55:0302  add si,ax
0f55:0304  xor di,di
0f55:0306  jmp short 035Ah
0f55:0308  mov al,[si+5530h]
0f55:030c  cbw
0f55:030d  mov [bp-4],ax
0f55:0310  xor si,1
0f55:0314  mov ax,3
0f55:0317  push ax
0f55:0318  push word ptr [bp-4]
0f55:031b  call far 06E9h,0E24h
0f55:0320  add sp,4
0f55:0323  or ax,ax
0f55:0325  je short 034Dh
0f55:0327  mov ax,3
0f55:032a  push ax
0f55:032b  mov ax,5
0f55:032e  push ax
0f55:032f  mov ax,110h
0f55:0332  push ax
0f55:0333  xor ax,ax
0f55:0335  push ax
0f55:0336  push word ptr [bp-2]
0f55:0339  mov ax,0FFFFh
0f55:033c  push ax
0f55:033d  push word ptr [bp-4]
0f55:0340  call far 143Eh,0F55h
0f55:0345  add sp,0Eh
0f55:0348  mov word ptr [bp-0Ah],1
0f55:034d  cmp word ptr [bp-6],2
0f55:0351  jl short 035Fh
0f55:0353  cmp word ptr [bp-8],0
0f55:0357  je short 035Fh
0f55:0359  inc di
0f55:035a  cmp di,2
0f55:035d  jl short 0308h
0f55:035f  mov ax,[bp-0Ah]
0f55:0362  pop di
0f55:0363  pop si
0f55:0364  mov sp,bp
0f55:0366  pop bp
0f55:0367  ret far

; Candidate 0f55:0368, file offset 0x12ab8
0f55:0368  push bp
0f55:0369  mov bp,sp
0f55:036b  sub sp,4
0f55:036e  push si
0f55:036f  push di
0f55:0370  mov di,[bp+0Ah]
0f55:0373  les bx,[bp+6]
0f55:0376  mov ax,es:[bx+8]
0f55:037a  mov [bp-2],ax
0f55:037d  mov al,es:[bx+0Bh]
0f55:0381  cbw
0f55:0382  mov si,ax
0f55:0384  cmp si,0FFFFh
0f55:0387  je short 03A0h
0f55:0389  xor ax,ax
0f55:038b  push ax
0f55:038c  push word ptr [bp-2]
0f55:038f  push di
0f55:0390  push si
0f55:0391  push cs
0f55:0392  call 000Ch
0f55:0395  add sp,8
0f55:0398  or ax,ax
0f55:039a  jne short 03A0h
0f55:039c  xor ax,ax
0f55:039e  jmp short 03DAh
0f55:03a0  cmp si,0FFFFh
0f55:03a3  jne short 03ACh
0f55:03a5  mov word ptr [bp-4],110h
0f55:03aa  jmp short 03B1h
0f55:03ac  mov word ptr [bp-4],910h
0f55:03b1  mov ax,3
0f55:03b4  push ax
0f55:03b5  mov ax,5
0f55:03b8  push ax
0f55:03b9  push word ptr [bp-4]
0f55:03bc  xor ax,ax
0f55:03be  push ax
0f55:03bf  push word ptr [bp-2]
0f55:03c2  push si
0f55:03c3  push ds
0f55:03c4  mov ax,di
0f55:03c6  mov dx,1Eh
0f55:03c9  imul dx
0f55:03cb  add ax,6E2Ah
0f55:03ce  push ax
0f55:03cf  call far 12B8h,0F55h
0f55:03d4  add sp,10h
0f55:03d7  mov ax,1
0f55:03da  pop di
0f55:03db  pop si
0f55:03dc  mov sp,bp
0f55:03de  pop bp
0f55:03df  ret far

; Candidate 0f55:0869, file offset 0x12fb9
0f55:0869  push bp
0f55:086a  mov bp,sp
0f55:086c  dec sp
0f55:086d  dec sp
0f55:086e  push si
0f55:086f  push di
0f55:0870  mov si,[bp+0Ah]
0f55:0873  or si,si
0f55:0875  je short 0889h
0f55:0877  mov ax,si
0f55:0879  mov dx,0Eh
0f55:087c  imul dx
0f55:087e  mov bx,ax
0f55:0880  mov al,[bx+71CEh]
0f55:0884  cbw
0f55:0885  mov di,ax
0f55:0887  jmp short 088Bh
0f55:0889  xor di,di
0f55:088b  mov word ptr [bp-2],0
0f55:0890  mov ax,[bp+6]
0f55:0893  mov dx,159h
0f55:0896  imul dx
0f55:0898  mov bx,ax
0f55:089a  mov ax,[bx-18AFh]
0f55:089e  and ax,40h
0f55:08a1  or ax,0
0f55:08a4  je short 08B9h
0f55:08a6  mov ax,1
0f55:08a9  push ax
0f55:08aa  push word ptr [bp+6]
0f55:08ad  mov ax,0Ah
0f55:08b0  push ax
0f55:08b1  call far 0C6Dh,10E2h
0f55:08b6  add sp,6
0f55:08b9  mov bx,di
0f55:08bb  mov cl,4
0f55:08bd  shl bx,cl
0f55:08bf  mov ax,[bx-6B84h]
0f55:08c3  and ax,7Fh
0f55:08c6  cmp ax,1
0f55:08c9  je short 08D7h
0f55:08cb  cmp ax,2
0f55:08ce  je short 08FBh
0f55:08d0  cmp ax,3
0f55:08d3  je short 090Eh
0f55:08d5  jmp short 0926h
0f55:08d7  push si
0f55:08d8  push word ptr [bp+6]
0f55:08db  push cs
0f55:08dc  call 03E0h
0f55:08df  add sp,4
0f55:08e2  mov [bp-2],ax
0f55:08e5  cmp word ptr [bp-2],0
0f55:08e9  jne short 08F0h
0f55:08eb  mov word ptr [bp-2],0FFFFh
0f55:08f0  mov ax,20h
0f55:08f3  push ax
0f55:08f4  call far 00AAh,1C9Fh
0f55:08f9  jmp short 0924h
0f55:08fb  push si
0f55:08fc  push word ptr [bp+8]
0f55:08ff  push word ptr [bp+6]
0f55:0902  push cs
0f55:0903  call 0628h
0f55:0906  add sp,6
0f55:0909  mov [bp-2],ax
0f55:090c  jmp short 0926h
0f55:090e  push si
0f55:090f  push word ptr [bp+6]
0f55:0912  push cs
0f55:0913  call 06ADh
0f55:0916  add sp,4
0f55:0919  mov [bp-2],ax
0f55:091c  push word ptr [bp+6]
0f55:091f  call far 0AF9h,1901h
0f55:0924  inc sp
0f55:0925  inc sp
0f55:0926  cmp word ptr [bp-2],0
0f55:092a  jle short 099Bh
0f55:092c  mov ax,si
0f55:092e  mov dx,0Eh
0f55:0931  imul dx
0f55:0933  mov bx,ax
0f55:0935  test byte ptr [bx+71CCh],8
0f55:093a  je short 0957h
0f55:093c  mov ax,[bp+6]
0f55:093f  mov dx,159h
0f55:0942  imul dx
0f55:0944  mov dx,[bp-2]
0f55:0947  mov bx,ax
0f55:0949  add [bx-19DDh],dx
0f55:094d  push word ptr [bp+6]
0f55:0950  call far 0AF9h,1901h
0f55:0955  inc sp
0f55:0956  inc sp
0f55:0957  mov ax,si
0f55:0959  mov dx,0Eh
0f55:095c  imul dx
0f55:095e  mov bx,ax
0f55:0960  test byte ptr [bx+71CCh],10h
0f55:0965  je short 097Eh
0f55:0967  mov ax,[bp+6]
0f55:096a  mov dx,159h
0f55:096d  imul dx
0f55:096f  mov dx,[bp+8]
0f55:0972  shl dx,1
0f55:0974  add ax,dx
0f55:0976  mov bx,ax
0f55:0978  mov word ptr [bx-191Bh],0
0f55:097e  mov ax,1
0f55:0981  push ax
0f55:0982  push word ptr [bp-2]
0f55:0985  push ds
0f55:0986  mov al,[0CB70h]
0f55:0989  cbw
0f55:098a  mov dx,1Eh
0f55:098d  imul dx
0f55:098f  add ax,6E2Ah
0f55:0992  push ax
0f55:0993  call far 104Dh,0F55h
0f55:0998  add sp,8
0f55:099b  mov ax,[bp+6]
0f55:099e  mov dx,159h
0f55:09a1  imul dx
0f55:09a3  mov dl,1
0f55:09a5  mov cl,[bp+8]
0f55:09a8  shl dl,cl
0f55:09aa  mov bx,ax
0f55:09ac  xor [bx-19D8h],dl
0f55:09b0  mov ax,[bp+6]
0f55:09b3  mov dx,159h
0f55:09b6  imul dx
0f55:09b8  add ax,[bp+8]
0f55:09bb  mov dl,[bp-2]
0f55:09be  mov bx,ax
0f55:09c0  mov [bx-18AAh],dl
0f55:09c4  push word ptr [bp+6]
0f55:09c7  call far 0AF9h,1901h
0f55:09cc  inc sp
0f55:09cd  inc sp
0f55:09ce  cmp word ptr [bp-2],0FFFEh
0f55:09d2  jge short 09DCh
0f55:09d4  mov al,1
0f55:09d6  push ax
0f55:09d7  mov al,[bp+8]
0f55:09da  jmp short 09E4h
0f55:09dc  mov al,1
0f55:09de  push ax
0f55:09df  mov al,[bp+8]
0f55:09e2  add al,2
0f55:09e4  push ax
0f55:09e5  xor ax,ax
0f55:09e7  mov dx,12h
0f55:09ea  push ax
0f55:09eb  push dx
0f55:09ec  mov al,[bp+6]
0f55:09ef  push ax
0f55:09f0  call far 06B7h,17B7h
0f55:09f5  add sp,0Ah
0f55:09f8  pop di
0f55:09f9  pop si
0f55:09fa  mov sp,bp
0f55:09fc  pop bp
0f55:09fd  ret far

; Candidate 0f55:09fe, file offset 0x1314e
0f55:09fe  push bp
0f55:09ff  mov bp,sp
0f55:0a01  push si
0f55:0a02  push di
0f55:0a03  xor ax,ax
0f55:0a05  mov si,ax
0f55:0a07  mov di,ax
0f55:0a09  jmp short 0A1Bh
0f55:0a0b  mov ax,0Dh
0f55:0a0e  push ax
0f55:0a0f  push si
0f55:0a10  call far 06E9h,0E24h
0f55:0a15  add sp,4
0f55:0a18  add di,ax
0f55:0a1a  inc si
0f55:0a1b  cmp si,6
0f55:0a1e  jl short 0A0Bh
0f55:0a20  or di,di
0f55:0a22  je short 0A27h
0f55:0a24  jmp 0ABAh
0f55:0a27  cmp word ptr [bp+6],0
0f55:0a2b  jne short 0A30h
0f55:0a2d  jmp 0ABAh
0f55:0a30  call far 0686h,0E24h
0f55:0a35  mov ax,[6E28h]
0f55:0a38  mov dx,[6E26h]
0f55:0a3c  and dx,0
0f55:0a40  and ax,10h
0f55:0a43  or dx,ax
0f55:0a45  je short 0A4Ch
0f55:0a47  call far 007Ah,2AF4h
0f55:0a4c  mov ax,1
0f55:0a4f  push ax
0f55:0a50  mov ax,43h
0f55:0a53  push ax
0f55:0a54  mov ax,0Eh
0f55:0a57  push ax
0f55:0a58  call far 1027h,0E24h
0f55:0a5d  add sp,6
0f55:0a60  or ax,ax
0f55:0a62  jne short 0A73h
0f55:0a64  call far 0,215Fh
0f55:0a69  xor ax,ax
0f55:0a6b  push ax
0f55:0a6c  call far 5A8Dh,0
0f55:0a71  inc sp
0f55:0a72  inc sp
0f55:0a73  push word ptr [0F09Ah]
0f55:0a77  push word ptr [0F098h]
0f55:0a7b  call far 000Ah,2166h
0f55:0a80  add sp,4
0f55:0a83  call far 0B5Bh,0E24h
0f55:0a88  xor ax,ax
0f55:0a8a  push ax
0f55:0a8b  push ax
0f55:0a8c  call far 0039h,2AEDh
0f55:0a91  add sp,4
0f55:0a94  or ax,ax
0f55:0a96  jne short 0AA7h
0f55:0a98  call far 0,215Fh
0f55:0a9d  xor ax,ax
0f55:0a9f  push ax
0f55:0aa0  call far 5A8Dh,0
0f55:0aa5  inc sp
0f55:0aa6  inc sp
0f55:0aa7  push word ptr [9344h]
0f55:0aab  push word ptr [9342h]
0f55:0aaf  call far 000Ah,2166h
0f55:0ab4  add sp,4
0f55:0ab7  mov di,1
0f55:0aba  mov ax,di
0f55:0abc  neg ax
0f55:0abe  sbb ax,ax
0f55:0ac0  inc ax
0f55:0ac1  pop di
0f55:0ac2  pop si
0f55:0ac3  pop bp
0f55:0ac4  ret far

; Candidate 0f55:0ac5, file offset 0x13215
0f55:0ac5  push bp
0f55:0ac6  mov bp,sp
0f55:0ac8  sub sp,4
0f55:0acb  push si
0f55:0acc  mov si,[bp+6]
0f55:0acf  mov ax,3
0f55:0ad2  push ax
0f55:0ad3  push si
0f55:0ad4  call far 06E9h,0E24h
0f55:0ad9  add sp,4
0f55:0adc  or ax,ax
0f55:0ade  je short 0B1Ch
0f55:0ae0  mov ax,si
0f55:0ae2  mov dx,159h
0f55:0ae5  imul dx
0f55:0ae7  add ax,0E608h
0f55:0aea  mov [bp-2],ds
0f55:0aed  mov [bp-4],ax
0f55:0af0  les bx,[bp-4]
0f55:0af3  mov ax,[bp+8]
0f55:0af6  add es:[bx+1Bh],ax
0f55:0afa  mov ax,es:[bx+1Bh]
0f55:0afe  cmp ax,es:[bx+1Dh]
0f55:0b02  jle short 0B0Ch
0f55:0b04  mov ax,es:[bx+1Dh]
0f55:0b08  mov es:[bx+1Bh],ax
0f55:0b0c  push si
0f55:0b0d  call far 03A5h,1901h
0f55:0b12  inc sp
0f55:0b13  inc sp
0f55:0b14  push si
0f55:0b15  call far 0AF9h,1901h
0f55:0b1a  inc sp
0f55:0b1b  inc sp
0f55:0b1c  pop si
0f55:0b1d  mov sp,bp
0f55:0b1f  pop bp
0f55:0b20  ret far

; Candidate 0f55:0b21, file offset 0x13271
0f55:0b21  push bp
0f55:0b22  mov bp,sp
0f55:0b24  sub sp,8
0f55:0b27  push si
0f55:0b28  mov si,[bp+6]
0f55:0b2b  mov ax,si
0f55:0b2d  mov dx,159h
0f55:0b30  imul dx
0f55:0b32  mov bx,ax
0f55:0b34  mov al,[bx-19D6h]
0f55:0b38  cbw
0f55:0b39  mov [bp-4],ax
0f55:0b3c  mov bx,[bp-4]
0f55:0b3f  mov al,[bx+1EC8h]
0f55:0b43  cbw
0f55:0b44  cwd
0f55:0b45  push dx
0f55:0b46  push ax
0f55:0b47  push word ptr [bp+0Ah]
0f55:0b4a  push word ptr [bp+8]
0f55:0b4d  call far 8551h,0
0f55:0b52  mov [bp+0Ah],dx
0f55:0b55  mov [bp+8],ax
0f55:0b58  mov word ptr [bp-2],0
0f55:0b5d  jmp 0C01h
0f55:0b60  mov al,[bp-2]
0f55:0b63  push ax
0f55:0b64  mov al,[bp-4]
0f55:0b67  push ax
0f55:0b68  call far 0082h,0B54h
0f55:0b6d  add sp,4
0f55:0b70  cmp al,0FFh
0f55:0b72  jne short 0B77h
0f55:0b74  jmp 0BFEh
0f55:0b77  mov ax,si
0f55:0b79  mov dx,159h
0f55:0b7c  imul dx
0f55:0b7e  mov dx,[bp-2]
0f55:0b81  shl dx,1
0f55:0b83  shl dx,1
0f55:0b85  add ax,dx
0f55:0b87  mov dx,[bp+0Ah]
0f55:0b8a  mov bx,[bp+8]
0f55:0b8d  xchg ax,bx
0f55:0b8f  add [bx-19CFh],ax
0f55:0b93  adc [bx-19CDh],dx
0f55:0b97  mov ax,si
0f55:0b99  mov dx,159h
0f55:0b9c  imul dx
0f55:0b9e  add ax,[bp-2]
0f55:0ba1  mov bx,ax
0f55:0ba3  mov al,[bx-19D2h]
0f55:0ba7  inc al
0f55:0ba9  push ax
0f55:0baa  mov al,[bp-2]
0f55:0bad  push ax
0f55:0bae  mov al,[bp-4]
0f55:0bb1  push ax
0f55:0bb2  call far 0515h,0B54h
0f55:0bb7  add sp,6
0f55:0bba  mov [bp-6],dx
0f55:0bbd  mov [bp-8],ax
0f55:0bc0  cmp word ptr [bp-6],0FFFFh
0f55:0bc4  jne short 0BCCh
0f55:0bc6  cmp word ptr [bp-8],0FFFFh
0f55:0bca  je short 0BFEh
0f55:0bcc  mov ax,si
0f55:0bce  mov dx,159h
0f55:0bd1  imul dx
0f55:0bd3  mov dx,[bp-2]
0f55:0bd6  shl dx,1
0f55:0bd8  shl dx,1
0f55:0bda  add ax,dx
0f55:0bdc  mov bx,ax
0f55:0bde  mov ax,[bx-19CDh]
0f55:0be2  mov dx,[bx-19CFh]
0f55:0be6  cmp ax,[bp-6]
0f55:0be9  jb short 0BFEh
0f55:0beb  ja short 0BF2h
0f55:0bed  cmp dx,[bp-8]
0f55:0bf0  jbe short 0BFEh
0f55:0bf2  push word ptr [bp-2]
0f55:0bf5  push si
0f55:0bf6  call far 0C6Ch,0F55h
0f55:0bfb  add sp,4
0f55:0bfe  inc word ptr [bp-2]
0f55:0c01  cmp word ptr [bp-2],3
0f55:0c05  jge short 0C0Ah
0f55:0c07  jmp 0B60h
0f55:0c0a  pop si
0f55:0c0b  mov sp,bp
0f55:0c0d  pop bp
0f55:0c0e  ret far

; Candidate 0f55:0c0f, file offset 0x1335f
0f55:0c0f  push bp
0f55:0c10  mov bp,sp
0f55:0c12  push si
0f55:0c13  push di
0f55:0c14  xor di,di
0f55:0c16  xor si,si
0f55:0c18  jmp short 0C2Dh
0f55:0c1a  mov ax,3
0f55:0c1d  push ax
0f55:0c1e  push si
0f55:0c1f  call far 06E9h,0E24h
0f55:0c24  add sp,4
0f55:0c27  or ax,ax
0f55:0c29  je short 0C2Ch
0f55:0c2b  inc di
0f55:0c2c  inc si
0f55:0c2d  cmp si,6
0f55:0c30  jl short 0C1Ah
0f55:0c32  or di,di
0f55:0c34  jle short 0C68h
0f55:0c36  mov ax,[bp+6]
0f55:0c39  cwd
0f55:0c3a  idiv di
0f55:0c3c  mov [bp+6],ax
0f55:0c3f  xor si,si
0f55:0c41  jmp short 0C63h
0f55:0c43  mov ax,3
0f55:0c46  push ax
0f55:0c47  push si
0f55:0c48  call far 06E9h,0E24h
0f55:0c4d  add sp,4
0f55:0c50  or ax,ax
0f55:0c52  je short 0C62h
0f55:0c54  mov ax,[bp+6]
0f55:0c57  cwd
0f55:0c58  push dx
0f55:0c59  push ax
0f55:0c5a  push si
0f55:0c5b  push cs
0f55:0c5c  call 0B21h
0f55:0c5f  add sp,6
0f55:0c62  inc si
0f55:0c63  cmp si,6
0f55:0c66  jl short 0C43h
0f55:0c68  pop di
0f55:0c69  pop si
0f55:0c6a  pop bp
0f55:0c6b  ret far

; Candidate 0f55:0c6c, file offset 0x133bc
0f55:0c6c  push bp
0f55:0c6d  mov bp,sp
0f55:0c6f  push si
0f55:0c70  mov ax,[bp+6]
0f55:0c73  mov dx,159h
0f55:0c76  imul dx
0f55:0c78  add ax,[bp+8]
0f55:0c7b  mov bx,ax
0f55:0c7d  inc byte ptr [bx-19D2h]
0f55:0c81  mov al,1
0f55:0c83  mov cl,[bp+8]
0f55:0c86  shl al,cl
0f55:0c88  push ax
0f55:0c89  mov al,[bp+6]
0f55:0c8c  push ax
0f55:0c8d  call far 01FBh,0B54h
0f55:0c92  add sp,4
0f55:0c95  mov si,ax
0f55:0c97  mov ax,[bp+6]
0f55:0c9a  mov dx,159h
0f55:0c9d  imul dx
0f55:0c9f  mov bx,ax
0f55:0ca1  add [bx-19DDh],si
0f55:0ca5  mov ax,[bp+6]
0f55:0ca8  mov dx,159h
0f55:0cab  imul dx
0f55:0cad  mov bx,ax
0f55:0caf  add [bx-19DBh],si
0f55:0cb3  push ds
0f55:0cb4  mov ax,[bp+6]
0f55:0cb7  mov dx,159h
0f55:0cba  imul dx
0f55:0cbc  add ax,0E60Ah
0f55:0cbf  push ax
0f55:0cc0  push ds
0f55:0cc1  mov ax,5590h
0f55:0cc4  push ax
0f55:0cc5  push ds
0f55:0cc6  mov ax,0F16Eh
0f55:0cc9  push ax
0f55:0cca  call far 64A1h,0
0f55:0ccf  add sp,0Ch
0f55:0cd2  push word ptr [bp+6]
0f55:0cd5  call far 0AF9h,1901h
0f55:0cda  inc sp
0f55:0cdb  inc sp
0f55:0cdc  push ds
0f55:0cdd  mov ax,0F16Eh
0f55:0ce0  push ax
0f55:0ce1  call far 0284h,21B0h
0f55:0ce6  add sp,4
0f55:0ce9  mov ax,17h
0f55:0cec  push ax
0f55:0ced  call far 00AAh,1C9Fh
0f55:0cf2  inc sp
0f55:0cf3  inc sp
0f55:0cf4  pop si
0f55:0cf5  pop bp
0f55:0cf6  ret far

; Candidate 0f55:0cf7, file offset 0x13447
0f55:0cf7  push bp
0f55:0cf8  mov bp,sp
0f55:0cfa  sub sp,10h
0f55:0cfd  push si
0f55:0cfe  push di
0f55:0cff  mov ax,[bp+6]
0f55:0d02  mov dx,159h
0f55:0d05  imul dx
0f55:0d07  add ax,0E608h
0f55:0d0a  mov [bp-0Eh],ds
0f55:0d0d  mov [bp-10h],ax
0f55:0d10  les bx,[bp-10h]
0f55:0d13  mov al,es:[bx+15h]
0f55:0d17  push ax
0f55:0d18  call far 01BDh,0B54h
0f55:0d1d  inc sp
0f55:0d1e  inc sp
0f55:0d1f  mov [bp-0Ch],ax
0f55:0d22  les bx,[bp-10h]
0f55:0d25  mov al,[bp-0Ch]
0f55:0d28  add al,0Ah
0f55:0d2a  mov es:[bx+1Fh],al
0f55:0d2e  xor si,si
0f55:0d30  jmp 0DE6h
0f55:0d33  mov al,[si+5540h]
0f55:0d37  cbw
0f55:0d38  shl ax,1
0f55:0d3a  les bx,[bp-10h]
0f55:0d3d  add bx,ax
0f55:0d3f  mov di,es:[bx+0DDh]
0f55:0d44  or di,di
0f55:0d46  jne short 0D4Bh
0f55:0d48  jmp 0DE5h
0f55:0d4b  cmp si,2
0f55:0d4e  jne short 0D66h
0f55:0d50  mov ax,1
0f55:0d53  push ax
0f55:0d54  push word ptr [bp+6]
0f55:0d57  call far 08AEh,0E24h
0f55:0d5c  add sp,4
0f55:0d5f  or ax,ax
0f55:0d61  jne short 0D66h
0f55:0d63  jmp 0DE5h
0f55:0d66  mov ax,di
0f55:0d68  mov dx,0Eh
0f55:0d6b  imul dx
0f55:0d6d  mov bx,ax
0f55:0d6f  mov al,[bx+71CEh]
0f55:0d73  cbw
0f55:0d74  mov [bp-2],ax
0f55:0d77  mov bx,[bp-2]
0f55:0d7a  mov cl,4
0f55:0d7c  shl bx,cl
0f55:0d7e  mov al,[bx-6B8Dh]
0f55:0d82  les bx,[bp-10h]
0f55:0d85  push ax
0f55:0d86  mov al,es:[bx+22h]
0f55:0d8a  cbw
0f55:0d8b  mov bx,ax
0f55:0d8d  pop ax
0f55:0d8e  and al,[bx+1F9Ah]
0f55:0d92  cbw
0f55:0d93  mov [bp-0Ah],ax
0f55:0d96  mov bx,[bp-2]
0f55:0d99  shl bx,cl
0f55:0d9b  test word ptr [bx-6B84h],7Fh
0f55:0da1  jne short 0DE5h
0f55:0da3  cmp word ptr [bp-0Ah],0
0f55:0da7  je short 0DE5h
0f55:0da9  cmp si,1
0f55:0dac  jl short 0DBFh
0f55:0dae  cmp si,2
0f55:0db1  jg short 0DBFh
0f55:0db3  cmp word ptr [bp-2],1Bh
0f55:0db7  je short 0DBFh
0f55:0db9  cmp word ptr [bp-2],39h
0f55:0dbd  jne short 0DE5h
0f55:0dbf  mov bx,[bp-2]
0f55:0dc2  mov cl,4
0f55:0dc4  shl bx,cl
0f55:0dc6  mov al,[bx-6B8Eh]
0f55:0dca  les bx,[bp-10h]
0f55:0dcd  add es:[bx+1Fh],al
0f55:0dd1  mov ax,di
0f55:0dd3  mov dx,0Eh
0f55:0dd6  imul dx
0f55:0dd8  mov bx,ax
0f55:0dda  mov al,[bx+71D7h]
0f55:0dde  mov bx,[bp-10h]
0f55:0de1  sub es:[bx+1Fh],al
0f55:0de5  inc si
0f55:0de6  cmp si,4
0f55:0de9  jge short 0DEEh
0f55:0deb  jmp 0D33h
0f55:0dee  les bx,[bp-10h]
0f55:0df1  mov di,es:[bx+0FFh]
0f55:0df6  mov ax,di
0f55:0df8  mov dx,0Eh
0f55:0dfb  imul dx
0f55:0dfd  mov bx,ax
0f55:0dff  cmp byte ptr [bx+71D7h],0
0f55:0e04  je short 0E09h
0f55:0e06  jmp 0EA3h
0f55:0e09  mov word ptr [bp-6],0
0f55:0e0e  mov word ptr [bp-8],0
0f55:0e13  mov bx,[bp-10h]
0f55:0e16  mov di,es:[bx+10Fh]
0f55:0e1b  or di,di
0f55:0e1d  je short 0E4Ch
0f55:0e1f  mov ax,di
0f55:0e21  mov dx,0Eh
0f55:0e24  imul dx
0f55:0e26  mov bx,ax
0f55:0e28  mov al,[bx+71CEh]
0f55:0e2c  cbw
0f55:0e2d  mov cl,4
0f55:0e2f  shl ax,cl
0f55:0e31  mov bx,ax
0f55:0e33  test word ptr [bx-6B84h],7Fh
0f55:0e39  jne short 0E4Ch
0f55:0e3b  mov ax,di
0f55:0e3d  mov dx,0Eh
0f55:0e40  imul dx
0f55:0e42  mov bx,ax
0f55:0e44  mov al,[bx+71D7h]
0f55:0e48  cbw
0f55:0e49  mov [bp-6],ax
0f55:0e4c  les bx,[bp-10h]
0f55:0e4f  mov di,es:[bx+111h]
0f55:0e54  or di,di
0f55:0e56  je short 0E85h
0f55:0e58  mov ax,di
0f55:0e5a  mov dx,0Eh
0f55:0e5d  imul dx
0f55:0e5f  mov bx,ax
0f55:0e61  mov al,[bx+71CEh]
0f55:0e65  cbw
0f55:0e66  mov cl,4
0f55:0e68  shl ax,cl
0f55:0e6a  mov bx,ax
0f55:0e6c  test word ptr [bx-6B84h],7Fh
0f55:0e72  jne short 0E85h
0f55:0e74  mov ax,di
0f55:0e76  mov dx,0Eh
0f55:0e79  imul dx
0f55:0e7b  mov bx,ax
0f55:0e7d  mov al,[bx+71D7h]
0f55:0e81  cbw
0f55:0e82  mov [bp-8],ax
0f55:0e85  mov ax,[bp-6]
0f55:0e88  cmp ax,[bp-8]
0f55:0e8b  jle short 0E8Fh
0f55:0e8d  jmp short 0E92h
0f55:0e8f  mov ax,[bp-8]
0f55:0e92  mov [bp-6],ax
0f55:0e95  les bx,[bp-10h]
0f55:0e98  mov al,es:[bx+1Fh]
0f55:0e9c  sub al,[bp-6]
0f55:0e9f  mov es:[bx+1Fh],al
0f55:0ea3  les bx,[bp-10h]
0f55:0ea6  cmp byte ptr es:[bx+145h],0
0f55:0eac  jle short 0ED1h
0f55:0eae  mov al,es:[bx+1Fh]
0f55:0eb2  cbw
0f55:0eb3  mov dx,[bp-0Ch]
0f55:0eb6  add dx,6
0f55:0eb9  cmp ax,dx
0f55:0ebb  jle short 0EC8h
0f55:0ebd  mov al,[bp-0Ch]
0f55:0ec0  add al,6
0f55:0ec2  mov es:[bx+1Fh],al
0f55:0ec6  jmp short 0ED1h
0f55:0ec8  les bx,[bp-10h]
0f55:0ecb  mov byte ptr es:[bx+145h],0
0f55:0ed1  les bx,[bp-10h]
0f55:0ed4  mov ax,es:[bx+149h]
0f55:0ed9  and ax,8
0f55:0edc  or ax,0
0f55:0edf  je short 0EEDh
0f55:0ee1  cmp byte ptr es:[bx+1Fh],4
0f55:0ee6  jle short 0EEDh
0f55:0ee8  mov byte ptr es:[bx+1Fh],4
0f55:0eed  les bx,[bp-10h]
0f55:0ef0  mov ax,es:[bx+149h]
0f55:0ef5  and ax,4000h
0f55:0ef8  or ax,0
0f55:0efb  je short 0F3Bh
0f55:0efd  mov word ptr [bp-4],5
0f55:0f02  push word ptr [bp+6]
0f55:0f05  call far 03F9h,10E2h
0f55:0f0a  inc sp
0f55:0f0b  inc sp
0f55:0f0c  cmp ax,5
0f55:0f0f  jle short 0F27h
0f55:0f11  push word ptr [bp+6]
0f55:0f14  call far 03F9h,10E2h
0f55:0f19  inc sp
0f55:0f1a  inc sp
0f55:0f1b  add ax,0FFFBh
0f55:0f1e  mov bx,3
0f55:0f21  cwd
0f55:0f22  idiv bx
0f55:0f24  add [bp-4],ax
0f55:0f27  les bx,[bp-10h]
0f55:0f2a  mov al,es:[bx+1Fh]
0f55:0f2e  cbw
0f55:0f2f  cmp ax,[bp-4]
0f55:0f32  jle short 0F3Bh
0f55:0f34  mov al,[bp-4]
0f55:0f37  mov es:[bx+1Fh],al
0f55:0f3b  les bx,[bp-10h]
0f55:0f3e  cmp byte ptr es:[bx+1Fh],0F6h
0f55:0f43  jge short 0F4Ah
0f55:0f45  mov byte ptr es:[bx+1Fh],0F6h
0f55:0f4a  pop di
0f55:0f4b  pop si
0f55:0f4c  mov sp,bp
0f55:0f4e  pop bp
0f55:0f4f  ret far

; Candidate 0f55:0f50, file offset 0x136a0
0f55:0f50  push bp
0f55:0f51  mov bp,sp
0f55:0f53  dec sp
0f55:0f54  dec sp
0f55:0f55  push si
0f55:0f56  mov si,[bp+8]
0f55:0f59  mov ax,4
0f55:0f5c  push ax
0f55:0f5d  push word ptr [bp+6]
0f55:0f60  call far 069Fh,0E24h
0f55:0f65  add sp,4
0f55:0f68  mov [bp-2],ax
0f55:0f6b  mov al,0
0f55:0f6d  push ax
0f55:0f6e  mov al,14h
0f55:0f70  push ax
0f55:0f71  mov al,1
0f55:0f73  push ax
0f55:0f74  call far 0505h,08D7h
0f55:0f79  add sp,6
0f55:0f7c  cmp ax,[bp-2]
0f55:0f7f  jl short 0F83h
0f55:0f81  sar si,1
0f55:0f83  mov ax,si
0f55:0f85  pop si
0f55:0f86  mov sp,bp
0f55:0f88  pop bp
0f55:0f89  ret far

; Candidate 0f55:0f8a, file offset 0x136da
0f55:0f8a  push bp
0f55:0f8b  mov bp,sp
0f55:0f8d  push si
0f55:0f8e  cmp word ptr [bp+0Eh],5
0f55:0f92  jne short 0F99h
0f55:0f94  xor ax,ax
0f55:0f96  jmp 1021h
0f55:0f99  mov al,[bp+0Eh]
0f55:0f9c  push ax
0f55:0f9d  mov al,[bp+0Ch]
0f55:0fa0  push ax
0f55:0fa1  mov al,[bp+0Ah]
0f55:0fa4  push ax
0f55:0fa5  call far 000Dh,0B54h
0f55:0faa  add sp,6
0f55:0fad  mov si,ax
0f55:0faf  mov ax,[bp+10h]
0f55:0fb2  cmp ax,3
0f55:0fb5  je short 0FC3h
0f55:0fb7  cmp ax,4
0f55:0fba  je short 0FE8h
0f55:0fbc  cmp ax,5
0f55:0fbf  je short 0FC3h
0f55:0fc1  jmp short 1005h
0f55:0fc3  cmp word ptr [bp+0Eh],1
0f55:0fc7  je short 0FD5h
0f55:0fc9  cmp word ptr [bp+0Eh],0
0f55:0fcd  je short 0FD5h
0f55:0fcf  cmp word ptr [bp+0Eh],4
0f55:0fd3  jne short 1005h
0f55:0fd5  les bx,[bp+6]
0f55:0fd8  mov al,es:[bx+17h]
0f55:0fdc  cbw
0f55:0fdd  mov bx,ax
0f55:0fdf  mov al,[bx+5545h]
0f55:0fe3  cbw
0f55:0fe4  sub si,ax
0f55:0fe6  jmp short 1005h
0f55:0fe8  cmp word ptr [bp+0Eh],4
0f55:0fec  je short 0FF4h
0f55:0fee  cmp word ptr [bp+0Eh],1
0f55:0ff2  jne short 1005h
0f55:0ff4  les bx,[bp+6]
0f55:0ff7  mov al,es:[bx+17h]
0f55:0ffb  cbw
0f55:0ffc  mov bx,ax
0f55:0ffe  mov al,[bx+5545h]
0f55:1002  cbw
0f55:1003  sub si,ax
0f55:1005  mov al,0
0f55:1007  push ax
0f55:1008  mov al,14h
0f55:100a  push ax
0f55:100b  mov al,1
0f55:100d  push ax
0f55:100e  call far 0505h,08D7h
0f55:1013  add sp,6
0f55:1016  cmp ax,si
0f55:1018  jl short 101Fh
0f55:101a  mov ax,1
0f55:101d  jmp short 1021h
0f55:101f  xor ax,ax
0f55:1021  pop si
0f55:1022  pop bp
0f55:1023  ret far

; Candidate 0f55:104d, file offset 0x1379d
0f55:104d  push bp
0f55:104e  mov bp,sp
0f55:1050  les bx,[bp+6]
0f55:1053  mov ax,[bp+0Ah]
0f55:1056  sub es:[bx+0Eh],ax
0f55:105a  and byte ptr es:[bx+16h],0F7h
0f55:105f  or byte ptr es:[bx+16h],1
0f55:1064  mov al,es:[bx]
0f55:1067  cbw
0f55:1068  mov dx,2Eh
0f55:106b  imul dx
0f55:106d  mov bx,ax
0f55:106f  mov ax,[bx-32D4h]
0f55:1073  and ax,2000h
0f55:1076  or ax,0
0f55:1079  je short 10A2h
0f55:107b  push word ptr [bp+8]
0f55:107e  push word ptr [bp+6]
0f55:1081  call far 1854h,0F55h
0f55:1086  add sp,4
0f55:1089  les bx,[bp+6]
0f55:108c  push word ptr es:[bx+2]
0f55:1090  call far 5,0E24h
0f55:1095  inc sp
0f55:1096  inc sp
0f55:1097  les bx,[bp+6]
0f55:109a  mov word ptr es:[bx+0Eh],0
0f55:10a0  jmp short 10D1h
0f55:10a2  les bx,[bp+6]
0f55:10a5  push word ptr es:[bx+2]
0f55:10a9  call far 5,0E24h
0f55:10ae  inc sp
0f55:10af  inc sp
0f55:10b0  or ax,ax
0f55:10b2  je short 10D1h
0f55:10b4  les bx,[bp+6]
0f55:10b7  or byte ptr es:[bx+16h],2
0f55:10bc  cmp word ptr [0E5A2h],0
0f55:10c1  jne short 1110h
0f55:10c3  push word ptr [bp+8]
0f55:10c6  push word ptr [bp+6]
0f55:10c9  call far 106Eh,0997h
0f55:10ce  add sp,4
0f55:10d1  les bx,[bp+6]
0f55:10d4  cmp word ptr es:[bx+0Eh],0
0f55:10d9  jg short 10EEh
0f55:10db  push word ptr [bp+0Ch]
0f55:10de  push word ptr [bp+8]
0f55:10e1  push word ptr [bp+6]
0f55:10e4  call far 114Eh,0997h
0f55:10e9  add sp,6
0f55:10ec  jmp short 1110h
0f55:10ee  push word ptr [6DD2h]
0f55:10f2  les bx,[bp+6]
0f55:10f5  push word ptr es:[bx+2]
0f55:10f9  call far 0FD8h,1A68h
0f55:10fe  add sp,4
0f55:1101  cmp ax,4
0f55:1104  jge short 1110h
0f55:1106  les bx,[bp+6]
0f55:1109  mov ax,[6DD2h]
0f55:110c  mov es:[bx+10h],ax
0f55:1110  pop bp
0f55:1111  ret far

; Candidate 0f55:1112, file offset 0x13862
0f55:1112  push bp
0f55:1113  mov bp,sp
0f55:1115  sub sp,0Ah
0f55:1118  push si
0f55:1119  push di
0f55:111a  test word ptr [bp+10h],100h
0f55:111f  je short 115Ch
0f55:1121  mov ax,[bp+0Ah]
0f55:1124  mov [bp-2],ax
0f55:1127  mov ax,[bp+0Ch]
0f55:112a  mov [bp-4],ax
0f55:112d  mov ax,[bp+0Eh]
0f55:1130  mov [bp-6],ax
0f55:1133  mov al,[bp-6]
0f55:1136  push ax
0f55:1137  mov ax,[bp-4]
0f55:113a  mov dx,0Eh
0f55:113d  imul dx
0f55:113f  mov bx,ax
0f55:1141  mov al,[bx+71CEh]
0f55:1145  cbw
0f55:1146  push ax
0f55:1147  push word ptr [bp-4]
0f55:114a  push word ptr [bp+8]
0f55:114d  push word ptr [bp+6]
0f55:1150  push word ptr [bp-2]
0f55:1153  push cs
0f55:1154  call 0192h
0f55:1157  add sp,0Ch
0f55:115a  jmp short 1170h
0f55:115c  mov al,[bp+0Eh]
0f55:115f  push ax
0f55:1160  mov al,[bp+0Ch]
0f55:1163  push ax
0f55:1164  mov al,[bp+0Ah]
0f55:1167  push ax
0f55:1168  call far 0505h,08D7h
0f55:116d  add sp,6
0f55:1170  mov si,ax
0f55:1172  les bx,[bp+6]
0f55:1175  mov al,es:[bx]
0f55:1178  cbw
0f55:1179  mov dx,2Eh
0f55:117c  imul dx
0f55:117e  add ax,0CD1Ah
0f55:1181  mov [bp-8],ds
0f55:1184  mov [bp-0Ah],ax
0f55:1187  cmp word ptr [bp+12h],5
0f55:118b  je short 11BEh
0f55:118d  mov ax,6
0f55:1190  push ax
0f55:1191  push word ptr [bp+12h]
0f55:1194  les bx,[bp-0Ah]
0f55:1197  mov al,es:[bx+2]
0f55:119b  cbw
0f55:119c  push ax
0f55:119d  xor ax,ax
0f55:119f  push ax
0f55:11a0  push word ptr [bp+8]
0f55:11a3  push word ptr [bp+6]
0f55:11a6  push cs
0f55:11a7  call 0F8Ah
0f55:11aa  add sp,0Ch
0f55:11ad  or ax,ax
0f55:11af  je short 11BEh
0f55:11b1  push si
0f55:11b2  push word ptr [bp+14h]
0f55:11b5  push cs
0f55:11b6  call 1024h
0f55:11b9  add sp,4
0f55:11bc  mov si,ax
0f55:11be  mov ax,[bp+10h]
0f55:11c1  and ax,110h
0f55:11c4  cmp ax,110h
0f55:11c7  jne short 11E6h
0f55:11c9  mov ax,[bp-4]
0f55:11cc  mov dx,0Eh
0f55:11cf  imul dx
0f55:11d1  mov bx,ax
0f55:11d3  mov al,[bx+71CEh]
0f55:11d7  cbw
0f55:11d8  push ax
0f55:11d9  push cs
0f55:11da  call 0251h
0f55:11dd  inc sp
0f55:11de  inc sp
0f55:11df  or ax,ax
0f55:11e1  jne short 11E6h
0f55:11e3  mov si,1
0f55:11e6  test word ptr [bp+10h],100h
0f55:11eb  je short 1208h
0f55:11ed  les bx,[bp-0Ah]
0f55:11f0  test word ptr es:[bx+10h],100h
0f55:11f6  je short 1208h
0f55:11f8  mov bx,[bp-4]
0f55:11fb  mov cl,4
0f55:11fd  shl bx,cl
0f55:11ff  test byte ptr [bx-6B8Dh],4
0f55:1204  jne short 1208h
0f55:1206  sar si,1
0f55:1208  test word ptr [bp+10h],100h
0f55:120d  je short 1259h
0f55:120f  les bx,[bp-0Ah]
0f55:1212  test word ptr es:[bx+10h],2000h
0f55:1218  je short 1259h
0f55:121a  mov ax,[bp-4]
0f55:121d  mov dx,0Eh
0f55:1220  imul dx
0f55:1222  mov bx,ax
0f55:1224  cmp byte ptr [bx+71D7h],3
0f55:1229  jge short 122Fh
0f55:122b  sar si,1
0f55:122d  sar si,1
0f55:122f  mov ax,[bp-4]
0f55:1232  mov dx,0Eh
0f55:1235  imul dx
0f55:1237  mov bx,ax
0f55:1239  cmp byte ptr [bx+71D7h],3
0f55:123e  jne short 1242h
0f55:1240  sar si,1
0f55:1242  or si,si
0f55:1244  jne short 1266h
0f55:1246  mov ax,[bp-4]
0f55:1249  mov dx,0Eh
0f55:124c  imul dx
0f55:124e  mov bx,ax
0f55:1250  mov al,[bx+71D7h]
0f55:1254  cbw
0f55:1255  mov si,ax
0f55:1257  jmp short 1266h
0f55:1259  les bx,[bp-0Ah]
0f55:125c  test word ptr es:[bx+10h],2000h
0f55:1262  je short 1266h
0f55:1264  sar si,1
0f55:1266  test word ptr [bp+10h],1
0f55:126b  je short 1281h
0f55:126d  push word ptr [bp+8]
0f55:1270  push word ptr [bp+6]
0f55:1273  call far 0A76h,0E24h
0f55:1278  add sp,4
0f55:127b  or ax,ax
0f55:127d  je short 1281h
0f55:127f  xor si,si
0f55:1281  xor di,di
0f55:1283  jmp short 12ABh
0f55:1285  mov bx,di
0f55:1287  shl bx,1
0f55:1289  mov ax,[bp+10h]
0f55:128c  test [bx+5559h],ax
0f55:1290  je short 12A9h
0f55:1292  les bx,[bp-0Ah]
0f55:1295  push es
0f55:1296  push bx
0f55:1297  mov bx,di
0f55:1299  shl bx,1
0f55:129b  mov ax,[bx+555Bh]
0f55:129f  pop bx
0f55:12a0  pop es
0f55:12a1  test es:[bx+10h],ax
0f55:12a5  je short 12A9h
0f55:12a7  xor si,si
0f55:12a9  inc di
0f55:12aa  inc di
0f55:12ab  cmp di,0Ch
0f55:12ae  jl short 1285h
0f55:12b0  mov ax,si
0f55:12b2  pop di
0f55:12b3  pop si
0f55:12b4  mov sp,bp
0f55:12b6  pop bp
0f55:12b7  ret far

; Candidate 0f55:12b8, file offset 0x13a08
0f55:12b8  push bp
0f55:12b9  mov bp,sp
0f55:12bb  dec sp
0f55:12bc  dec sp
0f55:12bd  push si
0f55:12be  push di
0f55:12bf  mov si,[bp+10h]
0f55:12c2  push word ptr [bp+14h]
0f55:12c5  push word ptr [bp+12h]
0f55:12c8  push si
0f55:12c9  push word ptr [bp+0Eh]
0f55:12cc  push word ptr [bp+0Ch]
0f55:12cf  push word ptr [bp+0Ah]
0f55:12d2  push word ptr [bp+8]
0f55:12d5  push word ptr [bp+6]
0f55:12d8  push cs
0f55:12d9  call 1112h
0f55:12dc  add sp,10h
0f55:12df  mov di,ax
0f55:12e1  mov ax,si
0f55:12e3  and ax,800h
0f55:12e6  mov [bp-2],ax
0f55:12e9  or di,di
0f55:12eb  jle short 12FEh
0f55:12ed  push word ptr [bp-2]
0f55:12f0  push di
0f55:12f1  push word ptr [bp+8]
0f55:12f4  push word ptr [bp+6]
0f55:12f7  push cs
0f55:12f8  call 104Dh
0f55:12fb  add sp,8
0f55:12fe  pop di
0f55:12ff  pop si
0f55:1300  mov sp,bp
0f55:1302  pop bp
0f55:1303  ret far

; Candidate 0f55:143e, file offset 0x13b8e
0f55:143e  push bp
0f55:143f  mov bp,sp
0f55:1441  push si
0f55:1442  push di
0f55:1443  mov si,[bp+6]
0f55:1446  push word ptr [bp+12h]
0f55:1449  push word ptr [bp+10h]
0f55:144c  push word ptr [bp+0Eh]
0f55:144f  push word ptr [bp+0Ch]
0f55:1452  push word ptr [bp+0Ah]
0f55:1455  push word ptr [bp+8]
0f55:1458  push ds
0f55:1459  mov ax,si
0f55:145b  mov dx,159h
0f55:145e  imul dx
0f55:1460  add ax,0E608h
0f55:1463  push ax
0f55:1464  push cs
0f55:1465  call 1304h
0f55:1468  add sp,10h
0f55:146b  mov di,ax
0f55:146d  or di,di
0f55:146f  je short 147Bh
0f55:1471  push di
0f55:1472  push si
0f55:1473  call far 14ACh,0F55h
0f55:1478  add sp,4
0f55:147b  pop di
0f55:147c  pop si
0f55:147d  pop bp
0f55:147e  ret far

; Candidate 0f55:14ac, file offset 0x13bfc
0f55:14ac  push bp
0f55:14ad  mov bp,sp
0f55:14af  sub sp,4
0f55:14b2  mov ax,[bp+6]
0f55:14b5  mov dx,159h
0f55:14b8  imul dx
0f55:14ba  add ax,0E608h
0f55:14bd  mov [bp-2],ds
0f55:14c0  mov [bp-4],ax
0f55:14c3  mov ax,3
0f55:14c6  push ax
0f55:14c7  push word ptr [bp+6]
0f55:14ca  call far 06E9h,0E24h
0f55:14cf  add sp,4
0f55:14d2  or ax,ax
0f55:14d4  jne short 14D9h
0f55:14d6  jmp 15D2h
0f55:14d9  les bx,[bp-4]
0f55:14dc  cmp byte ptr es:[bx+148h],0
0f55:14e2  je short 14FFh
0f55:14e4  mov al,es:[bx+148h]
0f55:14e9  sub al,[bp+8]
0f55:14ec  mov es:[bx+148h],al
0f55:14f1  cmp byte ptr es:[bx+148h],0
0f55:14f7  jge short 14FFh
0f55:14f9  mov byte ptr es:[bx+148h],0
0f55:14ff  les bx,[bp-4]
0f55:1502  mov ax,[bp+8]
0f55:1505  sub es:[bx+1Bh],ax
0f55:1509  mov al,[bp+8]
0f55:150c  mov es:[bx+14Dh],al
0f55:1511  cmp word ptr es:[bx+1Bh],0FFF6h
0f55:1516  jg short 152Ah
0f55:1518  push word ptr [bp-2]
0f55:151b  push word ptr [bp-4]
0f55:151e  push word ptr [bp+6]
0f55:1521  push cs
0f55:1522  call 147Fh
0f55:1525  add sp,6
0f55:1528  jmp short 1535h
0f55:152a  mov ax,15h
0f55:152d  push ax
0f55:152e  call far 00AAh,1C9Fh
0f55:1533  inc sp
0f55:1534  inc sp
0f55:1535  les bx,[bp-4]
0f55:1538  cmp byte ptr es:[bx+145h],0
0f55:153e  jle short 156Bh
0f55:1540  mov al,es:[bx+145h]
0f55:1545  sub al,[bp+8]
0f55:1548  mov es:[bx+145h],al
0f55:154d  cmp byte ptr es:[bx+145h],0
0f55:1553  jg short 156Bh
0f55:1555  mov byte ptr es:[bx+145h],0
0f55:155b  mov ax,1
0f55:155e  push ax
0f55:155f  push word ptr [bp+6]
0f55:1562  push ax
0f55:1563  call far 0C6Dh,10E2h
0f55:1568  add sp,6
0f55:156b  cmp byte ptr [0EE3Ah],0
0f55:1570  jne short 157Eh
0f55:1572  push word ptr [bp+6]
0f55:1575  call far 0AF9h,1901h
0f55:157a  inc sp
0f55:157b  inc sp
0f55:157c  jmp short 1592h
0f55:157e  call far 030Fh,238Bh
0f55:1583  push word ptr [bp+6]
0f55:1586  call far 05AAh,1901h
0f55:158b  inc sp
0f55:158c  inc sp
0f55:158d  call far 033Ah,238Bh
0f55:1592  les bx,[bp-4]
0f55:1595  cmp word ptr es:[bx+1Bh],0
0f55:159a  jg short 15B9h
0f55:159c  cmp byte ptr [0E441h],1
0f55:15a1  jne short 15B9h
0f55:15a3  mov al,[0D0B0h]
0f55:15a6  cbw
0f55:15a7  cmp ax,[bp+6]
0f55:15aa  jne short 15B9h
0f55:15ac  push ds
0f55:15ad  mov ax,0E5CAh
0f55:15b0  push ax
0f55:15b1  call far 14A7h,10E2h
0f55:15b6  add sp,4
0f55:15b9  mov al,1
0f55:15bb  push ax
0f55:15bc  mov al,6
0f55:15be  push ax
0f55:15bf  xor ax,ax
0f55:15c1  mov dx,12h
0f55:15c4  push ax
0f55:15c5  push dx
0f55:15c6  mov al,[bp+6]
0f55:15c9  push ax
0f55:15ca  call far 06B7h,17B7h
0f55:15cf  add sp,0Ah
0f55:15d2  mov sp,bp
0f55:15d4  pop bp
0f55:15d5  ret far

; Candidate 0f55:15d6, file offset 0x13d26
0f55:15d6  push bp
0f55:15d7  mov bp,sp
0f55:15d9  push si
0f55:15da  mov si,[bp+0Eh]
0f55:15dd  mov ax,[bp+6]
0f55:15e0  mov dx,159h
0f55:15e3  imul dx
0f55:15e5  mov bx,ax
0f55:15e7  mov al,[bx-19F7h]
0f55:15eb  mov ah,0
0f55:15ed  test [bp+8],ax
0f55:15f0  je short 15FBh
0f55:15f2  cmp word ptr [bp+16h],0
0f55:15f6  je short 15FBh
0f55:15f8  jmp 16F8h
0f55:15fb  mov ax,3
0f55:15fe  push ax
0f55:15ff  push word ptr [bp+6]
0f55:1602  call far 06E9h,0E24h
0f55:1607  add sp,4
0f55:160a  or ax,ax
0f55:160c  jne short 1611h
0f55:160e  jmp 16F8h
0f55:1611  cmp si,5
0f55:1614  je short 1629h
0f55:1616  push si
0f55:1617  push word ptr [bp+6]
0f55:161a  call far 069Fh,0E24h
0f55:161f  add sp,4
0f55:1622  or ax,ax
0f55:1624  je short 1629h
0f55:1626  jmp 16F8h
0f55:1629  test word ptr [bp+8],8
0f55:162e  je short 165Ah
0f55:1630  push word ptr [bp+6]
0f55:1633  call far 2AFBh,10E2h
0f55:1638  inc sp
0f55:1639  inc sp
0f55:163a  mov ax,[bp+6]
0f55:163d  mov dx,159h
0f55:1640  imul dx
0f55:1642  mov bx,ax
0f55:1644  and byte ptr [bx-19F7h],1
0f55:1649  mov ax,[bp+6]
0f55:164c  mov dx,159h
0f55:164f  imul dx
0f55:1651  mov bx,ax
0f55:1653  or byte ptr [bx-19F7h],8
0f55:1658  jmp short 166Bh
0f55:165a  mov ax,[bp+6]
0f55:165d  mov dx,159h
0f55:1660  imul dx
0f55:1662  mov dl,[bp+8]
0f55:1665  mov bx,ax
0f55:1667  or [bx-19F7h],dl
0f55:166b  test word ptr [bp+8],0Ch
0f55:1670  je short 168Fh
0f55:1672  cmp byte ptr [0E441h],0
0f55:1677  je short 168Fh
0f55:1679  mov al,[0D0B0h]
0f55:167c  cbw
0f55:167d  cmp ax,[bp+6]
0f55:1680  jne short 168Fh
0f55:1682  push ds
0f55:1683  mov ax,0E5CAh
0f55:1686  push ax
0f55:1687  call far 14A7h,10E2h
0f55:168c  add sp,4
0f55:168f  mov ax,[bp+10h]
0f55:1692  or ax,[bp+12h]
0f55:1695  je short 16BCh
0f55:1697  mov al,1
0f55:1699  push ax
0f55:169a  mov al,[bp+14h]
0f55:169d  push ax
0f55:169e  mov cx,[bp+12h]
0f55:16a1  mov bx,[bp+10h]
0f55:16a4  xor dx,dx
0f55:16a6  mov ax,222h
0f55:16a9  call far 8537h,0
0f55:16ae  push dx
0f55:16af  push ax
0f55:16b0  mov al,[bp+6]
0f55:16b3  push ax
0f55:16b4  call far 06B7h,17B7h
0f55:16b9  add sp,0Ah
0f55:16bc  push word ptr [bp+6]
0f55:16bf  call far 0AF9h,1901h
0f55:16c4  inc sp
0f55:16c5  inc sp
0f55:16c6  push word ptr [bp+0Ch]
0f55:16c9  push word ptr [bp+0Ah]
0f55:16cc  push ds
0f55:16cd  mov ax,[bp+6]
0f55:16d0  mov dx,159h
0f55:16d3  imul dx
0f55:16d5  add ax,0E60Ah
0f55:16d8  push ax
0f55:16d9  push ds
0f55:16da  mov ax,55CFh
0f55:16dd  push ax
0f55:16de  push ds
0f55:16df  mov ax,0F16Eh
0f55:16e2  push ax
0f55:16e3  call far 64A1h,0
0f55:16e8  add sp,10h
0f55:16eb  push ds
0f55:16ec  mov ax,0F16Eh
0f55:16ef  push ax
0f55:16f0  call far 0284h,21B0h
0f55:16f5  add sp,4
0f55:16f8  pop si
0f55:16f9  pop bp
0f55:16fa  ret far

; Candidate 0f55:16fb, file offset 0x13e4b
0f55:16fb  push bp
0f55:16fc  mov bp,sp
0f55:16fe  sub sp,4
0f55:1701  push si
0f55:1702  push di
0f55:1703  mov si,[bp+0Ah]
0f55:1706  les bx,[bp+6]
0f55:1709  mov al,es:[bx]
0f55:170c  cbw
0f55:170d  mov dx,2Eh
0f55:1710  imul dx
0f55:1712  add ax,0CD1Ah
0f55:1715  mov [bp-2],ds
0f55:1718  mov [bp-4],ax
0f55:171b  cmp word ptr [bp+0Ch],1
0f55:171f  jne short 1744h
0f55:1721  push word ptr [bp+8]
0f55:1724  push word ptr [bp+6]
0f55:1727  call far 0A76h,0E24h
0f55:172c  add sp,4
0f55:172f  or ax,ax
0f55:1731  jne short 173Eh
0f55:1733  les bx,[bp-4]
0f55:1736  test word ptr es:[bx+10h],10h
0f55:173c  je short 1744h
0f55:173e  mov ax,0FFFFh
0f55:1741  jmp 1840h
0f55:1744  mov ax,6
0f55:1747  push ax
0f55:1748  push word ptr [bp+0Eh]
0f55:174b  les bx,[bp-4]
0f55:174e  mov al,es:[bx+2]
0f55:1752  cbw
0f55:1753  push ax
0f55:1754  xor ax,ax
0f55:1756  push ax
0f55:1757  push word ptr [bp+8]
0f55:175a  push word ptr [bp+6]
0f55:175d  push cs
0f55:175e  call 0F8Ah
0f55:1761  add sp,0Ch
0f55:1764  or ax,ax
0f55:1766  je short 176Dh
0f55:1768  xor ax,ax
0f55:176a  jmp 1840h
0f55:176d  mov bx,si
0f55:176f  cmp bx,6
0f55:1772  jbe short 1777h
0f55:1774  jmp 183Dh
0f55:1777  shl bx,1
0f55:1779  jmp word ptr cs:[bx+1846h]
0f55:177e  cmp si,1
0f55:1781  jne short 179Dh
0f55:1783  les bx,[bp-4]
0f55:1786  mov ax,es:[bx+16h]
0f55:178a  and ax,2
0f55:178d  or ax,0
0f55:1790  je short 1797h
0f55:1792  mov ax,1
0f55:1795  jmp short 1799h
0f55:1797  xor ax,ax
0f55:1799  mov di,ax
0f55:179b  jmp short 17BEh
0f55:179d  or si,si
0f55:179f  jne short 17BBh
0f55:17a1  les bx,[bp-4]
0f55:17a4  mov ax,es:[bx+16h]
0f55:17a8  and ax,1
0f55:17ab  or ax,0
0f55:17ae  je short 17B5h
0f55:17b0  mov ax,1
0f55:17b3  jmp short 17B7h
0f55:17b5  xor ax,ax
0f55:17b7  mov di,ax
0f55:17b9  jmp short 17BEh
0f55:17bb  mov di,1
0f55:17be  or di,di
0f55:17c0  je short 183Dh
0f55:17c2  les bx,[bp-4]
0f55:17c5  test word ptr es:[bx+10h],2
0f55:17cb  jne short 183Dh
0f55:17cd  les bx,[bp+6]
0f55:17d0  mov byte ptr es:[bx+8],0Ah
0f55:17d5  mov byte ptr es:[bx+0Bh],0Fh
0f55:17da  jmp short 183Dh
0f55:17dc  les bx,[bp-4]
0f55:17df  test word ptr es:[bx+10h],8
0f55:17e5  jne short 183Dh
0f55:17e7  mov ax,1
0f55:17ea  push ax
0f55:17eb  mov ax,3E8h
0f55:17ee  push ax
0f55:17ef  push word ptr [bp+8]
0f55:17f2  push word ptr [bp+6]
0f55:17f5  push cs
0f55:17f6  call 104Dh
0f55:17f9  add sp,8
0f55:17fc  jmp short 183Dh
0f55:17fe  mov ax,1
0f55:1801  push ax
0f55:1802  mov ax,3E8h
0f55:1805  push ax
0f55:1806  push word ptr [bp+8]
0f55:1809  push word ptr [bp+6]
0f55:180c  push cs
0f55:180d  call 104Dh
0f55:1810  add sp,8
0f55:1813  jmp short 183Dh
0f55:1815  les bx,[bp+6]
0f55:1818  or byte ptr es:[bx+16h],20h
0f55:181d  mov byte ptr [0D0AAh],1
0f55:1822  jmp short 183Dh
0f55:1824  les bx,[bp-4]
0f55:1827  test word ptr es:[bx+10h],4
0f55:182d  jne short 183Dh
0f55:182f  push word ptr [bp+8]
0f55:1832  push word ptr [bp+6]
0f55:1835  call far 01D9h,0997h
0f55:183a  add sp,4
0f55:183d  mov ax,1
0f55:1840  pop di
0f55:1841  pop si
0f55:1842  mov sp,bp
0f55:1844  pop bp
0f55:1845  ret far

; Candidate 0f55:1854, file offset 0x13fa4
0f55:1854  push bp
0f55:1855  mov bp,sp
0f55:1857  push si
0f55:1858  les bx,[bp+6]
0f55:185b  or byte ptr es:[bx+16h],2
0f55:1860  push word ptr [6DD2h]
0f55:1864  push word ptr es:[bx+2]
0f55:1868  call far 0FD8h,1A68h
0f55:186d  add sp,4
0f55:1870  cmp ax,2
0f55:1873  jge short 18B2h
0f55:1875  xor ax,ax
0f55:1877  xor dx,dx
0f55:1879  push ax
0f55:187a  push dx
0f55:187b  mov ax,2
0f55:187e  push ax
0f55:187f  push word ptr [6DD2h]
0f55:1883  call far 1EF9h,10E2h
0f55:1888  add sp,8
0f55:188b  xor si,si
0f55:188d  jmp short 18ABh
0f55:188f  xor ax,ax
0f55:1891  push ax
0f55:1892  mov ax,1
0f55:1895  push ax
0f55:1896  mov ax,8
0f55:1899  push ax
0f55:189a  xor ax,ax
0f55:189c  push ax
0f55:189d  mov ax,6
0f55:18a0  push ax
0f55:18a1  push ax
0f55:18a2  push si
0f55:18a3  push cs
0f55:18a4  call 143Eh
0f55:18a7  add sp,0Eh
0f55:18aa  inc si
0f55:18ab  cmp si,6
0f55:18ae  jl short 188Fh
0f55:18b0  jmp short 18CBh
0f55:18b2  xor ax,ax
0f55:18b4  xor dx,dx
0f55:18b6  push ax
0f55:18b7  push dx
0f55:18b8  mov ax,2
0f55:18bb  push ax
0f55:18bc  les bx,[bp+6]
0f55:18bf  push word ptr es:[bx+2]
0f55:18c3  call far 1EF9h,10E2h
0f55:18c8  add sp,8
0f55:18cb  les bx,[bp+6]
0f55:18ce  and byte ptr es:[bx+16h],0FDh
0f55:18d3  pop si
0f55:18d4  pop bp
0f55:18d5  ret far

; Candidate 10e2:0032, file offset 0x14052
10e2:0032  push bp
10e2:0033  mov bp,sp
10e2:0035  push ds
10e2:0036  mov ax,5711h
10e2:0039  push ax
10e2:003a  call far 0BE6h,08D7h
10e2:003f  add sp,4
10e2:0042  pop bp
10e2:0043  ret far

; Candidate 10e2:0044, file offset 0x14064
10e2:0044  push bp
10e2:0045  mov bp,sp
10e2:0047  push si
10e2:0048  mov si,[bp+6]
10e2:004b  cmp si,0Bh
10e2:004e  jb short 005Ah
10e2:0050  cmp si,11h
10e2:0053  ja short 005Ah
10e2:0055  mov ax,1
10e2:0058  jmp short 005Ch
10e2:005a  xor ax,ax
10e2:005c  pop si
10e2:005d  pop bp
10e2:005e  ret far

; Candidate 10e2:005f, file offset 0x1407f
10e2:005f  push bp
10e2:0060  mov bp,sp
10e2:0062  push si
10e2:0063  mov si,[bp+6]
10e2:0066  mov ax,si
10e2:0068  mov dx,159h
10e2:006b  imul dx
10e2:006d  mov bx,ax
10e2:006f  and byte ptr [bx-19F7h],0FDh
10e2:0074  mov ax,si
10e2:0076  mov dx,159h
10e2:0079  imul dx
10e2:007b  mov bx,ax
10e2:007d  and word ptr [bx-18AFh],0DFFFh
10e2:0083  and word ptr [bx-18ADh],0FFFFh
10e2:0089  mov ax,0FFDEh
10e2:008c  push ax
10e2:008d  push si
10e2:008e  call far 0D76h,17B7h
10e2:0093  add sp,4
10e2:0096  push si
10e2:0097  call far 0AF9h,1901h
10e2:009c  inc sp
10e2:009d  inc sp
10e2:009e  pop si
10e2:009f  pop bp
10e2:00a0  ret far

; Candidate 10e2:00a1, file offset 0x140c1
10e2:00a1  push bp
10e2:00a2  mov bp,sp
10e2:00a4  sub sp,4
10e2:00a7  push si
10e2:00a8  cmp byte ptr [0E4C6h],1
10e2:00ad  jne short 00BBh
10e2:00af  mov al,[0D0B0h]
10e2:00b2  cbw
10e2:00b3  push ax
10e2:00b4  call far 03F9h,10E2h
10e2:00b9  jmp short 00C5h
10e2:00bb  mov al,[0D0B0h]
10e2:00be  cbw
10e2:00bf  push ax
10e2:00c0  call far 0390h,10E2h
10e2:00c5  inc sp
10e2:00c6  inc sp
10e2:00c7  mov si,ax
10e2:00c9  mov ax,[bp+8]
10e2:00cc  cwd
10e2:00cd  push ax
10e2:00ce  push dx
10e2:00cf  mov dx,[bp+0Ch]
10e2:00d2  mov ax,[bp+0Ah]
10e2:00d5  pop cx
10e2:00d6  pop bx
10e2:00d7  call far 8537h,0
10e2:00dc  push ax
10e2:00dd  mov ax,[bp+0Eh]
10e2:00e0  push dx
10e2:00e1  imul si
10e2:00e3  cwd
10e2:00e4  push ax
10e2:00e5  push dx
10e2:00e6  mov dx,[bp+0Ch]
10e2:00e9  mov ax,[bp+0Ah]
10e2:00ec  pop cx
10e2:00ed  pop bx
10e2:00ee  call far 8537h,0
10e2:00f3  pop bx
10e2:00f4  pop cx
10e2:00f5  add cx,ax
10e2:00f7  adc bx,dx
10e2:00f9  mov [bp-2],bx
10e2:00fc  mov [bp-4],cx
10e2:00ff  mov al,[bp+10h]
10e2:0102  push ax
10e2:0103  mov al,[bp+6]
10e2:0106  neg al
10e2:0108  push ax
10e2:0109  push word ptr [bp-2]
10e2:010c  push word ptr [bp-4]
10e2:010f  mov al,[0CBC2h]
10e2:0112  push ax
10e2:0113  call far 06B7h,17B7h
10e2:0118  add sp,0Ah
10e2:011b  pop si
10e2:011c  mov sp,bp
10e2:011e  pop bp
10e2:011f  ret far

; Candidate 10e2:023d, file offset 0x1425d
10e2:023d  push bp
10e2:023e  mov bp,sp
10e2:0240  sub sp,4
10e2:0243  push si
10e2:0244  mov [bp-2],ds
10e2:0247  mov word ptr [bp-4],979Eh
10e2:024c  mov si,33h
10e2:024f  jmp short 0260h
10e2:0251  les bx,[bp-4]
10e2:0254  cmp byte ptr es:[bx+4],0E2h
10e2:0259  je short 0265h
10e2:025b  inc si
10e2:025c  add word ptr [bp-4],10h
10e2:0260  cmp si,39h
10e2:0263  jl short 0251h
10e2:0265  cmp si,39h
10e2:0268  jne short 026Fh
10e2:026a  mov ax,0FFFFh
10e2:026d  jmp short 02C0h
10e2:026f  mov al,[bp+6]
10e2:0272  mov ah,0
10e2:0274  les bx,[bp-4]
10e2:0277  mov es:[bx],ax
10e2:027a  mov byte ptr es:[bx+6],0
10e2:027f  mov al,[bp+8]
10e2:0282  mov ah,0
10e2:0284  mov es:[bx+2],ax
10e2:0288  mov al,[bp+0Ah]
10e2:028b  mov es:[bx+4],al
10e2:028f  mov al,[bp+0Ch]
10e2:0292  mov es:[bx+5],al
10e2:0296  mov al,[bp+0Eh]
10e2:0299  mov es:[bx+0Ah],al
10e2:029d  mov es:[bx+7],al
10e2:02a1  mov al,[bp+10h]
10e2:02a4  mov es:[bx+0Bh],al
10e2:02a8  mov es:[bx+8],al
10e2:02ac  mov al,[bp+12h]
10e2:02af  mov es:[bx+0Ch],al
10e2:02b3  mov es:[bx+9],al
10e2:02b7  mov ax,[bp+14h]
10e2:02ba  mov es:[bx+0Eh],ax
10e2:02be  mov ax,si
10e2:02c0  pop si
10e2:02c1  mov sp,bp
10e2:02c3  pop bp
10e2:02c4  ret far

; Candidate 10e2:02c5, file offset 0x142e5
10e2:02c5  push bp
10e2:02c6  mov bp,sp
10e2:02c8  push si
10e2:02c9  mov si,[bp+6]
10e2:02cc  mov ax,si
10e2:02ce  mov dx,0Eh
10e2:02d1  imul dx
10e2:02d3  mov bx,ax
10e2:02d5  mov al,[bx+71CEh]
10e2:02d9  cbw
10e2:02da  mov cl,4
10e2:02dc  shl ax,cl
10e2:02de  mov bx,ax
10e2:02e0  mov byte ptr [bx-6B8Eh],0E2h
10e2:02e5  mov ax,si
10e2:02e7  mov dx,0Eh
10e2:02ea  imul dx
10e2:02ec  mov bx,ax
10e2:02ee  mov word ptr [bx+71D0h],0FFFEh
10e2:02f4  mov ax,si
10e2:02f6  mov dx,0Eh
10e2:02f9  imul dx
10e2:02fb  mov bx,ax
10e2:02fd  mov byte ptr [bx+71D6h],0FFh
10e2:0302  pop si
10e2:0303  pop bp
10e2:0304  ret far

; Candidate 10e2:0305, file offset 0x14325
10e2:0305  push bp
10e2:0306  mov bp,sp
10e2:0308  sub sp,4
10e2:030b  push si
10e2:030c  mov [bp-2],ds
10e2:030f  mov word ptr [bp-4],7264h
10e2:0314  mov si,0Bh
10e2:0317  jmp short 0328h
10e2:0319  les bx,[bp-4]
10e2:031c  cmp word ptr es:[bx+6],0FFFEh
10e2:0321  je short 032Dh
10e2:0323  inc si
10e2:0324  add word ptr [bp-4],0Eh
10e2:0328  cmp si,11h
10e2:032b  jl short 0319h
10e2:032d  cmp si,11h
10e2:0330  jne short 0337h
10e2:0332  mov ax,0FFFFh
10e2:0335  jmp short 0374h
10e2:0337  les bx,[bp-4]
10e2:033a  mov al,[bp+6]
10e2:033d  add al,20h
10e2:033f  mov es:[bx+2],al
10e2:0343  mov al,[bp+8]
10e2:0346  mov es:[bx+3],al
10e2:034a  mov al,[bp+0Ch]
10e2:034d  mov es:[bx+4],al
10e2:0351  mov al,[bp+0Ah]
10e2:0354  mov es:[bx+0Dh],al
10e2:0358  mov al,0
10e2:035a  mov [71CFh],al
10e2:035d  cbw
10e2:035e  mov es:[bx+6],ax
10e2:0362  mov es:[bx+1],al
10e2:0366  mov es:[bx],al
10e2:0369  cbw
10e2:036a  mov es:[bx+0Ah],ax
10e2:036e  mov es:[bx+8],ax
10e2:0372  mov ax,si
10e2:0374  pop si
10e2:0375  mov sp,bp
10e2:0377  pop bp
10e2:0378  ret far

; Candidate 10e2:0379, file offset 0x14399
10e2:0379  push bp
10e2:037a  mov bp,sp
10e2:037c  les bx,[bp+6]
10e2:037f  cmp word ptr es:[bx+0DFh],0
10e2:0385  jne short 038Ch
10e2:0387  mov ax,1
10e2:038a  jmp short 038Eh
10e2:038c  xor ax,ax
10e2:038e  pop bp
10e2:038f  ret far

; Candidate 10e2:0390, file offset 0x143b0
10e2:0390  push bp
10e2:0391  mov bp,sp
10e2:0393  dec sp
10e2:0394  dec sp
10e2:0395  push si
10e2:0396  mov si,[bp+6]
10e2:0399  cmp word ptr [71C8h],0
10e2:039e  je short 03A5h
10e2:03a0  mov ax,9
10e2:03a3  jmp short 03F4h
10e2:03a5  cmp si,0FFFFh
10e2:03a8  jne short 03BBh
10e2:03aa  cmp word ptr [6DCEh],7
10e2:03af  jge short 03B6h
10e2:03b1  mov ax,5
10e2:03b4  jmp short 03F4h
10e2:03b6  mov ax,9
10e2:03b9  jmp short 03F4h
10e2:03bb  mov ax,si
10e2:03bd  mov dx,159h
10e2:03c0  imul dx
10e2:03c2  mov bx,ax
10e2:03c4  mov al,[bx-19D6h]
10e2:03c8  cbw
10e2:03c9  push ax
10e2:03ca  mov ax,1
10e2:03cd  push ax
10e2:03ce  call far 009Ch,0B54h
10e2:03d3  add sp,4
10e2:03d6  mov [bp-2],ax
10e2:03d9  cmp ax,0FFFFh
10e2:03dc  jle short 03F1h
10e2:03de  mov ax,si
10e2:03e0  mov dx,159h
10e2:03e3  imul dx
10e2:03e5  add ax,[bp-2]
10e2:03e8  mov bx,ax
10e2:03ea  mov al,[bx-19D2h]
10e2:03ee  cbw
10e2:03ef  jmp short 03F4h
10e2:03f1  mov ax,1
10e2:03f4  pop si
10e2:03f5  mov sp,bp
10e2:03f7  pop bp
10e2:03f8  ret far

; Candidate 10e2:03f9, file offset 0x14419
10e2:03f9  push bp
10e2:03fa  mov bp,sp
10e2:03fc  push si
10e2:03fd  push di
10e2:03fe  mov si,[bp+6]
10e2:0401  cmp word ptr [71C8h],0
10e2:0406  je short 040Eh
10e2:0408  mov ax,9
10e2:040b  jmp 04A1h
10e2:040e  cmp si,0FFFFh
10e2:0411  jne short 0425h
10e2:0413  cmp word ptr [6DCEh],7
10e2:0418  jge short 0420h
10e2:041a  mov ax,5
10e2:041d  jmp 04A1h
10e2:0420  mov ax,9
10e2:0423  jmp short 04A1h
10e2:0425  mov ax,si
10e2:0427  mov dx,159h
10e2:042a  imul dx
10e2:042c  mov bx,ax
10e2:042e  mov al,[bx-19D6h]
10e2:0432  cbw
10e2:0433  push ax
10e2:0434  mov ax,2
10e2:0437  push ax
10e2:0438  call far 009Ch,0B54h
10e2:043d  add sp,4
10e2:0440  mov di,ax
10e2:0442  cmp ax,0FFFFh
10e2:0445  jle short 0457h
10e2:0447  mov ax,si
10e2:0449  mov dx,159h
10e2:044c  imul dx
10e2:044e  mov bx,ax
10e2:0450  mov al,[bx+di-19D2h]
10e2:0454  cbw
10e2:0455  jmp short 04A1h
10e2:0457  mov ax,si
10e2:0459  mov dx,159h
10e2:045c  imul dx
10e2:045e  mov bx,ax
10e2:0460  mov al,[bx-19D6h]
10e2:0464  cbw
10e2:0465  push ax
10e2:0466  mov ax,4
10e2:0469  push ax
10e2:046a  call far 009Ch,0B54h
10e2:046f  add sp,4
10e2:0472  mov di,ax
10e2:0474  cmp ax,0FFFFh
10e2:0477  jle short 049Eh
10e2:0479  mov ax,si
10e2:047b  mov dx,159h
10e2:047e  imul dx
10e2:0480  mov bx,ax
10e2:0482  cmp byte ptr [bx+di-19D2h],8
10e2:0487  jle short 049Ch
10e2:0489  mov ax,si
10e2:048b  mov dx,159h
10e2:048e  imul dx
10e2:0490  mov bx,ax
10e2:0492  mov al,[bx+di-19D2h]
10e2:0496  cbw
10e2:0497  add ax,0FFF8h
10e2:049a  jmp short 04A1h
10e2:049c  jmp short 049Eh
10e2:049e  mov ax,1
10e2:04a1  pop di
10e2:04a2  pop si
10e2:04a3  pop bp
10e2:04a4  ret far

; Candidate 10e2:0565, file offset 0x14585
10e2:0565  push bp
10e2:0566  mov bp,sp
10e2:0568  sub sp,4
10e2:056b  push si
10e2:056c  push di
10e2:056d  mov si,[bp+6]
10e2:0570  cmp si,0FFFFh
10e2:0573  jne short 0581h
10e2:0575  mov word ptr [bp-2],0
10e2:057a  mov word ptr [bp-4],5
10e2:057f  jmp short 0589h
10e2:0581  mov ax,si
10e2:0583  mov [bp-4],ax
10e2:0586  mov [bp-2],ax
10e2:0589  xor di,di
10e2:058b  jmp short 05CCh
10e2:058d  mov si,[bp-2]
10e2:0590  jmp short 05BBh
10e2:0592  mov ax,si
10e2:0594  mov dx,159h
10e2:0597  imul dx
10e2:0599  mov bx,ax
10e2:059b  test byte ptr [bx-19F7h],1
10e2:05a0  je short 05BAh
10e2:05a2  cmp byte ptr [0EE3Ah],0
10e2:05a7  je short 05B1h
10e2:05a9  mov al,[9317h]
10e2:05ac  cbw
10e2:05ad  cmp ax,si
10e2:05af  jne short 05BAh
10e2:05b1  push di
10e2:05b2  push si
10e2:05b3  push cs
10e2:05b4  call 04BCh
10e2:05b7  add sp,4
10e2:05ba  inc si
10e2:05bb  cmp si,[bp-4]
10e2:05be  jle short 0592h
10e2:05c0  mov ax,2
10e2:05c3  push ax
10e2:05c4  call far 04D2h,08D7h
10e2:05c9  inc sp
10e2:05ca  inc sp
10e2:05cb  inc di
10e2:05cc  cmp di,8
10e2:05cf  jl short 058Dh
10e2:05d1  mov si,[bp-2]
10e2:05d4  jmp short 05DFh
10e2:05d6  push si
10e2:05d7  call far 0AF9h,1901h
10e2:05dc  inc sp
10e2:05dd  inc sp
10e2:05de  inc si
10e2:05df  cmp si,[bp-4]
10e2:05e2  jle short 05D6h
10e2:05e4  pop di
10e2:05e5  pop si
10e2:05e6  mov sp,bp
10e2:05e8  pop bp
10e2:05e9  ret far

; Candidate 10e2:05ea, file offset 0x1460a
10e2:05ea  push bp
10e2:05eb  mov bp,sp
10e2:05ed  sub sp,6
10e2:05f0  push si
10e2:05f1  push di
10e2:05f2  mov ax,2
10e2:05f5  push ax
10e2:05f6  call far 003Dh,2187h
10e2:05fb  inc sp
10e2:05fc  inc sp
10e2:05fd  mov ax,78h
10e2:0600  push ax
10e2:0601  mov ax,0B0h
10e2:0604  push ax
10e2:0605  xor ax,ax
10e2:0607  push ax
10e2:0608  push ax
10e2:0609  call far 0206h,238Bh
10e2:060e  add sp,8
10e2:0611  mov ax,2
10e2:0614  push ax
10e2:0615  xor ax,ax
10e2:0617  push ax
10e2:0618  mov ax,78h
10e2:061b  push ax
10e2:061c  mov ax,16h
10e2:061f  push ax
10e2:0620  xor ax,ax
10e2:0622  push ax
10e2:0623  push ax
10e2:0624  push ax
10e2:0625  push ax
10e2:0626  call far 000Ah,1D92h
10e2:062b  add sp,10h
10e2:062e  xor si,si
10e2:0630  jmp short 0667h
10e2:0632  mov ax,si
10e2:0634  mov cl,8
10e2:0636  shl ax,cl
10e2:0638  mov dx,[0CBC4h]
10e2:063c  add dx,ax
10e2:063e  push word ptr [0CBC6h]
10e2:0642  push dx
10e2:0643  mov ax,10h
10e2:0646  push ax
10e2:0647  mov ax,2
10e2:064a  push ax
10e2:064b  mov al,[si+5692h]
10e2:064f  mov ah,0
10e2:0651  push ax
10e2:0652  mov al,[si+5682h]
10e2:0656  mov ah,0
10e2:0658  sar ax,1
10e2:065a  sar ax,1
10e2:065c  sar ax,1
10e2:065e  push ax
10e2:065f  call far dword ptr [65D2h]
10e2:0663  add sp,0Ch
10e2:0666  inc si
10e2:0667  cmp si,10h
10e2:066a  jl short 0632h
10e2:066c  mov word ptr [bp-6],0
10e2:0671  jmp 0782h
10e2:0674  mov word ptr [62A5h],2
10e2:067a  xor si,si
10e2:067c  jmp short 06C5h
10e2:067e  mov al,[si+5682h]
10e2:0682  mov ah,0
10e2:0684  mov [bp-2],ax
10e2:0687  mov al,[si+5692h]
10e2:068b  mov ah,0
10e2:068d  mov [bp-4],ax
10e2:0690  mov ax,si
10e2:0692  mov cl,8
10e2:0694  shl ax,cl
10e2:0696  mov dx,[0CBC4h]
10e2:069a  add dx,ax
10e2:069c  push word ptr [0CBC6h]
10e2:06a0  push dx
10e2:06a1  mov ax,10h
10e2:06a4  push ax
10e2:06a5  mov ax,2
10e2:06a8  push ax
10e2:06a9  mov al,[si+5692h]
10e2:06ad  mov ah,0
10e2:06af  push ax
10e2:06b0  mov al,[si+5682h]
10e2:06b4  mov ah,0
10e2:06b6  sar ax,1
10e2:06b8  sar ax,1
10e2:06ba  sar ax,1
10e2:06bc  push ax
10e2:06bd  call far dword ptr [6542h]
10e2:06c1  add sp,0Ch
10e2:06c4  inc si
10e2:06c5  cmp si,10h
10e2:06c8  jl short 067Eh
10e2:06ca  xor si,si
10e2:06cc  jmp short 0733h
10e2:06ce  mov bx,[bp-6]
10e2:06d1  shl bx,1
10e2:06d3  shl bx,1
10e2:06d5  mov dx,[bx+5608h]
10e2:06d9  mov ax,[bx+5606h]
10e2:06dd  mov bx,si
10e2:06df  shl bx,1
10e2:06e1  shl bx,1
10e2:06e3  and ax,[bx+5632h]
10e2:06e7  and dx,[bx+5634h]
10e2:06eb  mov cl,[si+5672h]
10e2:06ef  call far 8620h,0
10e2:06f4  mov di,ax
10e2:06f6  mov al,[si+5682h]
10e2:06fa  mov ah,0
10e2:06fc  mov [bp-2],ax
10e2:06ff  mov al,[si+5692h]
10e2:0703  mov ah,0
10e2:0705  mov [bp-4],ax
10e2:0708  mov ax,di
10e2:070a  dec di
10e2:070b  or ax,ax
10e2:070d  je short 0732h
10e2:070f  xor ax,ax
10e2:0711  push ax
10e2:0712  push word ptr [bp-4]
10e2:0715  push word ptr [bp-2]
10e2:0718  mov bx,di
10e2:071a  shl bx,1
10e2:071c  shl bx,1
10e2:071e  push word ptr [bx-33CAh]
10e2:0722  push word ptr [bx-33CCh]
10e2:0726  mov ax,2
10e2:0729  push ax
10e2:072a  call far 004Ah,1DA3h
10e2:072f  add sp,0Ch
10e2:0732  inc si
10e2:0733  cmp si,10h
10e2:0736  jl short 06CEh
10e2:0738  mov word ptr [62A5h],0
10e2:073e  mov ax,78h
10e2:0741  push ax
10e2:0742  mov ax,0B0h
10e2:0745  push ax
10e2:0746  xor ax,ax
10e2:0748  push ax
10e2:0749  push ax
10e2:074a  call far 0206h,238Bh
10e2:074f  add sp,8
10e2:0752  xor ax,ax
10e2:0754  push ax
10e2:0755  mov ax,2
10e2:0758  push ax
10e2:0759  mov ax,78h
10e2:075c  push ax
10e2:075d  mov ax,16h
10e2:0760  push ax
10e2:0761  xor ax,ax
10e2:0763  push ax
10e2:0764  push ax
10e2:0765  push ax
10e2:0766  push ax
10e2:0767  call far 000Ah,1D92h
10e2:076c  add sp,10h
10e2:076f  call far 02CAh,238Bh
10e2:0774  mov ax,2
10e2:0777  push ax
10e2:0778  call far 04D2h,08D7h
10e2:077d  inc sp
10e2:077e  inc sp
10e2:077f  inc word ptr [bp-6]
10e2:0782  cmp word ptr [bp-6],0Bh
10e2:0786  jge short 078Bh
10e2:0788  jmp 0674h
10e2:078b  xor si,si
10e2:078d  jmp short 07C4h
10e2:078f  mov ax,si
10e2:0791  mov cl,8
10e2:0793  shl ax,cl
10e2:0795  mov dx,[0CBC4h]
10e2:0799  add dx,ax
10e2:079b  push word ptr [0CBC6h]
10e2:079f  push dx
10e2:07a0  mov ax,10h
10e2:07a3  push ax
10e2:07a4  mov ax,2
10e2:07a7  push ax
10e2:07a8  mov al,[si+5692h]
10e2:07ac  mov ah,0
10e2:07ae  push ax
10e2:07af  mov al,[si+5682h]
10e2:07b3  mov ah,0
10e2:07b5  sar ax,1
10e2:07b7  sar ax,1
10e2:07b9  sar ax,1
10e2:07bb  push ax
10e2:07bc  call far dword ptr [6546h]
10e2:07c0  add sp,0Ch
10e2:07c3  inc si
10e2:07c4  cmp si,10h
10e2:07c7  jl short 078Fh
10e2:07c9  call far 02CAh,238Bh
10e2:07ce  mov ax,2
10e2:07d1  push ax
10e2:07d2  call far 9,2187h
10e2:07d7  inc sp
10e2:07d8  inc sp
10e2:07d9  pop di
10e2:07da  pop si
10e2:07db  mov sp,bp
10e2:07dd  pop bp
10e2:07de  ret far

; Candidate 10e2:084a, file offset 0x1486a
10e2:084a  push bp
10e2:084b  mov bp,sp
10e2:084d  sub sp,4
10e2:0850  push si
10e2:0851  push di
10e2:0852  mov di,[bp+8]
10e2:0855  mov [bp-2],ds
10e2:0858  mov word ptr [bp-4],0CC5Ch
10e2:085d  xor si,si
10e2:085f  jmp short 086Fh
10e2:0861  les bx,[bp-4]
10e2:0864  cmp byte ptr es:[bx],0
10e2:0868  je short 0874h
10e2:086a  inc si
10e2:086b  add word ptr [bp-4],12h
10e2:086f  cmp si,0Ah
10e2:0872  jl short 0861h
10e2:0874  cmp si,0Ah
10e2:0877  jne short 087Ch
10e2:0879  jmp 090Fh
10e2:087c  les bx,[bp-4]
10e2:087f  mov byte ptr es:[bx],2
10e2:0883  mov word ptr es:[bx+2],1
10e2:0889  mov bx,di
10e2:088b  shl bx,1
10e2:088d  shl bx,1
10e2:088f  mov al,[bx+255Ah]
10e2:0893  mov bx,[bp-4]
10e2:0896  mov es:[bx+0Ch],al
10e2:089a  mov al,[bp+0Eh]
10e2:089d  mov es:[bx+7],al
10e2:08a1  mov bx,di
10e2:08a3  shl bx,1
10e2:08a5  shl bx,1
10e2:08a7  mov al,[bx+2559h]
10e2:08ab  mov bx,[bp-4]
10e2:08ae  mov es:[bx+0Dh],al
10e2:08b2  mov ax,[bp+0Ah]
10e2:08b5  mov es:[bx+4],ax
10e2:08b9  mov al,[bp+0Ch]
10e2:08bc  mov es:[bx+6],al
10e2:08c0  mov es:[bx+8],di
10e2:08c4  mov bx,di
10e2:08c6  shl bx,1
10e2:08c8  shl bx,1
10e2:08ca  mov al,[bx+255Bh]
10e2:08ce  mov bx,[bp-4]
10e2:08d1  mov es:[bx+0Ah],al
10e2:08d5  mov al,[bp+6]
10e2:08d8  mov es:[bx+0Bh],al
10e2:08dc  mov bx,di
10e2:08de  shl bx,1
10e2:08e0  shl bx,1
10e2:08e2  mov al,[bx+2558h]
10e2:08e6  cbw
10e2:08e7  mov di,ax
10e2:08e9  mov dx,19h
10e2:08ec  imul dx
10e2:08ee  mov dx,29A6h
10e2:08f1  mov bx,ax
10e2:08f3  mov es,dx
10e2:08f5  mov ax,es:[bx+10h]
10e2:08fa  mov dx,es:[bx+0Eh]
10e2:08ff  les bx,[bp-4]
10e2:0902  mov es:[bx+10h],ax
10e2:0906  mov es:[bx+0Eh],dx
10e2:090a  mov byte ptr [0D0AAh],1
10e2:090f  pop di
10e2:0910  pop si
10e2:0911  mov sp,bp
10e2:0913  pop bp
10e2:0914  ret far

; Candidate 10e2:0915, file offset 0x14935
10e2:0915  push bp
10e2:0916  mov bp,sp
10e2:0918  sub sp,1Ah
10e2:091b  push si
10e2:091c  push di
10e2:091d  mov si,[bp+10h]
10e2:0920  les bx,[bp+6]
10e2:0923  mov al,es:[bx+0Ch]
10e2:0927  and al,10h
10e2:0929  mov [bp-7],al
10e2:092c  mov al,es:[bx+0Ch]
10e2:0930  and al,1
10e2:0932  mov [bp-2],al
10e2:0935  mov al,es:[bx+0Ch]
10e2:0939  and al,2
10e2:093b  mov [bp-3],al
10e2:093e  mov al,es:[bx+0Ch]
10e2:0942  and al,4
10e2:0944  mov [bp-4],al
10e2:0947  test byte ptr es:[bx+0Ch],8
10e2:094c  je short 0958h
10e2:094e  mov byte ptr [bp-8],4
10e2:0952  mov byte ptr [bp-9],0
10e2:0956  jmp short 0960h
10e2:0958  mov byte ptr [bp-8],5
10e2:095c  mov byte ptr [bp-9],3
10e2:0960  les bx,[bp+6]
10e2:0963  mov bx,es:[bx+8]
10e2:0967  shl bx,1
10e2:0969  shl bx,1
10e2:096b  mov al,[bx+2558h]
10e2:096f  cbw
10e2:0970  mov dx,19h
10e2:0973  imul dx
10e2:0975  mov dx,29A6h
10e2:0978  mov bx,ax
10e2:097a  mov es,dx
10e2:097c  mov di,es:[bx+17h]
10e2:0981  les bx,[bp+6]
10e2:0984  cmp byte ptr es:[bx+0Bh],0
10e2:0989  jl short 098Fh
10e2:098b  or di,800h
10e2:098f  mov byte ptr [bp-6],0
10e2:0993  or si,si
10e2:0995  jg short 099Ah
10e2:0997  mov si,1
10e2:099a  les bx,[bp+6]
10e2:099d  mov ax,es:[bx+4]
10e2:09a1  mov dx,0Ah
10e2:09a4  imul dx
10e2:09a6  mov bx,ax
10e2:09a8  test word ptr [bx-5C9Ch],7
10e2:09ae  jne short 09B3h
10e2:09b0  jmp 0A83h
10e2:09b3  mov bx,[bp+6]
10e2:09b6  cmp byte ptr es:[bx+0Bh],0
10e2:09bb  jge short 09C6h
10e2:09bd  cmp byte ptr [bp-7],0
10e2:09c1  jne short 09C6h
10e2:09c3  jmp 0A83h
10e2:09c6  mov al,[bp-2]
10e2:09c9  push ax
10e2:09ca  mov al,[bp-3]
10e2:09cd  push ax
10e2:09ce  les bx,[bp+6]
10e2:09d1  mov al,es:[bx+7]
10e2:09d5  push ax
10e2:09d6  mov al,es:[bx+6]
10e2:09da  cbw
10e2:09db  push ax
10e2:09dc  push word ptr es:[bx+4]
10e2:09e0  push ss
10e2:09e1  lea ax,[bp-14h]
10e2:09e4  push ax
10e2:09e5  call far 1AD2h,0997h
10e2:09ea  add sp,0Eh
10e2:09ed  mov word ptr [0E5A2h],1
10e2:09f3  lea ax,[bp-14h]
10e2:09f6  mov [bp-16h],ss
10e2:09f9  mov [bp-18h],ax
10e2:09fc  jmp short 0A72h
10e2:09fe  mov al,[bp+0Eh]
10e2:0a01  push ax
10e2:0a02  mov al,[bp+0Ch]
10e2:0a05  push ax
10e2:0a06  mov al,[bp+0Ah]
10e2:0a09  push ax
10e2:0a0a  call far 0505h,08D7h
10e2:0a0f  add sp,6
10e2:0a12  imul si
10e2:0a14  mov [bp-1],al
10e2:0a17  mov al,[bp-4]
10e2:0a1a  cbw
10e2:0a1b  or ax,ax
10e2:0a1d  je short 0A3Eh
10e2:0a1f  xor ax,ax
10e2:0a21  push ax
10e2:0a22  push ax
10e2:0a23  les bx,[bp-18h]
10e2:0a26  push word ptr es:[bx]
10e2:0a29  les bx,[bp+6]
10e2:0a2c  mov al,es:[bx+0Bh]
10e2:0a30  cbw
10e2:0a31  push ax
10e2:0a32  call far 000Ch,0F55h
10e2:0a37  add sp,8
10e2:0a3a  or ax,ax
10e2:0a3c  je short 0A6Eh
10e2:0a3e  mov al,[bp-9]
10e2:0a41  cbw
10e2:0a42  push ax
10e2:0a43  mov al,[bp-8]
10e2:0a46  cbw
10e2:0a47  push ax
10e2:0a48  push di
10e2:0a49  mov al,[bp-1]
10e2:0a4c  cbw
10e2:0a4d  push ax
10e2:0a4e  xor ax,ax
10e2:0a50  push ax
10e2:0a51  push ax
10e2:0a52  push ds
10e2:0a53  les bx,[bp-18h]
10e2:0a56  mov ax,es:[bx]
10e2:0a59  mov dx,1Eh
10e2:0a5c  imul dx
10e2:0a5e  add ax,6E2Ah
10e2:0a61  push ax
10e2:0a62  call far 12B8h,0F55h
10e2:0a67  add sp,10h
10e2:0a6a  mov byte ptr [bp-6],1
10e2:0a6e  add word ptr [bp-18h],2
10e2:0a72  les bx,[bp-18h]
10e2:0a75  cmp word ptr es:[bx],0FFFFh
10e2:0a79  jne short 09FEh
10e2:0a7b  call far 10D2h,0997h
10e2:0a80  jmp 0C35h
10e2:0a83  les bx,[bp+6]
10e2:0a86  mov ax,es:[bx+4]
10e2:0a8a  cmp ax,[6DD2h]
10e2:0a8e  je short 0A93h
10e2:0a90  jmp 0C35h
10e2:0a93  cmp byte ptr es:[bx+0Bh],0
10e2:0a98  jl short 0AA3h
10e2:0a9a  cmp byte ptr [bp-7],0
10e2:0a9e  jne short 0AA3h
10e2:0aa0  jmp 0C35h
10e2:0aa3  cmp byte ptr [bp-3],0
10e2:0aa7  jne short 0AACh
10e2:0aa9  jmp 0B2Fh
10e2:0aac  mov byte ptr [bp-5],0
10e2:0ab0  jmp short 0B26h
10e2:0ab2  mov ax,1
10e2:0ab5  push ax
10e2:0ab6  mov al,[bp-5]
10e2:0ab9  cbw
10e2:0aba  push ax
10e2:0abb  call far 06E9h,0E24h
10e2:0ac0  add sp,4
10e2:0ac3  or ax,ax
10e2:0ac5  je short 0B23h
10e2:0ac7  mov al,[bp-5]
10e2:0aca  cbw
10e2:0acb  push ax
10e2:0acc  push ds
10e2:0acd  mov ax,6E2Ah
10e2:0ad0  push ax
10e2:0ad1  call far 12EFh,0997h
10e2:0ad6  add sp,6
10e2:0ad9  or ax,ax
10e2:0adb  jne short 0AE5h
10e2:0add  mov al,[bp-4]
10e2:0ae0  cbw
10e2:0ae1  or ax,ax
10e2:0ae3  jne short 0B23h
10e2:0ae5  mov al,[bp+0Eh]
10e2:0ae8  push ax
10e2:0ae9  mov al,[bp+0Ch]
10e2:0aec  push ax
10e2:0aed  mov al,[bp+0Ah]
10e2:0af0  push ax
10e2:0af1  call far 0505h,08D7h
10e2:0af6  add sp,6
10e2:0af9  imul si
10e2:0afb  mov [bp-1],al
10e2:0afe  mov byte ptr [bp-6],1
10e2:0b02  mov al,[bp-9]
10e2:0b05  cbw
10e2:0b06  push ax
10e2:0b07  mov al,[bp-8]
10e2:0b0a  cbw
10e2:0b0b  push ax
10e2:0b0c  push di
10e2:0b0d  mov al,[bp-1]
10e2:0b10  cbw
10e2:0b11  push ax
10e2:0b12  xor ax,ax
10e2:0b14  push ax
10e2:0b15  push ax
10e2:0b16  mov al,[bp-5]
10e2:0b19  cbw
10e2:0b1a  push ax
10e2:0b1b  call far 143Eh,0F55h
10e2:0b20  add sp,0Eh
10e2:0b23  inc byte ptr [bp-5]
10e2:0b26  cmp byte ptr [bp-5],6
10e2:0b2a  jl short 0AB2h
10e2:0b2c  jmp 0C35h
10e2:0b2f  les bx,[bp+6]
10e2:0b32  mov al,es:[bx+6]
10e2:0b36  cbw
10e2:0b37  and ax,3
10e2:0b3a  mov [bp-1Ah],ax
10e2:0b3d  mov bx,[6DD4h]
10e2:0b41  shl bx,1
10e2:0b43  shl bx,1
10e2:0b45  add bx,[bp-1Ah]
10e2:0b48  mov al,[bx+2352h]
10e2:0b4c  cbw
10e2:0b4d  mov [bp-1Ah],ax
10e2:0b50  cmp word ptr [bp-1Ah],2
10e2:0b54  jle short 0B9Ah
10e2:0b56  mov ax,1
10e2:0b59  push ax
10e2:0b5a  mov ax,5
10e2:0b5d  push ax
10e2:0b5e  call far 06E9h,0E24h
10e2:0b63  add sp,4
10e2:0b66  or ax,ax
10e2:0b68  jne short 0B7Eh
10e2:0b6a  mov ax,1
10e2:0b6d  push ax
10e2:0b6e  mov ax,6
10e2:0b71  push ax
10e2:0b72  call far 06E9h,0E24h
10e2:0b77  add sp,4
10e2:0b7a  or ax,ax
10e2:0b7c  je short 0B9Ah
10e2:0b7e  mov al,0FFh
10e2:0b80  push ax
10e2:0b81  mov al,2
10e2:0b83  push ax
10e2:0b84  mov al,1
10e2:0b86  push ax
10e2:0b87  call far 0505h,08D7h
10e2:0b8c  add sp,6
10e2:0b8f  or ax,ax
10e2:0b91  je short 0B9Ah
10e2:0b93  mov al,[bp-1Ah]
10e2:0b96  add al,2
10e2:0b98  jmp short 0B9Dh
10e2:0b9a  mov al,[bp-1Ah]
10e2:0b9d  mov [bp-5],al
10e2:0ba0  les bx,[bp+6]
10e2:0ba3  cmp word ptr es:[bx+8],0
10e2:0ba8  jne short 0BC1h
10e2:0baa  mov al,[bp-5]
10e2:0bad  cbw
10e2:0bae  mov dx,159h
10e2:0bb1  imul dx
10e2:0bb3  mov bx,ax
10e2:0bb5  mov ax,[bx-18AFh]
10e2:0bb9  and ax,8
10e2:0bbc  or ax,0
10e2:0bbf  jne short 0C31h
10e2:0bc1  mov al,[bp-5]
10e2:0bc4  cbw
10e2:0bc5  mov dx,159h
10e2:0bc8  imul dx
10e2:0bca  mov bx,ax
10e2:0bcc  test byte ptr [bx-19F7h],1
10e2:0bd1  je short 0C35h
10e2:0bd3  mov al,[bp-5]
10e2:0bd6  cbw
10e2:0bd7  push ax
10e2:0bd8  push ds
10e2:0bd9  mov ax,6E2Ah
10e2:0bdc  push ax
10e2:0bdd  call far 12EFh,0997h
10e2:0be2  add sp,6
10e2:0be5  or ax,ax
10e2:0be7  jne short 0BF1h
10e2:0be9  mov al,[bp-4]
10e2:0bec  cbw
10e2:0bed  or ax,ax
10e2:0bef  jne short 0C35h
10e2:0bf1  mov al,[bp+0Eh]
10e2:0bf4  push ax
10e2:0bf5  mov al,[bp+0Ch]
10e2:0bf8  push ax
10e2:0bf9  mov al,[bp+0Ah]
10e2:0bfc  push ax
10e2:0bfd  call far 0505h,08D7h
10e2:0c02  add sp,6
10e2:0c05  imul si
10e2:0c07  mov [bp-1],al
10e2:0c0a  mov byte ptr [bp-6],1
10e2:0c0e  mov al,[bp-9]
10e2:0c11  cbw
10e2:0c12  push ax
10e2:0c13  mov al,[bp-8]
10e2:0c16  cbw
10e2:0c17  push ax
10e2:0c18  push di
10e2:0c19  mov al,[bp-1]
10e2:0c1c  cbw
10e2:0c1d  push ax
10e2:0c1e  xor ax,ax
10e2:0c20  push ax
10e2:0c21  push ax
10e2:0c22  mov al,[bp-5]
10e2:0c25  cbw
10e2:0c26  push ax
10e2:0c27  call far 143Eh,0F55h
10e2:0c2c  add sp,0Eh
10e2:0c2f  jmp short 0C35h
10e2:0c31  mov byte ptr [bp-6],1
10e2:0c35  cmp byte ptr [bp-6],0
10e2:0c39  je short 0C55h
10e2:0c3b  les bx,[bp+6]
10e2:0c3e  test byte ptr es:[bx+0Ch],40h
10e2:0c43  je short 0C55h
10e2:0c45  push word ptr [bp+8]
10e2:0c48  push word ptr [bp+6]
10e2:0c4b  call far 1EDBh,10E2h
10e2:0c50  add sp,4
10e2:0c53  jmp short 0C63h
10e2:0c55  les bx,[bp+6]
10e2:0c58  cmp word ptr es:[bx+8],4
10e2:0c5d  jne short 0C63h
10e2:0c5f  mov byte ptr [bp-6],0
10e2:0c63  mov al,[bp-6]
10e2:0c66  cbw
10e2:0c67  pop di
10e2:0c68  pop si
10e2:0c69  mov sp,bp
10e2:0c6b  pop bp
10e2:0c6c  ret far

; Candidate 10e2:0c6d, file offset 0x14c8d
10e2:0c6d  push bp
10e2:0c6e  mov bp,sp
10e2:0c70  sub sp,8
10e2:0c73  push si
10e2:0c74  push di
10e2:0c75  mov di,[bp+8]
10e2:0c78  mov ax,[bp+6]
10e2:0c7b  mov dx,19h
10e2:0c7e  imul dx
10e2:0c80  add ax,0
10e2:0c83  mov word ptr [bp-2],29A6h
10e2:0c88  mov [bp-4],ax
10e2:0c8b  mov ax,di
10e2:0c8d  mov dx,159h
10e2:0c90  imul dx
10e2:0c92  add ax,0E608h
10e2:0c95  mov [bp-6],ds
10e2:0c98  mov [bp-8],ax
10e2:0c9b  cmp word ptr [bp+0Ah],0
10e2:0c9f  je short 0CD0h
10e2:0ca1  les bx,[bp-4]
10e2:0ca4  push word ptr es:[bx+2]
10e2:0ca8  push word ptr es:[bx]
10e2:0cab  inc ax
10e2:0cac  inc ax
10e2:0cad  push word ptr [bp-6]
10e2:0cb0  push ax
10e2:0cb1  push ds
10e2:0cb2  mov ax,574Eh
10e2:0cb5  push ax
10e2:0cb6  push ds
10e2:0cb7  mov ax,0F16Eh
10e2:0cba  push ax
10e2:0cbb  call far 64A1h,0
10e2:0cc0  add sp,10h
10e2:0cc3  push ds
10e2:0cc4  mov ax,0F16Eh
10e2:0cc7  push ax
10e2:0cc8  call far 0BE6h,08D7h
10e2:0ccd  add sp,4
10e2:0cd0  les bx,[bp-4]
10e2:0cd3  mov ax,es:[bx+0Eh]
10e2:0cd7  or ax,es:[bx+10h]
10e2:0cdb  je short 0CEAh
10e2:0cdd  push word ptr [bp-6]
10e2:0ce0  push word ptr [bp-8]
10e2:0ce3  call far dword ptr es:[bx+0Eh]
10e2:0ce7  add sp,4
10e2:0cea  les bx,[bp-4]
10e2:0ced  test word ptr es:[bx+8],1
10e2:0cf3  je short 0D0Eh
10e2:0cf5  mov ax,es:[bx+15h]
10e2:0cf9  mov dx,es:[bx+13h]
10e2:0cfd  not dx
10e2:0cff  not ax
10e2:0d01  les bx,[bp-8]
10e2:0d04  and es:[bx+149h],dx
10e2:0d09  and es:[bx+14Bh],ax
10e2:0d0e  les bx,[bp-4]
10e2:0d11  test word ptr es:[bx+8],4
10e2:0d17  je short 0D2Dh
10e2:0d19  mov ax,es:[bx+15h]
10e2:0d1d  mov dx,es:[bx+13h]
10e2:0d21  not dx
10e2:0d23  not ax
10e2:0d25  and [6DDCh],dx
10e2:0d29  and [6DDEh],ax
10e2:0d2d  les bx,[bp-4]
10e2:0d30  test word ptr es:[bx+8],200h
10e2:0d36  je short 0D93h
10e2:0d38  xor si,si
10e2:0d3a  jmp short 0D8Eh
10e2:0d3c  mov ax,1
10e2:0d3f  push ax
10e2:0d40  push si
10e2:0d41  call far 06E9h,0E24h
10e2:0d46  add sp,4
10e2:0d49  or ax,ax
10e2:0d4b  je short 0D8Dh
10e2:0d4d  mov ax,2
10e2:0d50  push ax
10e2:0d51  push si
10e2:0d52  call far 06E9h,0E24h
10e2:0d57  add sp,4
10e2:0d5a  or ax,ax
10e2:0d5c  jne short 0D69h
10e2:0d5e  les bx,[bp-4]
10e2:0d61  test word ptr es:[bx+8],800h
10e2:0d67  je short 0D8Dh
10e2:0d69  les bx,[bp-4]
10e2:0d6c  mov ax,es:[bx+15h]
10e2:0d70  mov dx,es:[bx+13h]
10e2:0d74  not dx
10e2:0d76  not ax
10e2:0d78  push dx
10e2:0d79  push ax
10e2:0d7a  mov ax,si
10e2:0d7c  mov dx,159h
10e2:0d7f  imul dx
10e2:0d81  mov bx,ax
10e2:0d83  pop ax
10e2:0d84  pop dx
10e2:0d85  and [bx-18AFh],dx
10e2:0d89  and [bx-18ADh],ax
10e2:0d8d  inc si
10e2:0d8e  cmp si,6
10e2:0d91  jl short 0D3Ch
10e2:0d93  les bx,[bp-4]
10e2:0d96  test word ptr es:[bx+8],2
10e2:0d9c  je short 0DAAh
10e2:0d9e  mov al,[0CBC2h]
10e2:0da1  cbw
10e2:0da2  push ax
10e2:0da3  call far 0CF7h,0F55h
10e2:0da8  inc sp
10e2:0da9  inc sp
10e2:0daa  cmp word ptr [bp+0Ah],0
10e2:0dae  je short 0DD5h
10e2:0db0  les bx,[bp-4]
10e2:0db3  test word ptr es:[bx+8],20A0h
10e2:0db9  je short 0DC5h
10e2:0dbb  push di
10e2:0dbc  call far 0AF9h,1901h
10e2:0dc1  inc sp
10e2:0dc2  inc sp
10e2:0dc3  jmp short 0DD5h
10e2:0dc5  les bx,[bp-4]
10e2:0dc8  test word ptr es:[bx+8],40h
10e2:0dce  je short 0DD5h
10e2:0dd0  call far 0686h,0E24h
10e2:0dd5  pop di
10e2:0dd6  pop si
10e2:0dd7  mov sp,bp
10e2:0dd9  pop bp
10e2:0dda  ret far

; Candidate 10e2:0ddb, file offset 0x14dfb
10e2:0ddb  push bp
10e2:0ddc  mov bp,sp
10e2:0dde  dec sp
10e2:0ddf  dec sp
10e2:0de0  push si
10e2:0de1  push di
10e2:0de2  mov di,[bp+6]
10e2:0de5  mov al,[0D0B0h]
10e2:0de8  cbw
10e2:0de9  mov bx,ax
10e2:0deb  cmp byte ptr [bx+56A2h],0
10e2:0df0  jne short 0DF5h
10e2:0df2  jmp 0EC3h
10e2:0df5  push word ptr [6DD4h]
10e2:0df9  push word ptr [6DD2h]
10e2:0dfd  call far 012Fh,0E24h
10e2:0e02  add sp,4
10e2:0e05  mov [bp-2],ax
10e2:0e08  push word ptr [bp-2]
10e2:0e0b  mov al,[0D0B0h]
10e2:0e0e  push ax
10e2:0e0f  call far 1929h,0997h
10e2:0e14  add sp,4
10e2:0e17  mov si,ax
10e2:0e19  cmp si,0FFFFh
10e2:0e1c  je short 0E94h
10e2:0e1e  mov ax,1
10e2:0e21  push ax
10e2:0e22  xor ax,ax
10e2:0e24  push ax
10e2:0e25  push si
10e2:0e26  mov al,[0D0B0h]
10e2:0e29  cbw
10e2:0e2a  push ax
10e2:0e2b  call far 000Ch,0F55h
10e2:0e30  add sp,8
10e2:0e33  or ax,ax
10e2:0e35  jne short 0E3Ah
10e2:0e37  jmp 0EF0h
10e2:0e3a  cmp di,0FFFFh
10e2:0e3d  jne short 0E6Bh
10e2:0e3f  mov al,0
10e2:0e41  push ax
10e2:0e42  mov al,4
10e2:0e44  push ax
10e2:0e45  mov al,1
10e2:0e47  push ax
10e2:0e48  call far 0505h,08D7h
10e2:0e4d  add sp,6
10e2:0e50  push ax
10e2:0e51  mov ax,si
10e2:0e53  mov dx,1Eh
10e2:0e56  imul dx
10e2:0e58  mov bx,ax
10e2:0e5a  mov ax,[bx+6E36h]
10e2:0e5e  pop dx
10e2:0e5f  sub ax,dx
10e2:0e61  mov [bp+0Ah],ax
10e2:0e64  xor di,di
10e2:0e66  mov word ptr [bp+8],0
10e2:0e6b  mov ax,2
10e2:0e6e  push ax
10e2:0e6f  mov ax,4
10e2:0e72  push ax
10e2:0e73  mov ax,801h
10e2:0e76  push ax
10e2:0e77  push word ptr [bp+0Ah]
10e2:0e7a  push word ptr [bp+8]
10e2:0e7d  push di
10e2:0e7e  push ds
10e2:0e7f  mov ax,si
10e2:0e81  mov dx,1Eh
10e2:0e84  imul dx
10e2:0e86  add ax,6E2Ah
10e2:0e89  push ax
10e2:0e8a  call far 12B8h,0F55h
10e2:0e8f  add sp,10h
10e2:0e92  jmp short 0EF0h
10e2:0e94  push ds
10e2:0e95  mov al,[0D0B0h]
10e2:0e98  cbw
10e2:0e99  mov dx,159h
10e2:0e9c  imul dx
10e2:0e9e  add ax,0E60Ah
10e2:0ea1  push ax
10e2:0ea2  push ds
10e2:0ea3  mov ax,5766h
10e2:0ea6  push ax
10e2:0ea7  push ds
10e2:0ea8  mov ax,0F16Eh
10e2:0eab  push ax
10e2:0eac  call far 64A1h,0
10e2:0eb1  add sp,0Ch
10e2:0eb4  push ds
10e2:0eb5  mov ax,0F16Eh
10e2:0eb8  push ax
10e2:0eb9  call far 0BE6h,08D7h
10e2:0ebe  add sp,4
10e2:0ec1  jmp short 0EF0h
10e2:0ec3  push ds
10e2:0ec4  mov al,[0D0B0h]
10e2:0ec7  cbw
10e2:0ec8  mov dx,159h
10e2:0ecb  imul dx
10e2:0ecd  add ax,0E60Ah
10e2:0ed0  push ax
10e2:0ed1  push ds
10e2:0ed2  mov ax,577Eh
10e2:0ed5  push ax
10e2:0ed6  push ds
10e2:0ed7  mov ax,0F16Eh
10e2:0eda  push ax
10e2:0edb  call far 64A1h,0
10e2:0ee0  add sp,0Ch
10e2:0ee3  push ds
10e2:0ee4  mov ax,0F16Eh
10e2:0ee7  push ax
10e2:0ee8  call far 0BE6h,08D7h
10e2:0eed  add sp,4
10e2:0ef0  pop di
10e2:0ef1  pop si
10e2:0ef2  mov sp,bp
10e2:0ef4  pop bp
10e2:0ef5  ret far

; Candidate 10e2:0ef6, file offset 0x14f16
10e2:0ef6  push bp
10e2:0ef7  mov bp,sp
10e2:0ef9  mov ax,[bp+6]
10e2:0efc  mov dx,159h
10e2:0eff  imul dx
10e2:0f01  mov bx,ax
10e2:0f03  mov al,[bx-18A7h]
10e2:0f07  mov [0CD16h],al
10e2:0f0a  mov ax,[bp+6]
10e2:0f0d  mov dx,159h
10e2:0f10  imul dx
10e2:0f12  mov bx,ax
10e2:0f14  mov al,[bx-18A8h]
10e2:0f18  mov [936Ah],al
10e2:0f1b  mov ax,[bp+6]
10e2:0f1e  mov dx,159h
10e2:0f21  imul dx
10e2:0f23  mov bx,ax
10e2:0f25  mov al,[bx-18A6h]
10e2:0f29  mov [0D0ABh],al
10e2:0f2c  mov al,[bp+6]
10e2:0f2f  mov [0D0B0h],al
10e2:0f32  cmp byte ptr [bp+8],1
10e2:0f36  jne short 0F3Dh
10e2:0f38  mov ax,1
10e2:0f3b  jmp short 0F3Fh
10e2:0f3d  xor ax,ax
10e2:0f3f  mov [0E4C6h],al
10e2:0f42  cmp byte ptr [0E4C6h],0
10e2:0f47  je short 0F60h
10e2:0f49  mov [0DF48h],ds
10e2:0f4d  mov word ptr [0DF46h],2065h
10e2:0f53  mov ax,[bp+6]
10e2:0f56  mov dx,159h
10e2:0f59  imul dx
10e2:0f5b  add ax,0E691h
10e2:0f5e  jmp short 0F75h
10e2:0f60  mov [0DF48h],ds
10e2:0f64  mov word ptr [0DF46h],1FE1h
10e2:0f6a  mov ax,[bp+6]
10e2:0f6d  mov dx,159h
10e2:0f70  imul dx
10e2:0f72  add ax,0E641h
10e2:0f75  mov [0CC2Ch],ds
10e2:0f79  mov [0CC2Ah],ax
10e2:0f7c  mov al,[0CD16h]
10e2:0f7f  cbw
10e2:0f80  mov dx,0Ah
10e2:0f83  imul dx
10e2:0f85  les bx,[0CC2Ah]
10e2:0f89  add bx,ax
10e2:0f8b  mov al,[0D0ABh]
10e2:0f8e  cbw
10e2:0f8f  add bx,ax
10e2:0f91  mov al,[936Ah]
10e2:0f94  cbw
10e2:0f95  add bx,ax
10e2:0f97  cmp byte ptr es:[bx],0
10e2:0f9b  jg short 0FF1h
10e2:0f9d  mov byte ptr [936Ah],0
10e2:0fa2  jmp short 0FD9h
10e2:0fa4  mov al,[0CD16h]
10e2:0fa7  cbw
10e2:0fa8  mov dx,0Ah
10e2:0fab  imul dx
10e2:0fad  les bx,[0CC2Ah]
10e2:0fb1  add bx,ax
10e2:0fb3  mov al,[936Ah]
10e2:0fb6  cbw
10e2:0fb7  add bx,ax
10e2:0fb9  cmp byte ptr es:[bx],0
10e2:0fbd  jle short 0FD5h
10e2:0fbf  cmp byte ptr [936Ah],5
10e2:0fc4  jle short 0FE0h
10e2:0fc6  mov byte ptr [0D0ABh],6
10e2:0fcb  mov al,[936Ah]
10e2:0fce  add al,0FAh
10e2:0fd0  mov [936Ah],al
10e2:0fd3  jmp short 0FE0h
10e2:0fd5  inc byte ptr [936Ah]
10e2:0fd9  cmp byte ptr [936Ah],0Ah
10e2:0fde  jl short 0FA4h
10e2:0fe0  cmp byte ptr [936Ah],0Ah
10e2:0fe5  jne short 0FF1h
10e2:0fe7  mov byte ptr [0D0ABh],0
10e2:0fec  mov byte ptr [936Ah],6
10e2:0ff1  mov al,[0E441h]
10e2:0ff4  cbw
10e2:0ff5  or ax,ax
10e2:0ff7  jne short 101Bh
10e2:0ff9  mov ax,[0D0ACh]
10e2:0ffc  add ax,61A8h
10e2:0fff  push word ptr [0D0AEh]
10e2:1003  push ax
10e2:1004  mov ax,38h
10e2:1007  push ax
10e2:1008  mov ax,0Eh
10e2:100b  push ax
10e2:100c  mov ax,79h
10e2:100f  push ax
10e2:1010  mov ax,8
10e2:1013  push ax
10e2:1014  call far dword ptr [65D2h]
10e2:1018  add sp,0Ch
10e2:101b  mov byte ptr [0E441h],1
10e2:1020  call far 002Fh,0DFEh
10e2:1025  call far 1127h,10E2h
10e2:102a  mov ax,1
10e2:102d  pop bp
10e2:102e  ret far

; Candidate 10e2:1127, file offset 0x15147
10e2:1127  push bp
10e2:1128  mov bp,sp
10e2:112a  sub sp,0Ch
10e2:112d  push si
10e2:112e  push di
10e2:112f  mov word ptr [62A5h],2
10e2:1135  mov ax,0B1h
10e2:1138  push ax
10e2:1139  mov ax,0B0h
10e2:113c  push ax
10e2:113d  mov ax,78h
10e2:1140  push ax
10e2:1141  mov ax,40h
10e2:1144  push ax
10e2:1145  call far 0206h,238Bh
10e2:114a  add sp,8
10e2:114d  mov ax,2
10e2:1150  push ax
10e2:1151  xor ax,ax
10e2:1153  push ax
10e2:1154  mov ax,38h
10e2:1157  push ax
10e2:1158  mov ax,0Eh
10e2:115b  push ax
10e2:115c  mov ax,79h
10e2:115f  push ax
10e2:1160  mov ax,8
10e2:1163  push ax
10e2:1164  mov ax,79h
10e2:1167  push ax
10e2:1168  mov ax,8
10e2:116b  push ax
10e2:116c  call far 000Ah,1D92h
10e2:1171  add sp,10h
10e2:1174  call far 02CAh,238Bh
10e2:1179  xor si,si
10e2:117b  jmp 1210h
10e2:117e  mov al,[0CD16h]
10e2:1181  cbw
10e2:1182  cmp ax,si
10e2:1184  jne short 118Bh
10e2:1186  mov al,[0EEF0h]
10e2:1189  jmp short 118Eh
10e2:118b  mov al,[0E444h]
10e2:118e  mov ah,0
10e2:1190  mov [bp-4],ax
10e2:1193  mov al,[0CD16h]
10e2:1196  cbw
10e2:1197  cmp ax,si
10e2:1199  jne short 11A0h
10e2:119b  mov al,[0E5C2h]
10e2:119e  jmp short 11A3h
10e2:11a0  mov al,[0DF32h]
10e2:11a3  mov ah,0
10e2:11a5  mov [bp-6],ax
10e2:11a8  mov al,[0CD16h]
10e2:11ab  cbw
10e2:11ac  cmp ax,si
10e2:11ae  jne short 11B5h
10e2:11b0  mov al,[0E606h]
10e2:11b3  jmp short 11B8h
10e2:11b5  mov al,[0DF44h]
10e2:11b8  mov ah,0
10e2:11ba  mov [bp-8],ax
10e2:11bd  mov ax,si
10e2:11bf  mov dx,12h
10e2:11c2  imul dx
10e2:11c4  add ax,44h
10e2:11c7  mov [bp-2],ax
10e2:11ca  push word ptr [bp-8]
10e2:11cd  push word ptr [bp-6]
10e2:11d0  push word ptr [bp-4]
10e2:11d3  mov ax,81h
10e2:11d6  push ax
10e2:11d7  mov ax,[bp-2]
10e2:11da  add ax,11h
10e2:11dd  push ax
10e2:11de  mov ax,79h
10e2:11e1  push ax
10e2:11e2  push word ptr [bp-2]
10e2:11e5  call far 0A45h,08D7h
10e2:11ea  add sp,0Eh
10e2:11ed  xor ax,ax
10e2:11ef  push ax
10e2:11f0  mov ax,0Ch
10e2:11f3  push ax
10e2:11f4  mov ax,7Bh
10e2:11f7  push ax
10e2:11f8  mov ax,si
10e2:11fa  mov dx,12h
10e2:11fd  imul dx
10e2:11ff  add ax,4Bh
10e2:1202  push ax
10e2:1203  mov ax,si
10e2:1205  inc ax
10e2:1206  push ax
10e2:1207  call far 000Eh,2060h
10e2:120c  add sp,0Ah
10e2:120f  inc si
10e2:1210  cmp si,6
10e2:1213  jge short 1218h
10e2:1215  jmp 117Eh
10e2:1218  mov al,[0E606h]
10e2:121b  mov ah,0
10e2:121d  push ax
10e2:121e  mov al,[0E5C2h]
10e2:1221  mov ah,0
10e2:1223  push ax
10e2:1224  mov al,[0EEF0h]
10e2:1227  mov ah,0
10e2:1229  push ax
10e2:122a  mov ax,0B0h
10e2:122d  push ax
10e2:122e  mov ax,0AFh
10e2:1231  push ax
10e2:1232  mov ax,82h
10e2:1235  push ax
10e2:1236  mov ax,44h
10e2:1239  push ax
10e2:123a  call far 0A45h,08D7h
10e2:123f  add sp,0Eh
10e2:1242  mov al,[6D81h]
10e2:1245  mov ah,0
10e2:1247  push ax
10e2:1248  mov al,[929Ah]
10e2:124b  mov ah,0
10e2:124d  push ax
10e2:124e  mov al,[9364h]
10e2:1251  mov ah,0
10e2:1253  push ax
10e2:1254  mov ax,0B0h
10e2:1257  push ax
10e2:1258  mov ax,91h
10e2:125b  push ax
10e2:125c  mov ax,0A8h
10e2:125f  push ax
10e2:1260  mov ax,44h
10e2:1263  push ax
10e2:1264  call far 0A45h,08D7h
10e2:1269  add sp,0Eh
10e2:126c  mov al,[6D81h]
10e2:126f  mov ah,0
10e2:1271  push ax
10e2:1272  mov al,[929Ah]
10e2:1275  mov ah,0
10e2:1277  push ax
10e2:1278  mov al,[9364h]
10e2:127b  mov ah,0
10e2:127d  push ax
10e2:127e  mov ax,0B0h
10e2:1281  push ax
10e2:1282  mov ax,9Fh
10e2:1285  push ax
10e2:1286  mov ax,0A8h
10e2:1289  push ax
10e2:128a  mov ax,92h
10e2:128d  push ax
10e2:128e  call far 0A45h,08D7h
10e2:1293  add sp,0Eh
10e2:1296  mov al,[6D81h]
10e2:1299  mov ah,0
10e2:129b  push ax
10e2:129c  mov al,[929Ah]
10e2:129f  mov ah,0
10e2:12a1  push ax
10e2:12a2  mov al,[9364h]
10e2:12a5  mov ah,0
10e2:12a7  push ax
10e2:12a8  mov ax,0B0h
10e2:12ab  push ax
10e2:12ac  mov ax,0AFh
10e2:12af  push ax
10e2:12b0  mov ax,0A8h
10e2:12b3  push ax
10e2:12b4  mov ax,0A0h
10e2:12b7  push ax
10e2:12b8  call far 0A45h,08D7h
10e2:12bd  add sp,0Eh
10e2:12c0  xor ax,ax
10e2:12c2  push ax
10e2:12c3  mov ax,0A9h
10e2:12c6  push ax
10e2:12c7  mov ax,96h
10e2:12ca  push ax
10e2:12cb  push cs
10e2:12cc  call 102Fh
10e2:12cf  add sp,6
10e2:12d2  mov ax,1
10e2:12d5  push ax
10e2:12d6  mov ax,0A9h
10e2:12d9  push ax
10e2:12da  mov ax,0A5h
10e2:12dd  push ax
10e2:12de  push cs
10e2:12df  call 102Fh
10e2:12e2  add sp,6
10e2:12e5  mov al,[0E606h]
10e2:12e8  mov ah,0
10e2:12ea  mov [bp-8],ax
10e2:12ed  mov word ptr [bp-0Ah],8
10e2:12f2  mov word ptr [bp-0Ch],0Fh
10e2:12f7  xor si,si
10e2:12f9  jmp 1404h
10e2:12fc  mov al,[0CD16h]
10e2:12ff  cbw
10e2:1300  mov dx,0Ah
10e2:1303  imul dx
10e2:1305  les bx,[0CC2Ah]
10e2:1309  add bx,ax
10e2:130b  add bx,si
10e2:130d  mov al,[0D0ABh]
10e2:1310  cbw
10e2:1311  add bx,ax
10e2:1313  mov al,es:[bx]
10e2:1316  cbw
10e2:1317  mov di,ax
10e2:1319  mov al,[936Ah]
10e2:131c  cbw
10e2:131d  cmp ax,si
10e2:131f  je short 138Ah
10e2:1321  or di,di
10e2:1323  jl short 1362h
10e2:1325  cmp si,6
10e2:1328  jge short 1362h
10e2:132a  mov al,[0D0ABh]
10e2:132d  cbw
10e2:132e  mov dx,si
10e2:1330  add dx,ax
10e2:1332  cmp dx,9
10e2:1335  jge short 1362h
10e2:1337  push word ptr [bp-8]
10e2:133a  push word ptr [bp-0Ch]
10e2:133d  mov ax,si
10e2:133f  mov dx,6
10e2:1342  imul dx
10e2:1344  add ax,84h
10e2:1347  push ax
10e2:1348  mov ax,47h
10e2:134b  push ax
10e2:134c  mov ax,di
10e2:134e  shl ax,1
10e2:1350  shl ax,1
10e2:1352  les bx,[0DF46h]
10e2:1356  add bx,ax
10e2:1358  push word ptr es:[bx+2]
10e2:135c  push word ptr es:[bx]
10e2:135f  jmp 13FCh
10e2:1362  cmp si,6
10e2:1365  je short 136Ah
10e2:1367  jmp 1403h
10e2:136a  mov al,[6D81h]
10e2:136d  mov ah,0
10e2:136f  push ax
10e2:1370  mov ax,0Ch
10e2:1373  push ax
10e2:1374  mov ax,0AAh
10e2:1377  push ax
10e2:1378  mov ax,4Ah
10e2:137b  push ax
10e2:137c  push ds
10e2:137d  mov ax,57A5h
10e2:1380  push ax
10e2:1381  call far dword ptr [65F2h]
10e2:1385  add sp,0Ch
10e2:1388  jmp short 1403h
10e2:138a  or di,di
10e2:138c  jl short 13CAh
10e2:138e  cmp si,6
10e2:1391  jge short 13CAh
10e2:1393  mov al,[0D0ABh]
10e2:1396  cbw
10e2:1397  mov dx,si
10e2:1399  add dx,ax
10e2:139b  cmp dx,9
10e2:139e  jge short 13CAh
10e2:13a0  push word ptr [bp-0Ah]
10e2:13a3  push word ptr [bp-0Ch]
10e2:13a6  mov ax,si
10e2:13a8  mov dx,6
10e2:13ab  imul dx
10e2:13ad  add ax,84h
10e2:13b0  push ax
10e2:13b1  mov ax,47h
10e2:13b4  push ax
10e2:13b5  mov ax,di
10e2:13b7  shl ax,1
10e2:13b9  shl ax,1
10e2:13bb  les bx,[0DF46h]
10e2:13bf  add bx,ax
10e2:13c1  push word ptr es:[bx+2]
10e2:13c5  push word ptr es:[bx]
10e2:13c8  jmp short 13FCh
10e2:13ca  push word ptr [bp-0Ah]
10e2:13cd  mov ax,0AFh
10e2:13d0  push ax
10e2:13d1  mov ax,90h
10e2:13d4  push ax
10e2:13d5  mov ax,0A9h
10e2:13d8  push ax
10e2:13d9  mov ax,45h
10e2:13dc  push ax
10e2:13dd  call far dword ptr [657Ah]
10e2:13e1  add sp,0Ah
10e2:13e4  cmp si,6
10e2:13e7  jne short 1403h
10e2:13e9  push word ptr [bp-0Ah]
10e2:13ec  push word ptr [bp-0Ch]
10e2:13ef  mov ax,0AAh
10e2:13f2  push ax
10e2:13f3  mov ax,4Ah
10e2:13f6  push ax
10e2:13f7  push ds
10e2:13f8  mov ax,57B1h
10e2:13fb  push ax
10e2:13fc  call far dword ptr [65F2h]
10e2:1400  add sp,0Ch
10e2:1403  inc si
10e2:1404  cmp si,7
10e2:1407  jge short 140Ch
10e2:1409  jmp 12FCh
10e2:140c  mov al,[0D0B0h]
10e2:140f  cbw
10e2:1410  mov dx,159h
10e2:1413  imul dx
10e2:1415  mov bx,ax
10e2:1417  test byte ptr [bx-19D8h],4
10e2:141c  je short 1422h
10e2:141e  push cs
10e2:141f  call 10E5h
10e2:1422  mov al,[0CD16h]
10e2:1425  cbw
10e2:1426  mov dx,0Ah
10e2:1429  imul dx
10e2:142b  les bx,[0CC2Ah]
10e2:142f  add bx,ax
10e2:1431  cmp byte ptr es:[bx+6],0
10e2:1436  jg short 1457h
10e2:1438  xor ax,ax
10e2:143a  push ax
10e2:143b  mov ax,0A8h
10e2:143e  push ax
10e2:143f  mov ax,92h
10e2:1442  push ax
10e2:1443  push word ptr [0E4CCh]
10e2:1447  push word ptr [0E4CAh]
10e2:144b  mov ax,2
10e2:144e  push ax
10e2:144f  call far 004Ah,1DA3h
10e2:1454  add sp,0Ch
10e2:1457  mov word ptr [62A5h],0
10e2:145d  mov ax,0B1h
10e2:1460  push ax
10e2:1461  mov ax,0B0h
10e2:1464  push ax
10e2:1465  mov ax,78h
10e2:1468  push ax
10e2:1469  mov ax,44h
10e2:146c  push ax
10e2:146d  call far 0206h,238Bh
10e2:1472  add sp,8
10e2:1475  xor ax,ax
10e2:1477  push ax
10e2:1478  mov ax,2
10e2:147b  push ax
10e2:147c  mov ax,38h
10e2:147f  push ax
10e2:1480  mov ax,0Eh
10e2:1483  push ax
10e2:1484  mov ax,79h
10e2:1487  push ax
10e2:1488  mov ax,8
10e2:148b  push ax
10e2:148c  mov ax,79h
10e2:148f  push ax
10e2:1490  mov ax,8
10e2:1493  push ax
10e2:1494  call far 000Ah,1D92h
10e2:1499  add sp,10h
10e2:149c  call far 02CAh,238Bh
10e2:14a1  pop di
10e2:14a2  pop si
10e2:14a3  mov sp,bp
10e2:14a5  pop bp
10e2:14a6  ret far

; Candidate 10e2:14a7, file offset 0x154c7
10e2:14a7  push bp
10e2:14a8  mov bp,sp
10e2:14aa  mov byte ptr [0E441h],0
10e2:14af  mov ax,0B1h
10e2:14b2  push ax
10e2:14b3  mov ax,0B0h
10e2:14b6  push ax
10e2:14b7  mov ax,78h
10e2:14ba  push ax
10e2:14bb  mov ax,40h
10e2:14be  push ax
10e2:14bf  call far 0206h,238Bh
10e2:14c4  add sp,8
10e2:14c7  mov ax,[0D0ACh]
10e2:14ca  add ax,61A8h
10e2:14cd  push word ptr [0D0AEh]
10e2:14d1  push ax
10e2:14d2  mov ax,38h
10e2:14d5  push ax
10e2:14d6  mov ax,0Eh
10e2:14d9  push ax
10e2:14da  mov ax,79h
10e2:14dd  push ax
10e2:14de  mov ax,8
10e2:14e1  push ax
10e2:14e2  call far dword ptr [6546h]
10e2:14e6  add sp,0Ch
10e2:14e9  call far 02CAh,238Bh
10e2:14ee  mov ax,1
10e2:14f1  push ax
10e2:14f2  call far 003Eh,2ABAh
10e2:14f7  inc sp
10e2:14f8  inc sp
10e2:14f9  push cs
10e2:14fa  call 6
10e2:14fd  les bx,[bp+6]
10e2:1500  mov ax,es:[bx+4]
10e2:1504  pop bp
10e2:1505  ret far

; Candidate 10e2:199c, file offset 0x159bc
10e2:199c  push bp
10e2:199d  mov bp,sp
10e2:199f  sub sp,8
10e2:19a2  push si
10e2:19a3  push di
10e2:19a4  mov di,[bp+6]
10e2:19a7  mov ax,di
10e2:19a9  mov dx,19h
10e2:19ac  imul dx
10e2:19ae  add ax,0
10e2:19b1  mov word ptr [bp-2],29A6h
10e2:19b6  mov [bp-4],ax
10e2:19b9  les bx,[bp-4]
10e2:19bc  mov ax,es:[bx+6]
10e2:19c0  mov dx,es:[bx+4]
10e2:19c4  mov [0DF30h],ax
10e2:19c7  mov [0DF2Eh],dx
10e2:19cb  mov al,es:[bx+12h]
10e2:19cf  cbw
10e2:19d0  push ax
10e2:19d1  call far 00AAh,1C9Fh
10e2:19d6  inc sp
10e2:19d7  inc sp
10e2:19d8  les bx,[bp-4]
10e2:19db  test word ptr es:[bx+8],0A0h
10e2:19e1  je short 19F0h
10e2:19e3  mov al,[0CBC2h]
10e2:19e6  cbw
10e2:19e7  push ax
10e2:19e8  push cs
10e2:19e9  call 0565h
10e2:19ec  inc sp
10e2:19ed  inc sp
10e2:19ee  jmp short 1A16h
10e2:19f0  les bx,[bp-4]
10e2:19f3  test word ptr es:[bx+8],40h
10e2:19f9  je short 1A07h
10e2:19fb  mov ax,0FFFFh
10e2:19fe  push ax
10e2:19ff  push cs
10e2:1a00  call 0565h
10e2:1a03  inc sp
10e2:1a04  inc sp
10e2:1a05  jmp short 1A16h
10e2:1a07  les bx,[bp-4]
10e2:1a0a  test word ptr es:[bx+8],1000h
10e2:1a10  je short 1A16h
10e2:1a12  push cs
10e2:1a13  call 05EAh
10e2:1a16  les bx,[bp-4]
10e2:1a19  test word ptr es:[bx+8],20h
10e2:1a1f  je short 1A40h
10e2:1a21  mov ax,[0E5A8h]
10e2:1a24  inc ax
10e2:1a25  inc ax
10e2:1a26  push word ptr [0E5AAh]
10e2:1a2a  push ax
10e2:1a2b  call far 0284h,21B0h
10e2:1a30  add sp,4
10e2:1a33  push ds
10e2:1a34  mov ax,5825h
10e2:1a37  push ax
10e2:1a38  call far 0284h,21B0h
10e2:1a3d  add sp,4
10e2:1a40  les bx,[bp-4]
10e2:1a43  test word ptr es:[bx+8],30h
10e2:1a49  je short 1A9Bh
10e2:1a4b  les bx,[0E5A8h]
10e2:1a4f  mov ax,es:[bx+14Bh]
10e2:1a54  mov dx,es:[bx+149h]
10e2:1a59  les bx,[bp-4]
10e2:1a5c  and dx,es:[bx+13h]
10e2:1a60  and ax,es:[bx+15h]
10e2:1a64  or dx,ax
10e2:1a66  je short 1A9Bh
10e2:1a68  push word ptr es:[bx+2]
10e2:1a6c  push word ptr es:[bx]
10e2:1a6f  mov ax,[0E5A8h]
10e2:1a72  inc ax
10e2:1a73  inc ax
10e2:1a74  push word ptr [0E5AAh]
10e2:1a78  push ax
10e2:1a79  push ds
10e2:1a7a  mov ax,582Ah
10e2:1a7d  push ax
10e2:1a7e  push ds
10e2:1a7f  mov ax,0F16Eh
10e2:1a82  push ax
10e2:1a83  call far 64A1h,0
10e2:1a88  add sp,10h
10e2:1a8b  push ds
10e2:1a8c  mov ax,0F16Eh
10e2:1a8f  push ax
10e2:1a90  call far 0BE6h,08D7h
10e2:1a95  add sp,4
10e2:1a98  jmp 1C12h
10e2:1a9b  les bx,[bp-4]
10e2:1a9e  test word ptr es:[bx+8],50h
10e2:1aa4  je short 1AE2h
10e2:1aa6  mov ax,[6DDEh]
10e2:1aa9  mov dx,[6DDCh]
10e2:1aad  and dx,es:[bx+13h]
10e2:1ab1  and ax,es:[bx+15h]
10e2:1ab5  or dx,ax
10e2:1ab7  je short 1AE2h
10e2:1ab9  push word ptr es:[bx+2]
10e2:1abd  push word ptr es:[bx]
10e2:1ac0  push ds
10e2:1ac1  mov ax,5859h
10e2:1ac4  push ax
10e2:1ac5  push ds
10e2:1ac6  mov ax,0F16Eh
10e2:1ac9  push ax
10e2:1aca  call far 64A1h,0
10e2:1acf  add sp,0Ch
10e2:1ad2  push ds
10e2:1ad3  mov ax,0F16Eh
10e2:1ad6  push ax
10e2:1ad7  call far 0BE6h,08D7h
10e2:1adc  add sp,4
10e2:1adf  jmp 1C12h
10e2:1ae2  les bx,[bp-4]
10e2:1ae5  test word ptr es:[bx+8],8
10e2:1aeb  je short 1B18h
10e2:1aed  mov ax,es:[bx+0Ch]
10e2:1af1  mov dx,es:[bx+0Ah]
10e2:1af5  mov [bp-6],ax
10e2:1af8  mov [bp-8],dx
10e2:1afb  les bx,[bp-8]
10e2:1afe  push word ptr es:[bx+6]
10e2:1b02  push word ptr es:[bx+4]
10e2:1b06  mov ax,es:[bx+2]
10e2:1b0a  cwd
10e2:1b0b  push dx
10e2:1b0c  push ax
10e2:1b0d  push word ptr es:[bx]
10e2:1b10  push di
10e2:1b11  push cs
10e2:1b12  call 00A1h
10e2:1b15  add sp,0Ch
10e2:1b18  mov byte ptr [0DF38h],0
10e2:1b1d  mov ax,[0DF2Eh]
10e2:1b20  or ax,[0DF30h]
10e2:1b24  je short 1B2Ah
10e2:1b26  call far dword ptr [0DF2Eh]
10e2:1b2a  cmp byte ptr [0DF38h],0
10e2:1b2f  je short 1B34h
10e2:1b31  jmp 1C6Ah
10e2:1b34  les bx,[bp-4]
10e2:1b37  test word ptr es:[bx+8],1
10e2:1b3d  je short 1B55h
10e2:1b3f  mov ax,es:[bx+15h]
10e2:1b43  mov dx,es:[bx+13h]
10e2:1b47  les bx,[0E5A8h]
10e2:1b4b  or es:[bx+149h],dx
10e2:1b50  or es:[bx+14Bh],ax
10e2:1b55  les bx,[bp-4]
10e2:1b58  test word ptr es:[bx+8],4
10e2:1b5e  je short 1B70h
10e2:1b60  mov ax,es:[bx+15h]
10e2:1b64  mov dx,es:[bx+13h]
10e2:1b68  or [6DDCh],dx
10e2:1b6c  or [6DDEh],ax
10e2:1b70  les bx,[bp-4]
10e2:1b73  test word ptr es:[bx+8],200h
10e2:1b79  je short 1BD2h
10e2:1b7b  xor si,si
10e2:1b7d  jmp short 1BCDh
10e2:1b7f  mov ax,1
10e2:1b82  push ax
10e2:1b83  push si
10e2:1b84  call far 06E9h,0E24h
10e2:1b89  add sp,4
10e2:1b8c  or ax,ax
10e2:1b8e  je short 1BCCh
10e2:1b90  mov ax,2
10e2:1b93  push ax
10e2:1b94  push si
10e2:1b95  call far 06E9h,0E24h
10e2:1b9a  add sp,4
10e2:1b9d  or ax,ax
10e2:1b9f  jne short 1BACh
10e2:1ba1  les bx,[bp-4]
10e2:1ba4  test word ptr es:[bx+8],800h
10e2:1baa  je short 1BCCh
10e2:1bac  les bx,[bp-4]
10e2:1baf  mov ax,es:[bx+15h]
10e2:1bb3  mov dx,es:[bx+13h]
10e2:1bb7  push ax
10e2:1bb8  mov ax,si
10e2:1bba  mov bx,159h
10e2:1bbd  push dx
10e2:1bbe  imul bx
10e2:1bc0  mov bx,ax
10e2:1bc2  pop ax
10e2:1bc3  or [bx-18AFh],ax
10e2:1bc7  pop ax
10e2:1bc8  or [bx-18ADh],ax
10e2:1bcc  inc si
10e2:1bcd  cmp si,6
10e2:1bd0  jl short 1B7Fh
10e2:1bd2  les bx,[bp-4]
10e2:1bd5  test word ptr es:[bx+8],2
10e2:1bdb  je short 1BE9h
10e2:1bdd  mov al,[0CBC2h]
10e2:1be0  cbw
10e2:1be1  push ax
10e2:1be2  call far 0CF7h,0F55h
10e2:1be7  inc sp
10e2:1be8  inc sp
10e2:1be9  les bx,[bp-4]
10e2:1bec  test word ptr es:[bx+8],20A0h
10e2:1bf2  je short 1C02h
10e2:1bf4  mov al,[0CBC2h]
10e2:1bf7  cbw
10e2:1bf8  push ax
10e2:1bf9  call far 0AF9h,1901h
10e2:1bfe  inc sp
10e2:1bff  inc sp
10e2:1c00  jmp short 1C12h
10e2:1c02  les bx,[bp-4]
10e2:1c05  test word ptr es:[bx+8],40h
10e2:1c0b  je short 1C12h
10e2:1c0d  call far 0686h,0E24h
10e2:1c12  cmp word ptr [71C8h],0
10e2:1c17  je short 1C1Fh
10e2:1c19  push cs
10e2:1c1a  call 01DFh
10e2:1c1d  jmp short 1C50h
10e2:1c1f  mov al,[0D0B0h]
10e2:1c22  cbw
10e2:1c23  mov dx,159h
10e2:1c26  imul dx
10e2:1c28  mov bx,ax
10e2:1c2a  or byte ptr [bx-19D8h],4
10e2:1c2f  mov al,1
10e2:1c31  push ax
10e2:1c32  mov al,0Bh
10e2:1c34  push ax
10e2:1c35  xor ax,ax
10e2:1c37  mov dx,48h
10e2:1c3a  push ax
10e2:1c3b  push dx
10e2:1c3c  mov al,[0D0B0h]
10e2:1c3f  push ax
10e2:1c40  call far 06B7h,17B7h
10e2:1c45  add sp,0Ah
10e2:1c48  push cs
10e2:1c49  call 6
10e2:1c4c  push cs
10e2:1c4d  call 1127h
10e2:1c50  mov [0CD18h],di
10e2:1c54  mov ax,800h
10e2:1c57  push ax
10e2:1c58  push word ptr [6DD2h]
10e2:1c5c  call far 2BE9h,14ECh
10e2:1c61  add sp,4
10e2:1c64  mov word ptr [0CD18h],0
10e2:1c6a  pop di
10e2:1c6b  pop si
10e2:1c6c  mov sp,bp
10e2:1c6e  pop bp
10e2:1c6f  ret far

; Candidate 10e2:1c70, file offset 0x15c90
10e2:1c70  push bp
10e2:1c71  mov bp,sp
10e2:1c73  push si
10e2:1c74  push di
10e2:1c75  mov si,[bp+8]
10e2:1c78  mov di,[bp+0Ah]
10e2:1c7b  mov al,[0D0B0h]
10e2:1c7e  cbw
10e2:1c7f  mov [0EF46h],ax
10e2:1c82  mov al,[0E4C6h]
10e2:1c85  cbw
10e2:1c86  mov [0EF4Ah],ax
10e2:1c89  mov ax,di
10e2:1c8b  inc ax
10e2:1c8c  mov [71C8h],ax
10e2:1c8f  mov al,[bp+6]
10e2:1c92  mov [0D0B0h],al
10e2:1c95  cmp si,21h
10e2:1c98  jle short 1C9Fh
10e2:1c9a  mov ax,1
10e2:1c9d  jmp short 1CA1h
10e2:1c9f  xor ax,ax
10e2:1ca1  mov [0E4C6h],al
10e2:1ca4  push di
10e2:1ca5  push si
10e2:1ca6  push cs
10e2:1ca7  call 170Eh
10e2:1caa  add sp,4
10e2:1cad  pop di
10e2:1cae  pop si
10e2:1caf  pop bp
10e2:1cb0  ret far

; Candidate 10e2:1edb, file offset 0x15efb
10e2:1edb  push bp
10e2:1edc  mov bp,sp
10e2:1ede  push word ptr [bp+8]
10e2:1ee1  push word ptr [bp+6]
10e2:1ee4  les bx,[bp+6]
10e2:1ee7  push word ptr es:[bx+8]
10e2:1eeb  push word ptr es:[bx+4]
10e2:1eef  call far 1EF9h,10E2h
10e2:1ef4  add sp,8
10e2:1ef7  pop bp
10e2:1ef8  ret far

; Candidate 10e2:1ef9, file offset 0x15f19
10e2:1ef9  push bp
10e2:1efa  mov bp,sp
10e2:1efc  sub sp,0Eh
10e2:1eff  push si
10e2:1f00  push di
10e2:1f01  mov di,[bp+6]
10e2:1f04  cmp word ptr [0E4D2h],0
10e2:1f09  je short 1F1Eh
10e2:1f0b  push word ptr [6DD2h]
10e2:1f0f  mov ax,23h
10e2:1f12  push ax
10e2:1f13  call far 0014h,1A30h
10e2:1f18  add sp,4
10e2:1f1b  jmp 2109h
10e2:1f1e  mov bx,[bp+8]
10e2:1f21  mov al,[bx+56C9h]
10e2:1f25  cbw
10e2:1f26  mov [bp-0Ch],ax
10e2:1f29  mov bx,[bp-0Ch]
10e2:1f2c  shl bx,1
10e2:1f2e  shl bx,1
10e2:1f30  mov ax,[bx+56FFh]
10e2:1f34  mov dx,[bx+56FDh]
10e2:1f38  mov [bp-2],ax
10e2:1f3b  mov [bp-4],dx
10e2:1f3e  xor si,si
10e2:1f40  jmp short 1F4Dh
10e2:1f42  mov bx,si
10e2:1f44  shl bx,1
10e2:1f46  cmp [bx-6BBAh],di
10e2:1f4a  je short 1F52h
10e2:1f4c  inc si
10e2:1f4d  cmp si,12h
10e2:1f50  jl short 1F42h
10e2:1f52  cmp si,11h
10e2:1f55  jle short 1F5Ah
10e2:1f57  jmp 2109h
10e2:1f5a  mov al,[si+56B7h]
10e2:1f5e  cbw
10e2:1f5f  mov [bp-0Eh],ax
10e2:1f62  or ax,ax
10e2:1f64  jne short 1F79h
10e2:1f66  push word ptr [6DD2h]
10e2:1f6a  mov ax,23h
10e2:1f6d  push ax
10e2:1f6e  call far 0014h,1A30h
10e2:1f73  add sp,4
10e2:1f76  jmp 2109h
10e2:1f79  cmp word ptr [bp-0Eh],1
10e2:1f7d  jne short 1FA9h
10e2:1f7f  les bx,[bp+0Ah]
10e2:1f82  mov al,es:[bx+7]
10e2:1f86  cbw
10e2:1f87  and ax,1
10e2:1f8a  mov dx,[6DD4h]
10e2:1f8e  and dx,1
10e2:1f92  cmp ax,dx
10e2:1f94  je short 1FA9h
10e2:1f96  push word ptr [6DD2h]
10e2:1f9a  mov ax,23h
10e2:1f9d  push ax
10e2:1f9e  call far 0014h,1A30h
10e2:1fa3  add sp,4
10e2:1fa6  jmp 2109h
10e2:1fa9  mov al,[si+2330h]
10e2:1fad  cbw
10e2:1fae  mov [bp-6],ax
10e2:1fb1  mov ax,5
10e2:1fb4  push ax
10e2:1fb5  push ss
10e2:1fb6  lea ax,[bp-0Ah]
10e2:1fb9  push ax
10e2:1fba  push ss
10e2:1fbb  lea ax,[bp-8]
10e2:1fbe  push ax
10e2:1fbf  push si
10e2:1fc0  call far 0070h,2ABAh
10e2:1fc5  add sp,0Ch
10e2:1fc8  mov ax,[bp-0Ah]
10e2:1fcb  cmp ax,[bp-8]
10e2:1fce  jge short 1FD3h
10e2:1fd0  jmp 2109h
10e2:1fd3  mov ax,[bp+0Ah]
10e2:1fd6  or ax,[bp+0Ch]
10e2:1fd9  je short 1FE2h
10e2:1fdb  les bx,[bp+0Ah]
10e2:1fde  mov byte ptr es:[bx],0
10e2:1fe2  mov ax,1
10e2:1fe5  push ax
10e2:1fe6  call far 007Ah,2ABAh
10e2:1feb  inc sp
10e2:1fec  inc sp
10e2:1fed  mov ax,[bp+0Ah]
10e2:1ff0  or ax,[bp+0Ch]
10e2:1ff3  je short 1FFCh
10e2:1ff5  les bx,[bp+0Ah]
10e2:1ff8  mov byte ptr es:[bx],2
10e2:1ffc  mov word ptr [62A5h],2
10e2:2002  xor ax,ax
10e2:2004  push ax
10e2:2005  mov ax,78h
10e2:2008  push ax
10e2:2009  mov ax,0B0h
10e2:200c  push ax
10e2:200d  xor ax,ax
10e2:200f  push ax
10e2:2010  push ax
10e2:2011  call far dword ptr [657Ah]
10e2:2015  add sp,0Ah
10e2:2018  xor ax,ax
10e2:201a  push ax
10e2:201b  push ax
10e2:201c  call far dword ptr [657Eh]
10e2:2020  add sp,4
10e2:2023  mov [0EF4Ch],ax
10e2:2026  mov bx,[bp-6]
10e2:2029  mov al,[bx+56D7h]
10e2:202d  cbw
10e2:202e  push ax
10e2:202f  call far 002Fh,2ABAh
10e2:2034  inc sp
10e2:2035  inc sp
10e2:2036  mov word ptr [62A5h],0
10e2:203c  mov ax,5
10e2:203f  push ax
10e2:2040  push ss
10e2:2041  lea ax,[bp-0Ah]
10e2:2044  push ax
10e2:2045  push ss
10e2:2046  lea ax,[bp-8]
10e2:2049  push ax
10e2:204a  push si
10e2:204b  call far 0070h,2ABAh
10e2:2050  add sp,0Ch
10e2:2053  call far 030Fh,238Bh
10e2:2058  mov ax,si
10e2:205a  mov dx,5
10e2:205d  imul dx
10e2:205f  add ax,4
10e2:2062  shl ax,1
10e2:2064  shl ax,1
10e2:2066  mov bx,ax
10e2:2068  mov ax,[bx+23ECh]
10e2:206c  add ax,58h
10e2:206f  mov [0CC2Eh],ax
10e2:2072  mov word ptr [0CC30h],30h
10e2:2078  mov ax,23h
10e2:207b  push ax
10e2:207c  call far 00AAh,1C9Fh
10e2:2081  inc sp
10e2:2082  inc sp
10e2:2083  mov bx,[bp-6]
10e2:2086  cmp bx,3
10e2:2089  ja short 2104h
10e2:208b  shl bx,1
10e2:208d  jmp word ptr cs:[bx+210Fh]
10e2:2092  push word ptr [bp-2]
10e2:2095  push word ptr [bp-4]
10e2:2098  mov ax,7
10e2:209b  push ax
10e2:209c  mov ax,14h
10e2:209f  push ax
10e2:20a0  mov ax,23h
10e2:20a3  push ax
10e2:20a4  mov ax,93h
10e2:20a7  push ax
10e2:20a8  mov ax,3
10e2:20ab  jmp short 20FBh
10e2:20ad  push word ptr [bp-2]
10e2:20b0  push word ptr [bp-4]
10e2:20b3  mov ax,7
10e2:20b6  push ax
10e2:20b7  mov ax,14h
10e2:20ba  push ax
10e2:20bb  mov ax,23h
10e2:20be  push ax
10e2:20bf  mov ax,93h
10e2:20c2  push ax
10e2:20c3  mov ax,2
10e2:20c6  jmp short 20FBh
10e2:20c8  push word ptr [bp-2]
10e2:20cb  push word ptr [bp-4]
10e2:20ce  mov ax,7
10e2:20d1  push ax
10e2:20d2  mov ax,14h
10e2:20d5  push ax
10e2:20d6  mov ax,23h
10e2:20d9  push ax
10e2:20da  mov ax,93h
10e2:20dd  push ax
10e2:20de  mov ax,1
10e2:20e1  jmp short 20FBh
10e2:20e3  push word ptr [bp-2]
10e2:20e6  push word ptr [bp-4]
10e2:20e9  mov ax,4
10e2:20ec  push ax
10e2:20ed  mov ax,14h
10e2:20f0  push ax
10e2:20f1  mov ax,32h
10e2:20f4  push ax
10e2:20f5  mov ax,1CCh
10e2:20f8  push ax
10e2:20f9  xor ax,ax
10e2:20fb  push ax
10e2:20fc  call far 2117h,10E2h
10e2:2101  add sp,0Eh
10e2:2104  call far 033Ah,238Bh
10e2:2109  pop di
10e2:210a  pop si
10e2:210b  mov sp,bp
10e2:210d  pop bp
10e2:210e  ret far

; Candidate 10e2:2117, file offset 0x16137
10e2:2117  push bp
10e2:2118  mov bp,sp
10e2:211a  sub sp,2Ch
10e2:211d  push si
10e2:211e  push di
10e2:211f  mov ax,2
10e2:2122  push ax
10e2:2123  call far 003Dh,2187h
10e2:2128  inc sp
10e2:2129  inc sp
10e2:212a  mov bx,[bp+6]
10e2:212d  shl bx,1
10e2:212f  mov si,[bx+5709h]
10e2:2133  cmp word ptr [bp+6],0
10e2:2137  je short 213Ch
10e2:2139  dec word ptr [bp+6]
10e2:213c  mov ax,[0CBC6h]
10e2:213f  mov dx,[0CBC4h]
10e2:2143  mov [bp-1Eh],ax
10e2:2146  mov [bp-20h],dx
10e2:2149  mov word ptr [bp-28h],0
10e2:214e  mov word ptr [bp-2Ah],0FF9Ch
10e2:2153  mov word ptr [bp-2Ch],114h
10e2:2158  mov ax,[1D4Eh]
10e2:215b  mov [bp-24h],ax
10e2:215e  add ax,[1D52h]
10e2:2162  dec ax
10e2:2163  mov [bp-26h],ax
10e2:2166  mov ax,[1D4Ch]
10e2:2169  shl ax,1
10e2:216b  shl ax,1
10e2:216d  shl ax,1
10e2:216f  mov di,ax
10e2:2171  mov ax,[1D50h]
10e2:2174  shl ax,1
10e2:2176  shl ax,1
10e2:2178  shl ax,1
10e2:217a  mov dx,di
10e2:217c  add dx,ax
10e2:217e  mov [bp-22h],dx
10e2:2181  mov ax,[bp-1Eh]
10e2:2184  mov dx,[bp-20h]
10e2:2187  mov [bp-2],ax
10e2:218a  mov [bp-4],dx
10e2:218d  mov ax,[bp-1Eh]
10e2:2190  mov dx,[bp-20h]
10e2:2193  add dx,12Ch
10e2:2197  mov [bp-6],ax
10e2:219a  mov [bp-8],dx
10e2:219d  mov ax,[bp-1Eh]
10e2:21a0  mov dx,[bp-20h]
10e2:21a3  add dx,258h
10e2:21a7  mov [bp-0Ah],ax
10e2:21aa  mov [bp-0Ch],dx
10e2:21ad  mov ax,[bp-1Eh]
10e2:21b0  mov dx,[bp-20h]
10e2:21b3  add dx,384h
10e2:21b7  mov [bp-0Eh],ax
10e2:21ba  mov [bp-10h],dx
10e2:21bd  mov ax,[bp-1Eh]
10e2:21c0  mov dx,[bp-20h]
10e2:21c3  add dx,4B0h
10e2:21c7  mov [bp-12h],ax
10e2:21ca  mov [bp-14h],dx
10e2:21cd  mov ax,[bp-1Eh]
10e2:21d0  mov dx,[bp-20h]
10e2:21d3  add dx,5DCh
10e2:21d7  mov [bp-16h],ax
10e2:21da  mov [bp-18h],dx
10e2:21dd  mov ax,[bp-1Eh]
10e2:21e0  mov dx,[bp-20h]
10e2:21e3  add dx,708h
10e2:21e7  mov [bp-1Ah],ax
10e2:21ea  mov [bp-1Ch],dx
10e2:21ed  mov ax,[62A5h]
10e2:21f0  mov [0EF42h],ax
10e2:21f3  cmp word ptr [bp+0Ah],96h
10e2:21f8  jle short 21FFh
10e2:21fa  mov word ptr [bp+0Ah],96h
10e2:21ff  mov ax,[0CC2Eh]
10e2:2202  mov [0EF3Ah],ax
10e2:2205  mov ax,[0CC30h]
10e2:2208  mov [0EF3Ch],ax
10e2:220b  mov word ptr [0EF34h],0
10e2:2211  jmp 22C2h
10e2:2214  mov ax,[0EF34h]
10e2:2217  shl ax,1
10e2:2219  les bx,[bp-8]
10e2:221c  add bx,ax
10e2:221e  xor ax,ax
10e2:2220  mov es:[bx],ax
10e2:2223  mov dx,[0EF34h]
10e2:2227  shl dx,1
10e2:2229  les bx,[bp-4]
10e2:222c  add bx,dx
10e2:222e  mov es:[bx],ax
10e2:2231  push word ptr [bp+8]
10e2:2234  xor ax,ax
10e2:2236  push ax
10e2:2237  call far 4,2064h
10e2:223c  add sp,4
10e2:223f  mov dx,[bp+8]
10e2:2242  sar dx,1
10e2:2244  sub ax,dx
10e2:2246  mov dx,[0EF34h]
10e2:224a  shl dx,1
10e2:224c  les bx,[bp-0Ch]
10e2:224f  add bx,dx
10e2:2251  mov es:[bx],ax
10e2:2254  push word ptr [bp+8]
10e2:2257  xor ax,ax
10e2:2259  push ax
10e2:225a  call far 4,2064h
10e2:225f  add sp,4
10e2:2262  mov dx,[bp+8]
10e2:2265  sar dx,1
10e2:2267  sub ax,dx
10e2:2269  mov cl,8
10e2:226b  sub cl,[bp+0Eh]
10e2:226e  mov dx,[bp+8]
10e2:2271  sar dx,cl
10e2:2273  sub ax,dx
10e2:2275  mov dx,[0EF34h]
10e2:2279  shl dx,1
10e2:227b  les bx,[bp-10h]
10e2:227e  add bx,dx
10e2:2280  mov es:[bx],ax
10e2:2283  mov ax,800h
10e2:2286  cwd
10e2:2287  idiv word ptr [bp+0Ch]
10e2:228a  push ax
10e2:228b  mov ax,400h
10e2:228e  cwd
10e2:228f  idiv word ptr [bp+0Ch]
10e2:2292  push ax
10e2:2293  call far 4,2064h
10e2:2298  add sp,4
10e2:229b  mov dx,[0EF34h]
10e2:229f  shl dx,1
10e2:22a1  les bx,[bp-18h]
10e2:22a4  add bx,dx
10e2:22a6  mov es:[bx],ax
10e2:22a9  mov ax,[bp+6]
10e2:22ac  mov cl,8
10e2:22ae  shl ax,cl
10e2:22b0  mov dx,[0EF34h]
10e2:22b4  shl dx,1
10e2:22b6  les bx,[bp-1Ch]
10e2:22b9  add bx,dx
10e2:22bb  mov es:[bx],ax
10e2:22be  inc word ptr [0EF34h]
10e2:22c2  mov ax,[0EF34h]
10e2:22c5  cmp ax,[bp+0Ah]
10e2:22c8  jge short 22CDh
10e2:22ca  jmp 2214h
10e2:22cd  mov word ptr [0EF38h],2
10e2:22d3  jmp 2575h
10e2:22d6  cmp word ptr [0EF38h],2
10e2:22db  jne short 22E0h
10e2:22dd  jmp 2376h
10e2:22e0  mov ax,[bp+0Ah]
10e2:22e3  dec ax
10e2:22e4  mov [0EF34h],ax
10e2:22e7  jmp 236Ch
10e2:22ea  mov ax,[0EF34h]
10e2:22ed  shl ax,1
10e2:22ef  les bx,[bp-4]
10e2:22f2  add bx,ax
10e2:22f4  mov ax,es:[bx]
10e2:22f7  mov cl,6
10e2:22f9  sar ax,cl
10e2:22fb  mov cl,[bp+6]
10e2:22fe  sar ax,cl
10e2:2300  add ax,[0EF3Ah]
10e2:2304  mov [0EF3Eh],ax
10e2:2307  mov ax,[0EF34h]
10e2:230a  shl ax,1
10e2:230c  les bx,[bp-8]
10e2:230f  add bx,ax
10e2:2311  mov ax,es:[bx]
10e2:2314  mov cl,6
10e2:2316  sar ax,cl
10e2:2318  mov cl,[bp+6]
10e2:231b  sar ax,cl
10e2:231d  add ax,[0EF3Ch]
10e2:2321  mov [0EF40h],ax
10e2:2324  cmp [0EF40h],si
10e2:2328  jle short 232Eh
10e2:232a  mov [0EF40h],si
10e2:232e  push word ptr [bp-26h]
10e2:2331  push word ptr [bp-22h]
10e2:2334  push word ptr [bp-24h]
10e2:2337  push di
10e2:2338  push word ptr [0EF40h]
10e2:233c  push word ptr [0EF3Eh]
10e2:2340  call far 067Fh,08D7h
10e2:2345  add sp,0Ch
10e2:2348  or ax,ax
10e2:234a  je short 2368h
10e2:234c  mov ax,[0EF34h]
10e2:234f  shl ax,1
10e2:2351  les bx,[bp-14h]
10e2:2354  add bx,ax
10e2:2356  push word ptr es:[bx]
10e2:2359  push word ptr [0EF40h]
10e2:235d  push word ptr [0EF3Eh]
10e2:2361  call far dword ptr [65B2h]
10e2:2365  add sp,6
10e2:2368  dec word ptr [0EF34h]
10e2:236c  cmp word ptr [0EF34h],0
10e2:2371  jl short 2376h
10e2:2373  jmp 22EAh
10e2:2376  mov word ptr [0EF38h],0
10e2:237c  mov word ptr [0EF34h],0
10e2:2382  jmp 2560h
10e2:2385  mov ax,[0EF34h]
10e2:2388  shl ax,1
10e2:238a  les bx,[bp-0Ch]
10e2:238d  add bx,ax
10e2:238f  cmp word ptr es:[bx],0
10e2:2393  jle short 23A4h
10e2:2395  mov ax,[0EF34h]
10e2:2398  shl ax,1
10e2:239a  mov bx,[bp-0Ch]
10e2:239d  add bx,ax
10e2:239f  dec word ptr es:[bx]
10e2:23a2  jmp short 23B1h
10e2:23a4  mov ax,[0EF34h]
10e2:23a7  shl ax,1
10e2:23a9  les bx,[bp-0Ch]
10e2:23ac  add bx,ax
10e2:23ae  inc word ptr es:[bx]
10e2:23b1  mov ax,[0EF34h]
10e2:23b4  shl ax,1
10e2:23b6  les bx,[bp-0Ch]
10e2:23b9  add bx,ax
10e2:23bb  mov ax,es:[bx]
10e2:23be  mov dx,[0EF34h]
10e2:23c2  shl dx,1
10e2:23c4  les bx,[bp-4]
10e2:23c7  add bx,dx
10e2:23c9  add es:[bx],ax
10e2:23cc  mov ax,[0EF34h]
10e2:23cf  shl ax,1
10e2:23d1  les bx,[bp-10h]
10e2:23d4  add bx,ax
10e2:23d6  add word ptr es:[bx],5
10e2:23da  mov ax,[0EF34h]
10e2:23dd  shl ax,1
10e2:23df  mov bx,[bp-10h]
10e2:23e2  add bx,ax
10e2:23e4  mov ax,es:[bx]
10e2:23e7  mov dx,[0EF34h]
10e2:23eb  shl dx,1
10e2:23ed  les bx,[bp-8]
10e2:23f0  add bx,dx
10e2:23f2  add es:[bx],ax
10e2:23f5  mov ax,[0EF34h]
10e2:23f8  shl ax,1
10e2:23fa  les bx,[bp-18h]
10e2:23fd  add bx,ax
10e2:23ff  mov ax,es:[bx]
10e2:2402  mov dx,[0EF34h]
10e2:2406  shl dx,1
10e2:2408  les bx,[bp-1Ch]
10e2:240b  add bx,dx
10e2:240d  add es:[bx],ax
10e2:2410  mov ax,[0EF34h]
10e2:2413  shl ax,1
10e2:2415  les bx,[bp-4]
10e2:2418  add bx,ax
10e2:241a  mov ax,es:[bx]
10e2:241d  mov cl,6
10e2:241f  sar ax,cl
10e2:2421  mov cl,[bp+6]
10e2:2424  sar ax,cl
10e2:2426  add ax,[0EF3Ah]
10e2:242a  mov [0EF3Eh],ax
10e2:242d  mov ax,[0EF34h]
10e2:2430  shl ax,1
10e2:2432  les bx,[bp-8]
10e2:2435  add bx,ax
10e2:2437  mov ax,es:[bx]
10e2:243a  mov cl,6
10e2:243c  sar ax,cl
10e2:243e  mov cl,[bp+6]
10e2:2441  sar ax,cl
10e2:2443  add ax,[0EF3Ch]
10e2:2447  mov [0EF40h],ax
10e2:244a  cmp [0EF40h],si
10e2:244e  jge short 2455h
10e2:2450  cmp ax,[bp-28h]
10e2:2453  jge short 2475h
10e2:2455  mov ax,[0EF34h]
10e2:2458  shl ax,1
10e2:245a  les bx,[bp-10h]
10e2:245d  add bx,ax
10e2:245f  mov ax,es:[bx]
10e2:2462  sar ax,1
10e2:2464  xor dx,dx
10e2:2466  sub dx,ax
10e2:2468  mov ax,[0EF34h]
10e2:246b  shl ax,1
10e2:246d  mov bx,[bp-10h]
10e2:2470  add bx,ax
10e2:2472  mov es:[bx],dx
10e2:2475  mov ax,[0EF3Eh]
10e2:2478  cmp ax,[bp-2Ch]
10e2:247b  jge short 2482h
10e2:247d  cmp ax,[bp-2Ah]
10e2:2480  jge short 24A2h
10e2:2482  mov ax,[0EF34h]
10e2:2485  shl ax,1
10e2:2487  les bx,[bp-0Ch]
10e2:248a  add bx,ax
10e2:248c  mov ax,es:[bx]
10e2:248f  sar ax,1
10e2:2491  xor dx,dx
10e2:2493  sub dx,ax
10e2:2495  mov ax,[0EF34h]
10e2:2498  shl ax,1
10e2:249a  mov bx,[bp-0Ch]
10e2:249d  add bx,ax
10e2:249f  mov es:[bx],dx
10e2:24a2  cmp [0EF40h],si
10e2:24a6  jle short 24ACh
10e2:24a8  mov [0EF40h],si
10e2:24ac  mov word ptr [62A5h],2
10e2:24b2  push word ptr [0EF40h]
10e2:24b6  push word ptr [0EF3Eh]
10e2:24ba  call far dword ptr [657Eh]
10e2:24be  add sp,4
10e2:24c1  mov [0EF44h],ax
10e2:24c4  mov word ptr [62A5h],0
10e2:24ca  push word ptr [0EF40h]
10e2:24ce  push word ptr [0EF3Eh]
10e2:24d2  call far dword ptr [657Eh]
10e2:24d6  add sp,4
10e2:24d9  mov dx,[0EF34h]
10e2:24dd  shl dx,1
10e2:24df  les bx,[bp-14h]
10e2:24e2  add bx,dx
10e2:24e4  mov es:[bx],ax
10e2:24e7  mov ax,[0EF34h]
10e2:24ea  shl ax,1
10e2:24ec  les bx,[bp-1Ch]
10e2:24ef  add bx,ax
10e2:24f1  mov ax,es:[bx]
10e2:24f4  mov cl,8
10e2:24f6  sar ax,cl
10e2:24f8  les bx,[bp+10h]
10e2:24fb  add bx,ax
10e2:24fd  mov al,es:[bx]
10e2:2500  cbw
10e2:2501  mov [0EF36h],ax
10e2:2504  cmp word ptr [0EF36h],0
10e2:2509  je short 254Dh
10e2:250b  mov word ptr [0EF38h],1
10e2:2511  mov ax,[0EF44h]
10e2:2514  cmp ax,[0EF4Ch]
10e2:2518  jne short 255Ch
10e2:251a  push word ptr [bp-26h]
10e2:251d  push word ptr [bp-22h]
10e2:2520  push word ptr [bp-24h]
10e2:2523  push di
10e2:2524  push word ptr [0EF40h]
10e2:2528  push word ptr [0EF3Eh]
10e2:252c  call far 067Fh,08D7h
10e2:2531  add sp,0Ch
10e2:2534  or ax,ax
10e2:2536  je short 255Ch
10e2:2538  push word ptr [0EF36h]
10e2:253c  push word ptr [0EF40h]
10e2:2540  push word ptr [0EF3Eh]
10e2:2544  call far dword ptr [65B2h]
10e2:2548  add sp,6
10e2:254b  jmp short 255Ch
10e2:254d  mov ax,[0EF34h]
10e2:2550  shl ax,1
10e2:2552  les bx,[bp-18h]
10e2:2555  add bx,ax
10e2:2557  mov word ptr es:[bx],0
10e2:255c  inc word ptr [0EF34h]
10e2:2560  mov ax,[0EF34h]
10e2:2563  cmp ax,[bp+0Ah]
10e2:2566  jge short 256Bh
10e2:2568  jmp 2385h
10e2:256b  call far 0021h,1D9Bh
10e2:2570  call far 0021h,1D9Bh
10e2:2575  cmp word ptr [0EF38h],0
10e2:257a  je short 257Fh
10e2:257c  jmp 22D6h
10e2:257f  mov ax,2
10e2:2582  push ax
10e2:2583  call far 9,2187h
10e2:2588  inc sp
10e2:2589  inc sp
10e2:258a  mov ax,[0EF42h]
10e2:258d  mov [62A5h],ax
10e2:2590  pop di
10e2:2591  pop si
10e2:2592  mov sp,bp
10e2:2594  pop bp
10e2:2595  ret far

; Candidate 10e2:2596, file offset 0x165b6
10e2:2596  push bp
10e2:2597  mov bp,sp
10e2:2599  sub sp,3Eh
10e2:259c  push si
10e2:259d  push di
10e2:259e  mov di,[bp+0Ah]
10e2:25a1  mov word ptr [62A5h],2
10e2:25a7  xor ax,ax
10e2:25a9  push ax
10e2:25aa  mov ax,78h
10e2:25ad  push ax
10e2:25ae  mov ax,0B0h
10e2:25b1  push ax
10e2:25b2  xor ax,ax
10e2:25b4  push ax
10e2:25b5  push ax
10e2:25b6  call far dword ptr [657Ah]
10e2:25ba  add sp,0Ah
10e2:25bd  xor ax,ax
10e2:25bf  push ax
10e2:25c0  push ax
10e2:25c1  call far dword ptr [657Eh]
10e2:25c5  add sp,4
10e2:25c8  mov [0EF4Ch],ax
10e2:25cb  mov ax,7
10e2:25ce  push ax
10e2:25cf  call far 002Fh,2ABAh
10e2:25d4  inc sp
10e2:25d5  inc sp
10e2:25d6  mov word ptr [62A5h],0
10e2:25dc  mov ax,[0CBC6h]
10e2:25df  mov dx,[0CBC4h]
10e2:25e3  mov [bp-34h],ax
10e2:25e6  mov [bp-36h],dx
10e2:25e9  mov ax,[bp-34h]
10e2:25ec  mov [bp-14h],ax
10e2:25ef  mov [bp-16h],dx
10e2:25f2  mov ax,[bp-34h]
10e2:25f5  mov dx,[bp-36h]
10e2:25f8  add dx,12Ch
10e2:25fc  mov [bp-18h],ax
10e2:25ff  mov [bp-1Ah],dx
10e2:2602  mov ax,[bp-34h]
10e2:2605  mov dx,[bp-36h]
10e2:2608  add dx,258h
10e2:260c  mov [bp-1Ch],ax
10e2:260f  mov [bp-1Eh],dx
10e2:2612  mov ax,[bp-34h]
10e2:2615  mov dx,[bp-36h]
10e2:2618  add dx,384h
10e2:261c  mov [bp-20h],ax
10e2:261f  mov [bp-22h],dx
10e2:2622  mov ax,[bp-34h]
10e2:2625  mov dx,[bp-36h]
10e2:2628  add dx,4B0h
10e2:262c  mov [bp-24h],ax
10e2:262f  mov [bp-26h],dx
10e2:2632  mov ax,[bp-34h]
10e2:2635  mov dx,[bp-36h]
10e2:2638  add dx,5DCh
10e2:263c  mov [bp-28h],ax
10e2:263f  mov [bp-2Ah],dx
10e2:2642  mov ax,[bp-34h]
10e2:2645  mov dx,[bp-36h]
10e2:2648  add dx,708h
10e2:264c  mov [bp-2Ch],ax
10e2:264f  mov [bp-2Eh],dx
10e2:2652  mov ax,[bp-34h]
10e2:2655  mov dx,[bp-36h]
10e2:2658  add dx,834h
10e2:265c  mov [bp-30h],ax
10e2:265f  mov [bp-32h],dx
10e2:2662  mov cl,6
10e2:2664  shl word ptr [bp+8],cl
10e2:2667  mov ax,2
10e2:266a  push ax
10e2:266b  call far 003Dh,2187h
10e2:2670  inc sp
10e2:2671  inc sp
10e2:2672  mov ax,[62A5h]
10e2:2675  mov [bp-0Eh],ax
10e2:2678  cmp word ptr [bp+6],96h
10e2:267d  jle short 2684h
10e2:267f  mov word ptr [bp+6],96h
10e2:2684  mov word ptr [bp-6],58h
10e2:2689  mov word ptr [bp-8],30h
10e2:268e  xor si,si
10e2:2690  jmp 2827h
10e2:2693  push word ptr [bp+8]
10e2:2696  mov ax,[bp+8]
10e2:2699  sar ax,1
10e2:269b  sar ax,1
10e2:269d  push ax
10e2:269e  call far 4,2064h
10e2:26a3  add sp,4
10e2:26a6  mov [bp-38h],ax
10e2:26a9  xor ax,ax
10e2:26ab  mov [bp-3Eh],ax
10e2:26ae  mov [bp-3Ah],ax
10e2:26b1  jmp short 26BCh
10e2:26b3  add [bp-3Ah],di
10e2:26b6  mov ax,[bp-3Ah]
10e2:26b9  add [bp-3Eh],ax
10e2:26bc  mov ax,[bp-3Eh]
10e2:26bf  cmp ax,[bp-38h]
10e2:26c2  jl short 26B3h
10e2:26c4  call far 4,23DCh
10e2:26c9  mov ah,0
10e2:26cb  and ax,3
10e2:26ce  mov bx,ax
10e2:26d0  cmp bx,3
10e2:26d3  jbe short 26D8h
10e2:26d5  jmp 27A4h
10e2:26d8  shl bx,1
10e2:26da  jmp word ptr cs:[bx+2AF3h]
10e2:26df  mov ax,si
10e2:26e1  shl ax,1
10e2:26e3  les bx,[bp-16h]
10e2:26e6  add bx,ax
10e2:26e8  mov word ptr es:[bx],20h
10e2:26ed  mov ax,si
10e2:26ef  shl ax,1
10e2:26f1  les bx,[bp-1Ah]
10e2:26f4  add bx,ax
10e2:26f6  mov ax,[bp-3Eh]
10e2:26f9  mov es:[bx],ax
10e2:26fc  mov ax,si
10e2:26fe  shl ax,1
10e2:2700  les bx,[bp-1Eh]
10e2:2703  add bx,ax
10e2:2705  mov ax,[bp-3Ah]
10e2:2708  mov es:[bx],ax
10e2:270b  mov ax,si
10e2:270d  shl ax,1
10e2:270f  les bx,[bp-22h]
10e2:2712  add bx,ax
10e2:2714  mov word ptr es:[bx],0
10e2:2719  jmp 27A4h
10e2:271c  mov ax,si
10e2:271e  shl ax,1
10e2:2720  les bx,[bp-16h]
10e2:2723  add bx,ax
10e2:2725  mov ax,[bp-3Eh]
10e2:2728  jmp short 2776h
10e2:272a  mov ax,si
10e2:272c  shl ax,1
10e2:272e  les bx,[bp-16h]
10e2:2731  add bx,ax
10e2:2733  mov word ptr es:[bx],20h
10e2:2738  mov ax,si
10e2:273a  shl ax,1
10e2:273c  les bx,[bp-1Ah]
10e2:273f  add bx,ax
10e2:2741  mov ax,[bp-3Eh]
10e2:2744  neg ax
10e2:2746  mov es:[bx],ax
10e2:2749  mov ax,si
10e2:274b  shl ax,1
10e2:274d  les bx,[bp-1Eh]
10e2:2750  add bx,ax
10e2:2752  mov ax,[bp-3Ah]
10e2:2755  mov es:[bx],ax
10e2:2758  mov ax,si
10e2:275a  shl ax,1
10e2:275c  les bx,[bp-22h]
10e2:275f  add bx,ax
10e2:2761  mov word ptr es:[bx],0
10e2:2766  jmp short 27A4h
10e2:2768  mov ax,si
10e2:276a  shl ax,1
10e2:276c  les bx,[bp-16h]
10e2:276f  add bx,ax
10e2:2771  mov ax,[bp-3Eh]
10e2:2774  neg ax
10e2:2776  mov es:[bx],ax
10e2:2779  mov ax,si
10e2:277b  shl ax,1
10e2:277d  les bx,[bp-1Ah]
10e2:2780  add bx,ax
10e2:2782  mov word ptr es:[bx],20h
10e2:2787  mov ax,si
10e2:2789  shl ax,1
10e2:278b  les bx,[bp-1Eh]
10e2:278e  add bx,ax
10e2:2790  mov word ptr es:[bx],0
10e2:2795  mov ax,si
10e2:2797  shl ax,1
10e2:2799  les bx,[bp-22h]
10e2:279c  add bx,ax
10e2:279e  mov ax,[bp-3Ah]
10e2:27a1  mov es:[bx],ax
10e2:27a4  call far 4,23DCh
10e2:27a9  test al,1
10e2:27ab  je short 27D5h
10e2:27ad  mov ax,si
10e2:27af  shl ax,1
10e2:27b1  les bx,[bp-1Eh]
10e2:27b4  add bx,ax
10e2:27b6  mov dx,0FFFFh
10e2:27b9  mov ax,es:[bx]
10e2:27bc  imul dx
10e2:27be  mov es:[bx],ax
10e2:27c1  mov ax,si
10e2:27c3  shl ax,1
10e2:27c5  les bx,[bp-22h]
10e2:27c8  add bx,ax
10e2:27ca  mov dx,0FFFFh
10e2:27cd  mov ax,es:[bx]
10e2:27d0  imul dx
10e2:27d2  mov es:[bx],ax
10e2:27d5  mov ax,800h
10e2:27d8  cwd
10e2:27d9  idiv word ptr [bp+0Eh]
10e2:27dc  push ax
10e2:27dd  mov ax,400h
10e2:27e0  cwd
10e2:27e1  idiv word ptr [bp+0Eh]
10e2:27e4  push ax
10e2:27e5  call far 4,2064h
10e2:27ea  add sp,4
10e2:27ed  mov dx,si
10e2:27ef  shl dx,1
10e2:27f1  les bx,[bp-2Ah]
10e2:27f4  add bx,dx
10e2:27f6  mov es:[bx],ax
10e2:27f9  mov ax,si
10e2:27fb  shl ax,1
10e2:27fd  les bx,[bp-2Eh]
10e2:2800  add bx,ax
10e2:2802  mov word ptr es:[bx],0
10e2:2807  mov ax,[bp+0Eh]
10e2:280a  sar ax,1
10e2:280c  sar ax,1
10e2:280e  push ax
10e2:280f  xor ax,ax
10e2:2811  push ax
10e2:2812  call far 4,2064h
10e2:2817  add sp,4
10e2:281a  mov dx,si
10e2:281c  shl dx,1
10e2:281e  les bx,[bp-32h]
10e2:2821  add bx,dx
10e2:2823  mov es:[bx],ax
10e2:2826  inc si
10e2:2827  cmp si,[bp+6]
10e2:282a  jge short 282Fh
10e2:282c  jmp 2693h
10e2:282f  mov word ptr [bp-4],2
10e2:2834  mov word ptr [bp-12h],0
10e2:2839  jmp 2AD0h
10e2:283c  cmp word ptr [bp-4],2
10e2:2840  je short 2892h
10e2:2842  mov ax,[bp+6]
10e2:2845  dec ax
10e2:2846  mov si,ax
10e2:2848  jmp short 288Eh
10e2:284a  mov ax,si
10e2:284c  shl ax,1
10e2:284e  les bx,[bp-16h]
10e2:2851  add bx,ax
10e2:2853  mov ax,es:[bx]
10e2:2856  mov cl,6
10e2:2858  sar ax,cl
10e2:285a  add ax,[bp-6]
10e2:285d  mov [bp-0Ah],ax
10e2:2860  mov ax,si
10e2:2862  shl ax,1
10e2:2864  les bx,[bp-1Ah]
10e2:2867  add bx,ax
10e2:2869  mov ax,es:[bx]
10e2:286c  sar ax,cl
10e2:286e  add ax,[bp-8]
10e2:2871  mov [bp-0Ch],ax
10e2:2874  mov ax,si
10e2:2876  shl ax,1
10e2:2878  les bx,[bp-26h]
10e2:287b  add bx,ax
10e2:287d  push word ptr es:[bx]
10e2:2880  push word ptr [bp-0Ch]
10e2:2883  push word ptr [bp-0Ah]
10e2:2886  call far dword ptr [65B2h]
10e2:288a  add sp,6
10e2:288d  dec si
10e2:288e  or si,si
10e2:2890  jge short 284Ah
10e2:2892  mov word ptr [bp-4],0
10e2:2897  mov ax,di
10e2:2899  sar ax,1
10e2:289b  mov dx,di
10e2:289d  sar dx,1
10e2:289f  sar dx,1
10e2:28a1  add ax,dx
10e2:28a3  mov dx,di
10e2:28a5  sar dx,1
10e2:28a7  sar dx,1
10e2:28a9  sar dx,1
10e2:28ab  add ax,dx
10e2:28ad  mov [bp-3Ch],ax
10e2:28b0  xor si,si
10e2:28b2  jmp 2AC0h
10e2:28b5  mov ax,si
10e2:28b7  shl ax,1
10e2:28b9  les bx,[bp-32h]
10e2:28bc  add bx,ax
10e2:28be  cmp word ptr es:[bx],0
10e2:28c2  je short 28D3h
10e2:28c4  mov ax,si
10e2:28c6  shl ax,1
10e2:28c8  mov bx,[bp-32h]
10e2:28cb  add bx,ax
10e2:28cd  dec word ptr es:[bx]
10e2:28d0  jmp 29EDh
10e2:28d3  mov ax,si
10e2:28d5  shl ax,1
10e2:28d7  les bx,[bp-16h]
10e2:28da  add bx,ax
10e2:28dc  cmp word ptr es:[bx],0
10e2:28e0  jle short 2910h
10e2:28e2  mov ax,si
10e2:28e4  shl ax,1
10e2:28e6  les bx,[bp-1Eh]
10e2:28e9  add bx,ax
10e2:28eb  cmp word ptr es:[bx],0
10e2:28ef  jle short 28FFh
10e2:28f1  mov ax,si
10e2:28f3  shl ax,1
10e2:28f5  mov bx,[bp-1Eh]
10e2:28f8  add bx,ax
10e2:28fa  sub es:[bx],di
10e2:28fd  jmp short 293Ch
10e2:28ff  mov ax,si
10e2:2901  shl ax,1
10e2:2903  les bx,[bp-1Eh]
10e2:2906  add bx,ax
10e2:2908  mov ax,[bp-3Ch]
10e2:290b  sub es:[bx],ax
10e2:290e  jmp short 293Ch
10e2:2910  mov ax,si
10e2:2912  shl ax,1
10e2:2914  les bx,[bp-1Eh]
10e2:2917  add bx,ax
10e2:2919  cmp word ptr es:[bx],0
10e2:291d  jge short 292Dh
10e2:291f  mov ax,si
10e2:2921  shl ax,1
10e2:2923  mov bx,[bp-1Eh]
10e2:2926  add bx,ax
10e2:2928  add es:[bx],di
10e2:292b  jmp short 293Ch
10e2:292d  mov ax,si
10e2:292f  shl ax,1
10e2:2931  les bx,[bp-1Eh]
10e2:2934  add bx,ax
10e2:2936  mov ax,[bp-3Ch]
10e2:2939  add es:[bx],ax
10e2:293c  mov ax,si
10e2:293e  shl ax,1
10e2:2940  les bx,[bp-1Ah]
10e2:2943  add bx,ax
10e2:2945  cmp word ptr es:[bx],0
10e2:2949  jle short 2979h
10e2:294b  mov ax,si
10e2:294d  shl ax,1
10e2:294f  les bx,[bp-22h]
10e2:2952  add bx,ax
10e2:2954  cmp word ptr es:[bx],0
10e2:2958  jle short 2968h
10e2:295a  mov ax,si
10e2:295c  shl ax,1
10e2:295e  mov bx,[bp-22h]
10e2:2961  add bx,ax
10e2:2963  sub es:[bx],di
10e2:2966  jmp short 29A5h
10e2:2968  mov ax,si
10e2:296a  shl ax,1
10e2:296c  les bx,[bp-22h]
10e2:296f  add bx,ax
10e2:2971  mov ax,[bp-3Ch]
10e2:2974  sub es:[bx],ax
10e2:2977  jmp short 29A5h
10e2:2979  mov ax,si
10e2:297b  shl ax,1
10e2:297d  les bx,[bp-22h]
10e2:2980  add bx,ax
10e2:2982  cmp word ptr es:[bx],0
10e2:2986  jge short 2996h
10e2:2988  mov ax,si
10e2:298a  shl ax,1
10e2:298c  mov bx,[bp-22h]
10e2:298f  add bx,ax
10e2:2991  add es:[bx],di
10e2:2994  jmp short 29A5h
10e2:2996  mov ax,si
10e2:2998  shl ax,1
10e2:299a  les bx,[bp-22h]
10e2:299d  add bx,ax
10e2:299f  mov ax,[bp-3Ch]
10e2:29a2  add es:[bx],ax
10e2:29a5  mov ax,si
10e2:29a7  shl ax,1
10e2:29a9  les bx,[bp-1Eh]
10e2:29ac  add bx,ax
10e2:29ae  mov ax,es:[bx]
10e2:29b1  mov dx,si
10e2:29b3  shl dx,1
10e2:29b5  les bx,[bp-16h]
10e2:29b8  add bx,dx
10e2:29ba  add es:[bx],ax
10e2:29bd  mov ax,si
10e2:29bf  shl ax,1
10e2:29c1  les bx,[bp-22h]
10e2:29c4  add bx,ax
10e2:29c6  mov ax,es:[bx]
10e2:29c9  mov dx,si
10e2:29cb  shl dx,1
10e2:29cd  les bx,[bp-1Ah]
10e2:29d0  add bx,dx
10e2:29d2  add es:[bx],ax
10e2:29d5  mov ax,si
10e2:29d7  shl ax,1
10e2:29d9  les bx,[bp-2Ah]
10e2:29dc  add bx,ax
10e2:29de  mov ax,es:[bx]
10e2:29e1  mov dx,si
10e2:29e3  shl dx,1
10e2:29e5  les bx,[bp-2Eh]
10e2:29e8  add bx,dx
10e2:29ea  add es:[bx],ax
10e2:29ed  mov ax,si
10e2:29ef  shl ax,1
10e2:29f1  les bx,[bp-16h]
10e2:29f4  add bx,ax
10e2:29f6  mov ax,es:[bx]
10e2:29f9  mov cl,6
10e2:29fb  sar ax,cl
10e2:29fd  add ax,[bp-6]
10e2:2a00  mov [bp-0Ah],ax
10e2:2a03  mov ax,si
10e2:2a05  shl ax,1
10e2:2a07  les bx,[bp-1Ah]
10e2:2a0a  add bx,ax
10e2:2a0c  mov ax,es:[bx]
10e2:2a0f  sar ax,cl
10e2:2a11  add ax,[bp-8]
10e2:2a14  mov [bp-0Ch],ax
10e2:2a17  mov ax,[bp+0Eh]
10e2:2a1a  sar ax,1
10e2:2a1c  sar ax,1
10e2:2a1e  cmp ax,[bp-12h]
10e2:2a21  jle short 2A2Ah
10e2:2a23  mov word ptr [bp-10h],0
10e2:2a28  jmp short 2A46h
10e2:2a2a  mov word ptr [62A5h],2
10e2:2a30  push word ptr [bp-0Ch]
10e2:2a33  push word ptr [bp-0Ah]
10e2:2a36  call far dword ptr [657Eh]
10e2:2a3a  add sp,4
10e2:2a3d  mov [bp-10h],ax
10e2:2a40  mov word ptr [62A5h],0
10e2:2a46  push word ptr [bp-0Ch]
10e2:2a49  push word ptr [bp-0Ah]
10e2:2a4c  call far dword ptr [657Eh]
10e2:2a50  add sp,4
10e2:2a53  mov dx,si
10e2:2a55  shl dx,1
10e2:2a57  les bx,[bp-26h]
10e2:2a5a  add bx,dx
10e2:2a5c  mov es:[bx],ax
10e2:2a5f  mov ax,si
10e2:2a61  shl ax,1
10e2:2a63  les bx,[bp-2Eh]
10e2:2a66  add bx,ax
10e2:2a68  mov ax,es:[bx]
10e2:2a6b  mov cl,8
10e2:2a6d  sar ax,cl
10e2:2a6f  shl ax,1
10e2:2a71  les bx,[bp+10h]
10e2:2a74  add bx,ax
10e2:2a76  mov ax,es:[bx]
10e2:2a79  mov [bp-2],ax
10e2:2a7c  cmp word ptr [bp-2],0
10e2:2a80  je short 2AB1h
10e2:2a82  mov word ptr [bp-4],1
10e2:2a87  mov ax,[bp-10h]
10e2:2a8a  cmp ax,[0EF4Ch]
10e2:2a8e  jne short 2ABFh
10e2:2a90  mov ax,si
10e2:2a92  shl ax,1
10e2:2a94  les bx,[bp-32h]
10e2:2a97  add bx,ax
10e2:2a99  cmp word ptr es:[bx],0
10e2:2a9d  jne short 2ABFh
10e2:2a9f  push word ptr [bp-2]
10e2:2aa2  push word ptr [bp-0Ch]
10e2:2aa5  push word ptr [bp-0Ah]
10e2:2aa8  call far dword ptr [65B2h]
10e2:2aac  add sp,6
10e2:2aaf  jmp short 2ABFh
10e2:2ab1  mov ax,si
10e2:2ab3  shl ax,1
10e2:2ab5  les bx,[bp-2Ah]
10e2:2ab8  add bx,ax
10e2:2aba  mov word ptr es:[bx],0
10e2:2abf  inc si
10e2:2ac0  cmp si,[bp+6]
10e2:2ac3  jge short 2AC8h
10e2:2ac5  jmp 28B5h
10e2:2ac8  call far 0021h,1D9Bh
10e2:2acd  inc word ptr [bp-12h]
10e2:2ad0  cmp word ptr [bp-4],0
10e2:2ad4  je short 2AD9h
10e2:2ad6  jmp 283Ch
10e2:2ad9  mov ax,[bp-0Eh]
10e2:2adc  mov [62A5h],ax
10e2:2adf  inc word ptr [bp+0Ch]
10e2:2ae2  mov ax,2
10e2:2ae5  push ax
10e2:2ae6  call far 9,2187h
10e2:2aeb  inc sp
10e2:2aec  inc sp
10e2:2aed  pop di
10e2:2aee  pop si
10e2:2aef  mov sp,bp
10e2:2af1  pop bp
10e2:2af2  ret far

; Candidate 10e2:2afb, file offset 0x16b1b
10e2:2afb  push bp
10e2:2afc  mov bp,sp
10e2:2afe  sub sp,4
10e2:2b01  push si
10e2:2b02  push di
10e2:2b03  mov di,[bp+6]
10e2:2b06  mov ax,di
10e2:2b08  mov dx,159h
10e2:2b0b  imul dx
10e2:2b0d  add ax,0E608h
10e2:2b10  mov [bp-2],ds
10e2:2b13  mov [bp-4],ax
10e2:2b16  les bx,[bp-4]
10e2:2b19  mov word ptr es:[bx+14Bh],0
10e2:2b20  mov word ptr es:[bx+149h],0
10e2:2b27  xor si,si
10e2:2b29  jmp short 2B35h
10e2:2b2b  les bx,[bp-4]
10e2:2b2e  mov byte ptr es:[bx+si+145h],0
10e2:2b34  inc si
10e2:2b35  cmp si,4
10e2:2b38  jl short 2B2Bh
10e2:2b3a  xor si,si
10e2:2b3c  jmp short 2B80h
10e2:2b3e  les bx,[bp-4]
10e2:2b41  cmp byte ptr es:[bx+si+13Bh],0
10e2:2b47  jge short 2B5Dh
10e2:2b49  xor ax,ax
10e2:2b4b  push ax
10e2:2b4c  push di
10e2:2b4d  mov al,es:[bx+si+13Bh]
10e2:2b52  cbw
10e2:2b53  neg ax
10e2:2b55  push ax
10e2:2b56  push cs
10e2:2b57  call 0C6Dh
10e2:2b5a  add sp,6
10e2:2b5d  mov ax,si
10e2:2b5f  shl ax,1
10e2:2b61  shl ax,1
10e2:2b63  les bx,[bp-4]
10e2:2b66  add bx,ax
10e2:2b68  mov word ptr es:[bx+115h],0
10e2:2b6f  mov word ptr es:[bx+113h],0
10e2:2b76  mov bx,[bp-4]
10e2:2b79  mov byte ptr es:[bx+si+13Bh],0
10e2:2b7f  inc si
10e2:2b80  cmp si,0Ah
10e2:2b83  jl short 2B3Eh
10e2:2b85  call far 0C75h,17B7h
10e2:2b8a  push di
10e2:2b8b  call far 0CF7h,0F55h
10e2:2b90  inc sp
10e2:2b91  inc sp
10e2:2b92  les bx,[bp-4]
10e2:2b95  mov byte ptr es:[bx+20h],0
10e2:2b9a  mov byte ptr es:[bx+14Eh],0
10e2:2ba0  mov byte ptr es:[bx+14Fh],0
10e2:2ba6  mov byte ptr es:[bx+14Dh],0
10e2:2bac  mov al,es:[bx+0Eh]
10e2:2bb0  mov es:[bx+0Dh],al
10e2:2bb4  mov al,es:[bx+10h]
10e2:2bb8  mov es:[bx+0Fh],al
10e2:2bbc  call far 0686h,0E24h
10e2:2bc1  pop di
10e2:2bc2  pop si
10e2:2bc3  mov sp,bp
10e2:2bc5  pop bp
10e2:2bc6  ret far

; Candidate 10e2:2bc7, file offset 0x16be7
10e2:2bc7  push bp
10e2:2bc8  mov bp,sp
10e2:2bca  push si
10e2:2bcb  mov al,0
10e2:2bcd  push ax
10e2:2bce  mov al,6
10e2:2bd0  push ax
10e2:2bd1  mov al,1
10e2:2bd3  push ax
10e2:2bd4  call far 0505h,08D7h
10e2:2bd9  add sp,6
10e2:2bdc  mov si,ax
10e2:2bde  mov word ptr [0EF48h],0
10e2:2be4  jmp short 2C09h
10e2:2be6  mov ax,3
10e2:2be9  push ax
10e2:2bea  push si
10e2:2beb  call far 06E9h,0E24h
10e2:2bf0  add sp,4
10e2:2bf3  or ax,ax
10e2:2bf5  je short 2BFBh
10e2:2bf7  mov ax,si
10e2:2bf9  jmp short 2C13h
10e2:2bfb  inc si
10e2:2bfc  mov ax,si
10e2:2bfe  cmp ax,6
10e2:2c01  jle short 2C05h
10e2:2c03  xor si,si
10e2:2c05  inc word ptr [0EF48h]
10e2:2c09  cmp word ptr [0EF48h],6
10e2:2c0e  jl short 2BE6h
10e2:2c10  mov ax,0FFFFh
10e2:2c13  pop si
10e2:2c14  pop bp
10e2:2c15  ret far

; Candidate 10e2:2c16, file offset 0x16c36
10e2:2c16  push bp
10e2:2c17  mov bp,sp
10e2:2c19  push si
10e2:2c1a  mov ax,[bp+6]
10e2:2c1d  inc ax
10e2:2c1e  mov si,ax
10e2:2c20  inc word ptr [0EF48h]
10e2:2c24  jmp short 2C45h
10e2:2c26  mov ax,3
10e2:2c29  push ax
10e2:2c2a  push si
10e2:2c2b  call far 06E9h,0E24h
10e2:2c30  add sp,4
10e2:2c33  or ax,ax
10e2:2c35  je short 2C3Bh
10e2:2c37  mov ax,si
10e2:2c39  jmp short 2C4Fh
10e2:2c3b  inc si
10e2:2c3c  mov ax,si
10e2:2c3e  cmp ax,6
10e2:2c41  jle short 2C45h
10e2:2c43  xor si,si
10e2:2c45  cmp word ptr [0EF48h],6
10e2:2c4a  jl short 2C26h
10e2:2c4c  mov ax,0FFFFh
10e2:2c4f  pop si
10e2:2c50  pop bp
10e2:2c51  ret far

; Candidate 13a7:098c, file offset 0x175fc
13a7:098c  push bp
13a7:098d  mov bp,sp
13a7:098f  push si
13a7:0990  mov si,[bp+6]
13a7:0993  mov al,0
13a7:0995  push ax
13a7:0996  mov ax,4
13a7:0999  push ax
13a7:099a  push ds
13a7:099b  mov ax,si
13a7:099d  mov dx,6
13a7:09a0  imul dx
13a7:09a2  mov bx,ax
13a7:09a4  mov ax,[bx-6CBAh]
13a7:09a8  mov dx,0Ah
13a7:09ab  imul dx
13a7:09ad  add ax,0A360h
13a7:09b0  push ax
13a7:09b1  call far 7107h,0
13a7:09b6  add sp,8
13a7:09b9  mov ax,si
13a7:09bb  mov dx,6
13a7:09be  imul dx
13a7:09c0  mov bx,ax
13a7:09c2  mov word ptr [bx-6CBAh],0
13a7:09c8  mov byte ptr [0D0AAh],1
13a7:09cd  pop si
13a7:09ce  pop bp
13a7:09cf  ret far

; Candidate 14ec:000b, file offset 0x180cb
14ec:000b  push bp
14ec:000c  mov bp,sp
14ec:000e  sub sp,4
14ec:0011  push si
14ec:0012  mov [bp-2],ds
14ec:0015  mov word ptr [bp-4],0CBC8h
14ec:001a  xor si,si
14ec:001c  jmp short 006Bh
14ec:001e  les bx,[bp-4]
14ec:0021  mov ax,es:[bx+6]
14ec:0025  mov dx,es:[bx+4]
14ec:0029  cmp ax,[6686h]
14ec:002d  ja short 0066h
14ec:002f  jb short 0037h
14ec:0031  cmp dx,[6684h]
14ec:0035  jae short 0066h
14ec:0037  mov ax,80h
14ec:003a  push ax
14ec:003b  les bx,[bp-4]
14ec:003e  push word ptr es:[bx]
14ec:0041  call far 2BE9h,14ECh
14ec:0046  add sp,4
14ec:0049  les bx,[bp-4]
14ec:004c  mov ax,es:[bx+2]
14ec:0050  cwd
14ec:0051  add ax,[6684h]
14ec:0055  adc dx,[6686h]
14ec:0059  mov es:[bx+6],dx
14ec:005d  mov es:[bx+4],ax
14ec:0061  mov byte ptr [0D0AAh],1
14ec:0066  inc si
14ec:0067  add word ptr [bp-4],8
14ec:006b  cmp si,[0E4C8h]
14ec:006f  jl short 001Eh
14ec:0071  pop si
14ec:0072  mov sp,bp
14ec:0074  pop bp
14ec:0075  ret far

; Candidate 14ec:0076, file offset 0x18136
14ec:0076  push bp
14ec:0077  mov bp,sp
14ec:0079  push si
14ec:007a  push di
14ec:007b  mov di,[bp+6]
14ec:007e  call far 033Dh,0997h
14ec:0083  mov si,[6DD2h]
14ec:0087  mov [6DD2h],di
14ec:008b  mov ax,2
14ec:008e  push ax
14ec:008f  push si
14ec:0090  call far 2BE9h,14ECh
14ec:0095  add sp,4
14ec:0098  inc word ptr [5A28h]
14ec:009c  mov ax,[5A28h]
14ec:009f  cmp ax,3
14ec:00a2  jle short 00B7h
14ec:00a4  push ds
14ec:00a5  mov ax,5B29h
14ec:00a8  push ax
14ec:00a9  call far 0284h,21B0h
14ec:00ae  add sp,4
14ec:00b1  mov word ptr [5A28h],0
14ec:00b7  mov ax,1
14ec:00ba  push ax
14ec:00bb  push di
14ec:00bc  call far 2BE9h,14ECh
14ec:00c1  add sp,4
14ec:00c4  mov ax,di
14ec:00c6  mov dx,0Ah
14ec:00c9  imul dx
14ec:00cb  mov bx,ax
14ec:00cd  cmp byte ptr [bx-5CA0h],1Ah
14ec:00d2  jne short 00ECh
14ec:00d4  xor si,si
14ec:00d6  jmp short 00E7h
14ec:00d8  mov ax,di
14ec:00da  mov dx,0Ah
14ec:00dd  imul dx
14ec:00df  mov bx,ax
14ec:00e1  mov byte ptr [bx+si-5CA0h],0
14ec:00e6  inc si
14ec:00e7  cmp si,4
14ec:00ea  jl short 00D8h
14ec:00ec  call far 033Dh,0997h
14ec:00f1  inc word ptr [0E5C8h]
14ec:00f5  mov byte ptr [0DF24h],0FFh
14ec:00fa  mov byte ptr [0D0AAh],1
14ec:00ff  call far 0EC1h,17B7h
14ec:0104  pop di
14ec:0105  pop si
14ec:0106  pop bp
14ec:0107  ret far

; Candidate 14ec:01eb, file offset 0x182ab
14ec:01eb  push bp
14ec:01ec  mov bp,sp
14ec:01ee  mov ax,[bp+6]
14ec:01f1  mov dx,0Ah
14ec:01f4  imul dx
14ec:01f6  mov bx,ax
14ec:01f8  test word ptr [bx-5C9Ch],7
14ec:01fe  je short 0205h
14ec:0200  mov ax,1
14ec:0203  jmp short 0207h
14ec:0205  xor ax,ax
14ec:0207  pop bp
14ec:0208  ret far

; Candidate 14ec:0426, file offset 0x184e6
14ec:0426  push bp
14ec:0427  mov bp,sp
14ec:0429  mov ax,1
14ec:042c  push ax
14ec:042d  push word ptr [bp+6]
14ec:0430  push cs
14ec:0431  call 0209h
14ec:0434  add sp,4
14ec:0437  pop bp
14ec:0438  ret far

; Candidate 14ec:0a0d, file offset 0x18acd
14ec:0a0d  push bp
14ec:0a0e  mov bp,sp
14ec:0a10  mov ax,58h
14ec:0a13  push ax
14ec:0a14  mov ax,88h
14ec:0a17  push ax
14ec:0a18  mov ax,10h
14ec:0a1b  push ax
14ec:0a1c  mov ax,28h
14ec:0a1f  push ax
14ec:0a20  call far 0213h,2269h
14ec:0a25  add sp,8
14ec:0a28  or ax,ax
14ec:0a2a  jne short 0A33h
14ec:0a2c  cmp word ptr [0DF4Ch],40h
14ec:0a31  je short 0A60h
14ec:0a33  mov ax,[bp+6]
14ec:0a36  mov dx,0Ah
14ec:0a39  imul dx
14ec:0a3b  add ax,[bp+8]
14ec:0a3e  mov bx,ax
14ec:0a40  mov al,[bx-5CA0h]
14ec:0a44  cbw
14ec:0a45  mov bx,ax
14ec:0a47  test byte ptr [bx+2268h],20h
14ec:0a4c  je short 0A60h
14ec:0a4e  push ds
14ec:0a4f  mov ax,5BD2h
14ec:0a52  push ax
14ec:0a53  call far 0284h,21B0h
14ec:0a58  add sp,4
14ec:0a5b  mov ax,1
14ec:0a5e  jmp short 0A62h
14ec:0a60  xor ax,ax
14ec:0a62  pop bp
14ec:0a63  ret far

; Candidate 14ec:0a81, file offset 0x18b41
14ec:0a81  push bp
14ec:0a82  mov bp,sp
14ec:0a84  sub sp,2Ch
14ec:0a87  push si
14ec:0a88  push di
14ec:0a89  mov di,[bp+8]
14ec:0a8c  push ss
14ec:0a8d  lea ax,[bp-2Ch]
14ec:0a90  push ax
14ec:0a91  push ds
14ec:0a92  mov ax,5A75h
14ec:0a95  push ax
14ec:0a96  mov cx,28h
14ec:0a99  call far 86C9h,0
14ec:0a9e  xor di,2
14ec:0aa2  mov ax,[bp+6]
14ec:0aa5  mov dx,0Ah
14ec:0aa8  imul dx
14ec:0aaa  mov bx,ax
14ec:0aac  mov al,[bx+di-5CA0h]
14ec:0ab0  cbw
14ec:0ab1  mov si,ax
14ec:0ab3  mov al,[si+2218h]
14ec:0ab7  cbw
14ec:0ab8  or ax,ax
14ec:0aba  jne short 0AC0h
14ec:0abc  xor ax,ax
14ec:0abe  jmp short 0B1Bh
14ec:0ac0  mov ax,[bp+6]
14ec:0ac3  mov dx,0Ah
14ec:0ac6  imul dx
14ec:0ac8  mov bx,ax
14ec:0aca  mov ax,[bx-5C9Ch]
14ec:0ace  and ax,0F8h
14ec:0ad1  shr ax,1
14ec:0ad3  shr ax,1
14ec:0ad5  shr ax,1
14ec:0ad7  or ax,0E0h
14ec:0ada  mov [bp-2],ax
14ec:0add  test [0DF4Ch],ax
14ec:0ae1  jne short 0AE7h
14ec:0ae3  xor ax,ax
14ec:0ae5  jmp short 0B1Bh
14ec:0ae7  mov al,[si+2218h]
14ec:0aeb  cbw
14ec:0aec  dec ax
14ec:0aed  jge short 0AF3h
14ec:0aef  xor ax,ax
14ec:0af1  jmp short 0B1Bh
14ec:0af3  push di
14ec:0af4  push word ptr [bp+6]
14ec:0af7  mov al,[si+2218h]
14ec:0afb  cbw
14ec:0afc  shl ax,1
14ec:0afe  shl ax,1
14ec:0b00  lea dx,[bp-30h]
14ec:0b03  add ax,dx
14ec:0b05  mov bx,ax
14ec:0b07  call far dword ptr ss:[bx]
14ec:0b0a  add sp,4
14ec:0b0d  mov [bp-4],ax
14ec:0b10  mov word ptr [0DF4Ch],0
14ec:0b16  mov byte ptr [0D0AAh],1
14ec:0b1b  pop di
14ec:0b1c  pop si
14ec:0b1d  mov sp,bp
14ec:0b1f  pop bp
14ec:0b20  ret far

; Candidate 14ec:22b4, file offset 0x1a374
14ec:22b4  push bp
14ec:22b5  mov bp,sp
14ec:22b7  push si
14ec:22b8  push di
14ec:22b9  mov cx,[bp+6]
14ec:22bc  xor di,di
14ec:22be  xor si,si
14ec:22c0  jmp short 22FAh
14ec:22c2  mov ax,si
14ec:22c4  mov dx,1Eh
14ec:22c7  imul dx
14ec:22c9  mov bx,ax
14ec:22cb  mov al,[bx+6E2Ah]
14ec:22cf  cbw
14ec:22d0  cmp ax,cx
14ec:22d2  jne short 22F9h
14ec:22d4  mov ax,si
14ec:22d6  mov dx,1Eh
14ec:22d9  imul dx
14ec:22db  mov bx,ax
14ec:22dd  mov al,[bx+6E47h]
14ec:22e1  cbw
14ec:22e2  cmp ax,[6DD0h]
14ec:22e6  jne short 22F9h
14ec:22e8  mov ax,si
14ec:22ea  mov dx,1Eh
14ec:22ed  imul dx
14ec:22ef  mov bx,ax
14ec:22f1  cmp word ptr [bx+6E38h],0
14ec:22f6  jl short 22F9h
14ec:22f8  inc di
14ec:22f9  inc si
14ec:22fa  cmp si,1Eh
14ec:22fd  jl short 22C2h
14ec:22ff  mov ax,di
14ec:2301  pop di
14ec:2302  pop si
14ec:2303  pop bp
14ec:2304  ret far

; Candidate 14ec:2be9, file offset 0x1aca9
14ec:2be9  push bp
14ec:2bea  mov bp,sp
14ec:2bec  sub sp,82h
14ec:2bf0  push si
14ec:2bf1  push di
14ec:2bf2  mov di,[bp+6]
14ec:2bf5  push ss
14ec:2bf6  lea ax,[bp-82h]
14ec:2bfa  push ax
14ec:2bfb  push ds
14ec:2bfc  mov ax,5AB1h
14ec:2bff  push ax
14ec:2c00  mov cx,78h
14ec:2c03  call far 86C9h,0
14ec:2c08  mov ax,di
14ec:2c0a  mov dx,0Ah
14ec:2c0d  imul dx
14ec:2c0f  mov bx,ax
14ec:2c11  mov ax,[bx-5C98h]
14ec:2c15  mov [bp-6],ax
14ec:2c18  cmp word ptr [bp-6],0
14ec:2c1c  jne short 2C21h
14ec:2c1e  jmp 2CB9h
14ec:2c21  mov ax,di
14ec:2c23  mov dx,0Ah
14ec:2c26  imul dx
14ec:2c28  mov bx,ax
14ec:2c2a  mov ax,[bx-5C9Ch]
14ec:2c2e  mov [bp-8],ax
14ec:2c31  and ax,0FFF8h
14ec:2c34  shr ax,1
14ec:2c36  shr ax,1
14ec:2c38  shr ax,1
14ec:2c3a  or ax,0E0h
14ec:2c3d  mov [bp-0Ah],ax
14ec:2c40  mov ax,[bp+8]
14ec:2c43  test [bp-0Ah],ax
14ec:2c46  je short 2CB9h
14ec:2c48  mov byte ptr [6D7Ch],0
14ec:2c4d  mov [0A2CEh],di
14ec:2c51  mov ax,[bp+8]
14ec:2c54  mov [0EE22h],ax
14ec:2c57  mov byte ptr [946Ah],0
14ec:2c5c  mov byte ptr [931Ch],0FFh
14ec:2c61  mov word ptr [0E5A6h],0
14ec:2c67  mov ax,[71C6h]
14ec:2c6a  mov dx,[71C4h]
14ec:2c6e  add dx,[bp-6]
14ec:2c71  mov [bp-2],ax
14ec:2c74  mov [bp-4],dx
14ec:2c77  les bx,[bp-4]
14ec:2c7a  mov al,es:[bx]
14ec:2c7d  cbw
14ec:2c7e  mov si,ax
14ec:2c80  inc word ptr [bp-4]
14ec:2c83  or si,si
14ec:2c85  jge short 2CAAh
14ec:2c87  cmp si,0FFE1h
14ec:2c8a  jle short 2CAAh
14ec:2c8c  push word ptr [bp-2]
14ec:2c8f  push word ptr [bp-4]
14ec:2c92  mov bx,si
14ec:2c94  inc bx
14ec:2c95  neg bx
14ec:2c97  shl bx,1
14ec:2c99  shl bx,1
14ec:2c9b  lea ax,[bp-82h]
14ec:2c9f  add bx,ax
14ec:2ca1  call far dword ptr ss:[bx]
14ec:2ca4  add sp,4
14ec:2ca7  add [bp-4],ax
14ec:2caa  mov al,[946Ah]
14ec:2cad  cbw
14ec:2cae  or ax,ax
14ec:2cb0  jne short 2CB9h
14ec:2cb2  cmp word ptr [0E5A6h],0
14ec:2cb7  je short 2C77h
14ec:2cb9  pop di
14ec:2cba  pop si
14ec:2cbb  mov sp,bp
14ec:2cbd  pop bp
14ec:2cbe  ret far

; Candidate 17b7:05a6, file offset 0x1b316
17b7:05a6  push bp
17b7:05a7  mov bp,sp
17b7:05a9  sub sp,4
17b7:05ac  push si
17b7:05ad  xor si,si
17b7:05af  mov [bp-2],ds
17b7:05b2  mov word ptr [bp-4],5BFCh
17b7:05b7  jmp short 060Bh
17b7:05b9  les bx,[bp-4]
17b7:05bc  cmp byte ptr es:[bx+0Fh],0
17b7:05c1  je short 0606h
17b7:05c3  mov ax,es:[bx+0Ah]
17b7:05c7  mov dx,es:[bx+8]
17b7:05cb  cmp ax,[6686h]
17b7:05cf  ja short 0606h
17b7:05d1  jb short 05D9h
17b7:05d3  cmp dx,[6684h]
17b7:05d7  jae short 0606h
17b7:05d9  les bx,[bp-4]
17b7:05dc  push word ptr es:[bx+0Ch]
17b7:05e0  call far dword ptr es:[bx]
17b7:05e3  inc sp
17b7:05e4  inc sp
17b7:05e5  les bx,[bp-4]
17b7:05e8  cmp byte ptr es:[bx+0Fh],0
17b7:05ed  je short 0606h
17b7:05ef  mov ax,[6686h]
17b7:05f2  mov dx,[6684h]
17b7:05f6  add dx,es:[bx+4]
17b7:05fa  adc ax,es:[bx+6]
17b7:05fe  mov es:[bx+0Ah],ax
17b7:0602  mov es:[bx+8],dx
17b7:0606  inc si
17b7:0607  add word ptr [bp-4],10h
17b7:060b  cmp si,[5CFCh]
17b7:060f  jl short 05B9h
17b7:0611  call far 1754h,0997h
17b7:0616  call far 000Bh,14ECh
17b7:061b  push cs
17b7:061c  call 055Eh
17b7:061f  pop si
17b7:0620  mov sp,bp
17b7:0622  pop bp
17b7:0623  ret far

; Candidate 17b7:066d, file offset 0x1b3dd
17b7:066d  push bp
17b7:066e  mov bp,sp
17b7:0670  sub sp,4
17b7:0673  mov ax,[bp+6]
17b7:0676  mov cl,4
17b7:0678  shl ax,cl
17b7:067a  add ax,5BFCh
17b7:067d  mov [bp-2],ds
17b7:0680  mov [bp-4],ax
17b7:0683  les bx,[bp-4]
17b7:0686  mov al,[bp+8]
17b7:0689  mov es:[bx+0Fh],al
17b7:068d  mov ax,[6686h]
17b7:0690  mov dx,[6684h]
17b7:0694  add dx,es:[bx+4]
17b7:0698  adc ax,es:[bx+6]
17b7:069c  mov es:[bx+0Ah],ax
17b7:06a0  mov es:[bx+8],dx
17b7:06a4  mov sp,bp
17b7:06a6  pop bp
17b7:06a7  ret far

; Candidate 17b7:06b7, file offset 0x1b427
17b7:06b7  push bp
17b7:06b8  mov bp,sp
17b7:06ba  sub sp,10h
17b7:06bd  push si
17b7:06be  push di
17b7:06bf  mov al,[bp+6]
17b7:06c2  cbw
17b7:06c3  add ax,6
17b7:06c6  mov [bp-0Eh],ax
17b7:06c9  mov ax,[6686h]
17b7:06cc  mov dx,[6684h]
17b7:06d0  add dx,[bp+8]
17b7:06d3  adc ax,[bp+0Ah]
17b7:06d6  mov [bp-0Ah],ax
17b7:06d9  mov [bp-0Ch],dx
17b7:06dc  mov ax,[bp-0Eh]
17b7:06df  mov cl,4
17b7:06e1  shl ax,cl
17b7:06e3  add ax,5BFCh
17b7:06e6  mov [bp-2],ds
17b7:06e9  mov [bp-4],ax
17b7:06ec  mov al,[bp+6]
17b7:06ef  cbw
17b7:06f0  mov dx,159h
17b7:06f3  imul dx
17b7:06f5  add ax,0E608h
17b7:06f8  mov [bp-6],ds
17b7:06fb  mov [bp-8],ax
17b7:06fe  les bx,[bp-4]
17b7:0701  mov al,es:[bx+0Fh]
17b7:0705  cbw
17b7:0706  or ax,ax
17b7:0708  jne short 0744h
17b7:070a  mov ax,[bp+0Ah]
17b7:070d  mov dx,[bp+8]
17b7:0710  mov es:[bx+6],ax
17b7:0714  mov es:[bx+4],dx
17b7:0718  les bx,[bp-8]
17b7:071b  mov ax,[bp-0Ah]
17b7:071e  mov dx,[bp-0Ch]
17b7:0721  mov es:[bx+115h],ax
17b7:0726  mov es:[bx+113h],dx
17b7:072b  mov al,[bp+0Ch]
17b7:072e  mov es:[bx+13Bh],al
17b7:0733  mov ax,1
17b7:0736  push ax
17b7:0737  push word ptr [bp-0Eh]
17b7:073a  push cs
17b7:073b  call 066Dh
17b7:073e  add sp,4
17b7:0741  jmp 0835h
17b7:0744  les bx,[bp-4]
17b7:0747  mov ax,es:[bx+0Ah]
17b7:074b  mov dx,es:[bx+8]
17b7:074f  cmp ax,[bp-0Ah]
17b7:0752  jb short 076Ch
17b7:0754  ja short 075Bh
17b7:0756  cmp dx,[bp-0Ch]
17b7:0759  jbe short 076Ch
17b7:075b  les bx,[bp-4]
17b7:075e  mov ax,[bp-0Ah]
17b7:0761  mov dx,[bp-0Ch]
17b7:0764  mov es:[bx+0Ah],ax
17b7:0768  mov es:[bx+8],dx
17b7:076c  mov al,[bp+0Eh]
17b7:076f  cbw
17b7:0770  or ax,ax
17b7:0772  jne short 07BFh
17b7:0774  xor si,si
17b7:0776  jmp short 07B8h
17b7:0778  mov ax,si
17b7:077a  shl ax,1
17b7:077c  shl ax,1
17b7:077e  les bx,[bp-8]
17b7:0781  add bx,ax
17b7:0783  mov ax,es:[bx+113h]
17b7:0788  or ax,es:[bx+115h]
17b7:078d  jne short 07B7h
17b7:078f  mov ax,si
17b7:0791  shl ax,1
17b7:0793  shl ax,1
17b7:0795  mov bx,[bp-8]
17b7:0798  add bx,ax
17b7:079a  mov ax,[bp-0Ah]
17b7:079d  mov dx,[bp-0Ch]
17b7:07a0  mov es:[bx+115h],ax
17b7:07a5  mov es:[bx+113h],dx
17b7:07aa  mov bx,[bp-8]
17b7:07ad  mov al,[bp+0Ch]
17b7:07b0  mov es:[bx+si+13Bh],al
17b7:07b5  jmp short 0835h
17b7:07b7  inc si
17b7:07b8  cmp si,0Ah
17b7:07bb  jl short 0778h
17b7:07bd  jmp short 0835h
17b7:07bf  mov word ptr [bp-10h],0
17b7:07c4  mov di,0FFFFh
17b7:07c7  xor si,si
17b7:07c9  jmp short 0804h
17b7:07cb  cmp di,0FFFFh
17b7:07ce  jne short 07E9h
17b7:07d0  mov ax,si
17b7:07d2  shl ax,1
17b7:07d4  shl ax,1
17b7:07d6  les bx,[bp-8]
17b7:07d9  add bx,ax
17b7:07db  mov ax,es:[bx+113h]
17b7:07e0  or ax,es:[bx+115h]
17b7:07e5  jne short 07E9h
17b7:07e7  mov di,si
17b7:07e9  cmp word ptr [bp-10h],0
17b7:07ed  jne short 0803h
17b7:07ef  les bx,[bp-8]
17b7:07f2  mov al,es:[bx+si+13Bh]
17b7:07f7  cmp al,[bp+0Ch]
17b7:07fa  jne short 0803h
17b7:07fc  mov di,si
17b7:07fe  mov word ptr [bp-10h],1
17b7:0803  inc si
17b7:0804  cmp si,0Ah
17b7:0807  jge short 080Fh
17b7:0809  cmp word ptr [bp-10h],0
17b7:080d  je short 07CBh
17b7:080f  mov ax,di
17b7:0811  shl ax,1
17b7:0813  shl ax,1
17b7:0815  les bx,[bp-8]
17b7:0818  add bx,ax
17b7:081a  mov ax,[bp-0Ah]
17b7:081d  mov dx,[bp-0Ch]
17b7:0820  mov es:[bx+115h],ax
17b7:0825  mov es:[bx+113h],dx
17b7:082a  mov bx,[bp-8]
17b7:082d  mov al,[bp+0Ch]
17b7:0830  mov es:[bx+di+13Bh],al
17b7:0835  pop di
17b7:0836  pop si
17b7:0837  mov sp,bp
17b7:0839  pop bp
17b7:083a  ret far

; Candidate 17b7:0c75, file offset 0x1b9e5
17b7:0c75  push bp
17b7:0c76  mov bp,sp
17b7:0c78  sub sp,0Eh
17b7:0c7b  push si
17b7:0c7c  push di
17b7:0c7d  xor di,di
17b7:0c7f  mov [bp-2],ds
17b7:0c82  mov word ptr [bp-4],0E608h
17b7:0c87  jmp 0D68h
17b7:0c8a  mov ax,1
17b7:0c8d  push ax
17b7:0c8e  push di
17b7:0c8f  call far 06E9h,0E24h
17b7:0c94  add sp,4
17b7:0c97  or ax,ax
17b7:0c99  jne short 0C9Eh
17b7:0c9b  jmp 0D62h
17b7:0c9e  mov word ptr [bp-0Ch],0FFFFh
17b7:0ca3  mov word ptr [bp-0Eh],0FFFFh
17b7:0ca8  xor si,si
17b7:0caa  jmp short 0D00h
17b7:0cac  mov ax,si
17b7:0cae  shl ax,1
17b7:0cb0  shl ax,1
17b7:0cb2  les bx,[bp-4]
17b7:0cb5  add bx,ax
17b7:0cb7  mov ax,es:[bx+115h]
17b7:0cbc  mov dx,es:[bx+113h]
17b7:0cc1  cmp ax,[bp-0Ch]
17b7:0cc4  ja short 0CFFh
17b7:0cc6  jb short 0CCDh
17b7:0cc8  cmp dx,[bp-0Eh]
17b7:0ccb  jae short 0CFFh
17b7:0ccd  mov ax,si
17b7:0ccf  shl ax,1
17b7:0cd1  shl ax,1
17b7:0cd3  les bx,[bp-4]
17b7:0cd6  add bx,ax
17b7:0cd8  mov ax,es:[bx+113h]
17b7:0cdd  or ax,es:[bx+115h]
17b7:0ce2  je short 0CFFh
17b7:0ce4  mov ax,si
17b7:0ce6  shl ax,1
17b7:0ce8  shl ax,1
17b7:0cea  mov bx,[bp-4]
17b7:0ced  add bx,ax
17b7:0cef  mov ax,es:[bx+115h]
17b7:0cf4  mov dx,es:[bx+113h]
17b7:0cf9  mov [bp-0Ch],ax
17b7:0cfc  mov [bp-0Eh],dx
17b7:0cff  inc si
17b7:0d00  cmp si,0Ah
17b7:0d03  jl short 0CACh
17b7:0d05  mov ax,di
17b7:0d07  add ax,6
17b7:0d0a  mov [bp-0Ah],ax
17b7:0d0d  mov cl,4
17b7:0d0f  shl ax,cl
17b7:0d11  add ax,5BFCh
17b7:0d14  mov [bp-6],ds
17b7:0d17  mov [bp-8],ax
17b7:0d1a  cmp word ptr [bp-0Ch],0FFFFh
17b7:0d1e  jne short 0D26h
17b7:0d20  cmp word ptr [bp-0Eh],0FFFFh
17b7:0d24  je short 0D44h
17b7:0d26  mov ax,[bp-0Ch]
17b7:0d29  mov dx,[bp-0Eh]
17b7:0d2c  sub dx,[6684h]
17b7:0d30  sbb ax,[6686h]
17b7:0d34  les bx,[bp-8]
17b7:0d37  mov es:[bx+6],ax
17b7:0d3b  mov es:[bx+4],dx
17b7:0d3f  mov ax,1
17b7:0d42  jmp short 0D57h
17b7:0d44  les bx,[bp-8]
17b7:0d47  mov ax,[bp-0Ch]
17b7:0d4a  mov dx,[bp-0Eh]
17b7:0d4d  mov es:[bx+6],ax
17b7:0d51  mov es:[bx+4],dx
17b7:0d55  xor ax,ax
17b7:0d57  push ax
17b7:0d58  push word ptr [bp-0Ah]
17b7:0d5b  push cs
17b7:0d5c  call 066Dh
17b7:0d5f  add sp,4
17b7:0d62  inc di
17b7:0d63  add word ptr [bp-4],159h
17b7:0d68  cmp di,6
17b7:0d6b  jge short 0D70h
17b7:0d6d  jmp 0C8Ah
17b7:0d70  pop di
17b7:0d71  pop si
17b7:0d72  mov sp,bp
17b7:0d74  pop bp
17b7:0d75  ret far

; Candidate 17b7:0d76, file offset 0x1bae6
17b7:0d76  push bp
17b7:0d77  mov bp,sp
17b7:0d79  sub sp,4
17b7:0d7c  push si
17b7:0d7d  push di
17b7:0d7e  mov di,[bp+8]
17b7:0d81  mov ax,[bp+6]
17b7:0d84  mov dx,159h
17b7:0d87  imul dx
17b7:0d89  add ax,0E608h
17b7:0d8c  mov [bp-2],ds
17b7:0d8f  mov [bp-4],ax
17b7:0d92  xor si,si
17b7:0d94  jmp short 0DC0h
17b7:0d96  les bx,[bp-4]
17b7:0d99  mov al,es:[bx+si+13Bh]
17b7:0d9e  cbw
17b7:0d9f  cmp ax,di
17b7:0da1  jne short 0DBFh
17b7:0da3  mov byte ptr es:[bx+si+13Bh],0
17b7:0da9  mov ax,si
17b7:0dab  shl ax,1
17b7:0dad  shl ax,1
17b7:0daf  add bx,ax
17b7:0db1  mov word ptr es:[bx+115h],0
17b7:0db8  mov word ptr es:[bx+113h],0
17b7:0dbf  inc si
17b7:0dc0  cmp si,0Ah
17b7:0dc3  jl short 0D96h
17b7:0dc5  push cs
17b7:0dc6  call 0C75h
17b7:0dc9  pop di
17b7:0dca  pop si
17b7:0dcb  mov sp,bp
17b7:0dcd  pop bp
17b7:0dce  ret far

; Candidate 17b7:0ec1, file offset 0x1bc31
17b7:0ec1  push bp
17b7:0ec2  mov bp,sp
17b7:0ec4  sub sp,4
17b7:0ec7  push si
17b7:0ec8  push di
17b7:0ec9  mov [bp-2],ds
17b7:0ecc  mov word ptr [bp-4],0CC5Ch
17b7:0ed1  xor si,si
17b7:0ed3  jmp short 0F0Dh
17b7:0ed5  les bx,[bp-4]
17b7:0ed8  cmp byte ptr es:[bx],0
17b7:0edc  je short 0F08h
17b7:0ede  mov al,es:[bx+6]
17b7:0ee2  cbw
17b7:0ee3  push ax
17b7:0ee4  push word ptr es:[bx+4]
17b7:0ee8  push word ptr [bp-2]
17b7:0eeb  push word ptr [bp-4]
17b7:0eee  push cs
17b7:0eef  call 0188h
17b7:0ef2  add sp,8
17b7:0ef5  mov di,ax
17b7:0ef7  or di,di
17b7:0ef9  je short 0F08h
17b7:0efb  push word ptr [bp-2]
17b7:0efe  push word ptr [bp-4]
17b7:0f01  push cs
17b7:0f02  call 025Eh
17b7:0f05  add sp,4
17b7:0f08  inc si
17b7:0f09  add word ptr [bp-4],12h
17b7:0f0d  cmp si,0Ah
17b7:0f10  jl short 0ED5h
17b7:0f12  pop di
17b7:0f13  pop si
17b7:0f14  mov sp,bp
17b7:0f16  pop bp
17b7:0f17  ret far

; Candidate 1901:03a5, file offset 0x1c5b5
1901:03a5  push bp
1901:03a6  mov bp,sp
1901:03a8  sub sp,22h
1901:03ab  push si
1901:03ac  push di
1901:03ad  mov ax,1
1901:03b0  push ax
1901:03b1  push word ptr [bp+6]
1901:03b4  call far 06E9h,0E24h
1901:03b9  add sp,4
1901:03bc  or ax,ax
1901:03be  jne short 03C3h
1901:03c0  jmp 04FEh
1901:03c3  mov ax,[bp+6]
1901:03c6  mov dx,159h
1901:03c9  imul dx
1901:03cb  add ax,0E608h
1901:03ce  mov [bp-0Ch],ds
1901:03d1  mov [bp-0Eh],ax
1901:03d4  cmp byte ptr [0EE3Ah],0
1901:03d9  je short 03E7h
1901:03db  mov al,[9317h]
1901:03de  cbw
1901:03df  cmp ax,[bp+6]
1901:03e2  je short 03E7h
1901:03e4  jmp 04FEh
1901:03e7  cmp byte ptr [0EE3Ah],0
1901:03ec  jne short 0420h
1901:03ee  mov bx,[bp+6]
1901:03f1  and bx,1
1901:03f5  mov al,[bx+5D6Ah]
1901:03f9  cbw
1901:03fa  mov si,ax
1901:03fc  mov bx,[bp+6]
1901:03ff  sar bx,1
1901:0401  mov al,[bx+5D6Ch]
1901:0405  mov ah,0
1901:0407  mov di,ax
1901:0409  mov word ptr [bp-8],26h
1901:040e  mov word ptr [bp-0Ah],3
1901:0413  cmp word ptr [62A5h],0
1901:0418  jne short 0430h
1901:041a  add si,0B0h
1901:041e  jmp short 0430h
1901:0420  mov si,0FAh
1901:0423  mov di,10h
1901:0426  mov word ptr [bp-8],33h
1901:042b  mov word ptr [bp-0Ah],5
1901:0430  cmp byte ptr [0E4C5h],0
1901:0435  jne short 043Ah
1901:0437  jmp 04BEh
1901:043a  les bx,[bp-0Eh]
1901:043d  mov ax,es:[bx+1Bh]
1901:0441  add ax,0Ah
1901:0444  mov [bp-4],ax
1901:0447  mov ax,es:[bx+1Dh]
1901:044b  add ax,0Ah
1901:044e  mov [bp-6],ax
1901:0451  mov word ptr [bp-2],0
1901:0456  mov bx,3
1901:0459  cwd
1901:045a  idiv bx
1901:045c  cmp ax,[bp-4]
1901:045f  jle short 0466h
1901:0461  mov word ptr [bp-2],1
1901:0466  cmp word ptr [bp-4],0Ah
1901:046a  jg short 0471h
1901:046c  mov word ptr [bp-2],2
1901:0471  cmp byte ptr [0EE3Ah],0
1901:0476  jne short 0498h
1901:0478  mov al,[0E606h]
1901:047b  mov ah,0
1901:047d  push ax
1901:047e  mov ax,0Ch
1901:0481  push ax
1901:0482  mov ax,di
1901:0484  dec ax
1901:0485  push ax
1901:0486  mov ax,si
1901:0488  add ax,0FFF3h
1901:048b  push ax
1901:048c  push ds
1901:048d  mov ax,5D98h
1901:0490  push ax
1901:0491  call far dword ptr [65F2h]
1901:0495  add sp,0Ch
1901:0498  mov al,[6D80h]
1901:049b  mov ah,0
1901:049d  push ax
1901:049e  mov bx,[bp-2]
1901:04a1  mov al,[bx+5D62h]
1901:04a5  cbw
1901:04a6  push ax
1901:04a7  push word ptr [bp-0Ah]
1901:04aa  push word ptr [bp-8]
1901:04ad  push word ptr [bp-6]
1901:04b0  push word ptr [bp-4]
1901:04b3  push di
1901:04b4  push si
1901:04b5  push cs
1901:04b6  call 02DEh
1901:04b9  add sp,10h
1901:04bc  jmp short 04FEh
1901:04be  les bx,[bp-0Eh]
1901:04c1  push word ptr es:[bx+1Dh]
1901:04c5  push word ptr es:[bx+1Bh]
1901:04c9  push ds
1901:04ca  mov ax,5D9Bh
1901:04cd  push ax
1901:04ce  push ss
1901:04cf  lea ax,[bp-22h]
1901:04d2  push ax
1901:04d3  call far 64A1h,0
1901:04d8  add sp,0Ch
1901:04db  cmp byte ptr [0EE3Ah],0
1901:04e0  jne short 04E6h
1901:04e2  sub si,0Dh
1901:04e5  dec di
1901:04e6  mov al,[0E606h]
1901:04e9  mov ah,0
1901:04eb  push ax
1901:04ec  mov ax,0Ch
1901:04ef  push ax
1901:04f0  push di
1901:04f1  push si
1901:04f2  push ss
1901:04f3  lea ax,[bp-22h]
1901:04f6  push ax
1901:04f7  call far dword ptr [65F2h]
1901:04fb  add sp,0Ch
1901:04fe  pop di
1901:04ff  pop si
1901:0500  mov sp,bp
1901:0502  pop bp
1901:0503  ret far

; Candidate 1901:0504, file offset 0x1c714
1901:0504  push bp
1901:0505  mov bp,sp
1901:0507  sub sp,4
1901:050a  push si
1901:050b  push di
1901:050c  mov di,[bp+6]
1901:050f  cmp byte ptr [0EE3Ah],0
1901:0514  jne short 0519h
1901:0516  jmp 05A4h
1901:0519  mov ax,1
1901:051c  push ax
1901:051d  push di
1901:051e  call far 06E9h,0E24h
1901:0523  add sp,4
1901:0526  or ax,ax
1901:0528  je short 05A4h
1901:052a  mov ax,di
1901:052c  mov dx,159h
1901:052f  imul dx
1901:0531  add ax,0E608h
1901:0534  mov [bp-2],ds
1901:0537  mov [bp-4],ax
1901:053a  les bx,[bp-4]
1901:053d  mov al,es:[bx+1]
1901:0541  mov ah,0
1901:0543  test ax,1
1901:0546  je short 05A4h
1901:0548  cmp byte ptr [0EE3Ah],0
1901:054d  je short 0557h
1901:054f  mov al,[9317h]
1901:0552  cbw
1901:0553  cmp ax,di
1901:0555  jne short 05A4h
1901:0557  xor si,si
1901:0559  les bx,[bp-4]
1901:055c  cmp byte ptr es:[bx+25h],21h
1901:0561  jae short 0566h
1901:0563  mov si,1
1901:0566  les bx,[bp-4]
1901:0569  cmp byte ptr es:[bx+25h],14h
1901:056e  jae short 0573h
1901:0570  mov si,2
1901:0573  mov al,[6D80h]
1901:0576  mov ah,0
1901:0578  push ax
1901:0579  mov al,[si+5D6Fh]
1901:057d  cbw
1901:057e  push ax
1901:057f  mov ax,5
1901:0582  push ax
1901:0583  mov ax,33h
1901:0586  push ax
1901:0587  mov ax,64h
1901:058a  push ax
1901:058b  les bx,[bp-4]
1901:058e  mov al,es:[bx+25h]
1901:0592  mov ah,0
1901:0594  push ax
1901:0595  mov ax,19h
1901:0598  push ax
1901:0599  mov ax,0FAh
1901:059c  push ax
1901:059d  push cs
1901:059e  call 02DEh
1901:05a1  add sp,10h
1901:05a4  pop di
1901:05a5  pop si
1901:05a6  mov sp,bp
1901:05a8  pop bp
1901:05a9  ret far

; Candidate 1901:05aa, file offset 0x1c7ba
1901:05aa  push bp
1901:05ab  mov bp,sp
1901:05ad  sub sp,6
1901:05b0  push si
1901:05b1  push di
1901:05b2  mov di,[bp+6]
1901:05b5  mov ax,di
1901:05b7  mov dx,159h
1901:05ba  imul dx
1901:05bc  add ax,0E608h
1901:05bf  mov [bp-2],ds
1901:05c2  mov [bp-4],ax
1901:05c5  mov ax,1
1901:05c8  push ax
1901:05c9  push di
1901:05ca  call far 06E9h,0E24h
1901:05cf  add sp,4
1901:05d2  or ax,ax
1901:05d4  jne short 05D9h
1901:05d6  jmp 0729h
1901:05d9  cmp byte ptr [0EE3Ah],0
1901:05de  jne short 0606h
1901:05e0  mov bx,di
1901:05e2  and bx,1
1901:05e6  mov al,[bx+5D72h]
1901:05ea  cbw
1901:05eb  mov si,ax
1901:05ed  mov bx,di
1901:05ef  sar bx,1
1901:05f1  mov al,[bx+5D74h]
1901:05f5  cbw
1901:05f6  mov [bp-6],ax
1901:05f9  cmp word ptr [62A5h],0
1901:05fe  jne short 0619h
1901:0600  add si,0B0h
1901:0604  jmp short 0619h
1901:0606  mov al,[9317h]
1901:0609  cbw
1901:060a  cmp ax,di
1901:060c  je short 0611h
1901:060e  jmp 0729h
1901:0611  mov si,0B5h
1901:0614  mov word ptr [bp-6],3
1901:0619  les bx,[bp-4]
1901:061c  cmp word ptr es:[bx+1Bh],0FFF6h
1901:0621  jne short 0641h
1901:0623  xor ax,ax
1901:0625  push ax
1901:0626  push word ptr [bp-6]
1901:0629  push si
1901:062a  push word ptr [0E402h]
1901:062e  push word ptr [0E400h]
1901:0632  push word ptr [62A5h]
1901:0636  call far 004Ah,1DA3h
1901:063b  add sp,0Ch
1901:063e  jmp 0729h
1901:0641  les bx,[bp-4]
1901:0644  mov ax,es:[bx+149h]
1901:0649  and ax,140h
1901:064c  or ax,0
1901:064f  je short 066Ah
1901:0651  push word ptr [0EEEAh]
1901:0655  push word ptr [0EEE8h]
1901:0659  call far dword ptr [65DEh]
1901:065d  add sp,4
1901:0660  mov ax,1
1901:0663  push ax
1901:0664  call far dword ptr [6576h]
1901:0668  inc sp
1901:0669  inc sp
1901:066a  les bx,[bp-4]
1901:066d  test byte ptr es:[bx+1],2
1901:0672  je short 068Dh
1901:0674  push word ptr [0EEE6h]
1901:0678  push word ptr [0EEE4h]
1901:067c  call far dword ptr [65DEh]
1901:0680  add sp,4
1901:0683  mov ax,1
1901:0686  push ax
1901:0687  call far dword ptr [6576h]
1901:068b  inc sp
1901:068c  inc sp
1901:068d  les bx,[bp-4]
1901:0690  test byte ptr es:[bx+1],8
1901:0695  je short 06B0h
1901:0697  push word ptr [0EE32h]
1901:069b  push word ptr [0EE30h]
1901:069f  call far dword ptr [65DEh]
1901:06a3  add sp,4
1901:06a6  mov ax,1
1901:06a9  push ax
1901:06aa  call far dword ptr [6576h]
1901:06ae  inc sp
1901:06af  inc sp
1901:06b0  xor ax,ax
1901:06b2  push ax
1901:06b3  push word ptr [bp-6]
1901:06b6  push si
1901:06b7  les bx,[bp-4]
1901:06ba  push word ptr es:[bx+37h]
1901:06be  push word ptr es:[bx+35h]
1901:06c2  push word ptr [62A5h]
1901:06c6  call far 004Ah,1DA3h
1901:06cb  add sp,0Ch
1901:06ce  les bx,[bp-4]
1901:06d1  cmp word ptr es:[bx+1Bh],1
1901:06d6  jge short 06F3h
1901:06d8  xor ax,ax
1901:06da  push ax
1901:06db  push word ptr [bp-6]
1901:06de  push si
1901:06df  push word ptr [0CB62h]
1901:06e3  push word ptr [0CB60h]
1901:06e7  push word ptr [62A5h]
1901:06eb  call far 004Ah,1DA3h
1901:06f0  add sp,0Ch
1901:06f3  les bx,[bp-4]
1901:06f6  test byte ptr es:[bx+1],2
1901:06fb  jne short 0711h
1901:06fd  test byte ptr es:[bx+1],8
1901:0702  jne short 0711h
1901:0704  mov ax,es:[bx+149h]
1901:0709  and ax,140h
1901:070c  or ax,0
1901:070f  je short 0729h
1901:0711  push word ptr [0CD14h]
1901:0715  push word ptr [0CD12h]
1901:0719  call far dword ptr [65DEh]
1901:071d  add sp,4
1901:0720  xor ax,ax
1901:0722  push ax
1901:0723  call far dword ptr [6576h]
1901:0727  inc sp
1901:0728  inc sp
1901:0729  pop di
1901:072a  pop si
1901:072b  mov sp,bp
1901:072d  pop bp
1901:072e  ret far

; Candidate 1901:091f, file offset 0x1cb2f
1901:091f  push bp
1901:0920  mov bp,sp
1901:0922  dec sp
1901:0923  dec sp
1901:0924  push si
1901:0925  push di
1901:0926  mov al,[bp+6]
1901:0929  cbw
1901:092a  and ax,1
1901:092d  mov bx,ax
1901:092f  mov al,[bx+5D77h]
1901:0933  cbw
1901:0934  mov si,ax
1901:0936  mov al,[bp+6]
1901:0939  cbw
1901:093a  and ax,6
1901:093d  push ax
1901:093e  mov al,[bp+8]
1901:0941  cbw
1901:0942  pop bx
1901:0943  add bx,ax
1901:0945  mov al,[bx+5D79h]
1901:0949  mov ah,0
1901:094b  mov di,ax
1901:094d  cmp word ptr [62A5h],0
1901:0952  jne short 0958h
1901:0954  add si,0B0h
1901:0958  mov al,[bp+6]
1901:095b  cbw
1901:095c  mov dx,159h
1901:095f  imul dx
1901:0961  push ax
1901:0962  mov al,[bp+8]
1901:0965  cbw
1901:0966  shl ax,1
1901:0968  pop bx
1901:0969  add bx,ax
1901:096b  mov ax,[bx-191Bh]
1901:096f  mov [bp-2],ax
1901:0972  call far 030Fh,238Bh
1901:0977  mov al,[0E606h]
1901:097a  mov ah,0
1901:097c  push ax
1901:097d  mov al,[0E5C2h]
1901:0980  mov ah,0
1901:0982  push ax
1901:0983  mov al,[0EEF0h]
1901:0986  mov ah,0
1901:0988  push ax
1901:0989  mov ax,di
1901:098b  add ax,0Fh
1901:098e  push ax
1901:098f  mov ax,si
1901:0991  add ax,1Eh
1901:0994  push ax
1901:0995  push di
1901:0996  push si
1901:0997  call far 0A45h,08D7h
1901:099c  add sp,0Eh
1901:099f  cmp byte ptr [6655h],0
1901:09a4  je short 09D2h
1901:09a6  mov al,[bp+6]
1901:09a9  cmp al,[9317h]
1901:09ad  jne short 09D2h
1901:09af  mov al,[bp+8]
1901:09b2  cmp al,[0E5A4h]
1901:09b6  jne short 09D2h
1901:09b8  mov ax,0Fh
1901:09bb  push ax
1901:09bc  mov ax,di
1901:09be  add ax,0Fh
1901:09c1  push ax
1901:09c2  mov ax,si
1901:09c4  add ax,1Eh
1901:09c7  push ax
1901:09c8  push di
1901:09c9  push si
1901:09ca  call far 0571h,08D7h
1901:09cf  add sp,0Ah
1901:09d2  mov al,[bp+6]
1901:09d5  cbw
1901:09d6  mov dx,159h
1901:09d9  imul dx
1901:09db  push ax
1901:09dc  mov al,[bp+8]
1901:09df  cbw
1901:09e0  pop bx
1901:09e1  add bx,ax
1901:09e3  cmp byte ptr [bx-18AAh],0
1901:09e8  je short 0A0Dh
1901:09ea  mov al,[bp+6]
1901:09ed  cbw
1901:09ee  mov dx,159h
1901:09f1  imul dx
1901:09f3  push ax
1901:09f4  mov al,[bp+8]
1901:09f7  cbw
1901:09f8  pop bx
1901:09f9  add bx,ax
1901:09fb  mov al,[bx-18AAh]
1901:09ff  cbw
1901:0a00  push ax
1901:0a01  push di
1901:0a02  push si
1901:0a03  push cs
1901:0a04  call 072Fh
1901:0a07  add sp,6
1901:0a0a  jmp 0AEEh
1901:0a0d  cmp word ptr [bp-2],0
1901:0a11  je short 0A2Bh
1901:0a13  push di
1901:0a14  mov ax,si
1901:0a16  add ax,8
1901:0a19  push ax
1901:0a1a  push word ptr [bp-2]
1901:0a1d  push word ptr [62A5h]
1901:0a21  call far 07C8h,0E24h
1901:0a26  add sp,8
1901:0a29  jmp short 0A7Fh
1901:0a2b  cmp byte ptr [bp+8],0
1901:0a2f  jne short 0A57h
1901:0a31  mov ax,[6E28h]
1901:0a34  mov dx,[6E26h]
1901:0a38  and dx,0
1901:0a3c  and ax,8000h
1901:0a3f  or dx,ax
1901:0a41  je short 0A57h
1901:0a43  xor ax,ax
1901:0a45  push ax
1901:0a46  push di
1901:0a47  mov ax,si
1901:0a49  add ax,8
1901:0a4c  push ax
1901:0a4d  push word ptr [0D084h]
1901:0a51  push word ptr [0D082h]
1901:0a55  jmp short 0A73h
1901:0a57  xor ax,ax
1901:0a59  push ax
1901:0a5a  push di
1901:0a5b  mov ax,si
1901:0a5d  add ax,8
1901:0a60  push ax
1901:0a61  mov al,[bp+8]
1901:0a64  cbw
1901:0a65  shl ax,1
1901:0a67  shl ax,1
1901:0a69  mov bx,ax
1901:0a6b  push word ptr [bx-2FC4h]
1901:0a6f  push word ptr [bx-2FC6h]
1901:0a73  push word ptr [62A5h]
1901:0a77  call far 004Ah,1DA3h
1901:0a7c  add sp,0Ch
1901:0a7f  mov al,[bp+6]
1901:0a82  cbw
1901:0a83  mov dx,159h
1901:0a86  imul dx
1901:0a88  mov bx,ax
1901:0a8a  mov al,[bx-19D8h]
1901:0a8e  cbw
1901:0a8f  mov dx,1
1901:0a92  mov cl,[bp+8]
1901:0a95  shl dx,cl
1901:0a97  test dx,ax
1901:0a99  jne short 0AD5h
1901:0a9b  mov al,[bp+8]
1901:0a9e  cbw
1901:0a9f  push ax
1901:0aa0  mov al,[bp+6]
1901:0aa3  cbw
1901:0aa4  push ax
1901:0aa5  call far 08AEh,0E24h
1901:0aaa  add sp,4
1901:0aad  or ax,ax
1901:0aaf  je short 0AD5h
1901:0ab1  mov al,[bp+6]
1901:0ab4  cbw
1901:0ab5  mov dx,159h
1901:0ab8  imul dx
1901:0aba  mov bx,ax
1901:0abc  cmp word ptr [bx-19DDh],0
1901:0ac1  jle short 0AD5h
1901:0ac3  mov al,[bp+6]
1901:0ac6  cbw
1901:0ac7  mov dx,159h
1901:0aca  imul dx
1901:0acc  mov bx,ax
1901:0ace  test byte ptr [bx-19F7h],0Ch
1901:0ad3  je short 0AEEh
1901:0ad5  xor ax,ax
1901:0ad7  push ax
1901:0ad8  push di
1901:0ad9  push si
1901:0ada  push word ptr [71C2h]
1901:0ade  push word ptr [71C0h]
1901:0ae2  push word ptr [62A5h]
1901:0ae6  call far 004Ah,1DA3h
1901:0aeb  add sp,0Ch
1901:0aee  call far 033Ah,238Bh
1901:0af3  pop di
1901:0af4  pop si
1901:0af5  mov sp,bp
1901:0af7  pop bp
1901:0af8  ret far

; Candidate 1901:0af9, file offset 0x1cd09
1901:0af9  push bp
1901:0afa  mov bp,sp
1901:0afc  sub sp,1Eh
1901:0aff  push si
1901:0b00  push di
1901:0b01  mov ax,1
1901:0b04  push ax
1901:0b05  push word ptr [bp+6]
1901:0b08  call far 06E9h,0E24h
1901:0b0d  add sp,4
1901:0b10  or ax,ax
1901:0b12  jne short 0B17h
1901:0b14  jmp 12EAh
1901:0b17  mov ax,[bp+6]
1901:0b1a  mov dx,159h
1901:0b1d  imul dx
1901:0b1f  add ax,0E608h
1901:0b22  mov [bp-2],ds
1901:0b25  mov [bp-4],ax
1901:0b28  les bx,[bp-4]
1901:0b2b  test byte ptr es:[bx+1],0Eh
1901:0b30  je short 0B3Eh
1901:0b32  mov word ptr [bp-1Ch],8
1901:0b37  mov word ptr [bp-1Eh],6
1901:0b3c  jmp short 0B48h
1901:0b3e  mov word ptr [bp-1Ch],0Ch
1901:0b43  mov word ptr [bp-1Eh],0Fh
1901:0b48  mov al,[0EE3Ah]
1901:0b4b  cbw
1901:0b4c  or ax,ax
1901:0b4e  je short 0B63h
1901:0b50  cmp ax,1
1901:0b53  jne short 0B58h
1901:0b55  jmp 0D74h
1901:0b58  cmp ax,2
1901:0b5b  jne short 0B60h
1901:0b5d  jmp 0D74h
1901:0b60  jmp 12EAh
1901:0b63  call far 030Fh,238Bh
1901:0b68  mov ax,[0F092h]
1901:0b6b  mov dx,[0F090h]
1901:0b6f  mov [bp-6],ax
1901:0b72  mov [bp-8],dx
1901:0b75  push word ptr [9344h]
1901:0b79  push word ptr [9342h]
1901:0b7d  call far 000Ah,2166h
1901:0b82  add sp,4
1901:0b85  mov bx,[bp+6]
1901:0b88  and bx,1
1901:0b8c  mov al,[bx+5D91h]
1901:0b90  cbw
1901:0b91  mov [bp-0Ch],ax
1901:0b94  mov bx,[bp+6]
1901:0b97  sar bx,1
1901:0b99  mov al,[bx+5D95h]
1901:0b9d  cbw
1901:0b9e  mov [bp-0Eh],ax
1901:0ba1  mov ax,2
1901:0ba4  push ax
1901:0ba5  push ax
1901:0ba6  mov ax,18h
1901:0ba9  push ax
1901:0baa  mov ax,8
1901:0bad  push ax
1901:0bae  push word ptr [bp-0Eh]
1901:0bb1  push word ptr [bp-0Ch]
1901:0bb4  mov ax,0A8h
1901:0bb7  push ax
1901:0bb8  mov ax,16h
1901:0bbb  push ax
1901:0bbc  call far 000Ah,1D92h
1901:0bc1  add sp,10h
1901:0bc4  mov ax,2
1901:0bc7  push ax
1901:0bc8  push ax
1901:0bc9  mov ax,1Ah
1901:0bcc  push ax
1901:0bcd  mov ax,8
1901:0bd0  push ax
1901:0bd1  mov ax,[bp-0Eh]
1901:0bd4  add ax,18h
1901:0bd7  push ax
1901:0bd8  push word ptr [bp-0Ch]
1901:0bdb  mov ax,0A8h
1901:0bde  push ax
1901:0bdf  mov ax,1Eh
1901:0be2  push ax
1901:0be3  call far 000Ah,1D92h
1901:0be8  add sp,10h
1901:0beb  mov ax,[62A5h]
1901:0bee  mov [bp-10h],ax
1901:0bf1  mov word ptr [62A5h],2
1901:0bf7  shl word ptr [bp-0Ch],1
1901:0bfa  shl word ptr [bp-0Ch],1
1901:0bfd  shl word ptr [bp-0Ch],1
1901:0c00  mov al,[0EE20h]
1901:0c03  cbw
1901:0c04  cmp ax,[bp+6]
1901:0c07  jne short 0C25h
1901:0c09  mov al,[0E606h]
1901:0c0c  mov ah,0
1901:0c0e  push ax
1901:0c0f  mov ax,8
1901:0c12  push ax
1901:0c13  mov ax,[bp-0Eh]
1901:0c16  inc ax
1901:0c17  inc ax
1901:0c18  push ax
1901:0c19  mov ax,[bp-0Ch]
1901:0c1c  inc ax
1901:0c1d  inc ax
1901:0c1e  push ax
1901:0c1f  push ds
1901:0c20  mov ax,5DCDh
1901:0c23  jmp short 0C42h
1901:0c25  mov al,[0E606h]
1901:0c28  mov ah,0
1901:0c2a  push ax
1901:0c2b  push word ptr [bp-1Ch]
1901:0c2e  mov ax,[bp-0Eh]
1901:0c31  inc ax
1901:0c32  inc ax
1901:0c33  push ax
1901:0c34  mov ax,[bp-0Ch]
1901:0c37  inc ax
1901:0c38  inc ax
1901:0c39  push ax
1901:0c3a  mov ax,[bp-4]
1901:0c3d  inc ax
1901:0c3e  inc ax
1901:0c3f  push word ptr [bp-2]
1901:0c42  push ax
1901:0c43  call far dword ptr [65F2h]
1901:0c47  add sp,0Ch
1901:0c4a  push word ptr [bp+6]
1901:0c4d  push cs
1901:0c4e  call 05AAh
1901:0c51  inc sp
1901:0c52  inc sp
1901:0c53  mov al,0
1901:0c55  push ax
1901:0c56  mov al,[bp+6]
1901:0c59  push ax
1901:0c5a  push cs
1901:0c5b  call 091Fh
1901:0c5e  add sp,4
1901:0c61  mov al,1
1901:0c63  push ax
1901:0c64  mov al,[bp+6]
1901:0c67  push ax
1901:0c68  push cs
1901:0c69  call 091Fh
1901:0c6c  add sp,4
1901:0c6f  push word ptr [bp+6]
1901:0c72  push cs
1901:0c73  call 03A5h
1901:0c76  inc sp
1901:0c77  inc sp
1901:0c78  mov ax,2
1901:0c7b  push ax
1901:0c7c  push word ptr [bp+6]
1901:0c7f  call far 06E9h,0E24h
1901:0c84  add sp,4
1901:0c87  or ax,ax
1901:0c89  je short 0C94h
1901:0c8b  push word ptr [bp+6]
1901:0c8e  push cs
1901:0c8f  call 000Ch
1901:0c92  inc sp
1901:0c93  inc sp
1901:0c94  les bx,[bp-4]
1901:0c97  cmp byte ptr es:[bx+14Dh],0
1901:0c9d  jle short 0D1Dh
1901:0c9f  mov ax,0Ah
1901:0ca2  push ax
1901:0ca3  push ss
1901:0ca4  lea ax,[bp-1Ah]
1901:0ca7  push ax
1901:0ca8  mov al,es:[bx+14Dh]
1901:0cad  cbw
1901:0cae  push ax
1901:0caf  call far 704Ah,0
1901:0cb4  add sp,8
1901:0cb7  xor ax,ax
1901:0cb9  push ax
1901:0cba  mov ax,[bp-0Eh]
1901:0cbd  add ax,1Eh
1901:0cc0  push ax
1901:0cc1  mov ax,[bp-0Ch]
1901:0cc4  add ax,0Dh
1901:0cc7  push ax
1901:0cc8  push word ptr [0DF28h]
1901:0ccc  push word ptr [0DF26h]
1901:0cd0  mov ax,2
1901:0cd3  push ax
1901:0cd4  call far 004Ah,1DA3h
1901:0cd9  add sp,0Ch
1901:0cdc  xor ax,ax
1901:0cde  push ax
1901:0cdf  cmp word ptr [628Ah],0
1901:0ce4  jne short 0CEBh
1901:0ce6  mov ax,0Ch
1901:0ce9  jmp short 0CEEh
1901:0ceb  mov ax,0Fh
1901:0cee  push ax
1901:0cef  mov ax,[bp-0Eh]
1901:0cf2  add ax,2Ah
1901:0cf5  push ax
1901:0cf6  push ss
1901:0cf7  lea ax,[bp-1Ah]
1901:0cfa  push ax
1901:0cfb  call far 7599h,0
1901:0d00  add sp,4
1901:0d03  mov dx,3
1901:0d06  imul dx
1901:0d08  mov dx,[bp-0Ch]
1901:0d0b  add dx,22h
1901:0d0e  sub dx,ax
1901:0d10  push dx
1901:0d11  push ss
1901:0d12  lea ax,[bp-1Ah]
1901:0d15  push ax
1901:0d16  call far dword ptr [65F2h]
1901:0d1a  add sp,0Ch
1901:0d1d  mov ax,[bp-10h]
1901:0d20  mov [62A5h],ax
1901:0d23  cmp word ptr [62A5h],0
1901:0d28  jne short 0D5Eh
1901:0d2a  xor ax,ax
1901:0d2c  push ax
1901:0d2d  mov ax,2
1901:0d30  push ax
1901:0d31  mov ax,32h
1901:0d34  push ax
1901:0d35  mov ax,8
1901:0d38  push ax
1901:0d39  push word ptr [bp-0Eh]
1901:0d3c  mov bx,[bp+6]
1901:0d3f  and bx,1
1901:0d43  mov al,[bx+5D93h]
1901:0d47  cbw
1901:0d48  push ax
1901:0d49  push word ptr [bp-0Eh]
1901:0d4c  mov ax,[bp-0Ch]
1901:0d4f  sar ax,1
1901:0d51  sar ax,1
1901:0d53  sar ax,1
1901:0d55  push ax
1901:0d56  call far 000Ah,1D92h
1901:0d5b  add sp,10h
1901:0d5e  push word ptr [bp-6]
1901:0d61  push word ptr [bp-8]
1901:0d64  call far 000Ah,2166h
1901:0d69  add sp,4
1901:0d6c  call far 033Ah,238Bh
1901:0d71  jmp 12EAh
1901:0d74  mov al,[9317h]
1901:0d77  cbw
1901:0d78  cmp ax,[bp+6]
1901:0d7b  je short 0D80h
1901:0d7d  jmp 12EAh
1901:0d80  mov ax,2
1901:0d83  push ax
1901:0d84  push ax
1901:0d85  mov ax,0A8h
1901:0d88  push ax
1901:0d89  mov ax,12h
1901:0d8c  push ax
1901:0d8d  xor ax,ax
1901:0d8f  push ax
1901:0d90  push ax
1901:0d91  push ax
1901:0d92  mov ax,16h
1901:0d95  push ax
1901:0d96  call far 000Ah,1D92h
1901:0d9b  add sp,10h
1901:0d9e  mov word ptr [62A5h],2
1901:0da4  push word ptr [bp+6]
1901:0da7  push cs
1901:0da8  call 05AAh
1901:0dab  inc sp
1901:0dac  inc sp
1901:0dad  mov al,[0E606h]
1901:0db0  mov ah,0
1901:0db2  push ax
1901:0db3  push word ptr [bp-1Eh]
1901:0db6  mov ax,6
1901:0db9  push ax
1901:0dba  mov ax,0DBh
1901:0dbd  push ax
1901:0dbe  mov ax,[bp-4]
1901:0dc1  inc ax
1901:0dc2  inc ax
1901:0dc3  push word ptr [bp-2]
1901:0dc6  push ax
1901:0dc7  call far 0908h,08D7h
1901:0dcc  add sp,0Ch
1901:0dcf  push word ptr [bp+6]
1901:0dd2  push cs
1901:0dd3  call 03A5h
1901:0dd6  inc sp
1901:0dd7  inc sp
1901:0dd8  push word ptr [bp+6]
1901:0ddb  push cs
1901:0ddc  call 0504h
1901:0ddf  inc sp
1901:0de0  inc sp
1901:0de1  cmp byte ptr [0EE3Ah],1
1901:0de6  je short 0DEBh
1901:0de8  jmp 0F22h
1901:0deb  les bx,[bp-4]
1901:0dee  mov ax,es:[bx+1Bh]
1901:0df2  add ax,0Ah
1901:0df5  jne short 0E10h
1901:0df7  mov al,[6D81h]
1901:0dfa  mov ah,0
1901:0dfc  push ax
1901:0dfd  mov ax,6
1901:0e00  push ax
1901:0e01  mov ax,9Eh
1901:0e04  push ax
1901:0e05  mov ax,0F7h
1901:0e08  push ax
1901:0e09  push ds
1901:0e0a  mov ax,5DD6h
1901:0e0d  jmp 0ECBh
1901:0e10  les bx,[bp-4]
1901:0e13  mov ax,es:[bx+1Bh]
1901:0e17  add ax,9
1901:0e1a  cmp ax,0Ah
1901:0e1d  jae short 0E38h
1901:0e1f  mov al,[6D81h]
1901:0e22  mov ah,0
1901:0e24  push ax
1901:0e25  mov ax,6
1901:0e28  push ax
1901:0e29  mov ax,9Eh
1901:0e2c  push ax
1901:0e2d  mov ax,0E2h
1901:0e30  push ax
1901:0e31  push ds
1901:0e32  mov ax,5DDBh
1901:0e35  jmp 0ECBh
1901:0e38  les bx,[bp-4]
1901:0e3b  test byte ptr es:[bx+1],2
1901:0e40  je short 0E67h
1901:0e42  mov ax,es:[bx+149h]
1901:0e47  and ax,2000h
1901:0e4a  or ax,0
1901:0e4d  je short 0E67h
1901:0e4f  mov al,[6D81h]
1901:0e52  mov ah,0
1901:0e54  push ax
1901:0e55  mov ax,6
1901:0e58  push ax
1901:0e59  mov ax,9Eh
1901:0e5c  push ax
1901:0e5d  mov ax,0DCh
1901:0e60  push ax
1901:0e61  push ds
1901:0e62  mov ax,5DE7h
1901:0e65  jmp short 0ECBh
1901:0e67  les bx,[bp-4]
1901:0e6a  test byte ptr es:[bx+1],2
1901:0e6f  je short 0E89h
1901:0e71  mov al,[6D81h]
1901:0e74  mov ah,0
1901:0e76  push ax
1901:0e77  mov ax,6
1901:0e7a  push ax
1901:0e7b  mov ax,9Eh
1901:0e7e  push ax
1901:0e7f  mov ax,0EBh
1901:0e82  push ax
1901:0e83  push ds
1901:0e84  mov ax,5DF5h
1901:0e87  jmp short 0ECBh
1901:0e89  les bx,[bp-4]
1901:0e8c  test byte ptr es:[bx+1],4
1901:0e91  je short 0EABh
1901:0e93  mov al,[6D81h]
1901:0e96  mov ah,0
1901:0e98  push ax
1901:0e99  mov ax,6
1901:0e9c  push ax
1901:0e9d  mov ax,9Eh
1901:0ea0  push ax
1901:0ea1  mov ax,0E8h
1901:0ea4  push ax
1901:0ea5  push ds
1901:0ea6  mov ax,5DFEh
1901:0ea9  jmp short 0ECBh
1901:0eab  les bx,[bp-4]
1901:0eae  test byte ptr es:[bx+1],8
1901:0eb3  je short 0ED4h
1901:0eb5  mov al,[6D81h]
1901:0eb8  mov ah,0
1901:0eba  push ax
1901:0ebb  mov ax,6
1901:0ebe  push ax
1901:0ebf  mov ax,9Eh
1901:0ec2  push ax
1901:0ec3  mov ax,0E8h
1901:0ec6  push ax
1901:0ec7  push ds
1901:0ec8  mov ax,5E08h
1901:0ecb  push ax
1901:0ecc  call far 0908h,08D7h
1901:0ed1  add sp,0Ch
1901:0ed4  mov word ptr [bp-0Ah],0
1901:0ed9  jmp short 0EF0h
1901:0edb  mov ax,2
1901:0ede  push ax
1901:0edf  xor ax,ax
1901:0ee1  push ax
1901:0ee2  push word ptr [bp-0Ah]
1901:0ee5  call far 09A6h,0CBEh
1901:0eea  add sp,6
1901:0eed  inc word ptr [bp-0Ah]
1901:0ef0  cmp word ptr [bp-0Ah],1Bh
1901:0ef4  jl short 0EDBh
1901:0ef6  mov ax,2
1901:0ef9  push ax
1901:0efa  mov ax,1
1901:0efd  push ax
1901:0efe  mov ax,10h
1901:0f01  push ax
1901:0f02  call far 09A6h,0CBEh
1901:0f07  add sp,6
1901:0f0a  mov ax,2
1901:0f0d  push ax
1901:0f0e  mov ax,1
1901:0f11  push ax
1901:0f12  mov al,[0E5A4h]
1901:0f15  cbw
1901:0f16  push ax
1901:0f17  call far 09A6h,0CBEh
1901:0f1c  add sp,6
1901:0f1f  jmp 1295h
1901:0f22  mov word ptr [bp-0Ah],0
1901:0f27  jmp short 0F59h
1901:0f29  mov al,[6D81h]
1901:0f2c  mov ah,0
1901:0f2e  push ax
1901:0f2f  mov bx,[bp-0Ah]
1901:0f32  mov al,[bx+5D8Eh]
1901:0f36  mov ah,0
1901:0f38  push ax
1901:0f39  shl bx,1
1901:0f3b  push word ptr [bx+5D88h]
1901:0f3f  mov bx,[bp-0Ah]
1901:0f42  mov al,[bx+5D85h]
1901:0f46  mov ah,0
1901:0f48  push ax
1901:0f49  shl bx,1
1901:0f4b  push word ptr [bx+5D7Fh]
1901:0f4f  call far dword ptr [657Ah]
1901:0f53  add sp,0Ah
1901:0f56  inc word ptr [bp-0Ah]
1901:0f59  cmp word ptr [bp-0Ah],3
1901:0f5d  jl short 0F29h
1901:0f5f  mov al,[6D81h]
1901:0f62  mov ah,0
1901:0f64  push ax
1901:0f65  mov ax,0Fh
1901:0f68  push ax
1901:0f69  mov ax,2Ah
1901:0f6c  push ax
1901:0f6d  mov ax,0B7h
1901:0f70  push ax
1901:0f71  push ds
1901:0f72  mov ax,5E12h
1901:0f75  push ax
1901:0f76  call far 0908h,08D7h
1901:0f7b  add sp,0Ch
1901:0f7e  mov al,[6D81h]
1901:0f81  mov ah,0
1901:0f83  push ax
1901:0f84  mov ax,0Ch
1901:0f87  push ax
1901:0f88  mov ax,37h
1901:0f8b  push ax
1901:0f8c  mov ax,0B7h
1901:0f8f  push ax
1901:0f90  les bx,[bp-4]
1901:0f93  mov al,es:[bx+22h]
1901:0f97  cbw
1901:0f98  shl ax,1
1901:0f9a  shl ax,1
1901:0f9c  mov bx,ax
1901:0f9e  push word ptr [bx+1F48h]
1901:0fa2  push word ptr [bx+1F46h]
1901:0fa6  call far dword ptr [65F2h]
1901:0faa  add sp,0Ch
1901:0fad  mov al,[6D81h]
1901:0fb0  mov ah,0
1901:0fb2  push ax
1901:0fb3  mov ax,0Ch
1901:0fb6  push ax
1901:0fb7  mov ax,3Eh
1901:0fba  push ax
1901:0fbb  mov ax,0B7h
1901:0fbe  push ax
1901:0fbf  les bx,[bp-4]
1901:0fc2  mov al,es:[bx+23h]
1901:0fc6  cbw
1901:0fc7  shl ax,1
1901:0fc9  shl ax,1
1901:0fcb  mov bx,ax
1901:0fcd  push word ptr [bx+1FABh]
1901:0fd1  push word ptr [bx+1FA9h]
1901:0fd5  call far dword ptr [65F2h]
1901:0fd9  add sp,0Ch
1901:0fdc  mov al,[6D81h]
1901:0fdf  mov ah,0
1901:0fe1  push ax
1901:0fe2  mov ax,0Ch
1901:0fe5  push ax
1901:0fe6  mov ax,45h
1901:0fe9  push ax
1901:0fea  mov ax,0B7h
1901:0fed  push ax
1901:0fee  les bx,[bp-4]
1901:0ff1  mov al,es:[bx+21h]
1901:0ff5  cbw
1901:0ff6  shl ax,1
1901:0ff8  shl ax,1
1901:0ffa  mov bx,ax
1901:0ffc  push word ptr [bx+1F18h]
1901:1000  push word ptr [bx+1F16h]
1901:1004  call far dword ptr [65F2h]
1901:1008  add sp,0Ch
1901:100b  mov word ptr [bp-0Ah],0
1901:1010  jmp short 1045h
1901:1012  mov al,[6D81h]
1901:1015  mov ah,0
1901:1017  push ax
1901:1018  mov ax,0Ch
1901:101b  push ax
1901:101c  mov ax,[bp-0Ah]
1901:101f  mov dx,7
1901:1022  imul dx
1901:1024  add ax,52h
1901:1027  push ax
1901:1028  mov ax,0B7h
1901:102b  push ax
1901:102c  mov bx,[bp-0Ah]
1901:102f  shl bx,1
1901:1031  shl bx,1
1901:1033  push word ptr [bx+1F00h]
1901:1037  push word ptr [bx+1EFEh]
1901:103b  call far dword ptr [65F2h]
1901:103f  add sp,0Ch
1901:1042  inc word ptr [bp-0Ah]
1901:1045  cmp word ptr [bp-0Ah],6
1901:1049  jl short 1012h
1901:104b  mov al,[6D81h]
1901:104e  mov ah,0
1901:1050  push ax
1901:1051  mov ax,0Ch
1901:1054  push ax
1901:1055  mov ax,7Ch
1901:1058  push ax
1901:1059  mov ax,0B7h
1901:105c  push ax
1901:105d  push ds
1901:105e  mov ax,5E21h
1901:1061  push ax
1901:1062  call far dword ptr [65F2h]
1901:1066  add sp,0Ch
1901:1069  mov al,[6D81h]
1901:106c  mov ah,0
1901:106e  push ax
1901:106f  mov ax,0Ch
1901:1072  push ax
1901:1073  mov ax,8Ah
1901:1076  push ax
1901:1077  mov ax,0EFh
1901:107a  push ax
1901:107b  push ds
1901:107c  mov ax,5E2Dh
1901:107f  push ax
1901:1080  call far dword ptr [65F2h]
1901:1084  add sp,0Ch
1901:1087  mov al,[6D81h]
1901:108a  mov ah,0
1901:108c  push ax
1901:108d  mov ax,0Ch
1901:1090  push ax
1901:1091  mov ax,8Ah
1901:1094  push ax
1901:1095  mov ax,116h
1901:1098  push ax
1901:1099  push ds
1901:109a  mov ax,5E31h
1901:109d  push ax
1901:109e  call far dword ptr [65F2h]
1901:10a2  add sp,0Ch
1901:10a5  mov al,[6D81h]
1901:10a8  mov ah,0
1901:10aa  push ax
1901:10ab  mov ax,0Fh
1901:10ae  push ax
1901:10af  mov ax,52h
1901:10b2  push ax
1901:10b3  mov ax,113h
1901:10b6  push ax
1901:10b7  les bx,[bp-4]
1901:10ba  mov al,es:[bx+0Fh]
1901:10be  push ax
1901:10bf  mov al,es:[bx+0Dh]
1901:10c3  push ax
1901:10c4  call far 04C6h,0B54h
1901:10c9  add sp,4
1901:10cc  push dx
1901:10cd  push ax
1901:10ce  call far dword ptr [65F2h]
1901:10d2  add sp,0Ch
1901:10d5  mov al,[6D81h]
1901:10d8  mov ah,0
1901:10da  push ax
1901:10db  mov ax,0Fh
1901:10de  push ax
1901:10df  mov ax,59h
1901:10e2  push ax
1901:10e3  mov ax,113h
1901:10e6  push ax
1901:10e7  les bx,[bp-4]
1901:10ea  mov al,es:[bx+11h]
1901:10ee  cbw
1901:10ef  push ax
1901:10f0  call far 000Eh,2060h
1901:10f5  add sp,0Ah
1901:10f8  mov al,[6D81h]
1901:10fb  mov ah,0
1901:10fd  push ax
1901:10fe  mov ax,0Fh
1901:1101  push ax
1901:1102  mov ax,60h
1901:1105  push ax
1901:1106  mov ax,113h
1901:1109  push ax
1901:110a  les bx,[bp-4]
1901:110d  mov al,es:[bx+13h]
1901:1111  cbw
1901:1112  push ax
1901:1113  call far 000Eh,2060h
1901:1118  add sp,0Ah
1901:111b  mov al,[6D81h]
1901:111e  mov ah,0
1901:1120  push ax
1901:1121  mov ax,0Fh
1901:1124  push ax
1901:1125  mov ax,67h
1901:1128  push ax
1901:1129  mov ax,113h
1901:112c  push ax
1901:112d  les bx,[bp-4]
1901:1130  mov al,es:[bx+15h]
1901:1134  cbw
1901:1135  push ax
1901:1136  call far 000Eh,2060h
1901:113b  add sp,0Ah
1901:113e  mov al,[6D81h]
1901:1141  mov ah,0
1901:1143  push ax
1901:1144  mov ax,0Fh
1901:1147  push ax
1901:1148  mov ax,6Eh
1901:114b  push ax
1901:114c  mov ax,113h
1901:114f  push ax
1901:1150  les bx,[bp-4]
1901:1153  mov al,es:[bx+17h]
1901:1157  cbw
1901:1158  push ax
1901:1159  call far 000Eh,2060h
1901:115e  add sp,0Ah
1901:1161  mov al,[6D81h]
1901:1164  mov ah,0
1901:1166  push ax
1901:1167  mov ax,0Fh
1901:116a  push ax
1901:116b  mov ax,75h
1901:116e  push ax
1901:116f  mov ax,113h
1901:1172  push ax
1901:1173  les bx,[bp-4]
1901:1176  mov al,es:[bx+19h]
1901:117a  cbw
1901:117b  push ax
1901:117c  call far 000Eh,2060h
1901:1181  add sp,0Ah
1901:1184  mov al,[6D81h]
1901:1187  mov ah,0
1901:1189  push ax
1901:118a  mov ax,0Fh
1901:118d  push ax
1901:118e  mov ax,7Ch
1901:1191  push ax
1901:1192  mov ax,113h
1901:1195  push ax
1901:1196  les bx,[bp-4]
1901:1199  mov al,es:[bx+1Fh]
1901:119d  cbw
1901:119e  push ax
1901:119f  call far 000Eh,2060h
1901:11a4  add sp,0Ah
1901:11a7  mov word ptr [bp-0Ah],0
1901:11ac  jmp 128Ch
1901:11af  mov al,[bp-0Ah]
1901:11b2  push ax
1901:11b3  les bx,[bp-4]
1901:11b6  mov al,es:[bx+22h]
1901:11ba  push ax
1901:11bb  call far 0082h,0B54h
1901:11c0  add sp,4
1901:11c3  cbw
1901:11c4  mov si,ax
1901:11c6  cmp si,0FFFFh
1901:11c9  jne short 11CEh
1901:11cb  jmp 1289h
1901:11ce  mov al,[6D81h]
1901:11d1  mov ah,0
1901:11d3  push ax
1901:11d4  mov ax,0Ch
1901:11d7  push ax
1901:11d8  mov ax,[bp-0Ah]
1901:11db  mov dx,7
1901:11de  imul dx
1901:11e0  add ax,91h
1901:11e3  push ax
1901:11e4  mov ax,0B7h
1901:11e7  push ax
1901:11e8  mov bx,si
1901:11ea  shl bx,1
1901:11ec  shl bx,1
1901:11ee  push word ptr [bx+1F84h]
1901:11f2  push word ptr [bx+1F82h]
1901:11f6  call far dword ptr [65F2h]
1901:11fa  add sp,0Ch
1901:11fd  mov ax,[bp-0Ah]
1901:1200  shl ax,1
1901:1202  shl ax,1
1901:1204  les bx,[bp-4]
1901:1207  add bx,ax
1901:1209  mov ax,es:[bx+2Bh]
1901:120d  mov dx,es:[bx+29h]
1901:1211  mov [bp-12h],ax
1901:1214  mov [bp-14h],dx
1901:1217  mov bx,[bp-4]
1901:121a  add bx,[bp-0Ah]
1901:121d  mov al,es:[bx+26h]
1901:1221  cbw
1901:1222  mov di,ax
1901:1224  mov al,[6D81h]
1901:1227  mov ah,0
1901:1229  push ax
1901:122a  mov ax,0Fh
1901:122d  push ax
1901:122e  mov ax,[bp-0Ah]
1901:1231  mov dx,7
1901:1234  imul dx
1901:1236  add ax,91h
1901:1239  push ax
1901:123a  push word ptr [bp-12h]
1901:123d  push word ptr [bp-14h]
1901:1240  call far 09E2h,08D7h
1901:1245  add sp,4
1901:1248  mov dx,0F7h
1901:124b  sub dx,ax
1901:124d  push dx
1901:124e  push word ptr [bp-12h]
1901:1251  push word ptr [bp-14h]
1901:1254  call far 8,2107h
1901:1259  add sp,0Ch
1901:125c  mov al,[6D81h]
1901:125f  mov ah,0
1901:1261  push ax
1901:1262  mov ax,0Fh
1901:1265  push ax
1901:1266  mov ax,[bp-0Ah]
1901:1269  mov dx,7
1901:126c  imul dx
1901:126e  add ax,91h
1901:1271  push ax
1901:1272  push di
1901:1273  call far 0A15h,08D7h
1901:1278  inc sp
1901:1279  inc sp
1901:127a  mov dx,11Eh
1901:127d  sub dx,ax
1901:127f  push dx
1901:1280  push di
1901:1281  call far 000Eh,2060h
1901:1286  add sp,0Ah
1901:1289  inc word ptr [bp-0Ah]
1901:128c  cmp word ptr [bp-0Ah],3
1901:1290  jge short 1295h
1901:1292  jmp 11AFh
1901:1295  mov word ptr [62A5h],0
1901:129b  call far 030Fh,238Bh
1901:12a0  xor ax,ax
1901:12a2  push ax
1901:12a3  mov ax,2
1901:12a6  push ax
1901:12a7  mov ax,0A8h
1901:12aa  push ax
1901:12ab  mov ax,12h
1901:12ae  push ax
1901:12af  xor ax,ax
1901:12b1  push ax
1901:12b2  mov ax,16h
1901:12b5  push ax
1901:12b6  xor ax,ax
1901:12b8  push ax
1901:12b9  mov ax,16h
1901:12bc  push ax
1901:12bd  call far 000Ah,1D92h
1901:12c2  add sp,10h
1901:12c5  call far 033Ah,238Bh
1901:12ca  mov ax,2
1901:12cd  push ax
1901:12ce  push ax
1901:12cf  mov ax,0A8h
1901:12d2  push ax
1901:12d3  mov ax,12h
1901:12d6  push ax
1901:12d7  xor ax,ax
1901:12d9  push ax
1901:12da  mov ax,16h
1901:12dd  push ax
1901:12de  xor ax,ax
1901:12e0  push ax
1901:12e1  push ax
1901:12e2  call far 000Ah,1D92h
1901:12e7  add sp,10h
1901:12ea  pop di
1901:12eb  pop si
1901:12ec  mov sp,bp
1901:12ee  pop bp
1901:12ef  ret far

; Candidate 1a30:0000, file offset 0x1d500
1a30:0000  push bp
1a30:0001  mov bp,sp
1a30:0003  push word ptr [6DD2h]
1a30:0007  push word ptr [bp+6]
1a30:000a  call far 0014h,1A30h
1a30:000f  add sp,4
1a30:0012  pop bp
1a30:0013  ret far

; Candidate 1a30:0014, file offset 0x1d514
1a30:0014  push bp
1a30:0015  mov bp,sp
1a30:0017  dec sp
1a30:0018  dec sp
1a30:0019  push si
1a30:001a  mov si,[bp+8]
1a30:001d  cmp word ptr [65FAh],0
1a30:0022  je short 007Ah
1a30:0024  cmp word ptr [5E36h],0
1a30:0029  jle short 003Bh
1a30:002b  push word ptr [5E38h]
1a30:002f  push word ptr [5E36h]
1a30:0033  call far 00BEh,1C9Fh
1a30:0038  add sp,4
1a30:003b  or si,si
1a30:003d  je short 005Ch
1a30:003f  push si
1a30:0040  push word ptr [6DD2h]
1a30:0044  call far 0FD8h,1A68h
1a30:0049  add sp,4
1a30:004c  mov [bp-2],ax
1a30:004f  cmp ax,0Fh
1a30:0052  jle short 005Ch
1a30:0054  mov word ptr [5E36h],0
1a30:005a  jmp short 0062h
1a30:005c  mov ax,[bp+6]
1a30:005f  mov [5E36h],ax
1a30:0062  or si,si
1a30:0064  je short 006Bh
1a30:0066  mov ax,[bp-2]
1a30:0069  jmp short 006Dh
1a30:006b  xor ax,ax
1a30:006d  mov dx,0Fh
1a30:0070  sub dx,ax
1a30:0072  mov cl,4
1a30:0074  shl dx,cl
1a30:0076  mov [5E38h],dx
1a30:007a  pop si
1a30:007b  mov sp,bp
1a30:007d  pop bp
1a30:007e  ret far

; Candidate 1a68:0316, file offset 0x1db96
1a68:0316  push bp
1a68:0317  mov bp,sp
1a68:0319  push bx
1a68:031a  push cx
1a68:031b  push dx
1a68:031c  push di
1a68:031d  push si
1a68:031e  mov ax,[bp+6]
1a68:0321  mov dl,20h
1a68:0323  div dl
1a68:0325  mov bx,ax
1a68:0327  mov ax,[bp+8]
1a68:032a  div dl
1a68:032c  xor cx,cx
1a68:032e  xor dx,dx
1a68:0330  mov cl,ah
1a68:0332  mov dl,al
1a68:0334  xor ax,ax
1a68:0336  mov al,bh
1a68:0338  xor bh,bh
1a68:033a  mov si,0
1a68:033d  sub bx,dx
1a68:033f  mov di,bx
1a68:0341  jns short 0345h
1a68:0343  neg di
1a68:0345  sub cx,ax
1a68:0347  mov ax,cx
1a68:0349  jns short 034Dh
1a68:034b  neg ax
1a68:034d  mov dx,bx
1a68:034f  shl dx,1
1a68:0351  cmp dx,ax
1a68:0353  jl short 0358h
1a68:0355  or si,8
1a68:0358  neg dx
1a68:035a  cmp dx,ax
1a68:035c  jl short 0361h
1a68:035e  or si,4
1a68:0361  mov dx,cx
1a68:0363  shl dx,1
1a68:0365  cmp dx,di
1a68:0367  jl short 036Ch
1a68:0369  or si,2
1a68:036c  neg dx
1a68:036e  cmp dx,di
1a68:0370  jl short 0373h
1a68:0372  inc si
1a68:0373  xor ax,ax
1a68:0375  mov al,[si+6180h]
1a68:0379  pop si
1a68:037a  pop di
1a68:037b  pop dx
1a68:037c  pop cx
1a68:037d  pop bx
1a68:037e  pop bp
1a68:037f  ret far

; Candidate 1a68:0fd8, file offset 0x1e858
1a68:0fd8  push bp
1a68:0fd9  mov bp,sp
1a68:0fdb  push bx
1a68:0fdc  push cx
1a68:0fdd  push dx
1a68:0fde  mov ax,[bp+6]
1a68:0fe1  mov bx,[bp+8]
1a68:0fe4  mov cl,3
1a68:0fe6  mov dl,al
1a68:0fe8  and dl,1Fh
1a68:0feb  shl ax,cl
1a68:0fed  mov dh,ah
1a68:0fef  mov al,bl
1a68:0ff1  and al,1Fh
1a68:0ff3  shl bx,cl
1a68:0ff5  mov ah,bh
1a68:0ff7  sub ah,dh
1a68:0ff9  jns short 0FFDh
1a68:0ffb  neg ah
1a68:0ffd  sub al,dl
1a68:0fff  jns short 1003h
1a68:1001  neg al
1a68:1003  cmp al,ah
1a68:1005  jl short 1009h
1a68:1007  xchg ah,al
1a68:1009  shr al,1
1a68:100b  add al,ah
1a68:100d  xor ah,ah
1a68:100f  pop dx
1a68:1010  pop cx
1a68:1011  pop bx
1a68:1012  pop bp
1a68:1013  ret far

; Candidate 1a68:10fe, file offset 0x1e97e
1a68:10fe  push bp
1a68:10ff  mov bp,sp
1a68:1101  push ax
1a68:1102  push bx
1a68:1103  push cx
1a68:1104  push es
1a68:1105  push di
1a68:1106  push ds
1a68:1107  mov di,[bp+6]
1a68:110a  mov es,[bp+8]
1a68:110d  mov bx,[bp+0Ah]
1a68:1110  mov ds,[bp+0Ch]
1a68:1113  mov al,es:[di]
1a68:1116  cmp al,1
1a68:1118  jne short 1127h
1a68:111a  add di,4
1a68:111d  mov cx,10h
1a68:1120  mov al,es:[di]
1a68:1123  xlat [bx]
1a68:1124  stosb [di]
1a68:1125  loop 1120h
1a68:1127  pop ds
1a68:1128  pop di
1a68:1129  pop es
1a68:112a  pop cx
1a68:112b  pop bx
1a68:112c  pop ax
1a68:112d  pop bp
1a68:112e  ret far

; Candidate 1b7a:001a, file offset 0x1e9ba
1b7a:001a  push bp
1b7a:001b  mov bp,sp
1b7a:001d  sub sp,14h
1b7a:0020  push ds
1b7a:0021  mov ds,cs:[0Fh]
1b7a:0026  push si
1b7a:0027  push di
1b7a:0028  cld
1b7a:0029  cmp word ptr [110h],0
1b7a:002e  jne short 0033h
1b7a:0030  jmp 013Fh
1b7a:0033  call 01C9h
1b7a:0036  jae short 0064h
1b7a:0038  mov ax,[bp+6]
1b7a:003b  or ax,[bp+8]
1b7a:003e  jne short 004Ah
1b7a:0040  mov word ptr [bp+6],868h
1b7a:0045  mov word ptr [bp+8],2A32h
1b7a:004a  call 01BDh
1b7a:004d  jae short 0064h
1b7a:004f  call 0209h
1b7a:0052  jae short 0064h
1b7a:0054  mov ax,0FFFEh
1b7a:0057  jmp 0141h
1b7a:005a  mov ah,3Eh
1b7a:005c  int 21h
1b7a:005e  mov ax,0FFFFh
1b7a:0061  jmp 0141h
1b7a:0064  mov bx,ax
1b7a:0066  mov [128h],bx
1b7a:006a  mov cx,14h
1b7a:006d  call 028Ch
1b7a:0070  mov cx,0FFFDh
1b7a:0073  jb short 005Ah
1b7a:0075  xor ax,ax
1b7a:0077  xor dx,dx
1b7a:0079  cmp word ptr [bp-14h],5A4Dh
1b7a:007e  je short 0085h
1b7a:0080  mov cx,0FFFCh
1b7a:0083  jmp short 005Ah
1b7a:0085  mov ax,[bp-10h]
1b7a:0088  mov cx,[bp-12h]
1b7a:008b  jcxz 008Eh
1b7a:008d  dec ax
1b7a:008e  mov dx,200h
1b7a:0091  mul dx
1b7a:0093  add ax,cx
1b7a:0095  add ax,0Fh
1b7a:0098  adc dx,0
1b7a:009b  and ax,0FFF0h
1b7a:009e  push dx
1b7a:009f  push ax
1b7a:00a0  mov cx,dx
1b7a:00a2  mov dx,ax
1b7a:00a4  mov ax,4200h
1b7a:00a7  int 21h
1b7a:00a9  mov cx,10h
1b7a:00ac  call 028Ch
1b7a:00af  pop ax
1b7a:00b0  pop dx
1b7a:00b1  mov cx,0FFFDh
1b7a:00b4  jb short 005Ah
1b7a:00b6  add ax,10h
1b7a:00b9  adc dx,0
1b7a:00bc  cmp word ptr [bp-14h],4246h
1b7a:00c1  mov cx,0FFFCh
1b7a:00c4  je short 00C8h
1b7a:00c6  jmp short 005Ah
1b7a:00c8  cmp word ptr [bp-12h],564Fh
1b7a:00cd  je short 00D7h
1b7a:00cf  add ax,[bp-10h]
1b7a:00d2  adc dx,[bp-0Eh]
1b7a:00d5  jmp short 009Eh
1b7a:00d7  mov [114h],ax
1b7a:00da  mov [116h],dx
1b7a:00de  mov es,cs:[11h]
1b7a:00e3  mov ax,[bp-10h]
1b7a:00e6  mov es:[61B0h],ax
1b7a:00ea  mov ax,[bp-0Eh]
1b7a:00ed  mov es:[61B2h],ax
1b7a:00f1  mov ah,3Eh
1b7a:00f3  int 21h
1b7a:00f5  mov word ptr [128h],0
1b7a:00fb  call far 014Ah,1B7Ah
1b7a:0100  mov ax,[bp+0Ch]
1b7a:0103  inc ax
1b7a:0104  mov [124h],ax
1b7a:0107  mov [120h],ax
1b7a:010a  mov bx,[bp+0Ah]
1b7a:010d  mov [126h],bx
1b7a:0111  call 029Ch
1b7a:0114  mov bx,[126h]
1b7a:0118  sub bx,[124h]
1b7a:011c  cmp bx,[11Ah]
1b7a:0120  jae short 0128h
1b7a:0122  mov cx,0FFFBh
1b7a:0125  jmp 005Ah
1b7a:0128  shr bx,1
1b7a:012a  shr bx,1
1b7a:012c  mov [118h],bx
1b7a:0130  call 031Ch
1b7a:0133  jae short 013Fh
1b7a:0135  mov bx,[128h]
1b7a:0139  mov cx,0FFFFh
1b7a:013c  jmp short 0141h
1b7a:013e  nop
1b7a:013f  xor ax,ax
1b7a:0141  pop di
1b7a:0142  pop si
1b7a:0143  pop ds
1b7a:0144  mov sp,bp
1b7a:0146  pop bp
1b7a:0147  ret far 8

; Candidate 1b7a:014a, file offset 0x1eaea
1b7a:014a  push bp
1b7a:014b  mov bp,sp
1b7a:014d  push ds
1b7a:014e  mov ds,cs:[0Fh]
1b7a:0153  mov al,[111h]
1b7a:0156  mov ah,35h
1b7a:0158  int 21h
1b7a:015a  push es
1b7a:015b  push bx
1b7a:015c  push ds
1b7a:015d  mov al,[111h]
1b7a:0160  mov dx,[2]
1b7a:0164  mov ds,[4]
1b7a:0168  mov ah,25h
1b7a:016a  int 21h
1b7a:016c  pop ds
1b7a:016d  pop word ptr [2]
1b7a:0171  pop word ptr [4]
1b7a:0175  cmp word ptr [128h],0
1b7a:017a  je short 018Ch
1b7a:017c  mov bx,[128h]
1b7a:0180  mov ah,3Eh
1b7a:0182  int 21h
1b7a:0184  mov word ptr [128h],0
1b7a:018a  jmp short 0198h
1b7a:018c  lea dx,[8Ch]
1b7a:0190  mov ax,3D00h
1b7a:0193  int 21h
1b7a:0195  mov [128h],ax
1b7a:0198  pop ds
1b7a:0199  pop bp
1b7a:019a  ret far

; Candidate 1b7a:08ec, file offset 0x1f28c
1b7a:08ec  push bp
1b7a:08ed  mov bp,sp
1b7a:08ef  push ds
1b7a:08f0  mov ds,cs:[0Fh]
1b7a:08f5  test byte ptr [10h],1
1b7a:08fa  je short 0902h
1b7a:08fc  mov ax,0FFFFh
1b7a:08ff  jmp 09C9h
1b7a:0902  cmp word ptr [bp+6],0
1b7a:0906  je short 0919h
1b7a:0908  mov cx,[bp+0Ah]
1b7a:090b  jcxz 08FCh
1b7a:090d  cmp cx,[bp+8]
1b7a:0910  jbe short 08FCh
1b7a:0912  or byte ptr [38h],1
1b7a:0917  jmp short 0936h
1b7a:0919  call far 0D8Ch,1B7Ah
1b7a:091e  or ax,ax
1b7a:0920  je short 08FCh
1b7a:0922  mov bx,[bp+8]
1b7a:0925  cmp bx,ax
1b7a:0927  jae short 08FCh
1b7a:0929  sub ax,bx
1b7a:092b  mov cx,[bp+0Ah]
1b7a:092e  jcxz 0934h
1b7a:0930  cmp cx,ax
1b7a:0932  jb short 0936h
1b7a:0934  mov cx,ax
1b7a:0936  mov es,cs:[11h]
1b7a:093b  mov bx,4000h
1b7a:093e  mov ax,es:[61B0h]
1b7a:0942  mov dx,es:[61B2h]
1b7a:0947  add ax,3FFFh
1b7a:094a  adc dx,0
1b7a:094d  div bx
1b7a:094f  cmp cx,ax
1b7a:0951  jbe short 0955h
1b7a:0953  mov cx,ax
1b7a:0955  cmp cx,4
1b7a:0958  jae short 0967h
1b7a:095a  mov ax,400h
1b7a:095d  mul cx
1b7a:095f  cmp ax,[11Ah]
1b7a:0963  jae short 0967h
1b7a:0965  jmp short 08FCh
1b7a:0967  push word ptr [bp+6]
1b7a:096a  push word ptr [bp+8]
1b7a:096d  mov [bp+0Ah],cx
1b7a:0970  push cx
1b7a:0971  call far 0E3Eh,1B7Ah
1b7a:0976  or ax,ax
1b7a:0978  jne short 09C9h
1b7a:097a  push di
1b7a:097b  mov di,140h
1b7a:097e  push ds
1b7a:097f  pop es
1b7a:0980  cld
1b7a:0981  mov ax,4000h
1b7a:0984  mul word ptr [bp+8]
1b7a:0987  mov bx,ax
1b7a:0989  stosw [di]
1b7a:098a  mov cx,dx
1b7a:098c  mov ax,dx
1b7a:098e  stosw [di]
1b7a:098f  mov ax,4000h
1b7a:0992  mul word ptr [bp+0Ah]
1b7a:0995  add ax,bx
1b7a:0997  adc dx,cx
1b7a:0999  stosw [di]
1b7a:099a  mov ax,dx
1b7a:099c  stosw [di]
1b7a:099d  mov ax,bx
1b7a:099f  stosw [di]
1b7a:09a0  mov ax,cx
1b7a:09a2  stosw [di]
1b7a:09a3  mov word ptr [14Ch],0A4Ch
1b7a:09a9  mov word ptr [14Eh],0
1b7a:09af  mov word ptr [112h],1
1b7a:09b5  or byte ptr [10h],2
1b7a:09ba  mov word ptr [84h],0EA3h
1b7a:09c0  mov word ptr [80h],0D12h
1b7a:09c6  xor ax,ax
1b7a:09c8  pop di
1b7a:09c9  pop ds
1b7a:09ca  pop bp
1b7a:09cb  ret far

; Candidate 1b7a:0ab6, file offset 0x1f456
1b7a:0ab6  push bp
1b7a:0ab7  mov bp,sp
1b7a:0ab9  sub sp,2
1b7a:0abc  push ds
1b7a:0abd  mov ds,cs:[0Fh]
1b7a:0ac2  push si
1b7a:0ac3  push di
1b7a:0ac4  test byte ptr [10h],2
1b7a:0ac9  je short 0AD0h
1b7a:0acb  xor ax,ax
1b7a:0acd  jmp 0BC9h
1b7a:0ad0  mov byte ptr [bp-2],0
1b7a:0ad4  call far 0ECEh,1B7Ah
1b7a:0ad9  or ax,dx
1b7a:0adb  jne short 0AE3h
1b7a:0add  mov ax,0FFFFh
1b7a:0ae0  jmp 0BC9h
1b7a:0ae3  mov bx,[bp+6]
1b7a:0ae6  mov cx,[bp+8]
1b7a:0ae9  cmp cx,[3Ch]
1b7a:0aed  jb short 0AF7h
1b7a:0aef  ja short 0AFFh
1b7a:0af1  cmp bx,[3Ah]
1b7a:0af5  jae short 0AFFh
1b7a:0af7  mov cx,[3Ch]
1b7a:0afb  mov bx,[3Ah]
1b7a:0aff  cmp cx,[40h]
1b7a:0b03  ja short 0ADDh
1b7a:0b05  jb short 0B0Dh
1b7a:0b07  cmp bx,[3Eh]
1b7a:0b0b  ja short 0ADDh
1b7a:0b0d  mov [bp+6],bx
1b7a:0b10  mov [bp+8],cx
1b7a:0b13  mov ax,[3Eh]
1b7a:0b16  mov dx,[40h]
1b7a:0b1a  sub ax,bx
1b7a:0b1c  sbb dx,cx
1b7a:0b1e  mov si,[bp+0Ah]
1b7a:0b21  or si,[bp+0Ch]
1b7a:0b24  je short 0B39h
1b7a:0b26  cmp dx,[bp+0Ch]
1b7a:0b29  jb short 0B39h
1b7a:0b2b  ja short 0B33h
1b7a:0b2d  cmp ax,[3Eh]
1b7a:0b31  jbe short 0B39h
1b7a:0b33  mov ax,[bp+0Ah]
1b7a:0b36  mov dx,[bp+0Ch]
1b7a:0b39  mov es,cs:[11h]
1b7a:0b3e  cmp dx,es:[61B2h]
1b7a:0b43  jb short 0B57h
1b7a:0b45  ja short 0B4Eh
1b7a:0b47  cmp ax,es:[61B0h]
1b7a:0b4c  jbe short 0B57h
1b7a:0b4e  mov dx,es:[61B2h]
1b7a:0b53  mov ax,es:[61B0h]
1b7a:0b57  mov [bp+0Ah],ax
1b7a:0b5a  mov [bp+0Ch],dx
1b7a:0b5d  or dx,dx
1b7a:0b5f  jne short 0B6Fh
1b7a:0b61  push ax
1b7a:0b62  shr ax,4
1b7a:0b65  cmp ax,[11Ah]
1b7a:0b69  pop ax
1b7a:0b6a  jae short 0B6Fh
1b7a:0b6c  jmp 0ADDh
1b7a:0b6f  push cx
1b7a:0b70  push bx
1b7a:0b71  push dx
1b7a:0b72  push ax
1b7a:0b73  mov di,130h
1b7a:0b76  push ds
1b7a:0b77  pop es
1b7a:0b78  cld
1b7a:0b79  push ax
1b7a:0b7a  mov ax,bx
1b7a:0b7c  stosw [di]
1b7a:0b7d  mov ax,cx
1b7a:0b7f  stosw [di]
1b7a:0b80  pop ax
1b7a:0b81  add ax,bx
1b7a:0b83  adc dx,cx
1b7a:0b85  stosw [di]
1b7a:0b86  mov ax,dx
1b7a:0b88  stosw [di]
1b7a:0b89  mov ax,bx
1b7a:0b8b  stosw [di]
1b7a:0b8c  mov ax,cx
1b7a:0b8e  stosw [di]
1b7a:0b8f  call far 107Eh,1B7Ah
1b7a:0b94  or ax,ax
1b7a:0b96  jne short 0BC9h
1b7a:0b98  cmp byte ptr [bp-2],0
1b7a:0b9c  jne short 0BA4h
1b7a:0b9e  inc byte ptr [bp-2]
1b7a:0ba1  jmp 0AE3h
1b7a:0ba4  mov word ptr [13Ch],0BFFh
1b7a:0baa  mov word ptr [13Eh],0
1b7a:0bb0  mov word ptr [112h],1
1b7a:0bb6  or byte ptr [10h],1
1b7a:0bbb  mov word ptr [82h],1156h
1b7a:0bc1  mov word ptr [80h],0D12h
1b7a:0bc7  xor ax,ax
1b7a:0bc9  pop di
1b7a:0bca  pop si
1b7a:0bcb  pop ds
1b7a:0bcc  mov sp,bp
1b7a:0bce  pop bp
1b7a:0bcf  ret far

; Candidate 1b7a:0d8c, file offset 0x1f72c
1b7a:0d8c  push bp
1b7a:0d8d  mov bp,sp
1b7a:0d8f  sub sp,102h
1b7a:0d93  push ds
1b7a:0d94  mov ds,cs:[0Fh]
1b7a:0d99  push si
1b7a:0d9a  push di
1b7a:0d9b  test byte ptr [38h],1
1b7a:0da0  je short 0DB2h
1b7a:0da2  test byte ptr [38h],2
1b7a:0da7  jne short 0DACh
1b7a:0da9  jmp short 0E1Ah
1b7a:0dab  nop
1b7a:0dac  mov ax,[36h]
1b7a:0daf  jmp 0E37h
1b7a:0db2  push ds
1b7a:0db3  push cs
1b7a:0db4  pop ds
1b7a:0db5  mov dx,0D83h
1b7a:0db8  mov ax,3D00h
1b7a:0dbb  int 21h
1b7a:0dbd  pop ds
1b7a:0dbe  mov bx,ax
1b7a:0dc0  jb short 0DE4h
1b7a:0dc2  mov ax,4400h
1b7a:0dc5  int 21h
1b7a:0dc7  jb short 0DE0h
1b7a:0dc9  test dx,80h
1b7a:0dcd  je short 0DE0h
1b7a:0dcf  mov ax,4407h
1b7a:0dd2  int 21h
1b7a:0dd4  jb short 0DE0h
1b7a:0dd6  push ax
1b7a:0dd7  mov ah,3Eh
1b7a:0dd9  int 21h
1b7a:0ddb  pop ax
1b7a:0ddc  cmp al,0FFh
1b7a:0dde  je short 0DE7h
1b7a:0de0  mov ah,3Eh
1b7a:0de2  int 21h
1b7a:0de4  jmp short 0E30h
1b7a:0de6  nop
1b7a:0de7  mov ax,3567h
1b7a:0dea  int 21h
1b7a:0dec  mov ax,es
1b7a:0dee  or ax,bx
1b7a:0df0  je short 0DE4h
1b7a:0df2  mov ah,40h
1b7a:0df4  int 67h
1b7a:0df6  or ah,ah
1b7a:0df8  jne short 0DE4h
1b7a:0dfa  mov byte ptr [38h],1
1b7a:0dff  mov ah,46h
1b7a:0e01  int 67h
1b7a:0e03  or ah,ah
1b7a:0e05  jne short 0DE4h
1b7a:0e07  cmp al,32h
1b7a:0e09  jb short 0DE4h
1b7a:0e0b  mov [39h],al
1b7a:0e0e  mov ah,41h
1b7a:0e10  int 67h
1b7a:0e12  or ah,ah
1b7a:0e14  jne short 0DE4h
1b7a:0e16  mov [30h],bx
1b7a:0e1a  mov ah,42h
1b7a:0e1c  int 67h
1b7a:0e1e  or ah,ah
1b7a:0e20  jne short 0E30h
1b7a:0e22  mov [36h],bx
1b7a:0e26  mov word ptr [32h],0FFFFh
1b7a:0e2c  mov ax,bx
1b7a:0e2e  jmp short 0E37h
1b7a:0e30  xor ax,ax
1b7a:0e32  mov byte ptr [38h],0
1b7a:0e37  pop di
1b7a:0e38  pop si
1b7a:0e39  pop ds
1b7a:0e3a  mov sp,bp
1b7a:0e3c  pop bp
1b7a:0e3d  ret far

; Candidate 1b7a:0e3e, file offset 0x1f7de
1b7a:0e3e  push bp
1b7a:0e3f  mov bp,sp
1b7a:0e41  push ds
1b7a:0e42  mov ds,cs:[0Fh]
1b7a:0e47  test byte ptr [38h],1
1b7a:0e4c  jne short 0E51h
1b7a:0e4e  jmp short 0E9Bh
1b7a:0e50  nop
1b7a:0e51  test byte ptr [38h],2
1b7a:0e56  je short 0E5Dh
1b7a:0e58  xor ax,ax
1b7a:0e5a  jmp short 0E9Eh
1b7a:0e5c  nop
1b7a:0e5d  or byte ptr [38h],2
1b7a:0e62  mov ax,[bp+8]
1b7a:0e65  mov [34h],ax
1b7a:0e68  mov bx,[bp+6]
1b7a:0e6b  mov [36h],bx
1b7a:0e6f  mov dx,[bp+0Ah]
1b7a:0e72  or dx,dx
1b7a:0e74  jne short 0E83h
1b7a:0e76  mov ah,43h
1b7a:0e78  int 67h
1b7a:0e7a  or ah,ah
1b7a:0e7c  jne short 0E9Bh
1b7a:0e7e  or byte ptr [38h],4
1b7a:0e83  mov [32h],dx
1b7a:0e87  mov ah,47h
1b7a:0e89  int 67h
1b7a:0e8b  or ah,ah
1b7a:0e8d  jne short 0E9Bh
1b7a:0e8f  mov dx,[32h]
1b7a:0e93  mov ah,48h
1b7a:0e95  int 67h
1b7a:0e97  mov al,ah
1b7a:0e99  jmp short 0E9Eh
1b7a:0e9b  mov ax,0FFFFh
1b7a:0e9e  pop ds
1b7a:0e9f  pop bp
1b7a:0ea0  ret far 6

; Candidate 1b7a:0ece, file offset 0x1f86e
1b7a:0ece  push bp
1b7a:0ecf  mov bp,sp
1b7a:0ed1  sub sp,22h
1b7a:0ed4  push ds
1b7a:0ed5  mov ds,cs:[0Fh]
1b7a:0eda  push si
1b7a:0edb  push di
1b7a:0edc  test byte ptr [42h],1
1b7a:0ee1  je short 0EEDh
1b7a:0ee3  test byte ptr [42h],2
1b7a:0ee8  je short 0EF2h
1b7a:0eea  jmp 1063h
1b7a:0eed  mov byte ptr [42h],1
1b7a:0ef2  mov word ptr [3Ah],0
1b7a:0ef8  mov word ptr [3Ch],10h
1b7a:0efe  mov word ptr [3Eh],0
1b7a:0f04  mov word ptr [40h],10h
1b7a:0f0a  push sp
1b7a:0f0b  pop ax
1b7a:0f0c  cmp ax,sp
1b7a:0f0e  jne short 0F18h
1b7a:0f10  mov ah,30h
1b7a:0f12  int 21h
1b7a:0f14  cmp al,0Ah
1b7a:0f16  jb short 0F1Bh
1b7a:0f18  jmp 1074h
1b7a:0f1b  xchg ah,al
1b7a:0f1d  mov [bp-22h],ax
1b7a:0f20  mov ax,0F000h
1b7a:0f23  mov es,ax
1b7a:0f25  mov al,es:[0FFFEh]
1b7a:0f29  cmp al,0FCh
1b7a:0f2b  ja short 0F18h
1b7a:0f2d  cmp al,0FBh
1b7a:0f2f  je short 0F18h
1b7a:0f31  cmp al,0F9h
1b7a:0f33  je short 0F18h
1b7a:0f35  cmp word ptr [bp-22h],31h
1b7a:0f39  jae short 0F3Eh
1b7a:0f3b  jmp 0FBDh
1b7a:0f3e  mov ax,4300h
1b7a:0f41  int 2Fh
1b7a:0f43  cmp al,80h
1b7a:0f45  jne short 0F3Bh
1b7a:0f47  mov ax,4310h
1b7a:0f4a  int 2Fh
1b7a:0f4c  mov [43h],bx
1b7a:0f50  mov [45h],es
1b7a:0f54  xor ax,ax
1b7a:0f56  call far dword ptr [43h]
1b7a:0f5a  cmp ah,2
1b7a:0f5d  jb short 0FBDh
1b7a:0f5f  mov ah,8
1b7a:0f61  call far dword ptr [43h]
1b7a:0f65  or ax,ax
1b7a:0f67  je short 0FBAh
1b7a:0f69  mov si,ax
1b7a:0f6b  xchg dx,ax
1b7a:0f6c  mov ah,9
1b7a:0f6e  call far dword ptr [43h]
1b7a:0f72  or ax,ax
1b7a:0f74  je short 0FBAh
1b7a:0f76  mov [47h],dx
1b7a:0f7a  mov ah,0Ch
1b7a:0f7c  call far dword ptr [43h]
1b7a:0f80  or ax,ax
1b7a:0f82  je short 0FA0h
1b7a:0f84  mov [3Ah],bx
1b7a:0f88  mov [3Ch],dx
1b7a:0f8c  mov ax,400h
1b7a:0f8f  mul si
1b7a:0f91  add ax,[3Ah]
1b7a:0f95  adc dx,[3Ch]
1b7a:0f99  mov [3Eh],ax
1b7a:0f9c  mov [40h],dx
1b7a:0fa0  mov ah,0Dh
1b7a:0fa2  mov dx,[47h]
1b7a:0fa6  call far dword ptr [43h]
1b7a:0faa  mov ah,0Ah
1b7a:0fac  mov dx,[47h]
1b7a:0fb0  call far dword ptr [43h]
1b7a:0fb4  mov word ptr [47h],0
1b7a:0fba  jmp 1063h
1b7a:0fbd  mov ah,88h
1b7a:0fbf  int 15h
1b7a:0fc1  or ax,ax
1b7a:0fc3  jne short 0FC8h
1b7a:0fc5  jmp 1074h
1b7a:0fc8  mov dx,400h
1b7a:0fcb  mul dx
1b7a:0fcd  add dl,10h
1b7a:0fd0  mov [3Eh],ax
1b7a:0fd3  mov [40h],dx
1b7a:0fd7  mov cx,[43h]
1b7a:0fdb  or cx,[45h]
1b7a:0fdf  jcxz 0FECh
1b7a:0fe1  mov byte ptr [3Ch],11h
1b7a:0fe6  mov word ptr [3Ah],0
1b7a:0fec  mov ax,ss
1b7a:0fee  mov dx,10h
1b7a:0ff1  mul dx
1b7a:0ff3  lea bx,[bp-20h]
1b7a:0ff6  xor cx,cx
1b7a:0ff8  add bx,ax
1b7a:0ffa  adc cx,dx
1b7a:0ffc  mov ax,0
1b7a:0fff  mov dx,10h
1b7a:1002  mov si,20h
1b7a:1005  xor di,di
1b7a:1007  call 11AAh
1b7a:100a  jb short 0FC5h
1b7a:100c  lea di,[bp-1Dh]
1b7a:100f  push ss
1b7a:1010  pop es
1b7a:1011  lea si,[20h]
1b7a:1015  mov cx,5
1b7a:1018  cld
1b7a:1019  repe cmpsb [si],[di]
1b7a:101b  jne short 102Dh
1b7a:101d  mov ax,[bp-15h]
1b7a:1020  mul word ptr [bp-0Dh]
1b7a:1023  add dl,10h
1b7a:1026  mov [3Ah],ax
1b7a:1029  mov [3Ch],dl
1b7a:102d  xor ax,ax
1b7a:102f  mov es,ax
1b7a:1031  mov es,es:[66h]
1b7a:1036  mov di,12h
1b7a:1039  lea si,[20h]
1b7a:103d  mov cx,5
1b7a:1040  cld
1b7a:1041  repe cmpsb [si],[di]
1b7a:1043  jne short 1063h
1b7a:1045  mov ax,es:[2Ch]
1b7a:1049  mov dl,es:[2Eh]
1b7a:104e  cmp dl,[3Ch]
1b7a:1052  jb short 1063h
1b7a:1054  ja short 105Ch
1b7a:1056  cmp ax,[3Ah]
1b7a:105a  jbe short 1063h
1b7a:105c  mov [3Ah],ax
1b7a:105f  mov [3Ch],dl
1b7a:1063  mov ax,[3Eh]
1b7a:1066  mov dx,[40h]
1b7a:106a  sub ax,[3Ah]
1b7a:106e  sbb dx,[3Ch]
1b7a:1072  jmp short 1077h
1b7a:1074  xor ax,ax
1b7a:1076  cwd
1b7a:1077  pop di
1b7a:1078  pop si
1b7a:1079  pop ds
1b7a:107a  mov sp,bp
1b7a:107c  pop bp
1b7a:107d  ret far

; Candidate 1b7a:107e, file offset 0x1fa1e
1b7a:107e  push bp
1b7a:107f  mov bp,sp
1b7a:1081  push ds
1b7a:1082  mov ds,cs:[0Fh]
1b7a:1087  push si
1b7a:1088  push di
1b7a:1089  test byte ptr [42h],1
1b7a:108e  jne short 1093h
1b7a:1090  jmp 114Ch
1b7a:1093  test byte ptr [42h],2
1b7a:1098  je short 109Fh
1b7a:109a  xor ax,ax
1b7a:109c  jmp 114Fh
1b7a:109f  or byte ptr [42h],2
1b7a:10a4  mov ax,[bp+0Ah]
1b7a:10a7  mov dx,[bp+0Ch]
1b7a:10aa  mov si,[bp+6]
1b7a:10ad  mov di,[bp+8]
1b7a:10b0  mov bx,[43h]
1b7a:10b4  or bx,[45h]
1b7a:10b8  je short 10FDh
1b7a:10ba  mov ax,si
1b7a:10bc  mov dx,di
1b7a:10be  add ax,3FFh
1b7a:10c1  adc dx,0
1b7a:10c4  mov bx,400h
1b7a:10c7  div bx
1b7a:10c9  xchg dx,ax
1b7a:10ca  mov ah,9
1b7a:10cc  call far dword ptr [43h]
1b7a:10d0  or ax,ax
1b7a:10d2  je short 10FAh
1b7a:10d4  mov [47h],dx
1b7a:10d8  mov ah,0Ch
1b7a:10da  call far dword ptr [43h]
1b7a:10de  or ax,ax
1b7a:10e0  je short 10FAh
1b7a:10e2  mov [3Ah],bx
1b7a:10e6  mov [3Ch],dx
1b7a:10ea  mov [49h],bx
1b7a:10ee  mov [4Bh],dx
1b7a:10f2  mov ax,bx
1b7a:10f4  add ax,si
1b7a:10f6  adc dx,di
1b7a:10f8  jmp short 1141h
1b7a:10fa  jmp short 114Ch
1b7a:10fc  nop
1b7a:10fd  mov [3Ah],ax
1b7a:1100  mov [3Ch],dx
1b7a:1104  xor bx,bx
1b7a:1106  mov es,bx
1b7a:1108  push ds
1b7a:1109  mov bx,2A2Dh
1b7a:110c  mov ds,bx
1b7a:110e  mov bx,es:[64h]
1b7a:1113  mov [2Fh],bx
1b7a:1117  mov bx,es:[66h]
1b7a:111c  mov [31h],bx
1b7a:1120  mov word ptr es:[64h],3Fh
1b7a:1127  mov word ptr es:[66h],2A2Dh
1b7a:112e  mov [3Ah],ax
1b7a:1131  mov [3Ch],dl
1b7a:1135  add ax,si
1b7a:1137  adc dx,di
1b7a:1139  mov [2Ch],ax
1b7a:113c  mov [2Eh],dl
1b7a:1140  pop ds
1b7a:1141  mov [3Eh],ax
1b7a:1144  mov [40h],dx
1b7a:1148  xor ax,ax
1b7a:114a  jmp short 114Fh
1b7a:114c  mov ax,0FFFFh
1b7a:114f  pop di
1b7a:1150  pop si
1b7a:1151  pop ds
1b7a:1152  pop bp
1b7a:1153  ret far 8

; Candidate 1c9f:0009, file offset 0x1fbf9
1c9f:0009  push bp
1c9f:000a  mov bp,sp
1c9f:000c  push si
1c9f:000d  mov ax,0
1c9f:0010  mov es,ax
1c9f:0012  mov byte ptr es:[43B9h],0
1c9f:0018  mov ax,[638Ah]
1c9f:001b  cmp ax,1
1c9f:001e  je short 0038h
1c9f:0020  cmp ax,2
1c9f:0023  je short 002Ch
1c9f:0025  cmp ax,3
1c9f:0028  je short 002Ch
1c9f:002a  jmp short 00A7h
1c9f:002c  push word ptr [bp+8]
1c9f:002f  push word ptr [bp+6]
1c9f:0032  push ds
1c9f:0033  mov ax,61B6h
1c9f:0036  jmp short 0042h
1c9f:0038  push word ptr [bp+8]
1c9f:003b  push word ptr [bp+6]
1c9f:003e  push ds
1c9f:003f  mov ax,61BDh
1c9f:0042  push ax
1c9f:0043  push ds
1c9f:0044  mov ax,0F16Eh
1c9f:0047  push ax
1c9f:0048  call far 64A1h,0
1c9f:004d  add sp,0Ch
1c9f:0050  mov ax,1
1c9f:0053  push ax
1c9f:0054  push ds
1c9f:0055  mov ax,0F16Eh
1c9f:0058  push ax
1c9f:0059  call far 0107h,1DCEh
1c9f:005e  add sp,6
1c9f:0061  mov si,ax
1c9f:0063  xor ax,ax
1c9f:0065  mov dx,78h
1c9f:0068  push ax
1c9f:0069  push dx
1c9f:006a  push ds
1c9f:006b  mov ax,0EF58h
1c9f:006e  push ax
1c9f:006f  push si
1c9f:0070  call far 044Eh,1DCEh
1c9f:0075  add sp,0Ah
1c9f:0078  xor ax,ax
1c9f:007a  mov dx,3B10h
1c9f:007d  push ax
1c9f:007e  push dx
1c9f:007f  call far 025Ah,0
1c9f:0084  push dx
1c9f:0085  push ax
1c9f:0086  push si
1c9f:0087  call far 044Eh,1DCEh
1c9f:008c  add sp,0Ah
1c9f:008f  push si
1c9f:0090  call far 0406h,1DCEh
1c9f:0095  inc sp
1c9f:0096  inc sp
1c9f:0097  call far 02AAh,0
1c9f:009c  mov ax,0
1c9f:009f  mov es,ax
1c9f:00a1  mov byte ptr es:[43B9h],1
1c9f:00a7  pop si
1c9f:00a8  pop bp
1c9f:00a9  ret far

; Candidate 1c9f:00aa, file offset 0x1fc9a
1c9f:00aa  push bp
1c9f:00ab  mov bp,sp
1c9f:00ad  mov ax,0FFFFh
1c9f:00b0  push ax
1c9f:00b1  push word ptr [bp+6]
1c9f:00b4  call far 00BEh,1C9Fh
1c9f:00b9  add sp,4
1c9f:00bc  pop bp
1c9f:00bd  ret far

; Candidate 1c9f:00be, file offset 0x1fcae
1c9f:00be  push bp
1c9f:00bf  mov bp,sp
1c9f:00c1  dec sp
1c9f:00c2  dec sp
1c9f:00c3  push si
1c9f:00c4  push di
1c9f:00c5  mov di,[bp+6]
1c9f:00c8  cmp word ptr [65FAh],0
1c9f:00cd  jne short 00D2h
1c9f:00cf  jmp 0205h
1c9f:00d2  cmp word ptr [638Ah],0
1c9f:00d7  jne short 00DCh
1c9f:00d9  jmp 0205h
1c9f:00dc  or di,di
1c9f:00de  jge short 00E3h
1c9f:00e0  jmp 0205h
1c9f:00e3  cmp di,78h
1c9f:00e6  jl short 00EBh
1c9f:00e8  jmp 0205h
1c9f:00eb  mov al,[di-10A8h]
1c9f:00ef  mov ah,0
1c9f:00f1  mov si,ax
1c9f:00f3  cmp si,0FFh
1c9f:00f7  jne short 00FCh
1c9f:00f9  jmp 0205h
1c9f:00fc  cmp word ptr [638Ah],1
1c9f:0101  je short 0106h
1c9f:0103  jmp 01BEh
1c9f:0106  mov ax,0
1c9f:0109  mov es,ax
1c9f:010b  cmp byte ptr es:[43B0h],0
1c9f:0111  jne short 0106h
1c9f:0113  cmp word ptr [61B4h],0FFh
1c9f:0119  je short 0149h
1c9f:011b  push word ptr [0EF56h]
1c9f:011f  mov ax,1
1c9f:0122  push ax
1c9f:0123  push word ptr [61B4h]
1c9f:0127  call far 0260h,0
1c9f:012c  add sp,6
1c9f:012f  push word ptr [0EF54h]
1c9f:0133  mov ax,3
1c9f:0136  push ax
1c9f:0137  push word ptr [61B4h]
1c9f:013b  call far 0260h,0
1c9f:0140  add sp,6
1c9f:0143  mov word ptr [61B4h],0FFh
1c9f:0149  cmp word ptr [bp+8],0FFFFh
1c9f:014d  je short 01B4h
1c9f:014f  or si,si
1c9f:0151  je short 01B4h
1c9f:0153  cmp si,0FFh
1c9f:0157  je short 01B4h
1c9f:0159  mov [61B4h],si
1c9f:015d  mov ax,1
1c9f:0160  push ax
1c9f:0161  push si
1c9f:0162  call far 027Ah,0
1c9f:0167  add sp,4
1c9f:016a  mov [0EF56h],ax
1c9f:016d  mov ax,3
1c9f:0170  push ax
1c9f:0171  push si
1c9f:0172  call far 027Ah,0
1c9f:0177  add sp,4
1c9f:017a  mov [0EF54h],ax
1c9f:017d  shl ax,1
1c9f:017f  shl ax,1
1c9f:0181  xor ax,0FFh
1c9f:0184  imul word ptr [bp+8]
1c9f:0187  mov [bp-2],ax
1c9f:018a  mov cl,0Ah
1c9f:018c  shr ax,cl
1c9f:018e  xor ax,3Fh
1c9f:0191  push ax
1c9f:0192  mov ax,3
1c9f:0195  push ax
1c9f:0196  push si
1c9f:0197  call far 0260h,0
1c9f:019c  add sp,6
1c9f:019f  mov ax,[bp-2]
1c9f:01a2  mov cl,0Bh
1c9f:01a4  shr ax,cl
1c9f:01a6  push ax
1c9f:01a7  mov ax,1
1c9f:01aa  push ax
1c9f:01ab  push si
1c9f:01ac  call far 0260h,0
1c9f:01b1  add sp,6
1c9f:01b4  push si
1c9f:01b5  call far 4886h,0
1c9f:01ba  inc sp
1c9f:01bb  inc sp
1c9f:01bc  jmp short 0205h
1c9f:01be  cmp byte ptr [638Ch],1
1c9f:01c3  jne short 01EFh
1c9f:01c5  or si,si
1c9f:01c7  jge short 01DAh
1c9f:01c9  cmp byte ptr [6C45h],0
1c9f:01ce  je short 01DAh
1c9f:01d0  mov byte ptr [6C45h],0
1c9f:01d5  call far 0452h,1CC7h
1c9f:01da  or si,si
1c9f:01dc  jle short 01EFh
1c9f:01de  cmp byte ptr [6C45h],0
1c9f:01e3  jne short 01EFh
1c9f:01e5  mov byte ptr [6C45h],1
1c9f:01ea  call far 0452h,1CC7h
1c9f:01ef  and si,7Fh
1c9f:01f3  push si
1c9f:01f4  call far 0293h,0
1c9f:01f9  inc sp
1c9f:01fa  inc sp
1c9f:01fb  push dx
1c9f:01fc  push ax
1c9f:01fd  call far 0412h,1CC7h
1c9f:0202  add sp,4
1c9f:0205  pop di
1c9f:0206  pop si
1c9f:0207  mov sp,bp
1c9f:0209  pop bp
1c9f:020a  ret far

; Candidate 1c9f:020b, file offset 0x1fdfb
1c9f:020b  push bp
1c9f:020c  mov bp,sp
1c9f:020e  mov ax,[bp+6]
1c9f:0211  mov [638Ah],ax
1c9f:0214  cmp ax,1
1c9f:0217  je short 0225h
1c9f:0219  cmp ax,2
1c9f:021c  je short 022Ch
1c9f:021e  cmp ax,3
1c9f:0221  je short 0238h
1c9f:0223  jmp short 024Ch
1c9f:0225  call far 47F1h,0
1c9f:022a  jmp short 024Ch
1c9f:022c  call far 0372h,1CC7h
1c9f:0231  mov byte ptr [638Ch],0
1c9f:0236  jmp short 024Ch
1c9f:0238  call far 0372h,1CC7h
1c9f:023d  mov byte ptr [6C45h],1
1c9f:0242  mov byte ptr [638Ch],1
1c9f:0247  call far 0452h,1CC7h
1c9f:024c  pop bp
1c9f:024d  ret far

; Candidate 1c9f:024e, file offset 0x1fe3e
1c9f:024e  push bp
1c9f:024f  mov bp,sp
1c9f:0251  mov ax,[638Ah]
1c9f:0254  cmp ax,1
1c9f:0257  je short 0265h
1c9f:0259  cmp ax,2
1c9f:025c  je short 026Ch
1c9f:025e  cmp ax,3
1c9f:0261  je short 026Eh
1c9f:0263  jmp short 027Dh
1c9f:0265  call far 4844h,0
1c9f:026a  jmp short 027Dh
1c9f:026c  jmp short 0278h
1c9f:026e  call far 0465h,1CC7h
1c9f:0273  mov byte ptr [6C45h],0
1c9f:0278  call far 03D4h,1CC7h
1c9f:027d  mov word ptr [638Ah],0
1c9f:0283  pop bp
1c9f:0284  ret far

; Candidate 1cc7:0372, file offset 0x201e2
1cc7:0372  push bp
1cc7:0373  mov bp,sp
1cc7:0375  push di
1cc7:0376  push si
1cc7:0377  push ds
1cc7:0378  mov ax,31BEh
1cc7:037b  mov ds,ax
1cc7:037d  push ds
1cc7:037e  mov al,8
1cc7:0380  mov ah,35h
1cc7:0382  int 21h
1cc7:0384  mov cs:[5],bx
1cc7:0389  mov cs:[7],es
1cc7:038e  mov word ptr [4],0Fh
1cc7:0394  mov word ptr [6],0
1cc7:039a  mov ax,cs
1cc7:039c  mov ds,ax
1cc7:039e  mov dx,9
1cc7:03a1  mov al,8
1cc7:03a3  mov ah,25h
1cc7:03a5  int 21h
1cc7:03a7  mov al,36h
1cc7:03a9  out 43h,al
1cc7:03ab  mov ax,1000h
1cc7:03ae  out 40h,al
1cc7:03b0  mov al,ah
1cc7:03b2  out 40h,al
1cc7:03b4  mov al,0B6h
1cc7:03b6  out 43h,al
1cc7:03b8  pop ds
1cc7:03b9  in al,61h
1cc7:03bb  mov [198h],al
1cc7:03be  out 61h,al
1cc7:03c0  cmp byte ptr [1C5h],1
1cc7:03c5  je short 03CCh
1cc7:03c7  call 0362h
1cc7:03ca  jmp short 03CFh
1cc7:03cc  call 0345h
1cc7:03cf  pop ds
1cc7:03d0  pop si
1cc7:03d1  pop di
1cc7:03d2  pop bp
1cc7:03d3  ret far

; Candidate 1cc7:03d4, file offset 0x20244
1cc7:03d4  push bp
1cc7:03d5  mov bp,sp
1cc7:03d7  push di
1cc7:03d8  push si
1cc7:03d9  push ds
1cc7:03da  mov ax,31BEh
1cc7:03dd  mov ds,ax
1cc7:03df  push ds
1cc7:03e0  mov dx,cs:[5]
1cc7:03e5  mov bx,cs:[7]
1cc7:03ea  mov ds,bx
1cc7:03ec  mov al,8
1cc7:03ee  mov ah,25h
1cc7:03f0  int 21h
1cc7:03f2  mov al,36h
1cc7:03f4  out 43h,al
1cc7:03f6  mov ax,0
1cc7:03f9  out 40h,al
1cc7:03fb  mov al,ah
1cc7:03fd  out 40h,al
1cc7:03ff  pop ds
1cc7:0400  cmp byte ptr [1C5h],1
1cc7:0405  jne short 040Ah
1cc7:0407  call 0345h
1cc7:040a  call 0362h
1cc7:040d  pop ds
1cc7:040e  pop si
1cc7:040f  pop di
1cc7:0410  pop bp
1cc7:0411  ret far

; Candidate 1cc7:0412, file offset 0x20282
1cc7:0412  push bp
1cc7:0413  mov bp,sp
1cc7:0415  push di
1cc7:0416  push si
1cc7:0417  push ds
1cc7:0418  mov ax,31BEh
1cc7:041b  mov ds,ax
1cc7:041d  mov ax,[bp+6]
1cc7:0420  mov [14h],ax
1cc7:0423  mov ax,[bp+8]
1cc7:0426  mov [16h],ax
1cc7:0429  mov byte ptr [19Ch],1
1cc7:042e  mov byte ptr [19Bh],1
1cc7:0433  mov byte ptr [1C4h],1
1cc7:0438  pop ds
1cc7:0439  pop si
1cc7:043a  pop di
1cc7:043b  pop bp
1cc7:043c  ret far

; Candidate 1cc7:0452, file offset 0x202c2
1cc7:0452  push bp
1cc7:0453  mov bp,sp
1cc7:0455  push di
1cc7:0456  push si
1cc7:0457  push ds
1cc7:0458  mov ax,31BEh
1cc7:045b  mov ds,ax
1cc7:045d  call 0345h
1cc7:0460  pop ds
1cc7:0461  pop si
1cc7:0462  pop di
1cc7:0463  pop bp
1cc7:0464  ret far

; Candidate 1cc7:0465, file offset 0x202d5
1cc7:0465  push bp
1cc7:0466  mov bp,sp
1cc7:0468  push di
1cc7:0469  push si
1cc7:046a  push ds
1cc7:046b  mov ax,31BEh
1cc7:046e  mov ds,ax
1cc7:0470  call 0345h
1cc7:0473  call 0362h
1cc7:0476  pop ds
1cc7:0477  pop si
1cc7:0478  pop di
1cc7:0479  pop bp
1cc7:047a  ret far

; Candidate 1d0e:000b, file offset 0x202eb
1d0e:000b  push bp
1d0e:000c  mov bp,sp
1d0e:000e  sub sp,0Ch
1d0e:0011  mov ax,[bp+8]
1d0e:0014  mov dx,[bp+6]
1d0e:0017  mov [bp-6],ax
1d0e:001a  mov [bp-8],dx
1d0e:001d  test word ptr [bp+0Ah],20h
1d0e:0022  je short 0029h
1d0e:0024  mov ax,10h
1d0e:0027  jmp short 002Ch
1d0e:0029  mov ax,1
1d0e:002c  cwd
1d0e:002d  add [bp+6],ax
1d0e:0030  adc [bp+8],dx
1d0e:0033  jmp short 0047h
1d0e:0035  mov al,0FFh
1d0e:0037  push ax
1d0e:0038  xor ax,ax
1d0e:003a  push ax
1d0e:003b  call far 0C71h,1DCEh
1d0e:0040  add sp,4
1d0e:0043  or ax,ax
1d0e:0045  je short 005Fh
1d0e:0047  push word ptr [bp+8]
1d0e:004a  push word ptr [bp+6]
1d0e:004d  call far 80E2h,0
1d0e:0052  add sp,4
1d0e:0055  mov [bp-2],dx
1d0e:0058  mov [bp-4],ax
1d0e:005b  or ax,dx
1d0e:005d  je short 0035h
1d0e:005f  mov ax,[bp-4]
1d0e:0062  or ax,[bp-2]
1d0e:0065  jne short 0078h
1d0e:0067  mov ax,[629Ah]
1d0e:006a  or ax,[629Ch]
1d0e:006e  je short 0078h
1d0e:0070  call far dword ptr [629Ah]
1d0e:0074  or ax,ax
1d0e:0076  jne short 0047h
1d0e:0078  mov ax,[bp-4]
1d0e:007b  or ax,[bp-2]
1d0e:007e  jne short 0087h
1d0e:0080  xor dx,dx
1d0e:0082  xor ax,ax
1d0e:0084  jmp 013Bh
1d0e:0087  push word ptr [bp-2]
1d0e:008a  push word ptr [bp-4]
1d0e:008d  call far 0071h,2374h
1d0e:0092  add sp,4
1d0e:0095  mov [bp-2],dx
1d0e:0098  mov [bp-4],ax
1d0e:009b  test word ptr [bp+0Ah],20h
1d0e:00a0  je short 00C6h
1d0e:00a2  mov al,0Fh
1d0e:00a4  sub al,[bp-4]
1d0e:00a7  mov dl,al
1d0e:00a9  mov ah,0
1d0e:00ab  les bx,[bp-4]
1d0e:00ae  add bx,ax
1d0e:00b0  mov al,dl
1d0e:00b2  or al,[bp+0Ah]
1d0e:00b5  mov es:[bx],al
1d0e:00b8  mov ax,[bp-2]
1d0e:00bb  inc ax
1d0e:00bc  mov [bp-2],ax
1d0e:00bf  mov word ptr [bp-4],0
1d0e:00c4  jmp short 00D2h
1d0e:00c6  les bx,[bp-4]
1d0e:00c9  mov al,[bp+0Ah]
1d0e:00cc  mov es:[bx],al
1d0e:00cf  inc word ptr [bp-4]
1d0e:00d2  test word ptr [bp+0Ah],10h
1d0e:00d7  je short 0131h
1d0e:00d9  mov ax,[bp-2]
1d0e:00dc  mov dx,[bp-4]
1d0e:00df  jmp short 0108h
1d0e:00e1  mov ax,7D00h
1d0e:00e4  push ax
1d0e:00e5  xor ax,ax
1d0e:00e7  push ax
1d0e:00e8  push word ptr [bp-0Ah]
1d0e:00eb  push word ptr [bp-0Ch]
1d0e:00ee  call far 712Bh,0
1d0e:00f3  add sp,8
1d0e:00f6  sub word ptr [bp-8],7D00h
1d0e:00fb  sbb word ptr [bp-6],0
1d0e:00ff  mov ax,[bp-0Ah]
1d0e:0102  add ax,7D0h
1d0e:0105  mov dx,[bp-0Ch]
1d0e:0108  mov [bp-0Ah],ax
1d0e:010b  mov [bp-0Ch],dx
1d0e:010e  cmp word ptr [bp-6],0
1d0e:0112  ja short 00E1h
1d0e:0114  jne short 011Dh
1d0e:0116  cmp word ptr [bp-8],7D00h
1d0e:011b  ja short 00E1h
1d0e:011d  push word ptr [bp-8]
1d0e:0120  xor ax,ax
1d0e:0122  push ax
1d0e:0123  push word ptr [bp-0Ah]
1d0e:0126  push word ptr [bp-0Ch]
1d0e:0129  call far 712Bh,0
1d0e:012e  add sp,8
1d0e:0131  inc word ptr [629Eh]
1d0e:0135  mov dx,[bp-2]
1d0e:0138  mov ax,[bp-4]
1d0e:013b  mov sp,bp
1d0e:013d  pop bp
1d0e:013e  ret far

; Candidate 1d0e:013f, file offset 0x2041f
1d0e:013f  push bp
1d0e:0140  mov bp,sp
1d0e:0142  sub sp,6
1d0e:0145  mov ax,[bp+6]
1d0e:0148  or ax,[bp+8]
1d0e:014b  je short 018Ch
1d0e:014d  mov ax,[bp+8]
1d0e:0150  dec ax
1d0e:0151  mov dx,[bp+6]
1d0e:0154  add dx,0Fh
1d0e:0157  mov [bp-2],ax
1d0e:015a  mov [bp-4],dx
1d0e:015d  les bx,[bp-4]
1d0e:0160  mov al,es:[bx]
1d0e:0163  mov [bp-5],al
1d0e:0166  test byte ptr [bp-5],20h
1d0e:016a  je short 017Ch
1d0e:016c  push word ptr [bp-2]
1d0e:016f  mov ah,0
1d0e:0171  and ax,0Fh
1d0e:0174  mov dx,0Fh
1d0e:0177  sub dx,ax
1d0e:0179  push dx
1d0e:017a  jmp short 0184h
1d0e:017c  push word ptr [bp+8]
1d0e:017f  mov ax,[bp+6]
1d0e:0182  dec ax
1d0e:0183  push ax
1d0e:0184  call far 7FF2h,0
1d0e:0189  add sp,4
1d0e:018c  dec word ptr [629Eh]
1d0e:0190  mov sp,bp
1d0e:0192  pop bp
1d0e:0193  ret far

; Candidate 1d0e:0194, file offset 0x20474
1d0e:0194  push bp
1d0e:0195  mov bp,sp
1d0e:0197  sub sp,6
1d0e:019a  push si
1d0e:019b  mov si,[bp+0Ah]
1d0e:019e  mov ax,[bp+8]
1d0e:01a1  dec ax
1d0e:01a2  mov dx,[bp+6]
1d0e:01a5  add dx,0Fh
1d0e:01a8  mov [bp-2],ax
1d0e:01ab  mov [bp-4],dx
1d0e:01ae  les bx,[bp-4]
1d0e:01b1  mov al,es:[bx]
1d0e:01b4  and al,0Fh
1d0e:01b6  mov [bp-5],al
1d0e:01b9  mov al,es:[bx]
1d0e:01bc  and al,0F0h
1d0e:01be  mov [bp-6],al
1d0e:01c1  test byte ptr [bp-6],20h
1d0e:01c5  je short 01CCh
1d0e:01c7  mov ax,10h
1d0e:01ca  jmp short 01CFh
1d0e:01cc  mov ax,1
1d0e:01cf  add si,ax
1d0e:01d1  test byte ptr [bp-6],20h
1d0e:01d5  je short 021Dh
1d0e:01d7  push si
1d0e:01d8  push word ptr [bp-2]
1d0e:01db  mov al,[bp-5]
1d0e:01de  mov ah,0
1d0e:01e0  mov dx,0Fh
1d0e:01e3  sub dx,ax
1d0e:01e5  push dx
1d0e:01e6  call far 823Bh,0
1d0e:01eb  add sp,6
1d0e:01ee  mov [bp-2],dx
1d0e:01f1  mov [bp-4],ax
1d0e:01f4  mov al,10h
1d0e:01f6  sub al,[bp-4]
1d0e:01f9  mov [bp-5],al
1d0e:01fc  mov ah,0
1d0e:01fe  les bx,[bp-4]
1d0e:0201  add bx,ax
1d0e:0203  mov al,[bp-5]
1d0e:0206  add al,0FFh
1d0e:0208  or al,[bp-6]
1d0e:020b  mov es:[bx-1],al
1d0e:020f  mov ax,[bp-2]
1d0e:0212  inc ax
1d0e:0213  mov [bp-2],ax
1d0e:0216  mov word ptr [bp-4],0
1d0e:021b  jmp short 023Eh
1d0e:021d  push si
1d0e:021e  push word ptr [bp-2]
1d0e:0221  push word ptr [bp-4]
1d0e:0224  call far 823Bh,0
1d0e:0229  add sp,6
1d0e:022c  mov [bp-2],dx
1d0e:022f  mov [bp-4],ax
1d0e:0232  les bx,[bp-4]
1d0e:0235  mov al,[bp-6]
1d0e:0238  mov es:[bx],al
1d0e:023b  inc word ptr [bp-4]
1d0e:023e  mov dx,[bp-2]
1d0e:0241  mov ax,[bp-4]
1d0e:0244  pop si
1d0e:0245  mov sp,bp
1d0e:0247  pop bp
1d0e:0248  ret far

; Candidate 1d0e:0249, file offset 0x20529
1d0e:0249  push bp
1d0e:024a  mov bp,sp
1d0e:024c  sub sp,0Eh
1d0e:024f  call far 82B0h,0
1d0e:0254  cmp ax,0FFFFh
1d0e:0257  jne short 0286h
1d0e:0259  mov ax,9
1d0e:025c  push ax
1d0e:025d  call far 0033h,21A9h
1d0e:0262  inc sp
1d0e:0263  inc sp
1d0e:0264  push ds
1d0e:0265  mov ax,61C4h
1d0e:0268  push ax
1d0e:0269  call far 6,2246h
1d0e:026e  add sp,4
1d0e:0271  call far 05D0h,2295h
1d0e:0276  call far 0,215Fh
1d0e:027b  mov ax,5
1d0e:027e  push ax
1d0e:027f  call far 5A8Dh,0
1d0e:0284  inc sp
1d0e:0285  inc sp
1d0e:0286  call far 5BDEh,0
1d0e:028b  mov [bp-2],dx
1d0e:028e  mov [bp-4],ax
1d0e:0291  mov word ptr [bp-0Ch],0
1d0e:0296  mov word ptr [bp-0Eh],0
1d0e:029b  jmp short 02C1h
1d0e:029d  cmp word ptr [bp-6],0
1d0e:02a1  jne short 02C1h
1d0e:02a3  mov ax,[bp-8]
1d0e:02a6  mov dx,[bp-0Ah]
1d0e:02a9  cmp ax,[bp-2]
1d0e:02ac  jb short 02C1h
1d0e:02ae  ja short 02B5h
1d0e:02b0  cmp dx,[bp-4]
1d0e:02b3  jbe short 02C1h
1d0e:02b5  mov ax,[bp-8]
1d0e:02b8  mov dx,[bp-0Ah]
1d0e:02bb  mov [bp-2],ax
1d0e:02be  mov [bp-4],dx
1d0e:02c1  push ss
1d0e:02c2  lea ax,[bp-0Eh]
1d0e:02c5  push ax
1d0e:02c6  call far 84C0h,0
1d0e:02cb  add sp,4
1d0e:02ce  cmp ax,2
1d0e:02d1  je short 029Dh
1d0e:02d3  sub word ptr [bp-4],10h
1d0e:02d7  sbb word ptr [bp-2],0
1d0e:02db  cmp word ptr [bp-2],0
1d0e:02df  jl short 02F1h
1d0e:02e1  jg short 02E9h
1d0e:02e3  cmp word ptr [bp-4],0
1d0e:02e7  jbe short 02F1h
1d0e:02e9  mov dx,[bp-2]
1d0e:02ec  mov ax,[bp-4]
1d0e:02ef  jmp short 02F5h
1d0e:02f1  xor dx,dx
1d0e:02f3  xor ax,ax
1d0e:02f5  mov sp,bp
1d0e:02f7  pop bp
1d0e:02f8  ret far

; Candidate 1d3d:0009, file offset 0x205d9
1d3d:0009  push bp
1d3d:000a  mov bp,sp
1d3d:000c  sub sp,4
1d3d:000f  mov ax,[bp+6]
1d3d:0012  or ax,[bp+8]
1d3d:0015  je short 0066h
1d3d:0017  mov ax,[bp+8]
1d3d:001a  mov dx,[bp+6]
1d3d:001d  mov [bp-2],ax
1d3d:0020  mov [bp-4],dx
1d3d:0023  mov ax,[bp+0Ah]
1d3d:0026  or ax,[bp+0Ch]
1d3d:0029  je short 0072h
1d3d:002b  jmp short 003Dh
1d3d:002d  les bx,[bp+6]
1d3d:0030  mov ax,es:[bx+2]
1d3d:0034  mov dx,es:[bx]
1d3d:0037  mov [bp+8],ax
1d3d:003a  mov [bp+6],dx
1d3d:003d  les bx,[bp+6]
1d3d:0040  mov ax,es:[bx]
1d3d:0043  or ax,es:[bx+2]
1d3d:0047  jne short 002Dh
1d3d:0049  mov ax,[bp+0Ch]
1d3d:004c  mov dx,[bp+0Ah]
1d3d:004f  mov es:[bx+2],ax
1d3d:0053  mov es:[bx],dx
1d3d:0056  les bx,[bp+0Ah]
1d3d:0059  mov word ptr es:[bx+2],0
1d3d:005f  mov word ptr es:[bx],0
1d3d:0064  jmp short 0072h
1d3d:0066  mov ax,[bp+0Ch]
1d3d:0069  mov dx,[bp+0Ah]
1d3d:006c  mov [bp-2],ax
1d3d:006f  mov [bp-4],dx
1d3d:0072  mov dx,[bp-2]
1d3d:0075  mov ax,[bp-4]
1d3d:0078  mov sp,bp
1d3d:007a  pop bp
1d3d:007b  ret far

; Candidate 1d92:000a, file offset 0x20b2a
1d92:000a  push bp
1d92:000b  mov bp,sp
1d92:000d  push si
1d92:000e  push di
1d92:000f  mov si,[bp+6]
1d92:0012  mov di,[bp+0Ah]
1d92:0015  cmp word ptr [bp+0Eh],28h
1d92:0019  jle short 0020h
1d92:001b  mov word ptr [bp+0Eh],28h
1d92:0020  cmp word ptr [bp+10h],0C8h
1d92:0025  jle short 002Ch
1d92:0027  mov word ptr [bp+10h],0C8h
1d92:002c  or si,si
1d92:002e  jge short 0037h
1d92:0030  sub di,si
1d92:0032  add [bp+0Eh],si
1d92:0035  xor si,si
1d92:0037  cmp si,28h
1d92:003a  jge short 008Fh
1d92:003c  cmp di,28h
1d92:003f  jge short 008Fh
1d92:0041  or di,di
1d92:0043  jge short 004Ch
1d92:0045  sub si,di
1d92:0047  add [bp+0Eh],di
1d92:004a  xor di,di
1d92:004c  cmp word ptr [bp+8],0
1d92:0050  jge short 0060h
1d92:0052  mov ax,[bp+8]
1d92:0055  sub [bp+0Ch],ax
1d92:0058  add [bp+10h],ax
1d92:005b  mov word ptr [bp+8],0
1d92:0060  cmp word ptr [bp+0Ch],0
1d92:0064  jge short 0074h
1d92:0066  mov ax,[bp+0Ch]
1d92:0069  sub [bp+8],ax
1d92:006c  add [bp+10h],ax
1d92:006f  mov word ptr [bp+0Ch],0
1d92:0074  push word ptr [bp+14h]
1d92:0077  push word ptr [bp+12h]
1d92:007a  push word ptr [bp+10h]
1d92:007d  push word ptr [bp+0Eh]
1d92:0080  push word ptr [bp+0Ch]
1d92:0083  push di
1d92:0084  push word ptr [bp+8]
1d92:0087  push si
1d92:0088  call far dword ptr [6556h]
1d92:008c  add sp,10h
1d92:008f  pop di
1d92:0090  pop si
1d92:0091  pop bp
1d92:0092  ret far

; Candidate 1d9b:0003, file offset 0x20bb3
1d9b:0003  push bp
1d9b:0004  mov bp,sp
1d9b:0006  push si
1d9b:0007  mov si,[bp+6]
1d9b:000a  jmp short 0017h
1d9b:000c  push word ptr [0F16Ch]
1d9b:0010  call far 0019h,2404h
1d9b:0015  inc sp
1d9b:0016  inc sp
1d9b:0017  mov ax,si
1d9b:0019  dec si
1d9b:001a  or ax,ax
1d9b:001c  jne short 000Ch
1d9b:001e  pop si
1d9b:001f  pop bp
1d9b:0020  ret far

; Candidate 1d9b:0021, file offset 0x20bd1
1d9b:0021  push bp
1d9b:0022  mov bp,sp
1d9b:0024  mov ax,1
1d9b:0027  push ax
1d9b:0028  push cs
1d9b:0029  call 3
1d9b:002c  inc sp
1d9b:002d  inc sp
1d9b:002e  pop bp
1d9b:002f  ret far

; Candidate 1d9e:0000, file offset 0x20be0
1d9e:0000  push bp
1d9e:0001  mov bp,sp
1d9e:0003  push si
1d9e:0004  push di
1d9e:0005  mov si,[bp+6]
1d9e:0008  mov di,[bp+8]
1d9e:000b  push word ptr [bp+0Eh]
1d9e:000e  push di
1d9e:000f  push word ptr [bp+0Ah]
1d9e:0012  push di
1d9e:0013  push si
1d9e:0014  call far dword ptr [6566h]
1d9e:0018  add sp,0Ah
1d9e:001b  push word ptr [bp+0Eh]
1d9e:001e  push word ptr [bp+0Ch]
1d9e:0021  push word ptr [bp+0Ah]
1d9e:0024  push word ptr [bp+0Ch]
1d9e:0027  push si
1d9e:0028  call far dword ptr [6566h]
1d9e:002c  add sp,0Ah
1d9e:002f  push word ptr [bp+0Eh]
1d9e:0032  push word ptr [bp+0Ch]
1d9e:0035  push si
1d9e:0036  push di
1d9e:0037  push si
1d9e:0038  call far dword ptr [6566h]
1d9e:003c  add sp,0Ah
1d9e:003f  push word ptr [bp+0Eh]
1d9e:0042  push word ptr [bp+0Ch]
1d9e:0045  push word ptr [bp+0Ah]
1d9e:0048  push di
1d9e:0049  push word ptr [bp+0Ah]
1d9e:004c  call far dword ptr [6566h]
1d9e:0050  add sp,0Ah
1d9e:0053  pop di
1d9e:0054  pop si
1d9e:0055  pop bp
1d9e:0056  ret far

; Candidate 1da3:004a, file offset 0x20c7a
1da3:004a  push bp
1da3:004b  mov bp,sp
1da3:004d  push si
1da3:004e  mov si,[bp+10h]
1da3:0051  mov ax,[bp+8]
1da3:0054  or ax,[bp+0Ah]
1da3:0057  je short 0087h
1da3:0059  cmp si,[6298h]
1da3:005d  je short 0067h
1da3:005f  push si
1da3:0060  call far 0256h,1DA3h
1da3:0065  inc sp
1da3:0066  inc sp
1da3:0067  mov ax,[bp+0Eh]
1da3:006a  add ax,[0EFD2h]
1da3:006e  push ax
1da3:006f  mov ax,[bp+0Ch]
1da3:0072  add ax,[0EFD6h]
1da3:0076  push ax
1da3:0077  push word ptr [bp+0Ah]
1da3:007a  push word ptr [bp+8]
1da3:007d  push word ptr [bp+6]
1da3:0080  call far dword ptr [656Ah]
1da3:0084  add sp,0Ah
1da3:0087  pop si
1da3:0088  pop bp
1da3:0089  ret far

; Candidate 1da3:008a, file offset 0x20cba
1da3:008a  push bp
1da3:008b  mov bp,sp
1da3:008d  push si
1da3:008e  mov si,[bp+10h]
1da3:0091  mov ax,[bp+8]
1da3:0094  or ax,[bp+0Ah]
1da3:0097  je short 00C7h
1da3:0099  cmp si,[6298h]
1da3:009d  je short 00A7h
1da3:009f  push si
1da3:00a0  call far 0256h,1DA3h
1da3:00a5  inc sp
1da3:00a6  inc sp
1da3:00a7  mov ax,[bp+0Eh]
1da3:00aa  add ax,[0EFD2h]
1da3:00ae  push ax
1da3:00af  mov ax,[bp+0Ch]
1da3:00b2  add ax,[0EFD6h]
1da3:00b6  push ax
1da3:00b7  push word ptr [bp+0Ah]
1da3:00ba  push word ptr [bp+8]
1da3:00bd  push word ptr [bp+6]
1da3:00c0  call far dword ptr [65BEh]
1da3:00c4  add sp,0Ah
1da3:00c7  pop si
1da3:00c8  pop bp
1da3:00c9  ret far

; Candidate 1da3:00ca, file offset 0x20cfa
1da3:00ca  push bp
1da3:00cb  mov bp,sp
1da3:00cd  push si
1da3:00ce  mov si,[bp+10h]
1da3:00d1  mov ax,[bp+8]
1da3:00d4  or ax,[bp+0Ah]
1da3:00d7  je short 0107h
1da3:00d9  cmp si,[6298h]
1da3:00dd  je short 00E7h
1da3:00df  push si
1da3:00e0  call far 0256h,1DA3h
1da3:00e5  inc sp
1da3:00e6  inc sp
1da3:00e7  mov ax,[bp+0Eh]
1da3:00ea  add ax,[0EFD2h]
1da3:00ee  push ax
1da3:00ef  mov ax,[bp+0Ch]
1da3:00f2  add ax,[0EFD6h]
1da3:00f6  push ax
1da3:00f7  push word ptr [bp+0Ah]
1da3:00fa  push word ptr [bp+8]
1da3:00fd  push word ptr [bp+6]
1da3:0100  call far dword ptr [655Eh]
1da3:0104  add sp,0Ah
1da3:0107  pop si
1da3:0108  pop bp
1da3:0109  ret far

; Candidate 1da3:010a, file offset 0x20d3a
1da3:010a  push bp
1da3:010b  mov bp,sp
1da3:010d  push si
1da3:010e  mov si,[bp+10h]
1da3:0111  mov ax,[bp+8]
1da3:0114  or ax,[bp+0Ah]
1da3:0117  je short 0147h
1da3:0119  cmp si,[6298h]
1da3:011d  je short 0127h
1da3:011f  push si
1da3:0120  call far 0256h,1DA3h
1da3:0125  inc sp
1da3:0126  inc sp
1da3:0127  mov ax,[bp+0Eh]
1da3:012a  add ax,[0EFD2h]
1da3:012e  push ax
1da3:012f  mov ax,[bp+0Ch]
1da3:0132  add ax,[0EFD6h]
1da3:0136  push ax
1da3:0137  push word ptr [bp+0Ah]
1da3:013a  push word ptr [bp+8]
1da3:013d  push word ptr [bp+6]
1da3:0140  call far dword ptr [65BAh]
1da3:0144  add sp,0Ah
1da3:0147  pop si
1da3:0148  pop bp
1da3:0149  ret far

; Candidate 1da3:0256, file offset 0x20e86
1da3:0256  push bp
1da3:0257  mov bp,sp
1da3:0259  push si
1da3:025a  mov si,[bp+6]
1da3:025d  mov [6298h],si
1da3:0261  mov bx,si
1da3:0263  mov cl,4
1da3:0265  shl bx,cl
1da3:0267  mov ax,[bx+1CFCh]
1da3:026b  mov [0EFD4h],ax
1da3:026e  shl ax,1
1da3:0270  shl ax,1
1da3:0272  shl ax,1
1da3:0274  mov [0EFD6h],ax
1da3:0277  mov bx,si
1da3:0279  shl bx,cl
1da3:027b  mov ax,[0EFD4h]
1da3:027e  add ax,[bx+1D00h]
1da3:0282  mov [0EFD8h],ax
1da3:0285  mov bx,si
1da3:0287  shl bx,cl
1da3:0289  mov ax,[bx+1CFEh]
1da3:028d  mov [0EFD2h],ax
1da3:0290  mov bx,si
1da3:0292  shl bx,cl
1da3:0294  add ax,[bx+1D02h]
1da3:0298  mov [0EFD0h],ax
1da3:029b  push word ptr [0EFD0h]
1da3:029f  push word ptr [0EFD2h]
1da3:02a3  push word ptr [0EFD8h]
1da3:02a7  push word ptr [0EFD4h]
1da3:02ab  call far dword ptr [65DAh]
1da3:02af  add sp,8
1da3:02b2  pop si
1da3:02b3  pop bp
1da3:02b4  ret far

; Candidate 1dce:0107, file offset 0x20fe7
1dce:0107  push bp
1dce:0108  mov bp,sp
1dce:010a  sub sp,38h
1dce:010d  push si
1dce:010e  push di
1dce:010f  mov byte ptr [bp-38h],0
1dce:0113  push word ptr [bp+8]
1dce:0116  push word ptr [bp+6]
1dce:0119  push ss
1dce:011a  lea ax,[bp-38h]
1dce:011d  push ax
1dce:011e  call far 74C4h,0
1dce:0123  add sp,8
1dce:0126  mov ax,[bp+0Ah]
1dce:0129  cmp ax,1
1dce:012c  je short 013Bh
1dce:012e  cmp ax,2
1dce:0131  je short 0191h
1dce:0133  cmp ax,3
1dce:0136  je short 01B0h
1dce:0138  jmp 01FAh
1dce:013b  push word ptr [bp+8]
1dce:013e  push word ptr [bp+6]
1dce:0141  call far 0FC6h,1DCEh
1dce:0146  add sp,4
1dce:0149  or ax,ax
1dce:014b  jne short 0189h
1dce:014d  jmp short 016Ah
1dce:014f  push word ptr [bp+8]
1dce:0152  push word ptr [bp+6]
1dce:0155  mov ax,2
1dce:0158  push ax
1dce:0159  push cs
1dce:015a  call 0065h
1dce:015d  add sp,6
1dce:0160  or ax,ax
1dce:0162  jne short 016Ah
1dce:0164  mov ax,0FFFFh
1dce:0167  jmp 0400h
1dce:016a  push ss
1dce:016b  lea ax,[bp-38h]
1dce:016e  push ax
1dce:016f  call far 09B6h,1DCEh
1dce:0174  add sp,4
1dce:0177  or ax,ax
1dce:0179  je short 014Fh
1dce:017b  push word ptr [bp+8]
1dce:017e  push word ptr [bp+6]
1dce:0181  call far 12A1h,1DCEh
1dce:0186  add sp,4
1dce:0189  mov word ptr [bp-2],8001h
1dce:018e  jmp 022Ch
1dce:0191  mov word ptr [bp-2],8002h
1dce:0196  push ss
1dce:0197  lea ax,[bp-38h]
1dce:019a  push ax
1dce:019b  call far 0AF9h,1DCEh
1dce:01a0  add sp,4
1dce:01a3  push ss
1dce:01a4  lea ax,[bp-38h]
1dce:01a7  push ax
1dce:01a8  call far 0B6Fh,1DCEh
1dce:01ad  add sp,4
1dce:01b0  push ss
1dce:01b1  lea ax,[bp-38h]
1dce:01b4  push ax
1dce:01b5  call far 09B6h,1DCEh
1dce:01ba  add sp,4
1dce:01bd  or ax,ax
1dce:01bf  jne short 01EDh
1dce:01c1  jmp short 01DCh
1dce:01c3  push ss
1dce:01c4  lea ax,[bp-38h]
1dce:01c7  push ax
1dce:01c8  xor ax,ax
1dce:01ca  push ax
1dce:01cb  push cs
1dce:01cc  call 0065h
1dce:01cf  add sp,6
1dce:01d2  or ax,ax
1dce:01d4  jne short 01DCh
1dce:01d6  mov ax,0FFFFh
1dce:01d9  jmp 0400h
1dce:01dc  push ss
1dce:01dd  lea ax,[bp-38h]
1dce:01e0  push ax
1dce:01e1  call far 0B6Fh,1DCEh
1dce:01e6  add sp,4
1dce:01e9  or ax,ax
1dce:01eb  je short 01C3h
1dce:01ed  cmp word ptr [bp+0Ah],3
1dce:01f1  jne short 022Ch
1dce:01f3  mov word ptr [bp-2],8004h
1dce:01f8  jmp short 022Ch
1dce:01fa  push word ptr [bp+8]
1dce:01fd  push word ptr [bp+6]
1dce:0200  mov ax,1
1dce:0203  push ax
1dce:0204  push cs
1dce:0205  call 0065h
1dce:0208  add sp,6
1dce:020b  push word ptr [bp+8]
1dce:020e  push word ptr [bp+6]
1dce:0211  mov ax,0Ch
1dce:0214  push ax
1dce:0215  push cs
1dce:0216  call 00C9h
1dce:0219  add sp,6
1dce:021c  call far 0,215Fh
1dce:0221  mov ax,5
1dce:0224  push ax
1dce:0225  call far 5A8Dh,0
1dce:022a  inc sp
1dce:022b  inc sp
1dce:022c  push word ptr [bp+8]
1dce:022f  push word ptr [bp+6]
1dce:0232  call far 0FC6h,1DCEh
1dce:0237  add sp,4
1dce:023a  or ax,ax
1dce:023c  je short 0290h
1dce:023e  cmp word ptr [bp+0Ah],1
1dce:0242  je short 0290h
1dce:0244  push word ptr [bp+8]
1dce:0247  push word ptr [bp+6]
1dce:024a  call far 104Ch,1DCEh
1dce:024f  add sp,4
1dce:0252  mov [bp-4],ax
1dce:0255  mov dx,13h
1dce:0258  imul dx
1dce:025a  mov dx,27D8h
1dce:025d  mov bx,ax
1dce:025f  mov es,dx
1dce:0261  push word ptr es:[bx+0Ah]
1dce:0266  push word ptr es:[bx+8]
1dce:026b  call far 013Fh,1D0Eh
1dce:0270  add sp,4
1dce:0273  mov ax,[bp-4]
1dce:0276  mov dx,13h
1dce:0279  imul dx
1dce:027b  mov dx,27D8h
1dce:027e  mov bx,ax
1dce:0280  mov es,dx
1dce:0282  mov word ptr es:[bx+0Ah],0
1dce:0289  mov word ptr es:[bx+8],0
1dce:0290  push word ptr [bp+8]
1dce:0293  push word ptr [bp+6]
1dce:0296  call far 0FC6h,1DCEh
1dce:029b  add sp,4
1dce:029e  or ax,ax
1dce:02a0  je short 02A5h
1dce:02a2  jmp 0360h
1dce:02a5  push word ptr [bp+8]
1dce:02a8  push word ptr [bp+6]
1dce:02ab  call far 14E8h,1DCEh
1dce:02b0  add sp,4
1dce:02b3  mov [bp-6],ax
1dce:02b6  cmp ax,0FFFFh
1dce:02b9  je short 0309h
1dce:02bb  mov dx,13h
1dce:02be  imul dx
1dce:02c0  mov dx,27D8h
1dce:02c3  mov bx,ax
1dce:02c5  mov es,dx
1dce:02c7  cmp word ptr es:[bx+0Ch],0
1dce:02cd  jge short 0304h
1dce:02cf  mov ax,[bp-6]
1dce:02d2  mov dx,13h
1dce:02d5  imul dx
1dce:02d7  mov dx,27D8h
1dce:02da  mov bx,ax
1dce:02dc  mov es,dx
1dce:02de  mov ax,es:[bx+0Ch]
1dce:02e3  and ax,7FFFh
1dce:02e6  mov dx,13h
1dce:02e9  imul dx
1dce:02eb  mov dx,27D8h
1dce:02ee  mov bx,ax
1dce:02f0  mov es,dx
1dce:02f2  mov ax,es:[bx+2]
1dce:02f7  mov dx,es:[bx]
1dce:02fc  mov [bp+8],ax
1dce:02ff  mov [bp+6],dx
1dce:0302  jmp short 0309h
1dce:0304  mov word ptr [bp-6],0FFFFh
1dce:0309  mov ax,180h
1dce:030c  push ax
1dce:030d  push word ptr [bp-2]
1dce:0310  push word ptr [bp+8]
1dce:0313  push word ptr [bp+6]
1dce:0316  call far 71EAh,0
1dce:031b  add sp,8
1dce:031e  mov di,ax
1dce:0320  jmp short 0359h
1dce:0322  mov ax,180h
1dce:0325  push ax
1dce:0326  push word ptr [bp-2]
1dce:0329  push word ptr [bp+8]
1dce:032c  push word ptr [bp+6]
1dce:032f  call far 71EAh,0
1dce:0334  add sp,8
1dce:0337  mov di,ax
1dce:0339  cmp di,0FFFFh
1dce:033c  jne short 0359h
1dce:033e  push word ptr [bp+8]
1dce:0341  push word ptr [bp+6]
1dce:0344  mov ax,2
1dce:0347  push ax
1dce:0348  push cs
1dce:0349  call 0065h
1dce:034c  add sp,6
1dce:034f  or ax,ax
1dce:0351  jne short 0359h
1dce:0353  mov ax,0FFFFh
1dce:0356  jmp 0400h
1dce:0359  cmp di,0FFFFh
1dce:035c  je short 0322h
1dce:035e  jmp short 0391h
1dce:0360  push word ptr [bp+8]
1dce:0363  push word ptr [bp+6]
1dce:0366  call far 104Ch,1DCEh
1dce:036b  add sp,4
1dce:036e  mov di,ax
1dce:0370  mov dx,13h
1dce:0373  imul dx
1dce:0375  mov dx,27D8h
1dce:0378  mov bx,ax
1dce:037a  mov es,dx
1dce:037c  mov word ptr es:[bx+10h],0
1dce:0383  mov word ptr es:[bx+0Eh],0
1dce:038a  mov ax,di
1dce:038c  or ax,8000h
1dce:038f  mov di,ax
1dce:0391  mov word ptr [bp-4],0Ah
1dce:0396  xor si,si
1dce:0398  jmp short 03ACh
1dce:039a  mov bx,si
1dce:039c  shl bx,1
1dce:039e  cmp word ptr [bx-0FD4h],3FFFh
1dce:03a4  jne short 03ABh
1dce:03a6  mov [bp-4],si
1dce:03a9  jmp short 03B1h
1dce:03ab  inc si
1dce:03ac  cmp si,0Ah
1dce:03af  jl short 039Ah
1dce:03b1  cmp word ptr [bp-4],0Ah
1dce:03b5  jne short 03C8h
1dce:03b7  push word ptr [bp+8]
1dce:03ba  push word ptr [bp+6]
1dce:03bd  mov ax,3
1dce:03c0  push ax
1dce:03c1  push cs
1dce:03c2  call 00C9h
1dce:03c5  add sp,6
1dce:03c8  mov bx,[bp-4]
1dce:03cb  shl bx,1
1dce:03cd  mov [bx-0FD4h],di
1dce:03d1  mov bx,[bp-4]
1dce:03d4  shl bx,1
1dce:03d6  shl bx,1
1dce:03d8  mov ax,[0F04Ah]
1dce:03db  mov dx,[0F048h]
1dce:03df  mov [bx-0FFAh],ax
1dce:03e3  mov [bx-0FFCh],dx
1dce:03e7  mov bx,[bp-4]
1dce:03ea  shl bx,1
1dce:03ec  shl bx,1
1dce:03ee  mov ax,[0F046h]
1dce:03f1  mov dx,[0F044h]
1dce:03f5  mov [bx-1024h],ax
1dce:03f9  mov [bx-1026h],dx
1dce:03fd  mov ax,[bp-4]
1dce:0400  pop di
1dce:0401  pop si
1dce:0402  mov sp,bp
1dce:0404  pop bp
1dce:0405  ret far

; Candidate 1dce:0406, file offset 0x212e6
1dce:0406  push bp
1dce:0407  mov bp,sp
1dce:0409  push si
1dce:040a  push di
1dce:040b  mov di,[bp+6]
1dce:040e  mov bx,di
1dce:0410  shl bx,1
1dce:0412  mov si,[bx-0FD4h]
1dce:0416  cmp si,3FFFh
1dce:041a  jne short 042Dh
1dce:041c  xor ax,ax
1dce:041e  xor dx,dx
1dce:0420  push ax
1dce:0421  push dx
1dce:0422  mov ax,4
1dce:0425  push ax
1dce:0426  push cs
1dce:0427  call 00C9h
1dce:042a  add sp,6
1dce:042d  test si,8000h
1dce:0431  jne short 0440h
1dce:0433  mov ax,si
1dce:0435  and ax,3FFFh
1dce:0438  push ax
1dce:0439  call far 5A5Fh,0
1dce:043e  inc sp
1dce:043f  inc sp
1dce:0440  mov bx,di
1dce:0442  shl bx,1
1dce:0444  mov word ptr [bx-0FD4h],3FFFh
1dce:044a  pop di
1dce:044b  pop si
1dce:044c  pop bp
1dce:044d  ret far

; Candidate 1dce:044e, file offset 0x2132e
1dce:044e  push bp
1dce:044f  mov bp,sp
1dce:0451  sub sp,10h
1dce:0454  push si
1dce:0455  push di
1dce:0456  mov di,[bp+6]
1dce:0459  mov bx,di
1dce:045b  shl bx,1
1dce:045d  mov si,[bx-0FD4h]
1dce:0461  cmp si,3FFFh
1dce:0465  jne short 0478h
1dce:0467  xor ax,ax
1dce:0469  xor dx,dx
1dce:046b  push ax
1dce:046c  push dx
1dce:046d  mov ax,5
1dce:0470  push ax
1dce:0471  push cs
1dce:0472  call 00C9h
1dce:0475  add sp,6
1dce:0478  test si,8000h
1dce:047c  je short 049Bh
1dce:047e  push word ptr [bp+0Eh]
1dce:0481  push word ptr [bp+0Ch]
1dce:0484  push word ptr [bp+0Ah]
1dce:0487  push word ptr [bp+8]
1dce:048a  mov ax,si
1dce:048c  and ax,3FFFh
1dce:048f  push ax
1dce:0490  call far 10C6h,1DCEh
1dce:0495  add sp,0Ah
1dce:0498  jmp 05D8h
1dce:049b  test si,4000h
1dce:049f  je short 050Bh
1dce:04a1  mov ax,1
1dce:04a4  push ax
1dce:04a5  xor ax,ax
1dce:04a7  xor dx,dx
1dce:04a9  push ax
1dce:04aa  push dx
1dce:04ab  mov ax,si
1dce:04ad  and ax,3FFFh
1dce:04b0  push ax
1dce:04b1  call far 6F9Fh,0
1dce:04b6  add sp,8
1dce:04b9  mov [bp-0Ah],dx
1dce:04bc  mov [bp-0Ch],ax
1dce:04bf  mov bx,di
1dce:04c1  shl bx,1
1dce:04c3  shl bx,1
1dce:04c5  mov ax,[bx-0FFAh]
1dce:04c9  mov dx,[bx-0FFCh]
1dce:04cd  sub [bp-0Ch],dx
1dce:04d0  sbb [bp-0Ah],ax
1dce:04d3  mov bx,di
1dce:04d5  shl bx,1
1dce:04d7  shl bx,1
1dce:04d9  mov ax,[bx-1024h]
1dce:04dd  mov dx,[bx-1026h]
1dce:04e1  sub dx,[bp-0Ch]
1dce:04e4  sbb ax,[bp-0Ah]
1dce:04e7  mov [bp-6],ax
1dce:04ea  mov [bp-8],dx
1dce:04ed  mov ax,[bp+0Eh]
1dce:04f0  mov dx,[bp+0Ch]
1dce:04f3  cmp ax,[bp-6]
1dce:04f6  jb short 050Bh
1dce:04f8  ja short 04FFh
1dce:04fa  cmp dx,[bp-8]
1dce:04fd  jbe short 050Bh
1dce:04ff  mov ax,[bp-6]
1dce:0502  mov dx,[bp-8]
1dce:0505  mov [bp+0Eh],ax
1dce:0508  mov [bp+0Ch],dx
1dce:050b  and si,3FFFh
1dce:050f  mov word ptr [bp-2],0
1dce:0514  mov word ptr [bp-4],0
1dce:0519  jmp short 0584h
1dce:051b  push word ptr [bp+0Ah]
1dce:051e  push word ptr [bp+8]
1dce:0521  call far 0071h,2374h
1dce:0526  add sp,4
1dce:0529  mov [bp+0Ah],dx
1dce:052c  mov [bp+8],ax
1dce:052f  mov ax,7D00h
1dce:0532  push ax
1dce:0533  push word ptr [bp+0Ah]
1dce:0536  push word ptr [bp+8]
1dce:0539  push si
1dce:053a  call far 7384h,0
1dce:053f  add sp,8
1dce:0542  cwd
1dce:0543  mov [bp-0Eh],dx
1dce:0546  mov [bp-10h],ax
1dce:0549  sub word ptr [bp+0Ch],7D00h
1dce:054e  sbb word ptr [bp+0Eh],0
1dce:0552  cmp word ptr [bp-10h],0FFFFh
1dce:0556  jne short 055Eh
1dce:0558  xor dx,dx
1dce:055a  xor ax,ax
1dce:055c  jmp short 05D8h
1dce:055e  mov ax,[bp-2]
1dce:0561  mov dx,[bp-4]
1dce:0564  add dx,[bp-10h]
1dce:0567  adc ax,[bp-0Eh]
1dce:056a  mov [bp-2],ax
1dce:056d  mov [bp-4],dx
1dce:0570  mov ax,[bp+8]
1dce:0573  xor dx,dx
1dce:0575  add ax,[bp-10h]
1dce:0578  adc dx,[bp-0Eh]
1dce:057b  mov dx,[bp+0Ah]
1dce:057e  mov [bp+0Ah],dx
1dce:0581  mov [bp+8],ax
1dce:0584  cmp word ptr [bp+0Eh],0
1dce:0588  ja short 051Bh
1dce:058a  jne short 0593h
1dce:058c  cmp word ptr [bp+0Ch],7D00h
1dce:0591  ja short 051Bh
1dce:0593  push word ptr [bp+0Ah]
1dce:0596  push word ptr [bp+8]
1dce:0599  call far 0071h,2374h
1dce:059e  add sp,4
1dce:05a1  mov [bp+0Ah],dx
1dce:05a4  mov [bp+8],ax
1dce:05a7  push word ptr [bp+0Ch]
1dce:05aa  push word ptr [bp+0Ah]
1dce:05ad  push word ptr [bp+8]
1dce:05b0  push si
1dce:05b1  call far 7384h,0
1dce:05b6  add sp,8
1dce:05b9  cwd
1dce:05ba  mov [bp-0Eh],dx
1dce:05bd  mov [bp-10h],ax
1dce:05c0  cmp word ptr [bp-10h],0FFFFh
1dce:05c4  jne short 05CCh
1dce:05c6  xor dx,dx
1dce:05c8  xor ax,ax
1dce:05ca  jmp short 05D8h
1dce:05cc  mov dx,[bp-2]
1dce:05cf  mov ax,[bp-4]
1dce:05d2  add ax,[bp-10h]
1dce:05d5  adc dx,[bp-0Eh]
1dce:05d8  pop di
1dce:05d9  pop si
1dce:05da  mov sp,bp
1dce:05dc  pop bp
1dce:05dd  ret far

; Candidate 1dce:05de, file offset 0x214be
1dce:05de  push bp
1dce:05df  mov bp,sp
1dce:05e1  sub sp,0Ch
1dce:05e4  push si
1dce:05e5  push di
1dce:05e6  mov bx,[bp+6]
1dce:05e9  shl bx,1
1dce:05eb  mov si,[bx-0FD4h]
1dce:05ef  cmp si,3FFFh
1dce:05f3  jne short 0606h
1dce:05f5  xor ax,ax
1dce:05f7  xor dx,dx
1dce:05f9  push ax
1dce:05fa  push dx
1dce:05fb  mov ax,6
1dce:05fe  push ax
1dce:05ff  push cs
1dce:0600  call 00C9h
1dce:0603  add sp,6
1dce:0606  test si,8000h
1dce:060a  je short 061Dh
1dce:060c  xor ax,ax
1dce:060e  xor dx,dx
1dce:0610  push ax
1dce:0611  push dx
1dce:0612  mov ax,9
1dce:0615  push ax
1dce:0616  push cs
1dce:0617  call 00C9h
1dce:061a  add sp,6
1dce:061d  test si,4000h
1dce:0621  je short 068Fh
1dce:0623  mov ax,1
1dce:0626  push ax
1dce:0627  xor ax,ax
1dce:0629  xor dx,dx
1dce:062b  push ax
1dce:062c  push dx
1dce:062d  mov ax,si
1dce:062f  and ax,3FFFh
1dce:0632  push ax
1dce:0633  call far 6F9Fh,0
1dce:0638  add sp,8
1dce:063b  mov [bp-6],dx
1dce:063e  mov [bp-8],ax
1dce:0641  mov bx,[bp+6]
1dce:0644  shl bx,1
1dce:0646  shl bx,1
1dce:0648  mov ax,[bx-0FFAh]
1dce:064c  mov dx,[bx-0FFCh]
1dce:0650  sub [bp-8],dx
1dce:0653  sbb [bp-6],ax
1dce:0656  mov bx,[bp+6]
1dce:0659  shl bx,1
1dce:065b  shl bx,1
1dce:065d  mov ax,[bx-1024h]
1dce:0661  mov dx,[bx-1026h]
1dce:0665  sub dx,[bp-8]
1dce:0668  sbb ax,[bp-6]
1dce:066b  mov [bp-0Ah],ax
1dce:066e  mov [bp-0Ch],dx
1dce:0671  mov ax,[bp+0Eh]
1dce:0674  mov dx,[bp+0Ch]
1dce:0677  cmp ax,[bp-0Ah]
1dce:067a  jb short 068Fh
1dce:067c  ja short 0683h
1dce:067e  cmp dx,[bp-0Ch]
1dce:0681  jbe short 068Fh
1dce:0683  mov ax,[bp-0Ah]
1dce:0686  mov dx,[bp-0Ch]
1dce:0689  mov [bp+0Eh],ax
1dce:068c  mov [bp+0Ch],dx
1dce:068f  and si,3FFFh
1dce:0693  mov word ptr [bp-2],0
1dce:0698  mov word ptr [bp-4],0
1dce:069d  jmp short 06F5h
1dce:069f  push word ptr [bp+0Ah]
1dce:06a2  push word ptr [bp+8]
1dce:06a5  call far 0071h,2374h
1dce:06aa  add sp,4
1dce:06ad  mov [bp+0Ah],dx
1dce:06b0  mov [bp+8],ax
1dce:06b3  mov ax,7D00h
1dce:06b6  push ax
1dce:06b7  push word ptr [bp+0Ah]
1dce:06ba  push word ptr [bp+8]
1dce:06bd  push si
1dce:06be  call far 691Fh,0
1dce:06c3  add sp,8
1dce:06c6  mov di,ax
1dce:06c8  cmp di,7D00h
1dce:06cc  je short 06D4h
1dce:06ce  xor dx,dx
1dce:06d0  xor ax,ax
1dce:06d2  jmp short 074Ah
1dce:06d4  sub word ptr [bp+0Ch],7D00h
1dce:06d9  sbb word ptr [bp+0Eh],0
1dce:06dd  add word ptr [bp-4],7D00h
1dce:06e2  adc word ptr [bp-2],0
1dce:06e6  mov ax,[bp+8]
1dce:06e9  add ax,7D00h
1dce:06ec  mov dx,[bp+0Ah]
1dce:06ef  mov [bp+0Ah],dx
1dce:06f2  mov [bp+8],ax
1dce:06f5  cmp word ptr [bp+0Eh],0
1dce:06f9  ja short 069Fh
1dce:06fb  jne short 0704h
1dce:06fd  cmp word ptr [bp+0Ch],7D00h
1dce:0702  ja short 069Fh
1dce:0704  push word ptr [bp+0Ah]
1dce:0707  push word ptr [bp+8]
1dce:070a  call far 0071h,2374h
1dce:070f  add sp,4
1dce:0712  mov [bp+0Ah],dx
1dce:0715  mov [bp+8],ax
1dce:0718  push word ptr [bp+0Ch]
1dce:071b  push word ptr [bp+0Ah]
1dce:071e  push word ptr [bp+8]
1dce:0721  push si
1dce:0722  call far 691Fh,0
1dce:0727  add sp,8
1dce:072a  mov di,ax
1dce:072c  xor ax,ax
1dce:072e  cmp ax,[bp+0Eh]
1dce:0731  jne short 0738h
1dce:0733  cmp di,[bp+0Ch]
1dce:0736  je short 073Eh
1dce:0738  xor dx,dx
1dce:073a  xor ax,ax
1dce:073c  jmp short 074Ah
1dce:073e  mov dx,[bp-2]
1dce:0741  mov ax,[bp-4]
1dce:0744  add ax,[bp+0Ch]
1dce:0747  adc dx,[bp+0Eh]
1dce:074a  pop di
1dce:074b  pop si
1dce:074c  mov sp,bp
1dce:074e  pop bp
1dce:074f  ret far

; Candidate 1dce:0750, file offset 0x21630
1dce:0750  push bp
1dce:0751  mov bp,sp
1dce:0753  sub sp,8
1dce:0756  push si
1dce:0757  push di
1dce:0758  mov bx,[bp+6]
1dce:075b  shl bx,1
1dce:075d  mov si,[bx-0FD4h]
1dce:0761  cmp si,3FFFh
1dce:0765  jne short 0778h
1dce:0767  xor ax,ax
1dce:0769  xor dx,dx
1dce:076b  push ax
1dce:076c  push dx
1dce:076d  mov ax,7
1dce:0770  push ax
1dce:0771  push cs
1dce:0772  call 00C9h
1dce:0775  add sp,6
1dce:0778  test si,8000h
1dce:077c  jne short 0781h
1dce:077e  jmp 08DCh
1dce:0781  mov ax,si
1dce:0783  and ax,3FFFh
1dce:0786  mov di,ax
1dce:0788  mov dx,13h
1dce:078b  imul dx
1dce:078d  mov dx,27D8h
1dce:0790  mov bx,ax
1dce:0792  mov es,dx
1dce:0794  mov ax,es:[bx+10h]
1dce:0799  mov dx,es:[bx+0Eh]
1dce:079e  mov [bp-2],ax
1dce:07a1  mov [bp-4],dx
1dce:07a4  mov ax,[bp+0Ch]
1dce:07a7  or ax,ax
1dce:07a9  je short 07B8h
1dce:07ab  cmp ax,1
1dce:07ae  je short 082Ah
1dce:07b0  cmp ax,2
1dce:07b3  je short 080Ch
1dce:07b5  jmp 08A4h
1dce:07b8  mov ax,di
1dce:07ba  mov dx,13h
1dce:07bd  imul dx
1dce:07bf  mov dx,27D8h
1dce:07c2  mov bx,ax
1dce:07c4  mov es,dx
1dce:07c6  mov ax,es:[bx+6]
1dce:07cb  mov dx,es:[bx+4]
1dce:07d0  cmp ax,[bp+0Ah]
1dce:07d3  jg short 07FDh
1dce:07d5  jl short 07DCh
1dce:07d7  cmp dx,[bp+8]
1dce:07da  jae short 07FDh
1dce:07dc  mov ax,di
1dce:07de  mov dx,13h
1dce:07e1  imul dx
1dce:07e3  mov dx,27D8h
1dce:07e6  mov bx,ax
1dce:07e8  mov es,dx
1dce:07ea  mov ax,es:[bx+6]
1dce:07ef  mov dx,es:[bx+4]
1dce:07f4  mov [bp-2],ax
1dce:07f7  mov [bp-4],dx
1dce:07fa  jmp 08B5h
1dce:07fd  mov ax,[bp+0Ah]
1dce:0800  mov dx,[bp+8]
1dce:0803  mov [bp-2],ax
1dce:0806  mov [bp-4],dx
1dce:0809  jmp 08B5h
1dce:080c  mov ax,di
1dce:080e  mov dx,13h
1dce:0811  imul dx
1dce:0813  mov dx,27D8h
1dce:0816  mov bx,ax
1dce:0818  mov es,dx
1dce:081a  mov ax,es:[bx+6]
1dce:081f  mov dx,es:[bx+4]
1dce:0824  mov [bp-2],ax
1dce:0827  mov [bp-4],dx
1dce:082a  mov ax,di
1dce:082c  mov dx,13h
1dce:082f  imul dx
1dce:0831  mov dx,27D8h
1dce:0834  mov bx,[bp-2]
1dce:0837  mov cx,[bp-4]
1dce:083a  add cx,[bp+8]
1dce:083d  adc bx,[bp+0Ah]
1dce:0840  mov es,dx
1dce:0842  xchg ax,bx
1dce:0844  cmp es:[bx+6],ax
1dce:0849  jg short 0874h
1dce:084b  jl short 0854h
1dce:084d  cmp es:[bx+4],cx
1dce:0852  jae short 0874h
1dce:0854  mov ax,di
1dce:0856  mov dx,13h
1dce:0859  imul dx
1dce:085b  mov dx,27D8h
1dce:085e  mov bx,ax
1dce:0860  mov es,dx
1dce:0862  mov ax,es:[bx+6]
1dce:0867  mov dx,es:[bx+4]
1dce:086c  mov [bp-2],ax
1dce:086f  mov [bp-4],dx
1dce:0872  jmp short 08B5h
1dce:0874  mov ax,[bp-2]
1dce:0877  mov dx,[bp-4]
1dce:087a  add dx,[bp+8]
1dce:087d  adc ax,[bp+0Ah]
1dce:0880  or ax,ax
1dce:0882  jg short 0896h
1dce:0884  jl short 088Ah
1dce:0886  or dx,dx
1dce:0888  jae short 0896h
1dce:088a  mov word ptr [bp-2],0
1dce:088f  mov word ptr [bp-4],0
1dce:0894  jmp short 08B5h
1dce:0896  mov ax,[bp+0Ah]
1dce:0899  mov dx,[bp+8]
1dce:089c  add [bp-4],dx
1dce:089f  adc [bp-2],ax
1dce:08a2  jmp short 08B5h
1dce:08a4  xor ax,ax
1dce:08a6  xor dx,dx
1dce:08a8  push ax
1dce:08a9  push dx
1dce:08aa  mov ax,8
1dce:08ad  push ax
1dce:08ae  push cs
1dce:08af  call 00C9h
1dce:08b2  add sp,6
1dce:08b5  mov ax,di
1dce:08b7  mov dx,13h
1dce:08ba  imul dx
1dce:08bc  mov dx,27D8h
1dce:08bf  mov bx,[bp-2]
1dce:08c2  mov cx,[bp-4]
1dce:08c5  mov es,dx
1dce:08c7  xchg ax,bx
1dce:08c9  mov es:[bx+10h],ax
1dce:08ce  mov es:[bx+0Eh],cx
1dce:08d3  mov dx,[bp-2]
1dce:08d6  mov ax,[bp-4]
1dce:08d9  jmp 09B0h
1dce:08dc  mov ax,[bp+0Ch]
1dce:08df  or ax,ax
1dce:08e1  je short 08F0h
1dce:08e3  cmp ax,1
1dce:08e6  je short 092Bh
1dce:08e8  cmp ax,2
1dce:08eb  je short 094Ah
1dce:08ed  jmp 0999h
1dce:08f0  test si,4000h
1dce:08f4  je short 090Bh
1dce:08f6  mov bx,[bp+6]
1dce:08f9  shl bx,1
1dce:08fb  shl bx,1
1dce:08fd  mov ax,[bx-0FFAh]
1dce:0901  mov dx,[bx-0FFCh]
1dce:0905  add [bp+8],dx
1dce:0908  adc [bp+0Ah],ax
1dce:090b  push word ptr [bp+0Ch]
1dce:090e  push word ptr [bp+0Ah]
1dce:0911  push word ptr [bp+8]
1dce:0914  mov ax,si
1dce:0916  and ax,3FFFh
1dce:0919  push ax
1dce:091a  call far 6F9Fh,0
1dce:091f  add sp,8
1dce:0922  mov [bp-6],dx
1dce:0925  mov [bp-8],ax
1dce:0928  jmp 09AAh
1dce:092b  push word ptr [bp+0Ch]
1dce:092e  push word ptr [bp+0Ah]
1dce:0931  push word ptr [bp+8]
1dce:0934  mov ax,si
1dce:0936  and ax,3FFFh
1dce:0939  push ax
1dce:093a  call far 6F9Fh,0
1dce:093f  add sp,8
1dce:0942  mov [bp-6],dx
1dce:0945  mov [bp-8],ax
1dce:0948  jmp short 09AAh
1dce:094a  test si,4000h
1dce:094e  je short 097Ah
1dce:0950  mov bx,[bp+6]
1dce:0953  shl bx,1
1dce:0955  shl bx,1
1dce:0957  mov ax,[bx-0FFAh]
1dce:095b  mov dx,[bx-0FFCh]
1dce:095f  sub [bp+8],dx
1dce:0962  sbb [bp+0Ah],ax
1dce:0965  mov bx,[bp+6]
1dce:0968  shl bx,1
1dce:096a  shl bx,1
1dce:096c  mov ax,[bx-1024h]
1dce:0970  mov dx,[bx-1026h]
1dce:0974  add [bp+8],dx
1dce:0977  adc [bp+0Ah],ax
1dce:097a  push word ptr [bp+0Ch]
1dce:097d  push word ptr [bp+0Ah]
1dce:0980  push word ptr [bp+8]
1dce:0983  mov ax,si
1dce:0985  and ax,3FFFh
1dce:0988  push ax
1dce:0989  call far 6F9Fh,0
1dce:098e  add sp,8
1dce:0991  mov [bp-6],dx
1dce:0994  mov [bp-8],ax
1dce:0997  jmp short 09AAh
1dce:0999  xor ax,ax
1dce:099b  xor dx,dx
1dce:099d  push ax
1dce:099e  push dx
1dce:099f  mov ax,8
1dce:09a2  push ax
1dce:09a3  push cs
1dce:09a4  call 00C9h
1dce:09a7  add sp,6
1dce:09aa  mov dx,[bp-6]
1dce:09ad  mov ax,[bp-8]
1dce:09b0  pop di
1dce:09b1  pop si
1dce:09b2  mov sp,bp
1dce:09b4  pop bp
1dce:09b5  ret far

; Candidate 1dce:09b6, file offset 0x21896
1dce:09b6  push bp
1dce:09b7  mov bp,sp
1dce:09b9  push si
1dce:09ba  push di
1dce:09bb  mov si,0FFFFh
1dce:09be  push word ptr [bp+8]
1dce:09c1  push word ptr [bp+6]
1dce:09c4  call far 767Bh,0
1dce:09c9  add sp,4
1dce:09cc  mov [bp+8],dx
1dce:09cf  mov [bp+6],ax
1dce:09d2  push word ptr [bp+8]
1dce:09d5  push word ptr [bp+6]
1dce:09d8  call far 14E8h,1DCEh
1dce:09dd  add sp,4
1dce:09e0  mov si,ax
1dce:09e2  cmp si,0FFFFh
1dce:09e5  je short 0A2Dh
1dce:09e7  mov dx,13h
1dce:09ea  imul dx
1dce:09ec  mov dx,27D8h
1dce:09ef  mov bx,ax
1dce:09f1  mov es,dx
1dce:09f3  cmp word ptr es:[bx+0Ch],0
1dce:09f9  jge short 0A2Dh
1dce:09fb  mov ax,si
1dce:09fd  mov dx,13h
1dce:0a00  imul dx
1dce:0a02  mov dx,27D8h
1dce:0a05  mov bx,ax
1dce:0a07  mov es,dx
1dce:0a09  mov ax,es:[bx+0Ch]
1dce:0a0e  and ax,7FFFh
1dce:0a11  mov dx,13h
1dce:0a14  imul dx
1dce:0a16  mov dx,27D8h
1dce:0a19  mov bx,ax
1dce:0a1b  mov es,dx
1dce:0a1d  mov ax,es:[bx+2]
1dce:0a22  mov dx,es:[bx]
1dce:0a27  mov [bp+8],ax
1dce:0a2a  mov [bp+6],dx
1dce:0a2d  push word ptr [bp+8]
1dce:0a30  push word ptr [bp+6]
1dce:0a33  call far 11CFh,1DCEh
1dce:0a38  add sp,4
1dce:0a3b  or ax,ax
1dce:0a3d  jne short 0A44h
1dce:0a3f  xor ax,ax
1dce:0a41  jmp 0AF5h
1dce:0a44  mov ax,8001h
1dce:0a47  push ax
1dce:0a48  push word ptr [bp+8]
1dce:0a4b  push word ptr [bp+6]
1dce:0a4e  call far 71EAh,0
1dce:0a53  add sp,6
1dce:0a56  mov di,ax
1dce:0a58  cmp di,0FFFFh
1dce:0a5b  jne short 0A6Eh
1dce:0a5d  push word ptr [bp+8]
1dce:0a60  push word ptr [bp+6]
1dce:0a63  mov ax,0Fh
1dce:0a66  push ax
1dce:0a67  push cs
1dce:0a68  call 00C9h
1dce:0a6b  add sp,6
1dce:0a6e  cmp si,0FFFFh
1dce:0a71  jne short 0A75h
1dce:0a73  jmp short 0AEAh
1dce:0a75  mov ax,si
1dce:0a77  mov dx,13h
1dce:0a7a  imul dx
1dce:0a7c  mov dx,27D8h
1dce:0a7f  mov bx,ax
1dce:0a81  mov es,dx
1dce:0a83  cmp word ptr es:[bx+0Ch],0
1dce:0a89  jle short 0AEAh
1dce:0a8b  push di
1dce:0a8c  call far 6CC7h,0
1dce:0a91  inc sp
1dce:0a92  inc sp
1dce:0a93  push ax
1dce:0a94  mov ax,si
1dce:0a96  mov bx,13h
1dce:0a99  push dx
1dce:0a9a  imul bx
1dce:0a9c  mov dx,27D8h
1dce:0a9f  mov bx,ax
1dce:0aa1  mov es,dx
1dce:0aa3  pop ax
1dce:0aa4  cmp ax,es:[bx+6]
1dce:0aa9  pop ax
1dce:0aaa  jne short 0AB3h
1dce:0aac  cmp ax,es:[bx+4]
1dce:0ab1  je short 0AEAh
1dce:0ab3  mov ax,si
1dce:0ab5  mov dx,13h
1dce:0ab8  imul dx
1dce:0aba  mov dx,27D8h
1dce:0abd  mov bx,ax
1dce:0abf  mov es,dx
1dce:0ac1  mov ax,es:[bx+4]
1dce:0ac6  or ax,es:[bx+6]
1dce:0acb  je short 0AEAh
1dce:0acd  push di
1dce:0ace  call far 5A5Fh,0
1dce:0ad3  inc sp
1dce:0ad4  inc sp
1dce:0ad5  push word ptr [bp+8]
1dce:0ad8  push word ptr [bp+6]
1dce:0adb  mov ax,0Eh
1dce:0ade  push ax
1dce:0adf  push cs
1dce:0ae0  call 00C9h
1dce:0ae3  add sp,6
1dce:0ae6  xor ax,ax
1dce:0ae8  jmp short 0AF5h
1dce:0aea  push di
1dce:0aeb  call far 5A5Fh,0
1dce:0af0  inc sp
1dce:0af1  inc sp
1dce:0af2  mov ax,1
1dce:0af5  pop di
1dce:0af6  pop si
1dce:0af7  pop bp
1dce:0af8  ret far

; Candidate 1dce:0af9, file offset 0x219d9
1dce:0af9  push bp
1dce:0afa  mov bp,sp
1dce:0afc  push si
1dce:0afd  push word ptr [bp+8]
1dce:0b00  push word ptr [bp+6]
1dce:0b03  call far 0FC6h,1DCEh
1dce:0b08  add sp,4
1dce:0b0b  or ax,ax
1dce:0b0d  je short 0B59h
1dce:0b0f  push word ptr [bp+8]
1dce:0b12  push word ptr [bp+6]
1dce:0b15  call far 104Ch,1DCEh
1dce:0b1a  add sp,4
1dce:0b1d  mov si,ax
1dce:0b1f  mov dx,13h
1dce:0b22  imul dx
1dce:0b24  mov dx,27D8h
1dce:0b27  mov bx,ax
1dce:0b29  mov es,dx
1dce:0b2b  push word ptr es:[bx+0Ah]
1dce:0b30  push word ptr es:[bx+8]
1dce:0b35  call far 013Fh,1D0Eh
1dce:0b3a  add sp,4
1dce:0b3d  mov ax,si
1dce:0b3f  mov dx,13h
1dce:0b42  imul dx
1dce:0b44  mov dx,27D8h
1dce:0b47  mov bx,ax
1dce:0b49  mov es,dx
1dce:0b4b  mov word ptr es:[bx+0Ah],0
1dce:0b52  mov word ptr es:[bx+8],0
1dce:0b59  push word ptr [bp+8]
1dce:0b5c  push word ptr [bp+6]
1dce:0b5f  call far 796Ah,0
1dce:0b64  add sp,4
1dce:0b67  neg ax
1dce:0b69  sbb ax,ax
1dce:0b6b  inc ax
1dce:0b6c  pop si
1dce:0b6d  pop bp
1dce:0b6e  ret far

; Candidate 1dce:0b6f, file offset 0x21a4f
1dce:0b6f  push bp
1dce:0b70  mov bp,sp
1dce:0b72  push si
1dce:0b73  push word ptr [bp+8]
1dce:0b76  push word ptr [bp+6]
1dce:0b79  push cs
1dce:0b7a  call 0AF9h
1dce:0b7d  add sp,4
1dce:0b80  mov ax,180h
1dce:0b83  push ax
1dce:0b84  mov ax,8102h
1dce:0b87  push ax
1dce:0b88  push word ptr [bp+8]
1dce:0b8b  push word ptr [bp+6]
1dce:0b8e  call far 71EAh,0
1dce:0b93  add sp,8
1dce:0b96  mov si,ax
1dce:0b98  cmp si,0FFFFh
1dce:0b9b  jne short 0BA1h
1dce:0b9d  xor ax,ax
1dce:0b9f  jmp short 0BACh
1dce:0ba1  push si
1dce:0ba2  call far 5A5Fh,0
1dce:0ba7  inc sp
1dce:0ba8  inc sp
1dce:0ba9  mov ax,1
1dce:0bac  pop si
1dce:0bad  pop bp
1dce:0bae  ret far

; Candidate 1dce:0c71, file offset 0x21b51
1dce:0c71  push bp
1dce:0c72  mov bp,sp
1dce:0c74  dec sp
1dce:0c75  dec sp
1dce:0c76  push si
1dce:0c77  push di
1dce:0c78  xor si,si
1dce:0c7a  mov al,[bp+8]
1dce:0c7d  push ax
1dce:0c7e  push word ptr [bp+6]
1dce:0c81  push cs
1dce:0c82  call 0BAFh
1dce:0c85  add sp,4
1dce:0c88  mov di,ax
1dce:0c8a  cmp di,0FFFFh
1dce:0c8d  jne short 0C91h
1dce:0c8f  jmp short 0D03h
1dce:0c91  mov byte ptr [bp-1],0
1dce:0c95  xor si,si
1dce:0c97  jmp short 0CB0h
1dce:0c99  mov bx,si
1dce:0c9b  shl bx,1
1dce:0c9d  mov ax,[bx-0FD4h]
1dce:0ca1  and ax,3FFFh
1dce:0ca4  cmp ax,si
1dce:0ca6  jne short 0CAFh
1dce:0ca8  mov byte ptr [bp-1],1
1dce:0cac  mov si,0Ah
1dce:0caf  inc si
1dce:0cb0  cmp si,0Ah
1dce:0cb3  jl short 0C99h
1dce:0cb5  mov al,[bp-1]
1dce:0cb8  cbw
1dce:0cb9  or ax,ax
1dce:0cbb  jne short 0D03h
1dce:0cbd  cmp si,0Ah
1dce:0cc0  jne short 0D03h
1dce:0cc2  mov ax,di
1dce:0cc4  mov dx,13h
1dce:0cc7  imul dx
1dce:0cc9  mov dx,27D8h
1dce:0ccc  mov bx,ax
1dce:0cce  mov es,dx
1dce:0cd0  push word ptr es:[bx+0Ah]
1dce:0cd5  push word ptr es:[bx+8]
1dce:0cda  call far 013Fh,1D0Eh
1dce:0cdf  add sp,4
1dce:0ce2  mov ax,di
1dce:0ce4  mov dx,13h
1dce:0ce7  imul dx
1dce:0ce9  mov dx,27D8h
1dce:0cec  mov bx,ax
1dce:0cee  mov es,dx
1dce:0cf0  mov word ptr es:[bx+0Ah],0
1dce:0cf7  mov word ptr es:[bx+8],0
1dce:0cfe  mov ax,1
1dce:0d01  jmp short 0D05h
1dce:0d03  xor ax,ax
1dce:0d05  pop di
1dce:0d06  pop si
1dce:0d07  mov sp,bp
1dce:0d09  pop bp
1dce:0d0a  ret far

; Candidate 1dce:0fc6, file offset 0x21ea6
1dce:0fc6  push bp
1dce:0fc7  mov bp,sp
1dce:0fc9  push si
1dce:0fca  xor si,si
1dce:0fcc  push word ptr [bp+8]
1dce:0fcf  push word ptr [bp+6]
1dce:0fd2  call far 767Bh,0
1dce:0fd7  add sp,4
1dce:0fda  mov [bp+8],dx
1dce:0fdd  mov [bp+6],ax
1dce:0fe0  jmp short 102Eh
1dce:0fe2  push word ptr [bp+8]
1dce:0fe5  push word ptr [bp+6]
1dce:0fe8  mov ax,si
1dce:0fea  mov dx,13h
1dce:0fed  imul dx
1dce:0fef  mov dx,27D8h
1dce:0ff2  mov bx,ax
1dce:0ff4  mov es,dx
1dce:0ff6  push word ptr es:[bx+2]
1dce:0ffb  push word ptr es:[bx]
1dce:1000  call far 7540h,0
1dce:1005  add sp,8
1dce:1008  or ax,ax
1dce:100a  jne short 102Dh
1dce:100c  mov ax,si
1dce:100e  mov dx,13h
1dce:1011  imul dx
1dce:1013  mov dx,27D8h
1dce:1016  mov bx,ax
1dce:1018  mov es,dx
1dce:101a  mov ax,es:[bx+8]
1dce:101f  or ax,es:[bx+0Ah]
1dce:1024  je short 102Bh
1dce:1026  mov ax,1
1dce:1029  jmp short 1049h
1dce:102b  jmp short 1047h
1dce:102d  inc si
1dce:102e  mov ax,si
1dce:1030  mov dx,13h
1dce:1033  imul dx
1dce:1035  mov dx,27D8h
1dce:1038  mov bx,ax
1dce:103a  mov es,dx
1dce:103c  les bx,es:[bx]
1dce:1041  cmp byte ptr es:[bx],0
1dce:1045  jne short 0FE2h
1dce:1047  xor ax,ax
1dce:1049  pop si
1dce:104a  pop bp
1dce:104b  ret far

; Candidate 1dce:104c, file offset 0x21f2c
1dce:104c  push bp
1dce:104d  mov bp,sp
1dce:104f  push si
1dce:1050  xor si,si
1dce:1052  push word ptr [bp+8]
1dce:1055  push word ptr [bp+6]
1dce:1058  call far 767Bh,0
1dce:105d  add sp,4
1dce:1060  mov [bp+8],dx
1dce:1063  mov [bp+6],ax
1dce:1066  jmp short 1097h
1dce:1068  push word ptr [bp+8]
1dce:106b  push word ptr [bp+6]
1dce:106e  mov ax,si
1dce:1070  mov dx,13h
1dce:1073  imul dx
1dce:1075  mov dx,27D8h
1dce:1078  mov bx,ax
1dce:107a  mov es,dx
1dce:107c  push word ptr es:[bx+2]
1dce:1081  push word ptr es:[bx]
1dce:1086  call far 7540h,0
1dce:108b  add sp,8
1dce:108e  or ax,ax
1dce:1090  jne short 1096h
1dce:1092  mov ax,si
1dce:1094  jmp short 10C3h
1dce:1096  inc si
1dce:1097  mov ax,si
1dce:1099  mov dx,13h
1dce:109c  imul dx
1dce:109e  mov dx,27D8h
1dce:10a1  mov bx,ax
1dce:10a3  mov es,dx
1dce:10a5  les bx,es:[bx]
1dce:10aa  cmp byte ptr es:[bx],0
1dce:10ae  jne short 1068h
1dce:10b0  push word ptr [bp+8]
1dce:10b3  push word ptr [bp+6]
1dce:10b6  mov ax,0Ah
1dce:10b9  push ax
1dce:10ba  push cs
1dce:10bb  call 0065h
1dce:10be  add sp,6
1dce:10c1  xor ax,ax
1dce:10c3  pop si
1dce:10c4  pop bp
1dce:10c5  ret far

; Candidate 1dce:10c6, file offset 0x21fa6
1dce:10c6  push bp
1dce:10c7  mov bp,sp
1dce:10c9  sub sp,4
1dce:10cc  push si
1dce:10cd  push di
1dce:10ce  mov si,[bp+6]
1dce:10d1  mov ax,si
1dce:10d3  mov dx,13h
1dce:10d6  imul dx
1dce:10d8  mov dx,27D8h
1dce:10db  mov bx,ax
1dce:10dd  mov es,dx
1dce:10df  mov ax,es:[bx+10h]
1dce:10e4  mov dx,es:[bx+0Eh]
1dce:10e9  add dx,[bp+0Ch]
1dce:10ec  adc ax,[bp+0Eh]
1dce:10ef  push dx
1dce:10f0  push ax
1dce:10f1  mov ax,si
1dce:10f3  mov dx,13h
1dce:10f6  imul dx
1dce:10f8  mov dx,27D8h
1dce:10fb  mov bx,ax
1dce:10fd  mov es,dx
1dce:10ff  pop ax
1dce:1100  cmp ax,es:[bx+6]
1dce:1105  pop ax
1dce:1106  jl short 114Bh
1dce:1108  jg short 1111h
1dce:110a  cmp ax,es:[bx+4]
1dce:110f  jbe short 114Bh
1dce:1111  mov ax,si
1dce:1113  mov dx,13h
1dce:1116  imul dx
1dce:1118  mov dx,27D8h
1dce:111b  mov bx,ax
1dce:111d  mov es,dx
1dce:111f  mov ax,es:[bx+6]
1dce:1124  mov dx,es:[bx+4]
1dce:1129  push ax
1dce:112a  mov ax,si
1dce:112c  mov bx,13h
1dce:112f  push dx
1dce:1130  imul bx
1dce:1132  mov dx,27D8h
1dce:1135  mov bx,ax
1dce:1137  mov es,dx
1dce:1139  pop ax
1dce:113a  sub ax,es:[bx+0Eh]
1dce:113f  pop dx
1dce:1140  sbb dx,es:[bx+10h]
1dce:1145  mov [bp+0Eh],dx
1dce:1148  mov [bp+0Ch],ax
1dce:114b  mov ax,si
1dce:114d  mov dx,13h
1dce:1150  imul dx
1dce:1152  mov dx,27D8h
1dce:1155  mov bx,ax
1dce:1157  mov es,dx
1dce:1159  mov ax,es:[bx+8]
1dce:115e  push bx
1dce:115f  push es
1dce:1160  push ax
1dce:1161  mov ax,si
1dce:1163  mov dx,13h
1dce:1166  imul dx
1dce:1168  mov dx,27D8h
1dce:116b  mov bx,ax
1dce:116d  mov es,dx
1dce:116f  pop ax
1dce:1170  add ax,es:[bx+0Eh]
1dce:1175  pop es
1dce:1176  pop bx
1dce:1177  push word ptr es:[bx+0Ah]
1dce:117c  push ax
1dce:117d  call far 0071h,2374h
1dce:1182  add sp,4
1dce:1185  mov [bp-2],dx
1dce:1188  mov [bp-4],ax
1dce:118b  push word ptr [bp+0Eh]
1dce:118e  push word ptr [bp+0Ch]
1dce:1191  push word ptr [bp+0Ah]
1dce:1194  push word ptr [bp+8]
1dce:1197  push word ptr [bp-2]
1dce:119a  push word ptr [bp-4]
1dce:119d  call far 4,2374h
1dce:11a2  add sp,0Ch
1dce:11a5  mov ax,si
1dce:11a7  mov dx,13h
1dce:11aa  imul dx
1dce:11ac  mov dx,27D8h
1dce:11af  mov bx,[bp+0Eh]
1dce:11b2  mov cx,[bp+0Ch]
1dce:11b5  mov di,ax
1dce:11b7  mov es,dx
1dce:11b9  add es:[di+0Eh],cx
1dce:11be  adc es:[di+10h],bx
1dce:11c3  mov dx,[bp+0Eh]
1dce:11c6  mov ax,[bp+0Ch]
1dce:11c9  pop di
1dce:11ca  pop si
1dce:11cb  mov sp,bp
1dce:11cd  pop bp
1dce:11ce  ret far

; Candidate 1dce:11cf, file offset 0x220af
1dce:11cf  push bp
1dce:11d0  mov bp,sp
1dce:11d2  dec sp
1dce:11d3  dec sp
1dce:11d4  push si
1dce:11d5  push di
1dce:11d6  call far 6B35h,0
1dce:11db  mov [bp-2],ax
1dce:11de  push word ptr [bp+8]
1dce:11e1  push word ptr [bp+6]
1dce:11e4  call far 767Bh,0
1dce:11e9  add sp,4
1dce:11ec  mov [bp+8],dx
1dce:11ef  mov [bp+6],ax
1dce:11f2  mov ax,8001h
1dce:11f5  push ax
1dce:11f6  push word ptr [bp+8]
1dce:11f9  push word ptr [bp+6]
1dce:11fc  call far 71EAh,0
1dce:1201  add sp,6
1dce:1204  mov di,ax
1dce:1206  cmp di,0FFFFh
1dce:1209  je short 1219h
1dce:120b  push di
1dce:120c  call far 5A5Fh,0
1dce:1211  inc sp
1dce:1212  inc sp
1dce:1213  mov ax,[bp-2]
1dce:1216  inc ax
1dce:1217  jmp short 1276h
1dce:1219  cmp byte ptr [61F4h],0
1dce:121e  jne short 1222h
1dce:1220  jmp short 1274h
1dce:1222  mov al,[0F042h]
1dce:1225  cbw
1dce:1226  mov si,ax
1dce:1228  jmp short 1265h
1dce:122a  push si
1dce:122b  call far 0037h,2263h
1dce:1230  inc sp
1dce:1231  inc sp
1dce:1232  or ax,ax
1dce:1234  je short 1264h
1dce:1236  push si
1dce:1237  call far 6B3Bh,0
1dce:123c  inc sp
1dce:123d  inc sp
1dce:123e  mov ax,8001h
1dce:1241  push ax
1dce:1242  push word ptr [bp+8]
1dce:1245  push word ptr [bp+6]
1dce:1248  call far 71EAh,0
1dce:124d  add sp,6
1dce:1250  mov di,ax
1dce:1252  cmp di,0FFFFh
1dce:1255  je short 1264h
1dce:1257  push di
1dce:1258  call far 5A5Fh,0
1dce:125d  inc sp
1dce:125e  inc sp
1dce:125f  mov ax,si
1dce:1261  inc ax
1dce:1262  jmp short 1276h
1dce:1264  dec si
1dce:1265  cmp si,0FFFFh
1dce:1268  jne short 122Ah
1dce:126a  push word ptr [bp-2]
1dce:126d  call far 6B3Bh,0
1dce:1272  inc sp
1dce:1273  inc sp
1dce:1274  xor ax,ax
1dce:1276  pop di
1dce:1277  pop si
1dce:1278  mov sp,bp
1dce:127a  pop bp
1dce:127b  ret far

; Candidate 1dce:127c, file offset 0x2215c
1dce:127c  push bp
1dce:127d  mov bp,sp
1dce:127f  call far 6B35h,0
1dce:1284  mov [0F040h],ax
1dce:1287  push cs
1dce:1288  call 0DADh
1dce:128b  pop bp
1dce:128c  ret far

; Candidate 1dce:128d, file offset 0x2216d
1dce:128d  push bp
1dce:128e  mov bp,sp
1dce:1290  push cs
1dce:1291  call 0D0Bh
1dce:1294  push word ptr [0F040h]
1dce:1298  call far 6B3Bh,0
1dce:129d  inc sp
1dce:129e  inc sp
1dce:129f  pop bp
1dce:12a0  ret far

; Candidate 1dce:12a1, file offset 0x22181
1dce:12a1  push bp
1dce:12a2  mov bp,sp
1dce:12a4  push si
1dce:12a5  push word ptr [bp+8]
1dce:12a8  push word ptr [bp+6]
1dce:12ab  call far 14E8h,1DCEh
1dce:12b0  add sp,4
1dce:12b3  mov si,ax
1dce:12b5  cmp si,0FFFFh
1dce:12b8  jne short 12BCh
1dce:12ba  jmp short 12DFh
1dce:12bc  mov ax,si
1dce:12be  mov dx,13h
1dce:12c1  imul dx
1dce:12c3  mov dx,27D8h
1dce:12c6  mov bx,ax
1dce:12c8  mov es,dx
1dce:12ca  test byte ptr es:[bx+12h],40h
1dce:12d0  je short 12DFh
1dce:12d2  push si
1dce:12d3  call far 12E4h,1DCEh
1dce:12d8  inc sp
1dce:12d9  inc sp
1dce:12da  mov ax,1
1dce:12dd  jmp short 12E1h
1dce:12df  xor ax,ax
1dce:12e1  pop si
1dce:12e2  pop bp
1dce:12e3  ret far

; Candidate 1dce:12e4, file offset 0x221c4
1dce:12e4  push bp
1dce:12e5  mov bp,sp
1dce:12e7  sub sp,0Ch
1dce:12ea  push si
1dce:12eb  push di
1dce:12ec  mov di,[bp+6]
1dce:12ef  mov word ptr [bp-2],0
1dce:12f4  mov word ptr [bp-4],0
1dce:12f9  mov ax,di
1dce:12fb  mov dx,13h
1dce:12fe  imul dx
1dce:1300  add ax,0
1dce:1303  mov word ptr [bp-6],27D8h
1dce:1308  mov [bp-8],ax
1dce:130b  les bx,[bp-8]
1dce:130e  cmp word ptr es:[bx+6],0
1dce:1313  jg short 1338h
1dce:1315  jne short 131Eh
1dce:1317  cmp word ptr es:[bx+4],0
1dce:131c  ja short 1338h
1dce:131e  les bx,[bp-8]
1dce:1321  push word ptr es:[bx+2]
1dce:1325  push word ptr es:[bx]
1dce:1328  mov ax,10h
1dce:132b  push ax
1dce:132c  push cs
1dce:132d  call 00C9h
1dce:1330  add sp,6
1dce:1333  xor ax,ax
1dce:1335  jmp 14E2h
1dce:1338  call far 0249h,1D0Eh
1dce:133d  les bx,[bp-8]
1dce:1340  cmp dx,es:[bx+6]
1dce:1344  jl short 136Ch
1dce:1346  jne short 134Eh
1dce:1348  cmp ax,es:[bx+4]
1dce:134c  jb short 136Ch
1dce:134e  xor ax,ax
1dce:1350  push ax
1dce:1351  les bx,[bp-8]
1dce:1354  push word ptr es:[bx+6]
1dce:1358  push word ptr es:[bx+4]
1dce:135c  call far 000Bh,1D0Eh
1dce:1361  add sp,6
1dce:1364  mov [bp-2],dx
1dce:1367  mov [bp-4],ax
1dce:136a  jmp short 1376h
1dce:136c  mov word ptr [bp-2],0
1dce:1371  mov word ptr [bp-4],0
1dce:1376  mov ax,[bp-4]
1dce:1379  or ax,[bp-2]
1dce:137c  jne short 13B8h
1dce:137e  les bx,[bp-8]
1dce:1381  mov al,es:[bx+12h]
1dce:1385  push ax
1dce:1386  push word ptr es:[bx+4]
1dce:138a  push cs
1dce:138b  call 0C71h
1dce:138e  add sp,4
1dce:1391  or ax,ax
1dce:1393  je short 13B3h
1dce:1395  xor ax,ax
1dce:1397  push ax
1dce:1398  les bx,[bp-8]
1dce:139b  push word ptr es:[bx+6]
1dce:139f  push word ptr es:[bx+4]
1dce:13a3  call far 000Bh,1D0Eh
1dce:13a8  add sp,6
1dce:13ab  mov [bp-2],dx
1dce:13ae  mov [bp-4],ax
1dce:13b1  jmp short 13B8h
1dce:13b3  xor ax,ax
1dce:13b5  jmp 14E2h
1dce:13b8  les bx,[bp-8]
1dce:13bb  cmp word ptr es:[bx+0Ch],0
1dce:13c0  jle short 13DDh
1dce:13c2  mov ax,180h
1dce:13c5  push ax
1dce:13c6  mov ax,8001h
1dce:13c9  push ax
1dce:13ca  push word ptr es:[bx+2]
1dce:13ce  push word ptr es:[bx]
1dce:13d1  call far 71EAh,0
1dce:13d6  add sp,8
1dce:13d9  mov si,ax
1dce:13db  jmp short 143Dh
1dce:13dd  mov ax,di
1dce:13df  mov dx,13h
1dce:13e2  imul dx
1dce:13e4  mov dx,27D8h
1dce:13e7  mov bx,ax
1dce:13e9  mov es,dx
1dce:13eb  mov ax,es:[bx+0Ch]
1dce:13f0  and ax,7FFFh
1dce:13f3  mov dx,13h
1dce:13f6  imul dx
1dce:13f8  add ax,0
1dce:13fb  mov word ptr [bp-0Ah],27D8h
1dce:1400  mov [bp-0Ch],ax
1dce:1403  mov ax,180h
1dce:1406  push ax
1dce:1407  mov ax,8001h
1dce:140a  push ax
1dce:140b  les bx,[bp-0Ch]
1dce:140e  push word ptr es:[bx+2]
1dce:1412  push word ptr es:[bx]
1dce:1415  call far 71EAh,0
1dce:141a  add sp,8
1dce:141d  mov si,ax
1dce:141f  les bx,[bp-8]
1dce:1422  push word ptr es:[bx+2]
1dce:1426  push word ptr es:[bx]
1dce:1429  push si
1dce:142a  call far 1600h,1DCEh
1dce:142f  add sp,6
1dce:1432  les bx,[bp-8]
1dce:1435  mov es:[bx+6],dx
1dce:1439  mov es:[bx+4],ax
1dce:143d  cmp si,0FFFFh
1dce:1440  jne short 1455h
1dce:1442  push word ptr [bp-2]
1dce:1445  push word ptr [bp-4]
1dce:1448  call far 013Fh,1D0Eh
1dce:144d  add sp,4
1dce:1450  xor ax,ax
1dce:1452  jmp 14E2h
1dce:1455  les bx,[bp-8]
1dce:1458  cmp word ptr es:[bx+0Ch],0
1dce:145d  jle short 148Fh
1dce:145f  push si
1dce:1460  call far 6CC7h,0
1dce:1465  inc sp
1dce:1466  inc sp
1dce:1467  les bx,[bp-8]
1dce:146a  cmp dx,es:[bx+6]
1dce:146e  jne short 1476h
1dce:1470  cmp ax,es:[bx+4]
1dce:1474  je short 148Fh
1dce:1476  les bx,[bp-8]
1dce:1479  push word ptr es:[bx+2]
1dce:147d  push word ptr es:[bx]
1dce:1480  mov ax,0Eh
1dce:1483  push ax
1dce:1484  push cs
1dce:1485  call 00C9h
1dce:1488  add sp,6
1dce:148b  xor ax,ax
1dce:148d  jmp short 14E2h
1dce:148f  les bx,[bp-8]
1dce:1492  push word ptr es:[bx+4]
1dce:1496  push word ptr [bp-2]
1dce:1499  push word ptr [bp-4]
1dce:149c  push si
1dce:149d  call far 7384h,0
1dce:14a2  add sp,8
1dce:14a5  cwd
1dce:14a6  les bx,[bp-8]
1dce:14a9  cmp dx,es:[bx+6]
1dce:14ad  jne short 14CDh
1dce:14af  cmp ax,es:[bx+4]
1dce:14b3  jne short 14CDh
1dce:14b5  mov ax,[bp-2]
1dce:14b8  mov dx,[bp-4]
1dce:14bb  mov es:[bx+0Ah],ax
1dce:14bf  mov es:[bx+8],dx
1dce:14c3  push si
1dce:14c4  call far 5A5Fh,0
1dce:14c9  inc sp
1dce:14ca  inc sp
1dce:14cb  jmp short 14DFh
1dce:14cd  push word ptr [bp-2]
1dce:14d0  push word ptr [bp-4]
1dce:14d3  call far 013Fh,1D0Eh
1dce:14d8  add sp,4
1dce:14db  xor ax,ax
1dce:14dd  jmp short 14E2h
1dce:14df  mov ax,1
1dce:14e2  pop di
1dce:14e3  pop si
1dce:14e4  mov sp,bp
1dce:14e6  pop bp
1dce:14e7  ret far

; Candidate 1dce:14e8, file offset 0x223c8
1dce:14e8  push bp
1dce:14e9  mov bp,sp
1dce:14eb  push si
1dce:14ec  xor si,si
1dce:14ee  jmp short 151Fh
1dce:14f0  push word ptr [bp+8]
1dce:14f3  push word ptr [bp+6]
1dce:14f6  mov ax,si
1dce:14f8  mov dx,13h
1dce:14fb  imul dx
1dce:14fd  mov dx,27D8h
1dce:1500  mov bx,ax
1dce:1502  mov es,dx
1dce:1504  push word ptr es:[bx+2]
1dce:1509  push word ptr es:[bx]
1dce:150e  call far 7540h,0
1dce:1513  add sp,8
1dce:1516  or ax,ax
1dce:1518  jne short 151Eh
1dce:151a  mov ax,si
1dce:151c  jmp short 153Bh
1dce:151e  inc si
1dce:151f  mov ax,si
1dce:1521  mov dx,13h
1dce:1524  imul dx
1dce:1526  mov dx,27D8h
1dce:1529  mov bx,ax
1dce:152b  mov es,dx
1dce:152d  les bx,es:[bx]
1dce:1532  cmp byte ptr es:[bx],0
1dce:1536  jne short 14F0h
1dce:1538  mov ax,0FFFFh
1dce:153b  pop si
1dce:153c  pop bp
1dce:153d  ret far

; Candidate 1dce:153e, file offset 0x2241e
1dce:153e  push bp
1dce:153f  mov bp,sp
1dce:1541  push si
1dce:1542  xor si,si
1dce:1544  push word ptr [bp+8]
1dce:1547  push word ptr [bp+6]
1dce:154a  call far 767Bh,0
1dce:154f  add sp,4
1dce:1552  mov [bp+8],dx
1dce:1555  mov [bp+6],ax
1dce:1558  jmp short 15CAh
1dce:155a  push word ptr [bp+8]
1dce:155d  push word ptr [bp+6]
1dce:1560  mov ax,si
1dce:1562  mov dx,13h
1dce:1565  imul dx
1dce:1567  mov dx,27D8h
1dce:156a  mov bx,ax
1dce:156c  mov es,dx
1dce:156e  push word ptr es:[bx+2]
1dce:1573  push word ptr es:[bx]
1dce:1578  call far 7540h,0
1dce:157d  add sp,8
1dce:1580  or ax,ax
1dce:1582  jne short 15C9h
1dce:1584  jmp short 159Eh
1dce:1586  mov ax,si
1dce:1588  mov dx,13h
1dce:158b  imul dx
1dce:158d  mov dx,27D8h
1dce:1590  mov bx,ax
1dce:1592  mov es,dx
1dce:1594  mov ax,es:[bx+0Ch]
1dce:1599  and ax,7FFFh
1dce:159c  mov si,ax
1dce:159e  mov ax,si
1dce:15a0  mov dx,13h
1dce:15a3  imul dx
1dce:15a5  mov dx,27D8h
1dce:15a8  mov bx,ax
1dce:15aa  mov es,dx
1dce:15ac  cmp word ptr es:[bx+0Ch],0
1dce:15b2  jl short 1586h
1dce:15b4  mov ax,si
1dce:15b6  mov dx,13h
1dce:15b9  imul dx
1dce:15bb  mov dx,27D8h
1dce:15be  mov bx,ax
1dce:15c0  mov es,dx
1dce:15c2  mov ax,es:[bx+0Ch]
1dce:15c7  jmp short 15E9h
1dce:15c9  inc si
1dce:15ca  mov ax,si
1dce:15cc  mov dx,13h
1dce:15cf  imul dx
1dce:15d1  mov dx,27D8h
1dce:15d4  mov bx,ax
1dce:15d6  mov es,dx
1dce:15d8  les bx,es:[bx]
1dce:15dd  cmp byte ptr es:[bx],0
1dce:15e1  je short 15E6h
1dce:15e3  jmp 155Ah
1dce:15e6  mov ax,0FFFFh
1dce:15e9  pop si
1dce:15ea  pop bp
1dce:15eb  ret far

; Candidate 1dce:1600, file offset 0x224e0
1dce:1600  push bp
1dce:1601  mov bp,sp
1dce:1603  sub sp,16h
1dce:1606  push si
1dce:1607  push di
1dce:1608  mov di,[bp+6]
1dce:160b  and di,3FFFh
1dce:160f  mov ax,4
1dce:1612  push ax
1dce:1613  push ss
1dce:1614  lea ax,[bp-4]
1dce:1617  push ax
1dce:1618  push di
1dce:1619  call far 7384h,0
1dce:161e  add sp,8
1dce:1621  xor si,si
1dce:1623  mov ax,1
1dce:1626  push ax
1dce:1627  push ss
1dce:1628  lea ax,[bp-16h]
1dce:162b  mov dx,si
1dce:162d  add dx,ax
1dce:162f  push dx
1dce:1630  push di
1dce:1631  call far 7384h,0
1dce:1636  add sp,8
1dce:1639  mov bx,si
1dce:163b  inc si
1dce:163c  lea ax,[bp-16h]
1dce:163f  add bx,ax
1dce:1641  cmp byte ptr ss:[bx],0
1dce:1645  jne short 1623h
1dce:1647  push word ptr [bp+0Ah]
1dce:164a  push word ptr [bp+8]
1dce:164d  push ss
1dce:164e  push ax
1dce:164f  call far 7540h,0
1dce:1654  add sp,8
1dce:1657  or ax,ax
1dce:1659  jne short 160Fh
1dce:165b  mov ax,4
1dce:165e  push ax
1dce:165f  push ss
1dce:1660  lea ax,[bp-8]
1dce:1663  push ax
1dce:1664  push di
1dce:1665  call far 7384h,0
1dce:166a  add sp,8
1dce:166d  xor ax,ax
1dce:166f  push ax
1dce:1670  push word ptr [bp-2]
1dce:1673  push word ptr [bp-4]
1dce:1676  push di
1dce:1677  call far 6F9Fh,0
1dce:167c  add sp,8
1dce:167f  mov ax,[bp-2]
1dce:1682  mov dx,[bp-4]
1dce:1685  sub [bp-8],dx
1dce:1688  sbb [bp-6],ax
1dce:168b  mov ax,[bp-6]
1dce:168e  mov dx,[bp-8]
1dce:1691  mov [0F046h],ax
1dce:1694  mov [0F044h],dx
1dce:1698  mov ax,[bp-2]
1dce:169b  mov dx,[bp-4]
1dce:169e  mov [0F04Ah],ax
1dce:16a1  mov [0F048h],dx
1dce:16a5  mov dx,[bp-6]
1dce:16a8  mov ax,[bp-8]
1dce:16ab  pop di
1dce:16ac  pop si
1dce:16ad  mov sp,bp
1dce:16af  pop bp
1dce:16b0  ret far

; Candidate 1f3e:0009, file offset 0x225e9
1f3e:0009  push bp
1f3e:000a  mov bp,sp
1f3e:000c  push si
1f3e:000d  mov si,[bp+6]
1f3e:0010  and si,0Fh
1f3e:0014  mov bx,si
1f3e:0016  or bx,1
1f3e:001a  shl bx,1
1f3e:001c  mov dx,[bx+62A7h]
1f3e:0020  xor ax,ax
1f3e:0022  pop si
1f3e:0023  pop bp
1f3e:0024  ret far

; Candidate 1f42:0016, file offset 0x22636
1f42:0016  push bp
1f42:0017  mov bp,sp
1f42:0019  push cs
1f42:001a  mov ax,1
1f42:001d  push ax
1f42:001e  call far 6DEDh,0
1f42:0023  add sp,4
1f42:0026  pop bp
1f42:0027  ret far

; Candidate 1f44:0008, file offset 0x22648
1f44:0008  push bp
1f44:0009  mov bp,sp
1f44:000b  sub sp,4
1f44:000e  push si
1f44:000f  mov ax,1
1f44:0012  push ax
1f44:0013  push word ptr [bp+8]
1f44:0016  push word ptr [bp+6]
1f44:0019  call far 0107h,1DCEh
1f44:001e  add sp,6
1f44:0021  mov si,ax
1f44:0023  push si
1f44:0024  call far 0406h,1DCEh
1f44:0029  inc sp
1f44:002a  inc sp
1f44:002b  mov ax,3
1f44:002e  push ax
1f44:002f  push word ptr [bp+8]
1f44:0032  push word ptr [bp+6]
1f44:0035  call far 0107h,1DCEh
1f44:003a  add sp,6
1f44:003d  mov si,ax
1f44:003f  xor ax,ax
1f44:0041  mov dx,4
1f44:0044  push ax
1f44:0045  push dx
1f44:0046  push ss
1f44:0047  lea ax,[bp-4]
1f44:004a  push ax
1f44:004b  push si
1f44:004c  call far 044Eh,1DCEh
1f44:0051  add sp,0Ah
1f44:0054  cmp word ptr [bp-2],4D52h
1f44:0059  jne short 0078h
1f44:005b  cmp word ptr [bp-4],4F46h
1f44:0060  jne short 0078h
1f44:0062  mov ax,1
1f44:0065  push ax
1f44:0066  xor ax,ax
1f44:0068  mov dx,4
1f44:006b  push ax
1f44:006c  push dx
1f44:006d  push si
1f44:006e  call far 0750h,1DCEh
1f44:0073  add sp,8
1f44:0076  jmp short 0083h
1f44:0078  push si
1f44:0079  call far 0406h,1DCEh
1f44:007e  inc sp
1f44:007f  inc sp
1f44:0080  mov si,0FFFFh
1f44:0083  mov ax,si
1f44:0085  pop si
1f44:0086  mov sp,bp
1f44:0088  pop bp
1f44:0089  ret far

; Candidate 1f44:008a, file offset 0x226ca
1f44:008a  push bp
1f44:008b  mov bp,sp
1f44:008d  push si
1f44:008e  mov si,[bp+6]
1f44:0091  cmp si,0FFFFh
1f44:0094  je short 009Eh
1f44:0096  push si
1f44:0097  call far 0406h,1DCEh
1f44:009c  inc sp
1f44:009d  inc sp
1f44:009e  pop si
1f44:009f  pop bp
1f44:00a0  ret far

; Candidate 1f44:01c9, file offset 0x22809
1f44:01c9  push bp
1f44:01ca  mov bp,sp
1f44:01cc  sub sp,0Ah
1f44:01cf  push si
1f44:01d0  mov si,[bp+6]
1f44:01d3  mov byte ptr [bp-9],1
1f44:01d7  xor ax,ax
1f44:01d9  mov dx,4
1f44:01dc  push ax
1f44:01dd  push dx
1f44:01de  push ss
1f44:01df  lea ax,[bp-4]
1f44:01e2  push ax
1f44:01e3  push si
1f44:01e4  call far 044Eh,1DCEh
1f44:01e9  add sp,0Ah
1f44:01ec  or dx,dx
1f44:01ee  jne short 01F5h
1f44:01f0  cmp ax,4
1f44:01f3  je short 0200h
1f44:01f5  mov al,[bp-9]
1f44:01f8  cbw
1f44:01f9  or ax,ax
1f44:01fb  jne short 0200h
1f44:01fd  jmp 035Ah
1f44:0200  mov ax,[bp-4]
1f44:0203  or ax,[bp-2]
1f44:0206  jne short 0231h
1f44:0208  xor ax,ax
1f44:020a  mov dx,4
1f44:020d  push ax
1f44:020e  push dx
1f44:020f  push ss
1f44:0210  lea ax,[bp-4]
1f44:0213  push ax
1f44:0214  push si
1f44:0215  call far 044Eh,1DCEh
1f44:021a  add sp,0Ah
1f44:021d  or dx,dx
1f44:021f  jne short 0226h
1f44:0221  cmp ax,4
1f44:0224  je short 0231h
1f44:0226  mov al,[bp-9]
1f44:0229  cbw
1f44:022a  or ax,ax
1f44:022c  jne short 0231h
1f44:022e  jmp 035Ah
1f44:0231  xor ax,ax
1f44:0233  mov dx,4
1f44:0236  push ax
1f44:0237  push dx
1f44:0238  push ss
1f44:0239  lea ax,[bp-8]
1f44:023c  push ax
1f44:023d  push si
1f44:023e  call far 044Eh,1DCEh
1f44:0243  add sp,0Ah
1f44:0246  or dx,dx
1f44:0248  jne short 024Fh
1f44:024a  cmp ax,4
1f44:024d  je short 025Ah
1f44:024f  mov al,[bp-9]
1f44:0252  cbw
1f44:0253  or ax,ax
1f44:0255  jne short 025Ah
1f44:0257  jmp 035Ah
1f44:025a  push word ptr [bp-6]
1f44:025d  push word ptr [bp-8]
1f44:0260  call far 6,23DFh
1f44:0265  add sp,4
1f44:0268  mov [bp-6],dx
1f44:026b  mov [bp-8],ax
1f44:026e  mov ax,[bp+0Ah]
1f44:0271  mov dx,[bp+8]
1f44:0274  cmp ax,[bp-2]
1f44:0277  je short 027Ch
1f44:0279  jmp 030Dh
1f44:027c  cmp dx,[bp-4]
1f44:027f  je short 0284h
1f44:0281  jmp 030Dh
1f44:0284  mov ax,[bp+12h]
1f44:0287  mov dx,[bp+10h]
1f44:028a  cmp ax,[bp-6]
1f44:028d  jg short 029Eh
1f44:028f  jl short 0296h
1f44:0291  cmp dx,[bp-8]
1f44:0294  jae short 029Eh
1f44:0296  mov dx,[bp+12h]
1f44:0299  mov ax,[bp+10h]
1f44:029c  jmp short 02A4h
1f44:029e  mov dx,[bp-6]
1f44:02a1  mov ax,[bp-8]
1f44:02a4  mov [bp+12h],dx
1f44:02a7  mov [bp+10h],ax
1f44:02aa  push word ptr [bp+12h]
1f44:02ad  push word ptr [bp+10h]
1f44:02b0  push word ptr [bp+0Eh]
1f44:02b3  push word ptr [bp+0Ch]
1f44:02b6  push si
1f44:02b7  call far 044Eh,1DCEh
1f44:02bc  add sp,0Ah
1f44:02bf  mov ax,[bp-6]
1f44:02c2  mov dx,[bp-8]
1f44:02c5  add dx,1
1f44:02c8  adc ax,0
1f44:02cb  and dx,0FFFEh
1f44:02cf  and ax,0FFFFh
1f44:02d2  mov [bp-6],ax
1f44:02d5  mov [bp-8],dx
1f44:02d8  mov ax,[bp+12h]
1f44:02db  mov dx,[bp+10h]
1f44:02de  cmp ax,[bp-6]
1f44:02e1  jg short 0305h
1f44:02e3  jl short 02EAh
1f44:02e5  cmp dx,[bp-8]
1f44:02e8  jae short 0305h
1f44:02ea  mov ax,1
1f44:02ed  push ax
1f44:02ee  mov ax,[bp-6]
1f44:02f1  mov dx,[bp-8]
1f44:02f4  sub dx,[bp+10h]
1f44:02f7  sbb ax,[bp+12h]
1f44:02fa  push ax
1f44:02fb  push dx
1f44:02fc  push si
1f44:02fd  call far 0750h,1DCEh
1f44:0302  add sp,8
1f44:0305  mov dx,[bp+12h]
1f44:0308  mov ax,[bp+10h]
1f44:030b  jmp short 035Eh
1f44:030d  cmp byte ptr [bp-9],0
1f44:0311  je short 032Bh
1f44:0313  xor ax,ax
1f44:0315  push ax
1f44:0316  mov dx,0Ch
1f44:0319  push ax
1f44:031a  push dx
1f44:031b  push si
1f44:031c  call far 0750h,1DCEh
1f44:0321  add sp,8
1f44:0324  mov byte ptr [bp-9],0
1f44:0328  jmp 01D7h
1f44:032b  mov ax,[bp-6]
1f44:032e  mov dx,[bp-8]
1f44:0331  add dx,1
1f44:0334  adc ax,0
1f44:0337  and dx,0FFFEh
1f44:033b  and ax,0FFFFh
1f44:033e  mov [bp-6],ax
1f44:0341  mov [bp-8],dx
1f44:0344  mov ax,1
1f44:0347  push ax
1f44:0348  push word ptr [bp-6]
1f44:034b  push word ptr [bp-8]
1f44:034e  push si
1f44:034f  call far 0750h,1DCEh
1f44:0354  add sp,8
1f44:0357  jmp 01D7h
1f44:035a  xor dx,dx
1f44:035c  xor ax,ax
1f44:035e  pop si
1f44:035f  mov sp,bp
1f44:0361  pop bp
1f44:0362  ret far

; Candidate 1f7a:0003, file offset 0x229a3
1f7a:0003  push bp
1f7a:0004  mov bp,sp
1f7a:0006  sub sp,0Eh
1f7a:0009  push si
1f7a:000a  push di
1f7a:000b  mov word ptr [bp-2],0
1f7a:0010  mov word ptr [bp-4],46Ch
1f7a:0015  xor ax,ax
1f7a:0017  mov [0F16Ch],ax
1f7a:001a  mov di,ax
1f7a:001c  call far 0269h,2269h
1f7a:0021  les bx,[bp-4]
1f7a:0024  mov ax,es:[bx+2]
1f7a:0028  mov dx,es:[bx]
1f7a:002b  mov [bp-6],ax
1f7a:002e  mov [bp-8],dx
1f7a:0031  call far 0267h,2269h
1f7a:0036  les bx,[bp-4]
1f7a:0039  mov ax,es:[bx+2]
1f7a:003d  mov dx,es:[bx]
1f7a:0040  cmp ax,[bp-6]
1f7a:0043  jne short 004Ah
1f7a:0045  cmp dx,[bp-8]
1f7a:0048  je short 0036h
1f7a:004a  call far 0269h,2269h
1f7a:004f  les bx,[bp-4]
1f7a:0052  mov ax,es:[bx+2]
1f7a:0056  mov dx,es:[bx]
1f7a:0059  add dx,4
1f7a:005c  adc ax,0
1f7a:005f  mov [bp-6],ax
1f7a:0062  mov [bp-8],dx
1f7a:0065  call far 0267h,2269h
1f7a:006a  jmp short 0077h
1f7a:006c  inc di
1f7a:006d  mov si,0C8h
1f7a:0070  jmp short 0073h
1f7a:0072  dec si
1f7a:0073  or si,si
1f7a:0075  jne short 0072h
1f7a:0077  les bx,[bp-4]
1f7a:007a  mov ax,es:[bx+2]
1f7a:007e  mov dx,es:[bx]
1f7a:0081  cmp ax,[bp-6]
1f7a:0084  jb short 006Ch
1f7a:0086  jne short 008Dh
1f7a:0088  cmp dx,[bp-8]
1f7a:008b  jb short 006Ch
1f7a:008d  xor ax,ax
1f7a:008f  mov [bp-0Ch],ax
1f7a:0092  mov [bp-0Ah],ax
1f7a:0095  mov word ptr [bp-0Eh],0
1f7a:009a  jmp short 00B0h
1f7a:009c  call far 000Ch,2404h
1f7a:00a1  or ax,ax
1f7a:00a3  je short 00AAh
1f7a:00a5  inc word ptr [bp-0Ch]
1f7a:00a8  jmp short 00ADh
1f7a:00aa  inc word ptr [bp-0Ah]
1f7a:00ad  inc word ptr [bp-0Eh]
1f7a:00b0  cmp word ptr [bp-0Eh],2710h
1f7a:00b5  jl short 009Ch
1f7a:00b7  mov ax,[bp-0Ch]
1f7a:00ba  cmp ax,[bp-0Ah]
1f7a:00bd  jle short 00C5h
1f7a:00bf  mov word ptr [0F16Ch],1
1f7a:00c5  pop di
1f7a:00c6  pop si
1f7a:00c7  mov sp,bp
1f7a:00c9  pop bp
1f7a:00ca  ret far

; Candidate 1f86:004e, file offset 0x22aae
1f86:004e  push bp
1f86:004f  mov bp,sp
1f86:0051  push si
1f86:0052  push di
1f86:0053  xor si,si
1f86:0055  call far 0507h,2295h
1f86:005a  or ax,ax
1f86:005c  je short 0092h
1f86:005e  call far 066Dh,2295h
1f86:0063  mov si,ax
1f86:0065  test si,100h
1f86:0069  je short 0092h
1f86:006b  and ax,0FFh
1f86:006e  mov di,ax
1f86:0070  cmp di,11h
1f86:0073  jl short 007Ah
1f86:0075  cmp di,1Ah
1f86:0078  jle short 008Eh
1f86:007a  cmp di,1Fh
1f86:007d  jl short 0084h
1f86:007f  cmp di,27h
1f86:0082  jle short 008Eh
1f86:0084  cmp di,2Eh
1f86:0087  jl short 0092h
1f86:0089  cmp di,34h
1f86:008c  jg short 0092h
1f86:008e  and si,0FEFFh
1f86:0092  push si
1f86:0093  push word ptr [bp+8]
1f86:0096  push word ptr [bp+6]
1f86:0099  call far 00A5h,1F86h
1f86:009e  add sp,6
1f86:00a1  pop di
1f86:00a2  pop si
1f86:00a3  pop bp
1f86:00a4  ret far

; Candidate 1f86:00a5, file offset 0x22b05
1f86:00a5  push bp
1f86:00a6  mov bp,sp
1f86:00a8  sub sp,28h
1f86:00ab  push si
1f86:00ac  push di
1f86:00ad  mov word ptr [bp-0Ah],0
1f86:00b2  mov word ptr [0F0FEh],0
1f86:00b8  mov al,[6655h]
1f86:00bb  mov ah,0
1f86:00bd  or ax,ax
1f86:00bf  je short 00C4h
1f86:00c1  jmp 019Fh
1f86:00c4  mov ax,[661Ah]
1f86:00c7  mov [6379h],ax
1f86:00ca  mov ax,[661Ch]
1f86:00cd  mov [637Bh],ax
1f86:00d0  mov ax,41h
1f86:00d3  push ax
1f86:00d4  call far 068Bh,2295h
1f86:00d9  inc sp
1f86:00da  inc sp
1f86:00db  or ax,ax
1f86:00dd  je short 00E7h
1f86:00df  mov word ptr [6385h],2
1f86:00e5  jmp short 00EDh
1f86:00e7  mov word ptr [6385h],4
1f86:00ed  mov ax,42h
1f86:00f0  push ax
1f86:00f1  call far 068Bh,2295h
1f86:00f6  inc sp
1f86:00f7  inc sp
1f86:00f8  or ax,ax
1f86:00fa  je short 0104h
1f86:00fc  mov word ptr [6387h],2
1f86:0102  jmp short 010Ah
1f86:0104  mov word ptr [6387h],4
1f86:010a  mov al,[bp+0Ah]
1f86:010d  and al,0FFh
1f86:010f  mov [bp-27h],al
1f86:0112  cmp word ptr [bp+0Ah],0
1f86:0116  jge short 0156h
1f86:0118  cmp byte ptr [bp-27h],0C6h
1f86:011c  jb short 014Fh
1f86:011e  cmp byte ptr [bp-27h],0C7h
1f86:0122  ja short 014Fh
1f86:0124  test word ptr [bp+0Ah],800h
1f86:0129  je short 0132h
1f86:012b  mov word ptr [bp-12h],3
1f86:0130  jmp short 0137h
1f86:0132  mov word ptr [bp-12h],1
1f86:0137  cmp byte ptr [bp-27h],0C6h
1f86:013b  jne short 0145h
1f86:013d  mov ax,[bp-12h]
1f86:0140  mov [6385h],ax
1f86:0143  jmp short 0189h
1f86:0145  mov ax,[bp-12h]
1f86:0148  mov [6387h],ax
1f86:014b  jmp short 0189h
1f86:014d  jmp short 0189h
1f86:014f  and word ptr [bp+0Ah],0FFh
1f86:0154  jmp short 019Fh
1f86:0156  cmp byte ptr [bp-27h],41h
1f86:015a  jb short 019Fh
1f86:015c  cmp byte ptr [bp-27h],42h
1f86:0160  ja short 019Fh
1f86:0162  test word ptr [bp+0Ah],800h
1f86:0167  je short 0170h
1f86:0169  mov word ptr [bp-12h],3
1f86:016e  jmp short 0175h
1f86:0170  mov word ptr [bp-12h],1
1f86:0175  cmp byte ptr [bp-27h],41h
1f86:0179  jne short 0183h
1f86:017b  mov ax,[bp-12h]
1f86:017e  mov [6385h],ax
1f86:0181  jmp short 0189h
1f86:0183  mov ax,[bp-12h]
1f86:0186  mov [6387h],ax
1f86:0189  mov ax,[6622h]
1f86:018c  mov [6379h],ax
1f86:018f  mov ax,[6624h]
1f86:0192  mov [637Bh],ax
1f86:0195  mov word ptr [bp-0Ah],1
1f86:019a  mov word ptr [bp+0Ah],0
1f86:019f  mov word ptr [bp-4],0
1f86:01a4  mov word ptr [bp-2],1
1f86:01a9  mov ax,[bp+6]
1f86:01ac  or ax,[bp+8]
1f86:01af  jne short 01B7h
1f86:01b1  mov ax,[bp+0Ah]
1f86:01b4  jmp 08BFh
1f86:01b7  mov ax,[bp+8]
1f86:01ba  mov dx,[bp+6]
1f86:01bd  cmp ax,[6266h]
1f86:01c1  jne short 01D3h
1f86:01c3  cmp dx,[6264h]
1f86:01c7  jne short 01D3h
1f86:01c9  cmp byte ptr [6389h],0
1f86:01ce  jne short 01D3h
1f86:01d0  jmp 0274h
1f86:01d3  mov ax,[bp+8]
1f86:01d6  mov dx,[bp+6]
1f86:01d9  mov [6266h],ax
1f86:01dc  mov [6264h],dx
1f86:01e0  mov word ptr [626Eh],0
1f86:01e6  push word ptr [bp+8]
1f86:01e9  push word ptr [bp+6]
1f86:01ec  call far 08D5h,1F86h
1f86:01f1  add sp,4
1f86:01f4  les bx,[bp+6]
1f86:01f7  mov ax,es:[bx+0Eh]
1f86:01fb  and ax,0AA04h
1f86:01fe  or [626Eh],ax
1f86:0202  test word ptr es:[bx+2Eh],20h
1f86:0208  je short 022Ah
1f86:020a  mov ax,es:[bx+34h]
1f86:020e  or ax,es:[bx+36h]
1f86:0212  je short 022Ah
1f86:0214  mov ax,[0F04Ch]
1f86:0217  or ax,[0F04Eh]
1f86:021b  je short 022Ah
1f86:021d  push word ptr [bp+8]
1f86:0220  push word ptr [bp+6]
1f86:0223  call far dword ptr [0F04Ch]
1f86:0227  add sp,4
1f86:022a  les bx,[bp+6]
1f86:022d  mov ax,es:[bx]
1f86:0230  or ax,es:[bx+2]
1f86:0234  jne short 023Bh
1f86:0236  mov word ptr [bp-2],0
1f86:023b  cmp word ptr [bp-2],0
1f86:023f  je short 0251h
1f86:0241  les bx,[bp+6]
1f86:0244  mov ax,es:[bx+2]
1f86:0248  mov dx,es:[bx]
1f86:024b  mov [bp+8],ax
1f86:024e  mov [bp+6],dx
1f86:0251  cmp word ptr [bp-2],0
1f86:0255  jne short 01E6h
1f86:0257  mov word ptr [626Ah],0
1f86:025d  mov word ptr [6268h],0
1f86:0263  mov word ptr [626Ch],1
1f86:0269  mov byte ptr [6389h],0
1f86:026e  mov word ptr [6270h],0FFFFh
1f86:0274  mov word ptr [bp-1Ah],0
1f86:0279  mov bx,[bp-1Ah]
1f86:027c  mov cl,4
1f86:027e  shl bx,cl
1f86:0280  mov ax,[bx+1CFCh]
1f86:0284  shl ax,1
1f86:0286  shl ax,1
1f86:0288  shl ax,1
1f86:028a  mov [bp-1Ch],ax
1f86:028d  mov bx,[bp-1Ah]
1f86:0290  shl bx,cl
1f86:0292  mov ax,[bx+1D00h]
1f86:0296  shl ax,1
1f86:0298  shl ax,1
1f86:029a  shl ax,1
1f86:029c  mov [bp-20h],ax
1f86:029f  mov bx,[bp-1Ah]
1f86:02a2  shl bx,cl
1f86:02a4  mov ax,[bx+1CFEh]
1f86:02a8  mov [bp-1Eh],ax
1f86:02ab  mov bx,[bp-1Ah]
1f86:02ae  shl bx,cl
1f86:02b0  mov ax,[bx+1D02h]
1f86:02b4  mov [bp-22h],ax
1f86:02b7  mov word ptr [bp-8],0
1f86:02bc  mov word ptr [bp-18h],0
1f86:02c1  mov ax,[6268h]
1f86:02c4  or ax,[626Ah]
1f86:02c8  je short 02D7h
1f86:02ca  mov ax,[626Ah]
1f86:02cd  mov dx,[6268h]
1f86:02d1  mov [bp+8],ax
1f86:02d4  mov [bp+6],dx
1f86:02d7  les bx,[bp+6]
1f86:02da  test word ptr es:[bx+0Eh],8
1f86:02e0  je short 0300h
1f86:02e2  mov ax,es:[bx+2]
1f86:02e6  mov dx,es:[bx]
1f86:02e9  mov [bp+8],ax
1f86:02ec  mov [bp+6],dx
1f86:02ef  or dx,ax
1f86:02f1  je short 02F8h
1f86:02f3  mov ax,1
1f86:02f6  jmp short 02FAh
1f86:02f8  xor ax,ax
1f86:02fa  mov [bp-2],ax
1f86:02fd  jmp 088Dh
1f86:0300  mov word ptr [bp-6],0
1f86:0305  mov word ptr [bp-0Ch],0
1f86:030a  les bx,[bp+6]
1f86:030d  mov ax,es:[bx+4]
1f86:0311  or ax,8000h
1f86:0314  mov [bp-14h],ax
1f86:0317  mov si,es:[bx+2Eh]
1f86:031b  mov di,es:[bx+0Eh]
1f86:031f  test si,1
1f86:0323  je short 032Bh
1f86:0325  or si,8
1f86:0329  jmp short 032Fh
1f86:032b  and si,0FFF7h
1f86:032f  test si,4
1f86:0333  je short 033Bh
1f86:0335  or si,10h
1f86:0339  jmp short 033Fh
1f86:033b  and si,0FFEFh
1f86:033f  cmp word ptr [bp+0Ah],0
1f86:0343  je short 039Ch
1f86:0345  les bx,[bp+6]
1f86:0348  mov ax,es:[bx+6]
1f86:034c  cmp ax,[bp+0Ah]
1f86:034f  jne short 036Fh
1f86:0351  mov word ptr [0F0FEh],1
1f86:0357  mov word ptr [6385h],1
1f86:035d  xor si,1
1f86:0361  mov ax,[bp-14h]
1f86:0364  mov [bp-4],ax
1f86:0367  mov word ptr [bp-6],1
1f86:036c  jmp 07A6h
1f86:036f  les bx,[bp+6]
1f86:0372  mov ax,es:[bx+8]
1f86:0376  cmp ax,[bp+0Ah]
1f86:0379  je short 037Eh
1f86:037b  jmp 07A6h
1f86:037e  mov word ptr [0F0FEh],2
1f86:0384  mov word ptr [6387h],1
1f86:038a  xor si,1
1f86:038e  mov ax,[bp-14h]
1f86:0391  mov [bp-4],ax
1f86:0394  mov word ptr [bp-6],1
1f86:0399  jmp 07A6h
1f86:039c  mov al,[6655h]
1f86:039f  mov ah,0
1f86:03a1  or ax,ax
1f86:03a3  je short 03A8h
1f86:03a5  jmp 07A6h
1f86:03a8  cmp word ptr [626Eh],0
1f86:03ad  jne short 03B8h
1f86:03af  cmp word ptr [bp-0Ah],0
1f86:03b3  jne short 03B8h
1f86:03b5  jmp 07A6h
1f86:03b8  mov ax,di
1f86:03ba  and ax,0F00h
1f86:03bd  mov [bp-0Eh],ax
1f86:03c0  mov ax,di
1f86:03c2  and ax,0F000h
1f86:03c5  mov [bp-10h],ax
1f86:03c8  cmp word ptr [626Ch],0
1f86:03cd  jne short 03D2h
1f86:03cf  jmp 07A6h
1f86:03d2  les bx,[bp+6]
1f86:03d5  mov ax,es:[bx+1Ch]
1f86:03d9  cmp ax,[bp-1Ah]
1f86:03dc  je short 0423h
1f86:03de  mov ax,es:[bx+1Ch]
1f86:03e2  mov [bp-1Ah],ax
1f86:03e5  mov bx,[bp-1Ah]
1f86:03e8  mov cl,4
1f86:03ea  shl bx,cl
1f86:03ec  mov ax,[bx+1CFCh]
1f86:03f0  shl ax,1
1f86:03f2  shl ax,1
1f86:03f4  shl ax,1
1f86:03f6  mov [bp-1Ch],ax
1f86:03f9  mov bx,[bp-1Ah]
1f86:03fc  shl bx,cl
1f86:03fe  mov ax,[bx+1D00h]
1f86:0402  shl ax,1
1f86:0404  shl ax,1
1f86:0406  shl ax,1
1f86:0408  mov [bp-20h],ax
1f86:040b  mov bx,[bp-1Ah]
1f86:040e  shl bx,cl
1f86:0410  mov ax,[bx+1CFEh]
1f86:0414  mov [bp-1Eh],ax
1f86:0417  mov bx,[bp-1Ah]
1f86:041a  shl bx,cl
1f86:041c  mov ax,[bx+1D02h]
1f86:0420  mov [bp-22h],ax
1f86:0423  mov ax,[bp-1Ch]
1f86:0426  mov [bp-24h],ax
1f86:0429  les bx,[bp+6]
1f86:042c  cmp word ptr es:[bx+1Eh],0
1f86:0431  jge short 0439h
1f86:0433  mov ax,[bp-20h]
1f86:0436  add [bp-24h],ax
1f86:0439  les bx,[bp+6]
1f86:043c  mov ax,es:[bx+1Eh]
1f86:0440  add [bp-24h],ax
1f86:0443  mov ax,[bp-1Eh]
1f86:0446  mov [bp-26h],ax
1f86:0449  cmp word ptr es:[bx+20h],0
1f86:044e  jge short 0456h
1f86:0450  mov ax,[bp-22h]
1f86:0453  add [bp-26h],ax
1f86:0456  les bx,[bp+6]
1f86:0459  mov ax,es:[bx+20h]
1f86:045d  add [bp-26h],ax
1f86:0460  mov ax,[6379h]
1f86:0463  cmp ax,[bp-24h]
1f86:0466  jge short 046Bh
1f86:0468  jmp 071Fh
1f86:046b  mov ax,[bp-24h]
1f86:046e  add ax,es:[bx+22h]
1f86:0472  cmp ax,[6379h]
1f86:0476  ja short 047Bh
1f86:0478  jmp 071Fh
1f86:047b  mov ax,[637Bh]
1f86:047e  cmp ax,[bp-26h]
1f86:0481  jge short 0486h
1f86:0483  jmp 071Fh
1f86:0486  mov ax,[bp-26h]
1f86:0489  add ax,es:[bx+24h]
1f86:048d  cmp ax,[637Bh]
1f86:0491  ja short 0496h
1f86:0493  jmp 071Fh
1f86:0496  or si,2
1f86:049a  cmp word ptr [bp-0Eh],0
1f86:049e  jne short 04A3h
1f86:04a0  jmp 05D2h
1f86:04a3  mov bx,[6385h]
1f86:04a7  dec bx
1f86:04a8  cmp bx,3
1f86:04ab  jbe short 04B0h
1f86:04ad  jmp 05D2h
1f86:04b0  shl bx,1
1f86:04b2  jmp word ptr cs:[bx+8CDh]
1f86:04b7  test di,4
1f86:04bb  jne short 04CDh
1f86:04bd  les bx,[bp+6]
1f86:04c0  cmp byte ptr es:[bx+0Ch],0
1f86:04c5  je short 04CDh
1f86:04c7  or si,4
1f86:04cb  jmp short 04D1h
1f86:04cd  and si,0FFFBh
1f86:04d1  test di,800h
1f86:04d5  je short 04DFh
1f86:04d7  mov word ptr [bp-6],1
1f86:04dc  jmp 05D2h
1f86:04df  test di,2
1f86:04e3  jne short 04E8h
1f86:04e5  jmp 05D2h
1f86:04e8  test si,1
1f86:04ec  jne short 04F1h
1f86:04ee  jmp 05D2h
1f86:04f1  and si,0FFFEh
1f86:04f5  jmp 05D2h
1f86:04f8  cmp di,[6270h]
1f86:04fc  je short 0501h
1f86:04fe  jmp 05D2h
1f86:0501  test di,4
1f86:0505  je short 051Ch
1f86:0507  les bx,[bp+6]
1f86:050a  cmp byte ptr es:[bx+0Ch],0
1f86:050f  je short 051Ch
1f86:0511  or si,4
1f86:0515  mov word ptr [bp-0Ch],1
1f86:051a  jmp short 0520h
1f86:051c  and si,0FFFBh
1f86:0520  test di,200h
1f86:0524  jne short 0529h
1f86:0526  jmp 05D2h
1f86:0529  mov word ptr [bp-6],1
1f86:052e  test di,1
1f86:0532  je short 0537h
1f86:0534  jmp 05D2h
1f86:0537  or si,1
1f86:053b  mov ax,[bp-14h]
1f86:053e  mov [bp-4],ax
1f86:0541  jmp 05D2h
1f86:0544  mov word ptr [bp-18h],1
1f86:0549  test di,4
1f86:054d  je short 0564h
1f86:054f  les bx,[bp+6]
1f86:0552  cmp byte ptr es:[bx+0Ch],0
1f86:0557  je short 0564h
1f86:0559  or si,4
1f86:055d  mov word ptr [bp-0Ch],1
1f86:0562  jmp short 0568h
1f86:0564  and si,0FFFBh
1f86:0568  test di,100h
1f86:056c  je short 0583h
1f86:056e  mov word ptr [bp-6],1
1f86:0573  test di,1
1f86:0577  jne short 0583h
1f86:0579  xor si,1
1f86:057d  mov ax,[bp-14h]
1f86:0580  mov [bp-4],ax
1f86:0583  test di,40h
1f86:0587  je short 059Bh
1f86:0589  mov ax,[bp+8]
1f86:058c  mov dx,[bp+6]
1f86:058f  mov [626Ah],ax
1f86:0592  mov [6268h],dx
1f86:0596  mov word ptr [bp-8],1
1f86:059b  mov [6270h],di
1f86:059f  jmp short 05D2h
1f86:05a1  cmp di,[6270h]
1f86:05a5  jne short 05D2h
1f86:05a7  test di,400h
1f86:05ab  je short 05C2h
1f86:05ad  mov word ptr [bp-6],1
1f86:05b2  test di,1
1f86:05b6  je short 05C2h
1f86:05b8  xor si,1
1f86:05bc  mov ax,[bp-14h]
1f86:05bf  mov [bp-4],ax
1f86:05c2  test di,2
1f86:05c6  je short 05D2h
1f86:05c8  test si,1
1f86:05cc  je short 05D2h
1f86:05ce  and si,0FFFEh
1f86:05d2  cmp word ptr [bp-10h],0
1f86:05d6  jne short 05DBh
1f86:05d8  jmp 07A6h
1f86:05db  cmp word ptr [bp-6],0
1f86:05df  je short 05E4h
1f86:05e1  jmp 07A6h
1f86:05e4  cmp word ptr [bp-0Ch],0
1f86:05e8  je short 05EDh
1f86:05ea  jmp 07A6h
1f86:05ed  mov bx,[6387h]
1f86:05f1  dec bx
1f86:05f2  cmp bx,3
1f86:05f5  jbe short 05FAh
1f86:05f7  jmp 07A6h
1f86:05fa  shl bx,1
1f86:05fc  jmp word ptr cs:[bx+8C5h]
1f86:0601  test di,4
1f86:0605  jne short 0617h
1f86:0607  les bx,[bp+6]
1f86:060a  cmp byte ptr es:[bx+0Ch],0
1f86:060f  je short 0617h
1f86:0611  or si,4
1f86:0615  jmp short 061Bh
1f86:0617  and si,0FFFBh
1f86:061b  test di,8000h
1f86:061f  je short 0629h
1f86:0621  mov word ptr [bp-6],1
1f86:0626  jmp 07A6h
1f86:0629  test di,2
1f86:062d  jne short 0632h
1f86:062f  jmp 07A6h
1f86:0632  test si,1
1f86:0636  jne short 063Bh
1f86:0638  jmp 07A6h
1f86:063b  and si,0FFFEh
1f86:063f  jmp 07A6h
1f86:0642  cmp di,[6270h]
1f86:0646  je short 064Bh
1f86:0648  jmp 07A6h
1f86:064b  test di,4
1f86:064f  je short 0661h
1f86:0651  les bx,[bp+6]
1f86:0654  cmp byte ptr es:[bx+0Ch],0
1f86:0659  je short 0661h
1f86:065b  or si,4
1f86:065f  jmp short 0665h
1f86:0661  and si,0FFFBh
1f86:0665  test di,2000h
1f86:0669  jne short 066Eh
1f86:066b  jmp 07A6h
1f86:066e  mov word ptr [bp-6],1
1f86:0673  test di,1
1f86:0677  je short 067Ch
1f86:0679  jmp 07A6h
1f86:067c  or si,1
1f86:0680  mov ax,[bp-14h]
1f86:0683  mov [bp-4],ax
1f86:0686  jmp 07A6h
1f86:0689  mov word ptr [bp-18h],1
1f86:068e  test di,4
1f86:0692  je short 06A4h
1f86:0694  les bx,[bp+6]
1f86:0697  cmp byte ptr es:[bx+0Ch],0
1f86:069c  je short 06A4h
1f86:069e  or si,4
1f86:06a2  jmp short 06A8h
1f86:06a4  and si,0FFFBh
1f86:06a8  test di,1000h
1f86:06ac  je short 06C3h
1f86:06ae  mov word ptr [bp-6],1
1f86:06b3  test di,1
1f86:06b7  jne short 06C3h
1f86:06b9  xor si,1
1f86:06bd  mov ax,[bp-14h]
1f86:06c0  mov [bp-4],ax
1f86:06c3  test di,40h
1f86:06c7  je short 06DBh
1f86:06c9  mov ax,[bp+8]
1f86:06cc  mov dx,[bp+6]
1f86:06cf  mov [626Ah],ax
1f86:06d2  mov [6268h],dx
1f86:06d6  mov word ptr [bp-8],1
1f86:06db  mov [6270h],di
1f86:06df  jmp 07A6h
1f86:06e2  cmp di,[6270h]
1f86:06e6  je short 06EBh
1f86:06e8  jmp 07A6h
1f86:06eb  test di,4000h
1f86:06ef  je short 0706h
1f86:06f1  mov word ptr [bp-6],1
1f86:06f6  test di,1
1f86:06fa  je short 0706h
1f86:06fc  xor si,1
1f86:0700  mov ax,[bp-14h]
1f86:0703  mov [bp-4],ax
1f86:0706  test di,2
1f86:070a  jne short 070Fh
1f86:070c  jmp 07A6h
1f86:070f  test si,1
1f86:0713  jne short 0718h
1f86:0715  jmp 07A6h
1f86:0718  and si,0FFFEh
1f86:071c  jmp 07A6h
1f86:071f  and si,0FFF9h
1f86:0723  test di,40h
1f86:0727  je short 0796h
1f86:0729  mov ax,[6268h]
1f86:072c  or ax,[626Ah]
1f86:0730  je short 0796h
1f86:0732  cmp word ptr [bp-8],0
1f86:0736  jne short 0796h
1f86:0738  test di,80h
1f86:073c  jne short 0796h
1f86:073e  cmp word ptr [bp-0Eh],0
1f86:0742  je short 075Bh
1f86:0744  mov bx,[6385h]
1f86:0748  shl bx,1
1f86:074a  mov ax,[bx+6270h]
1f86:074e  mov [bp-16h],ax
1f86:0751  test [bp-16h],di
1f86:0754  je short 075Bh
1f86:0756  mov word ptr [bp-6],1
1f86:075b  cmp word ptr [bp-10h],0
1f86:075f  je short 077Eh
1f86:0761  cmp word ptr [bp-6],0
1f86:0765  jne short 077Eh
1f86:0767  mov bx,[6387h]
1f86:076b  shl bx,1
1f86:076d  mov ax,[bx+6278h]
1f86:0771  mov [bp-16h],ax
1f86:0774  test [bp-16h],di
1f86:0777  je short 077Eh
1f86:0779  mov word ptr [bp-6],1
1f86:077e  cmp word ptr [bp-6],0
1f86:0782  jne short 0796h
1f86:0784  mov word ptr [626Ah],0
1f86:078a  mov word ptr [6268h],0
1f86:0790  mov word ptr [626Ch],1
1f86:0796  test di,2
1f86:079a  je short 07A6h
1f86:079c  test si,1
1f86:07a0  je short 07A6h
1f86:07a2  and si,0FFFEh
1f86:07a6  les bx,[bp+6]
1f86:07a9  mov es:[bx+2Eh],si
1f86:07ad  mov es:[bx+0Eh],di
1f86:07b1  mov ax,si
1f86:07b3  and ax,8
1f86:07b6  neg ax
1f86:07b8  sbb ax,ax
1f86:07ba  inc ax
1f86:07bb  mov dx,si
1f86:07bd  and dx,1
1f86:07c1  neg dx
1f86:07c3  sbb dx,dx
1f86:07c5  inc dx
1f86:07c6  cmp ax,dx
1f86:07c8  jne short 07E3h
1f86:07ca  mov ax,si
1f86:07cc  and ax,10h
1f86:07cf  neg ax
1f86:07d1  sbb ax,ax
1f86:07d3  inc ax
1f86:07d4  mov dx,si
1f86:07d6  and dx,4
1f86:07da  neg dx
1f86:07dc  sbb dx,dx
1f86:07de  inc dx
1f86:07df  cmp ax,dx
1f86:07e1  je short 07F1h
1f86:07e3  push word ptr [bp+8]
1f86:07e6  push word ptr [bp+6]
1f86:07e9  call far 08D5h,1F86h
1f86:07ee  add sp,4
1f86:07f1  cmp word ptr [bp-6],0
1f86:07f5  je short 0819h
1f86:07f7  les bx,[bp+6]
1f86:07fa  mov ax,es:[bx+30h]
1f86:07fe  or ax,es:[bx+32h]
1f86:0802  je short 0819h
1f86:0804  push word ptr [bp+8]
1f86:0807  push word ptr [bp+6]
1f86:080a  call far dword ptr es:[bx+30h]
1f86:080e  add sp,4
1f86:0811  neg ax
1f86:0813  sbb ax,ax
1f86:0815  inc ax
1f86:0816  mov [bp-2],ax
1f86:0819  test si,2
1f86:081d  je short 082Ah
1f86:081f  test di,20h
1f86:0823  je short 082Ah
1f86:0825  mov word ptr [bp-2],0
1f86:082a  mov ax,[6268h]
1f86:082d  or ax,[626Ah]
1f86:0831  je short 0864h
1f86:0833  cmp word ptr [bp-0Eh],0
1f86:0837  je short 0840h
1f86:0839  cmp word ptr [6385h],3
1f86:083e  je short 084Dh
1f86:0840  cmp word ptr [bp-10h],0
1f86:0844  je short 0864h
1f86:0846  cmp word ptr [6387h],3
1f86:084b  jne short 0864h
1f86:084d  mov word ptr [626Ah],0
1f86:0853  mov word ptr [6268h],0
1f86:0859  mov word ptr [626Ch],1
1f86:085f  mov word ptr [bp-2],0
1f86:0864  mov ax,[6268h]
1f86:0867  or ax,[626Ah]
1f86:086b  je short 0873h
1f86:086d  cmp word ptr [bp-8],0
1f86:0871  je short 0896h
1f86:0873  cmp word ptr [bp-2],0
1f86:0877  je short 088Dh
1f86:0879  les bx,[bp+6]
1f86:087c  mov ax,es:[bx+2]
1f86:0880  mov dx,es:[bx]
1f86:0883  mov [bp+8],ax
1f86:0886  mov [bp+6],dx
1f86:0889  or dx,ax
1f86:088b  je short 0896h
1f86:088d  cmp word ptr [bp-2],0
1f86:0891  je short 0896h
1f86:0893  jmp 02D7h
1f86:0896  cmp word ptr [6385h],1
1f86:089b  je short 08A4h
1f86:089d  cmp word ptr [6387h],1
1f86:08a2  jne short 08B0h
1f86:08a4  cmp word ptr [bp-18h],0
1f86:08a8  jne short 08B0h
1f86:08aa  mov word ptr [6270h],0FFFFh
1f86:08b0  cmp word ptr [bp-4],0
1f86:08b4  jne short 08BCh
1f86:08b6  mov ax,[bp+0Ah]
1f86:08b9  mov [bp-4],ax
1f86:08bc  mov ax,[bp-4]
1f86:08bf  pop di
1f86:08c0  pop si
1f86:08c1  mov sp,bp
1f86:08c3  pop bp
1f86:08c4  ret far

; Candidate 1f86:08d5, file offset 0x23335
1f86:08d5  push bp
1f86:08d6  mov bp,sp
1f86:08d8  sub sp,2Eh
1f86:08db  push si
1f86:08dc  push di
1f86:08dd  les bx,[bp+6]
1f86:08e0  mov al,es:[bx+0Ah]
1f86:08e4  mov ah,0
1f86:08e6  mov [bp-2],ax
1f86:08e9  mov al,es:[bx+0Ch]
1f86:08ed  mov ah,0
1f86:08ef  mov [bp-8],ax
1f86:08f2  mov al,es:[bx+0Bh]
1f86:08f6  mov ah,0
1f86:08f8  mov [bp-0Ah],ax
1f86:08fb  cmp word ptr [bp-2],0
1f86:08ff  jne short 0910h
1f86:0901  cmp word ptr [bp-8],0
1f86:0905  jne short 0910h
1f86:0907  cmp word ptr [bp-0Ah],0
1f86:090b  jne short 0910h
1f86:090d  jmp 0D96h
1f86:0910  les bx,[bp+6]
1f86:0913  mov ax,es:[bx+0Eh]
1f86:0917  and ax,18h
1f86:091a  cmp ax,18h
1f86:091d  jne short 0922h
1f86:091f  jmp 0D96h
1f86:0922  les bx,[bp+6]
1f86:0925  mov ax,es:[bx+2Eh]
1f86:0929  and ax,4
1f86:092c  mov [bp-4],ax
1f86:092f  mov ax,es:[bx+2Eh]
1f86:0933  and ax,1
1f86:0936  mov [bp-6],ax
1f86:0939  mov ax,es:[bx+2Eh]
1f86:093d  and ax,10h
1f86:0940  mov [bp-12h],ax
1f86:0943  mov ax,es:[bx+2Eh]
1f86:0947  and ax,8
1f86:094a  mov [bp-14h],ax
1f86:094d  mov ax,es:[bx+1Ch]
1f86:0951  mov [bp-0Ch],ax
1f86:0954  xor si,si
1f86:0956  cmp word ptr es:[bx+1Eh],0
1f86:095b  jge short 0970h
1f86:095d  mov bx,[bp-0Ch]
1f86:0960  mov cl,4
1f86:0962  shl bx,cl
1f86:0964  mov ax,[bx+1D00h]
1f86:0968  shl ax,1
1f86:096a  shl ax,1
1f86:096c  shl ax,1
1f86:096e  add si,ax
1f86:0970  les bx,[bp+6]
1f86:0973  add si,es:[bx+1Eh]
1f86:0977  mov [bp-0Eh],si
1f86:097a  mov bx,[bp-0Ch]
1f86:097d  mov cl,4
1f86:097f  shl bx,cl
1f86:0981  mov ax,[bx+1CFCh]
1f86:0985  shl ax,1
1f86:0987  shl ax,1
1f86:0989  shl ax,1
1f86:098b  add si,ax
1f86:098d  xor di,di
1f86:098f  mov bx,[bp+6]
1f86:0992  cmp word ptr es:[bx+20h],0
1f86:0997  jge short 09A2h
1f86:0999  mov bx,[bp-0Ch]
1f86:099c  shl bx,cl
1f86:099e  add di,[bx+1D02h]
1f86:09a2  les bx,[bp+6]
1f86:09a5  add di,es:[bx+20h]
1f86:09a9  mov [bp-10h],di
1f86:09ac  mov bx,[bp-0Ch]
1f86:09af  mov cl,4
1f86:09b1  shl bx,cl
1f86:09b3  add di,[bx+1CFEh]
1f86:09b7  mov bx,[bp+6]
1f86:09ba  mov ax,es:[bx+22h]
1f86:09be  mov [bp-18h],ax
1f86:09c1  mov ax,es:[bx+24h]
1f86:09c5  mov [bp-1Ah],ax
1f86:09c8  mov ax,es:[bx+12h]
1f86:09cc  mov dx,es:[bx+10h]
1f86:09d0  mov [bp-28h],ax
1f86:09d3  mov [bp-2Ah],dx
1f86:09d6  mov ax,es:[bx+16h]
1f86:09da  mov dx,es:[bx+14h]
1f86:09de  mov [bp-24h],ax
1f86:09e1  mov [bp-26h],dx
1f86:09e4  mov ax,es:[bx+1Ah]
1f86:09e8  mov dx,es:[bx+18h]
1f86:09ec  mov [bp-2Ch],ax
1f86:09ef  mov [bp-2Eh],dx
1f86:09f2  mov al,es:[bx+28h]
1f86:09f6  mov ah,0
1f86:09f8  mov [bp-20h],ax
1f86:09fb  mov al,es:[bx+29h]
1f86:09ff  mov ah,0
1f86:0a01  mov [bp-22h],ax
1f86:0a04  mov ax,si
1f86:0a06  add ax,[bp-18h]
1f86:0a09  dec ax
1f86:0a0a  mov [bp-1Ch],ax
1f86:0a0d  mov ax,di
1f86:0a0f  add ax,[bp-1Ah]
1f86:0a12  dec ax
1f86:0a13  mov [bp-1Eh],ax
1f86:0a16  mov ax,di
1f86:0a18  add ax,[bp-1Ah]
1f86:0a1b  push ax
1f86:0a1c  mov ax,si
1f86:0a1e  add ax,[bp-18h]
1f86:0a21  push ax
1f86:0a22  push di
1f86:0a23  push si
1f86:0a24  call far 0206h,238Bh
1f86:0a29  add sp,8
1f86:0a2c  cmp word ptr [bp-6],0
1f86:0a30  jne short 0A35h
1f86:0a32  jmp 0B20h
1f86:0a35  cmp word ptr [bp-0Ah],1
1f86:0a39  je short 0A3Eh
1f86:0a3b  jmp 0AC5h
1f86:0a3e  cmp word ptr [bp-2],1
1f86:0a42  jne short 0A62h
1f86:0a44  push word ptr [bp-0Ch]
1f86:0a47  push word ptr [bp-10h]
1f86:0a4a  push word ptr [bp-0Eh]
1f86:0a4d  push word ptr [bp-24h]
1f86:0a50  push word ptr [bp-26h]
1f86:0a53  push word ptr [62A5h]
1f86:0a57  call far 004Ah,1DA3h
1f86:0a5c  add sp,0Ch
1f86:0a5f  jmp 0B20h
1f86:0a62  cmp word ptr [bp-2],2
1f86:0a66  jne short 0A89h
1f86:0a68  cmp word ptr [bp-4],0
1f86:0a6c  je short 0A71h
1f86:0a6e  jmp 0B20h
1f86:0a71  push word ptr [bp-22h]
1f86:0a74  push word ptr [bp-20h]
1f86:0a77  push di
1f86:0a78  push si
1f86:0a79  push word ptr [bp-24h]
1f86:0a7c  push word ptr [bp-26h]
1f86:0a7f  call far dword ptr [65F2h]
1f86:0a83  add sp,0Ch
1f86:0a86  jmp 0B20h
1f86:0a89  cmp word ptr [bp-2],3
1f86:0a8d  jne short 0AA9h
1f86:0a8f  push di
1f86:0a90  mov ax,si
1f86:0a92  sar ax,1
1f86:0a94  sar ax,1
1f86:0a96  sar ax,1
1f86:0a98  push ax
1f86:0a99  les bx,[bp+6]
1f86:0a9c  push word ptr es:[bx+36h]
1f86:0aa0  call far dword ptr [656Eh]
1f86:0aa4  add sp,6
1f86:0aa7  jmp short 0B20h
1f86:0aa9  cmp word ptr [bp-2],4
1f86:0aad  jne short 0B20h
1f86:0aaf  mov ax,[bp-26h]
1f86:0ab2  or ax,[bp-24h]
1f86:0ab5  je short 0B20h
1f86:0ab7  push word ptr [bp+8]
1f86:0aba  push word ptr [bp+6]
1f86:0abd  call far dword ptr [bp-26h]
1f86:0ac0  add sp,4
1f86:0ac3  jmp short 0B20h
1f86:0ac5  cmp word ptr [bp-0Ah],2
1f86:0ac9  jne short 0AE6h
1f86:0acb  cmp word ptr [bp-4],0
1f86:0acf  jne short 0B20h
1f86:0ad1  push word ptr [bp-20h]
1f86:0ad4  push word ptr [bp-1Eh]
1f86:0ad7  push word ptr [bp-1Ch]
1f86:0ada  push di
1f86:0adb  push si
1f86:0adc  call far 0,1D9Eh
1f86:0ae1  add sp,0Ah
1f86:0ae4  jmp short 0B20h
1f86:0ae6  cmp word ptr [bp-0Ah],3
1f86:0aea  jne short 0B06h
1f86:0aec  cmp word ptr [bp-4],0
1f86:0af0  jne short 0B20h
1f86:0af2  push word ptr [bp-20h]
1f86:0af5  push word ptr [bp-1Eh]
1f86:0af8  push word ptr [bp-1Ch]
1f86:0afb  push di
1f86:0afc  push si
1f86:0afd  call far dword ptr [6572h]
1f86:0b01  add sp,0Ah
1f86:0b04  jmp short 0B20h
1f86:0b06  cmp word ptr [bp-0Ah],4
1f86:0b0a  jne short 0B20h
1f86:0b0c  mov ax,[bp-26h]
1f86:0b0f  or ax,[bp-24h]
1f86:0b12  je short 0B20h
1f86:0b14  push word ptr [bp+8]
1f86:0b17  push word ptr [bp+6]
1f86:0b1a  call far dword ptr [bp-26h]
1f86:0b1d  add sp,4
1f86:0b20  cmp word ptr [bp-4],0
1f86:0b24  jne short 0B29h
1f86:0b26  jmp 0C71h
1f86:0b29  cmp word ptr [bp-8],1
1f86:0b2d  je short 0B32h
1f86:0b2f  jmp 0BECh
1f86:0b32  cmp word ptr [bp-2],1
1f86:0b36  jne short 0B56h
1f86:0b38  push word ptr [bp-0Ch]
1f86:0b3b  push word ptr [bp-10h]
1f86:0b3e  push word ptr [bp-0Eh]
1f86:0b41  push word ptr [bp-2Ch]
1f86:0b44  push word ptr [bp-2Eh]
1f86:0b47  push word ptr [62A5h]
1f86:0b4b  call far 004Ah,1DA3h
1f86:0b50  add sp,0Ch
1f86:0b53  jmp 0C71h
1f86:0b56  cmp word ptr [bp-2],2
1f86:0b5a  jne short 0BA8h
1f86:0b5c  cmp word ptr [bp-6],0
1f86:0b60  je short 0B85h
1f86:0b62  les bx,[bp+6]
1f86:0b65  mov al,es:[bx+2Dh]
1f86:0b69  mov ah,0
1f86:0b6b  push ax
1f86:0b6c  mov al,es:[bx+2Ch]
1f86:0b70  mov ah,0
1f86:0b72  push ax
1f86:0b73  push di
1f86:0b74  push si
1f86:0b75  push word ptr [bp-2Ch]
1f86:0b78  push word ptr [bp-2Eh]
1f86:0b7b  call far dword ptr [65F2h]
1f86:0b7f  add sp,0Ch
1f86:0b82  jmp 0C71h
1f86:0b85  les bx,[bp+6]
1f86:0b88  mov al,es:[bx+2Bh]
1f86:0b8c  mov ah,0
1f86:0b8e  push ax
1f86:0b8f  mov al,es:[bx+2Ah]
1f86:0b93  mov ah,0
1f86:0b95  push ax
1f86:0b96  push di
1f86:0b97  push si
1f86:0b98  push word ptr [bp-2Ch]
1f86:0b9b  push word ptr [bp-2Eh]
1f86:0b9e  call far dword ptr [65F2h]
1f86:0ba2  add sp,0Ch
1f86:0ba5  jmp 0C71h
1f86:0ba8  cmp word ptr [bp-2],3
1f86:0bac  jne short 0BC9h
1f86:0bae  push di
1f86:0baf  mov ax,si
1f86:0bb1  sar ax,1
1f86:0bb3  sar ax,1
1f86:0bb5  sar ax,1
1f86:0bb7  push ax
1f86:0bb8  les bx,[bp+6]
1f86:0bbb  push word ptr es:[bx+36h]
1f86:0bbf  call far dword ptr [656Eh]
1f86:0bc3  add sp,6
1f86:0bc6  jmp 0C71h
1f86:0bc9  cmp word ptr [bp-2],4
1f86:0bcd  je short 0BD2h
1f86:0bcf  jmp 0C71h
1f86:0bd2  mov ax,[bp-2Eh]
1f86:0bd5  or ax,[bp-2Ch]
1f86:0bd8  jne short 0BDDh
1f86:0bda  jmp 0C71h
1f86:0bdd  push word ptr [bp+8]
1f86:0be0  push word ptr [bp+6]
1f86:0be3  call far dword ptr [bp-2Eh]
1f86:0be6  add sp,4
1f86:0be9  jmp 0C71h
1f86:0bec  cmp word ptr [bp-8],2
1f86:0bf0  jne short 0C22h
1f86:0bf2  cmp word ptr [bp-6],0
1f86:0bf6  je short 0C01h
1f86:0bf8  les bx,[bp+6]
1f86:0bfb  mov al,es:[bx+2Ch]
1f86:0bff  jmp short 0C08h
1f86:0c01  les bx,[bp+6]
1f86:0c04  mov al,es:[bx+2Ah]
1f86:0c08  mov ah,0
1f86:0c0a  mov [bp-16h],ax
1f86:0c0d  push word ptr [bp-16h]
1f86:0c10  push word ptr [bp-1Eh]
1f86:0c13  push word ptr [bp-1Ch]
1f86:0c16  push di
1f86:0c17  push si
1f86:0c18  call far 0,1D9Eh
1f86:0c1d  add sp,0Ah
1f86:0c20  jmp short 0C71h
1f86:0c22  cmp word ptr [bp-8],3
1f86:0c26  jne short 0C57h
1f86:0c28  cmp word ptr [bp-6],0
1f86:0c2c  je short 0C37h
1f86:0c2e  les bx,[bp+6]
1f86:0c31  mov al,es:[bx+2Ch]
1f86:0c35  jmp short 0C3Eh
1f86:0c37  les bx,[bp+6]
1f86:0c3a  mov al,es:[bx+2Ah]
1f86:0c3e  mov ah,0
1f86:0c40  mov [bp-16h],ax
1f86:0c43  push word ptr [bp-16h]
1f86:0c46  push word ptr [bp-1Eh]
1f86:0c49  push word ptr [bp-1Ch]
1f86:0c4c  push di
1f86:0c4d  push si
1f86:0c4e  call far dword ptr [6572h]
1f86:0c52  add sp,0Ah
1f86:0c55  jmp short 0C71h
1f86:0c57  cmp word ptr [bp-8],4
1f86:0c5b  jne short 0C71h
1f86:0c5d  mov ax,[bp-2Eh]
1f86:0c60  or ax,[bp-2Ch]
1f86:0c63  je short 0C71h
1f86:0c65  push word ptr [bp+8]
1f86:0c68  push word ptr [bp+6]
1f86:0c6b  call far dword ptr [bp-2Eh]
1f86:0c6e  add sp,4
1f86:0c71  cmp word ptr [bp-4],0
1f86:0c75  je short 0C7Ah
1f86:0c77  jmp 0D91h
1f86:0c7a  cmp word ptr [bp-6],0
1f86:0c7e  je short 0C83h
1f86:0c80  jmp 0D91h
1f86:0c83  cmp word ptr [bp-2],1
1f86:0c87  jne short 0CA7h
1f86:0c89  push word ptr [bp-0Ch]
1f86:0c8c  push word ptr [bp-10h]
1f86:0c8f  push word ptr [bp-0Eh]
1f86:0c92  push word ptr [bp-28h]
1f86:0c95  push word ptr [bp-2Ah]
1f86:0c98  push word ptr [62A5h]
1f86:0c9c  call far 004Ah,1DA3h
1f86:0ca1  add sp,0Ch
1f86:0ca4  jmp 0D91h
1f86:0ca7  cmp word ptr [bp-2],2
1f86:0cab  jne short 0CD0h
1f86:0cad  les bx,[bp+6]
1f86:0cb0  mov al,es:[bx+27h]
1f86:0cb4  mov ah,0
1f86:0cb6  push ax
1f86:0cb7  mov al,es:[bx+26h]
1f86:0cbb  mov ah,0
1f86:0cbd  push ax
1f86:0cbe  push di
1f86:0cbf  push si
1f86:0cc0  push word ptr [bp-28h]
1f86:0cc3  push word ptr [bp-2Ah]
1f86:0cc6  call far dword ptr [65F2h]
1f86:0cca  add sp,0Ch
1f86:0ccd  jmp 0D91h
1f86:0cd0  cmp word ptr [bp-2],3
1f86:0cd4  jne short 0CF1h
1f86:0cd6  push di
1f86:0cd7  mov ax,si
1f86:0cd9  sar ax,1
1f86:0cdb  sar ax,1
1f86:0cdd  sar ax,1
1f86:0cdf  push ax
1f86:0ce0  les bx,[bp+6]
1f86:0ce3  push word ptr es:[bx+34h]
1f86:0ce7  call far dword ptr [656Eh]
1f86:0ceb  add sp,6
1f86:0cee  jmp 0D91h
1f86:0cf1  cmp word ptr [bp-2],4
1f86:0cf5  jne short 0D11h
1f86:0cf7  mov ax,[bp-2Ah]
1f86:0cfa  or ax,[bp-28h]
1f86:0cfd  jne short 0D02h
1f86:0cff  jmp 0D91h
1f86:0d02  push word ptr [bp+8]
1f86:0d05  push word ptr [bp+6]
1f86:0d08  call far dword ptr [bp-2Ah]
1f86:0d0b  add sp,4
1f86:0d0e  jmp 0D91h
1f86:0d11  cmp word ptr [bp-2],5
1f86:0d15  jne short 0D30h
1f86:0d17  les bx,[bp+6]
1f86:0d1a  mov al,es:[bx+26h]
1f86:0d1e  mov ah,0
1f86:0d20  push ax
1f86:0d21  push word ptr [bp-1Eh]
1f86:0d24  push word ptr [bp-1Ch]
1f86:0d27  push di
1f86:0d28  push si
1f86:0d29  call far 0,1D9Eh
1f86:0d2e  jmp short 0D8Eh
1f86:0d30  cmp word ptr [bp-2],0
1f86:0d34  jne short 0D91h
1f86:0d36  cmp word ptr [bp-0Ah],2
1f86:0d3a  je short 0D42h
1f86:0d3c  cmp word ptr [bp-8],2
1f86:0d40  jne short 0D5Bh
1f86:0d42  les bx,[bp+6]
1f86:0d45  mov al,es:[bx+26h]
1f86:0d49  mov ah,0
1f86:0d4b  push ax
1f86:0d4c  push word ptr [bp-1Eh]
1f86:0d4f  push word ptr [bp-1Ch]
1f86:0d52  push di
1f86:0d53  push si
1f86:0d54  call far 0,1D9Eh
1f86:0d59  jmp short 0D8Eh
1f86:0d5b  cmp word ptr [bp-0Ah],3
1f86:0d5f  jne short 0D6Ch
1f86:0d61  cmp word ptr [bp-14h],0
1f86:0d65  je short 0D6Ch
1f86:0d67  push word ptr [bp-20h]
1f86:0d6a  jmp short 0D82h
1f86:0d6c  cmp word ptr [bp-8],3
1f86:0d70  jne short 0D91h
1f86:0d72  cmp word ptr [bp-12h],0
1f86:0d76  je short 0D91h
1f86:0d78  les bx,[bp+6]
1f86:0d7b  mov al,es:[bx+2Ah]
1f86:0d7f  mov ah,0
1f86:0d81  push ax
1f86:0d82  push word ptr [bp-1Eh]
1f86:0d85  push word ptr [bp-1Ch]
1f86:0d88  push di
1f86:0d89  push si
1f86:0d8a  call far dword ptr [6572h]
1f86:0d8e  add sp,0Ah
1f86:0d91  call far 02CAh,238Bh
1f86:0d96  pop di
1f86:0d97  pop si
1f86:0d98  mov sp,bp
1f86:0d9a  pop bp
1f86:0d9b  ret far

; Candidate 1f86:0d9c, file offset 0x237fc
1f86:0d9c  push bp
1f86:0d9d  mov bp,sp
1f86:0d9f  mov ax,[bp+0Ah]
1f86:0da2  mov dx,[bp+8]
1f86:0da5  mov [0F04Eh],ax
1f86:0da8  mov [0F04Ch],dx
1f86:0dac  pop bp
1f86:0dad  ret far

; Candidate 2060:000e, file offset 0x2380e
2060:000e  push bp
2060:000f  mov bp,sp
2060:0011  sub sp,1Eh
2060:0014  mov ax,0Ah
2060:0017  push ax
2060:0018  push ss
2060:0019  lea ax,[bp-1Eh]
2060:001c  push ax
2060:001d  push word ptr [bp+6]
2060:0020  call far 704Ah,0
2060:0025  add sp,8
2060:0028  push word ptr [bp+0Eh]
2060:002b  push word ptr [bp+0Ch]
2060:002e  push word ptr [bp+0Ah]
2060:0031  push word ptr [bp+8]
2060:0034  push ss
2060:0035  lea ax,[bp-1Eh]
2060:0038  push ax
2060:0039  call far dword ptr [65F2h]
2060:003d  add sp,0Ch
2060:0040  mov sp,bp
2060:0042  pop bp
2060:0043  ret far

; Candidate 2064:0004, file offset 0x23844
2064:0004  push bp
2064:0005  mov bp,sp
2064:0007  dec sp
2064:0008  dec sp
2064:0009  push si
2064:000a  push di
2064:000b  mov si,[bp+6]
2064:000e  mov di,[bp+8]
2064:0011  cmp si,di
2064:0013  jbe short 001Dh
2064:0015  mov [bp-2],si
2064:0018  mov si,di
2064:001a  mov di,[bp-2]
2064:001d  xor ax,ax
2064:001f  mov dx,8000h
2064:0022  push ax
2064:0023  push dx
2064:0024  call far 62A3h,0
2064:0029  cwd
2064:002a  push ax
2064:002b  mov ax,di
2064:002d  sub ax,si
2064:002f  inc ax
2064:0030  push dx
2064:0031  xor dx,dx
2064:0033  pop cx
2064:0034  pop bx
2064:0035  call far 8537h,0
2064:003a  push dx
2064:003b  push ax
2064:003c  call far 8551h,0
2064:0041  add ax,si
2064:0043  mov [bp-2],ax
2064:0046  cmp ax,di
2064:0048  ja short 001Dh
2064:004a  pop di
2064:004b  pop si
2064:004c  mov sp,bp
2064:004e  pop bp
2064:004f  ret far

; Candidate 2069:0000, file offset 0x23890
2069:0000  push bp
2069:0001  mov bp,sp
2069:0003  push si
2069:0004  mov ax,1
2069:0007  push ax
2069:0008  push word ptr [bp+8]
2069:000b  push word ptr [bp+6]
2069:000e  call far 0107h,1DCEh
2069:0013  add sp,6
2069:0016  mov si,ax
2069:0018  push word ptr [bp+10h]
2069:001b  push word ptr [bp+0Eh]
2069:001e  push word ptr [bp+0Ch]
2069:0021  push word ptr [bp+0Ah]
2069:0024  push si
2069:0025  call far 044Eh,1DCEh
2069:002a  add sp,0Ah
2069:002d  mov [bp+10h],dx
2069:0030  mov [bp+0Eh],ax
2069:0033  push si
2069:0034  call far 0406h,1DCEh
2069:0039  inc sp
2069:003a  inc sp
2069:003b  mov dx,[bp+10h]
2069:003e  mov ax,[bp+0Eh]
2069:0041  pop si
2069:0042  pop bp
2069:0043  ret far

; Candidate 2069:0044, file offset 0x238d4
2069:0044  push bp
2069:0045  mov bp,sp
2069:0047  sub sp,0Ah
2069:004a  push si
2069:004b  push di
2069:004c  push word ptr [bp+0Ah]
2069:004f  call far 9,1F3Eh
2069:0054  inc sp
2069:0055  inc sp
2069:0056  mov [bp-4],dx
2069:0059  mov [bp-6],ax
2069:005c  mov ax,1
2069:005f  push ax
2069:0060  push word ptr [bp+8]
2069:0063  push word ptr [bp+6]
2069:0066  call far 0107h,1DCEh
2069:006b  add sp,6
2069:006e  mov si,ax
2069:0070  xor ax,ax
2069:0072  mov dx,2
2069:0075  push ax
2069:0076  push dx
2069:0077  push ss
2069:0078  lea ax,[bp-2]
2069:007b  push ax
2069:007c  push si
2069:007d  call far 044Eh,1DCEh
2069:0082  add sp,0Ah
2069:0085  xor ax,ax
2069:0087  mov dx,8
2069:008a  push ax
2069:008b  push dx
2069:008c  push word ptr [bp-4]
2069:008f  push word ptr [bp-6]
2069:0092  push si
2069:0093  call far 044Eh,1DCEh
2069:0098  add sp,0Ah
2069:009b  sub word ptr [bp-2],8
2069:009f  les bx,[bp-6]
2069:00a2  mov di,es:[bx+6]
2069:00a6  mov ax,[bp+0Eh]
2069:00a9  or ax,[bp+10h]
2069:00ac  je short 00C7h
2069:00ae  or di,di
2069:00b0  je short 00C7h
2069:00b2  xor ax,ax
2069:00b4  push ax
2069:00b5  push di
2069:00b6  push word ptr [bp+10h]
2069:00b9  push word ptr [bp+0Eh]
2069:00bc  push si
2069:00bd  call far 044Eh,1DCEh
2069:00c2  add sp,0Ah
2069:00c5  jmp short 00D8h
2069:00c7  mov ax,1
2069:00ca  push ax
2069:00cb  xor ax,ax
2069:00cd  push ax
2069:00ce  push di
2069:00cf  push si
2069:00d0  call far 0750h,1DCEh
2069:00d5  add sp,8
2069:00d8  les bx,[bp-6]
2069:00db  mov word ptr es:[bx+6],0
2069:00e1  sub [bp-2],di
2069:00e4  mov bx,[bp+0Ah]
2069:00e7  shl bx,1
2069:00e9  mov ax,[bx+62A7h]
2069:00ed  mov [bp-8],ax
2069:00f0  mov word ptr [bp-0Ah],0
2069:00f5  mov bx,[bp+0Ah]
2069:00f8  shl bx,1
2069:00fa  shl bx,1
2069:00fc  mov ax,[bx+62E7h]
2069:0100  mov dx,[bp-2]
2069:0103  add dx,8
2069:0106  sub ax,dx
2069:0108  add [bp-0Ah],ax
2069:010b  push word ptr [bp-8]
2069:010e  push word ptr [bp-0Ah]
2069:0111  call far 0071h,2374h
2069:0116  add sp,4
2069:0119  mov [bp-8],dx
2069:011c  mov [bp-0Ah],ax
2069:011f  mov ax,[bp-8]
2069:0122  mov [bp-8],ax
2069:0125  mov word ptr [bp-0Ah],0
2069:012a  xor ax,ax
2069:012c  mov dx,8
2069:012f  push ax
2069:0130  push dx
2069:0131  push word ptr [bp-8]
2069:0134  push word ptr [bp-0Ah]
2069:0137  push word ptr [bp-4]
2069:013a  push word ptr [bp-6]
2069:013d  call far 4,2374h
2069:0142  add sp,0Ch
2069:0145  xor ax,ax
2069:0147  push ax
2069:0148  push word ptr [bp-2]
2069:014b  mov ax,[bp-0Ah]
2069:014e  add ax,8
2069:0151  push word ptr [bp-8]
2069:0154  push ax
2069:0155  push si
2069:0156  call far 044Eh,1DCEh
2069:015b  add sp,0Ah
2069:015e  push si
2069:015f  call far 0406h,1DCEh
2069:0164  inc sp
2069:0165  inc sp
2069:0166  push word ptr [bp+0Ch]
2069:0169  call far 9,1F3Eh
2069:016e  inc sp
2069:016f  inc sp
2069:0170  push dx
2069:0171  push ax
2069:0172  push word ptr [bp-8]
2069:0175  push word ptr [bp-0Ah]
2069:0178  call far 0186h,2069h
2069:017d  add sp,8
2069:0180  pop di
2069:0181  pop si
2069:0182  mov sp,bp
2069:0184  pop bp
2069:0185  ret far

; Candidate 2069:0186, file offset 0x23a16
2069:0186  push bp
2069:0187  mov bp,sp
2069:0189  sub sp,4
2069:018c  push si
2069:018d  les bx,[bp+6]
2069:0190  mov al,es:[bx]
2069:0193  mov ah,0
2069:0195  or ax,ax
2069:0197  je short 01A6h
2069:0199  cmp ax,3
2069:019c  je short 01E4h
2069:019e  cmp ax,4
2069:01a1  je short 01F4h
2069:01a3  jmp 0225h
2069:01a6  les bx,[bp+6]
2069:01a9  mov ax,es:[bx+4]
2069:01ad  mov dx,es:[bx+2]
2069:01b1  mov [bp-2],ax
2069:01b4  mov [bp-4],dx
2069:01b7  add word ptr [bp+6],6
2069:01bb  les bx,[bp+6]
2069:01be  mov si,es:[bx]
2069:01c1  add word ptr [bp+6],2
2069:01c5  add [bp+6],si
2069:01c8  push word ptr [bp-2]
2069:01cb  push word ptr [bp-4]
2069:01ce  push word ptr [bp+0Ch]
2069:01d1  push word ptr [bp+0Ah]
2069:01d4  push word ptr [bp+8]
2069:01d7  push word ptr [bp+6]
2069:01da  call far 4,2374h
2069:01df  add sp,0Ch
2069:01e2  jmp short 0225h
2069:01e4  push word ptr [bp+0Ch]
2069:01e7  push word ptr [bp+8]
2069:01ea  call far 0104h,23ECh
2069:01ef  add sp,4
2069:01f2  jmp short 021Dh
2069:01f4  add word ptr [bp+6],6
2069:01f8  les bx,[bp+6]
2069:01fb  mov si,es:[bx]
2069:01fe  add word ptr [bp+6],2
2069:0202  add [bp+6],si
2069:0205  mov ax,0FFFFh
2069:0208  push ax
2069:0209  push word ptr [bp+0Ch]
2069:020c  push word ptr [bp+0Ah]
2069:020f  push word ptr [bp+8]
2069:0212  push word ptr [bp+6]
2069:0215  call far 4,23ECh
2069:021a  add sp,0Ah
2069:021d  mov word ptr [bp-2],0
2069:0222  mov [bp-4],ax
2069:0225  mov dx,[bp-2]
2069:0228  mov ax,[bp-4]
2069:022b  pop si
2069:022c  mov sp,bp
2069:022e  pop bp
2069:022f  ret far

; Candidate 2069:0230, file offset 0x23ac0
2069:0230  push bp
2069:0231  mov bp,sp
2069:0233  pop bp
2069:0234  ret far

; Candidate 208c:0005, file offset 0x23ac5
208c:0005  push bp
208c:0006  mov bp,sp
208c:0008  sub sp,6
208c:000b  push si
208c:000c  push di
208c:000d  mov di,[bp+0Ah]
208c:0010  mov word ptr [bp-2],0
208c:0015  mov word ptr [bp-4],0
208c:001a  push word ptr [bp+8]
208c:001d  push word ptr [bp+6]
208c:0020  call far 11CFh,1DCEh
208c:0025  add sp,4
208c:0028  mov ax,8001h
208c:002b  push ax
208c:002c  push word ptr [bp+8]
208c:002f  push word ptr [bp+6]
208c:0032  call far 71EAh,0
208c:0037  add sp,6
208c:003a  mov si,ax
208c:003c  cmp si,0FFFFh
208c:003f  je short 0090h
208c:0041  mov ax,2
208c:0044  push ax
208c:0045  push ss
208c:0046  lea ax,[bp-6]
208c:0049  push ax
208c:004a  push si
208c:004b  call far 7384h,0
208c:0050  add sp,8
208c:0053  cmp ax,2
208c:0056  je short 005Eh
208c:0058  xor dx,dx
208c:005a  xor ax,ax
208c:005c  jmp short 0096h
208c:005e  mov ax,10h
208c:0061  push ax
208c:0062  xor ax,ax
208c:0064  push ax
208c:0065  push word ptr [bp-6]
208c:0068  call far 000Bh,1D0Eh
208c:006d  add sp,6
208c:0070  mov [bp-2],dx
208c:0073  mov [bp-4],ax
208c:0076  push word ptr [bp-6]
208c:0079  inc ax
208c:007a  inc ax
208c:007b  push word ptr [bp-2]
208c:007e  push ax
208c:007f  push si
208c:0080  call far 7384h,0
208c:0085  add sp,8
208c:0088  push si
208c:0089  call far 5A5Fh,0
208c:008e  inc sp
208c:008f  inc sp
208c:0090  mov dx,[bp-2]
208c:0093  mov ax,[bp-4]
208c:0096  pop di
208c:0097  pop si
208c:0098  mov sp,bp
208c:009a  pop bp
208c:009b  ret far

; Candidate 2107:0008, file offset 0x24278
2107:0008  push bp
2107:0009  mov bp,sp
2107:000b  sub sp,0Eh
2107:000e  mov ax,0Ah
2107:0011  push ax
2107:0012  push ss
2107:0013  lea ax,[bp-0Eh]
2107:0016  push ax
2107:0017  push word ptr [bp+8]
2107:001a  push word ptr [bp+6]
2107:001d  call far 7096h,0
2107:0022  add sp,0Ah
2107:0025  push word ptr [bp+10h]
2107:0028  push word ptr [bp+0Eh]
2107:002b  push word ptr [bp+0Ch]
2107:002e  push word ptr [bp+0Ah]
2107:0031  push ss
2107:0032  lea ax,[bp-0Eh]
2107:0035  push ax
2107:0036  call far dword ptr [65F2h]
2107:003a  add sp,0Ch
2107:003d  mov sp,bp
2107:003f  pop bp
2107:0040  ret far

; Candidate 210b:0001, file offset 0x242b1
210b:0001  push bp
210b:0002  mov bp,sp
210b:0004  dec sp
210b:0005  dec sp
210b:0006  mov ax,[62A5h]
210b:0009  mov [bp-2],ax
210b:000c  mov ax,[bp+6]
210b:000f  mov [62A5h],ax
210b:0012  mov ax,[bp-2]
210b:0015  mov sp,bp
210b:0017  pop bp
210b:0018  ret far

; Candidate 2111:000d, file offset 0x2431d
2111:000d  push bp
2111:000e  mov bp,sp
2111:0010  mov ax,0FFh
2111:0013  push ax
2111:0014  xor ax,ax
2111:0016  push ax
2111:0017  push word ptr [bp+8]
2111:001a  push word ptr [bp+6]
2111:001d  call far dword ptr [65E2h]
2111:0021  add sp,8
2111:0024  pop bp
2111:0025  ret far

; Candidate 212d:000b, file offset 0x244db
212d:000b  push bp
212d:000c  mov bp,sp
212d:000e  dec sp
212d:000f  dec sp
212d:0010  push si
212d:0011  push di
212d:0012  mov di,[bp+6]
212d:0015  mov ax,di
212d:0017  cmp ax,3
212d:001a  je short 001Eh
212d:001c  jmp short 0034h
212d:001e  mov ax,0FA00h
212d:0021  push ax
212d:0022  xor ax,ax
212d:0024  push ax
212d:0025  mov ax,0A000h
212d:0028  xor dx,dx
212d:002a  push ax
212d:002b  push dx
212d:002c  call far 712Bh,0
212d:0031  add sp,8
212d:0034  cmp di,8
212d:0037  jne short 003Ch
212d:0039  jmp 00DAh
212d:003c  push di
212d:003d  call far 0033h,21A9h
212d:0042  inc sp
212d:0043  inc sp
212d:0044  call far 8,2269h
212d:0049  mov bx,di
212d:004b  shl bx,1
212d:004d  shl bx,1
212d:004f  mov ax,[bx+63B1h]
212d:0053  mov dx,[bx+63AFh]
212d:0057  mov [6373h],ax
212d:005a  mov [6371h],dx
212d:005e  push word ptr [6373h]
212d:0062  push word ptr [6371h]
212d:0066  call far 11CFh,1DCEh
212d:006b  add sp,4
212d:006e  mov [bp-2],ax
212d:0071  cmp word ptr [bp-2],0
212d:0075  je short 0093h
212d:0077  push ds
212d:0078  mov ax,6371h
212d:007b  push ax
212d:007c  call far 005Dh,23CDh
212d:0081  add sp,4
212d:0084  cmp ax,0FFFFh
212d:0087  je short 008Eh
212d:0089  mov ax,1
212d:008c  jmp short 0090h
212d:008e  xor ax,ax
212d:0090  mov [bp-2],ax
212d:0093  cmp word ptr [bp-2],0
212d:0097  jne short 00DAh
212d:0099  mov ax,9
212d:009c  push ax
212d:009d  call far 0033h,21A9h
212d:00a2  inc sp
212d:00a3  inc sp
212d:00a4  push word ptr [6373h]
212d:00a8  push word ptr [6371h]
212d:00ac  push ds
212d:00ad  mov ax,6403h
212d:00b0  push ax
212d:00b1  push ds
212d:00b2  mov ax,0F16Eh
212d:00b5  push ax
212d:00b6  call far 64A1h,0
212d:00bb  add sp,0Ch
212d:00be  push ds
212d:00bf  mov ax,0F16Eh
212d:00c2  push ax
212d:00c3  call far 6,2246h
212d:00c8  add sp,4
212d:00cb  call far 0516h,2295h
212d:00d0  call far 05D0h,2295h
212d:00d5  xor ax,ax
212d:00d7  jmp 0304h
212d:00da  mov si,2
212d:00dd  jmp short 011Fh
212d:00df  mov bx,si
212d:00e1  shl bx,1
212d:00e3  shl bx,1
212d:00e5  mov ax,[bx+62EBh]
212d:00e9  or ax,[bx+62EDh]
212d:00ed  je short 011Dh
212d:00ef  or si,si
212d:00f1  je short 011Dh
212d:00f3  mov bx,si
212d:00f5  shl bx,1
212d:00f7  mov ax,[bx-0FAEh]
212d:00fb  or ax,20h
212d:00fe  push ax
212d:00ff  mov bx,si
212d:0101  shl bx,1
212d:0103  shl bx,1
212d:0105  push word ptr [bx+62EDh]
212d:0109  push word ptr [bx+62EBh]
212d:010d  call far 000Bh,1D0Eh
212d:0112  add sp,6
212d:0115  mov bx,si
212d:0117  shl bx,1
212d:0119  mov [bx+62A9h],dx
212d:011d  inc si
212d:011e  inc si
212d:011f  cmp si,10h
212d:0122  jl short 00DFh
212d:0124  mov bx,di
212d:0126  cmp bx,6
212d:0129  ja short 019Eh
212d:012b  shl bx,1
212d:012d  jmp word ptr cs:[bx+312h]
212d:0132  mov ax,0B800h
212d:0135  jmp short 0186h
212d:0137  mov word ptr [62A7h],0A000h
212d:013d  mov word ptr [62ABh],0A200h
212d:0143  mov word ptr [62AFh],0A400h
212d:0149  mov word ptr [62B3h],0A600h
212d:014f  mov word ptr [62B7h],0A800h
212d:0155  mov word ptr [62BBh],0AA00h
212d:015b  mov word ptr [62BFh],0AC00h
212d:0161  mov word ptr [62C3h],0AE00h
212d:0167  jmp short 019Eh
212d:0169  mov word ptr [62A7h],0A000h
212d:016f  mov word ptr [62ABh],0A400h
212d:0175  mov word ptr [62AFh],0A800h
212d:017b  mov word ptr [62B3h],0AC00h
212d:0181  jmp short 019Eh
212d:0183  mov ax,0A000h
212d:0186  mov [62A9h],ax
212d:0189  mov [62A7h],ax
212d:018c  mov ax,[62ADh]
212d:018f  mov [62ABh],ax
212d:0192  mov ax,[62B1h]
212d:0195  mov [62AFh],ax
212d:0198  mov ax,[62B5h]
212d:019b  mov [62B3h],ax
212d:019e  cmp di,8
212d:01a1  je short 0218h
212d:01a3  call far dword ptr [655Ah]
212d:01a7  mov ax,[bp+8]
212d:01aa  or ax,[bp+0Ah]
212d:01ad  je short 0218h
212d:01af  mov ax,8
212d:01b2  push ax
212d:01b3  push word ptr [bp+0Ah]
212d:01b6  push word ptr [bp+8]
212d:01b9  call far 5,208Ch
212d:01be  add sp,6
212d:01c1  mov [0F09Ah],dx
212d:01c5  mov [0F098h],ax
212d:01c8  or ax,[0F09Ah]
212d:01cc  jne short 0208h
212d:01ce  mov ax,9
212d:01d1  push ax
212d:01d2  call far 0033h,21A9h
212d:01d7  inc sp
212d:01d8  inc sp
212d:01d9  push word ptr [bp+0Ah]
212d:01dc  push word ptr [bp+8]
212d:01df  push ds
212d:01e0  mov ax,6445h
212d:01e3  push ax
212d:01e4  push ds
212d:01e5  mov ax,0F16Eh
212d:01e8  push ax
212d:01e9  call far 64A1h,0
212d:01ee  add sp,0Ch
212d:01f1  push ds
212d:01f2  mov ax,0F16Eh
212d:01f5  push ax
212d:01f6  call far 6,2246h
212d:01fb  add sp,4
212d:01fe  call far 05D0h,2295h
212d:0203  xor ax,ax
212d:0205  jmp 0304h
212d:0208  push word ptr [0F09Ah]
212d:020c  push word ptr [0F098h]
212d:0210  call far 000Ah,2166h
212d:0215  add sp,4
212d:0218  mov ax,10h
212d:021b  push ax
212d:021c  xor ax,ax
212d:021e  mov dx,300h
212d:0221  push ax
212d:0222  push dx
212d:0223  call far 000Bh,1D0Eh
212d:0228  add sp,6
212d:022b  mov [0F16Ah],dx
212d:022f  mov [0F168h],ax
212d:0232  mov bx,di
212d:0234  dec bx
212d:0235  dec bx
212d:0236  cmp bx,3
212d:0239  jbe short 023Eh
212d:023b  jmp 02D2h
212d:023e  shl bx,1
212d:0240  jmp word ptr cs:[bx+30Ah]
212d:0245  mov ax,10h
212d:0248  push ax
212d:0249  push ds
212d:024a  mov ax,639Fh
212d:024d  push ax
212d:024e  push word ptr [0F16Ah]
212d:0252  push word ptr [0F168h]
212d:0256  call far 70E3h,0
212d:025b  add sp,0Ah
212d:025e  mov ax,10h
212d:0261  push ax
212d:0262  xor ax,ax
212d:0264  push ax
212d:0265  push word ptr [0F16Ah]
212d:0269  push word ptr [0F168h]
212d:026d  call far dword ptr [65E2h]
212d:0271  add sp,8
212d:0274  jmp short 02D2h
212d:0276  mov ax,10h
212d:0279  push ax
212d:027a  push ds
212d:027b  mov ax,638Fh
212d:027e  push ax
212d:027f  push word ptr [0F16Ah]
212d:0283  push word ptr [0F168h]
212d:0287  call far 70E3h,0
212d:028c  add sp,0Ah
212d:028f  mov ax,10h
212d:0292  push ax
212d:0293  xor ax,ax
212d:0295  push ax
212d:0296  push word ptr [0F16Ah]
212d:029a  push word ptr [0F168h]
212d:029e  call far dword ptr [65E2h]
212d:02a2  add sp,8
212d:02a5  jmp short 02D2h
212d:02a7  mov ax,3
212d:02aa  push ax
212d:02ab  mov ax,3Fh
212d:02ae  push ax
212d:02af  mov ax,[0F168h]
212d:02b2  add ax,2Dh
212d:02b5  push word ptr [0F16Ah]
212d:02b9  push ax
212d:02ba  call far 712Bh,0
212d:02bf  add sp,8
212d:02c2  push word ptr [0F16Ah]
212d:02c6  push word ptr [0F168h]
212d:02ca  call far 000Dh,2111h
212d:02cf  add sp,4
212d:02d2  call far 127Ch,1DCEh
212d:02d7  mov byte ptr [638Eh],1
212d:02dc  call far 3,1F7Ah
212d:02e1  xor ax,ax
212d:02e3  xor dx,dx
212d:02e5  push ax
212d:02e6  push dx
212d:02e7  call far 6524h,0
212d:02ec  add sp,4
212d:02ef  push ax
212d:02f0  call far 6292h,0
212d:02f5  inc sp
212d:02f6  inc sp
212d:02f7  xor ax,ax
212d:02f9  push ax
212d:02fa  call far 0133h,21B0h
212d:02ff  inc sp
212d:0300  inc sp
212d:0301  mov ax,1
212d:0304  pop di
212d:0305  pop si
212d:0306  mov sp,bp
212d:0308  pop bp
212d:0309  ret far

; Candidate 215f:0000, file offset 0x247f0
215f:0000  push bp
215f:0001  mov bp,sp
215f:0003  call far 024Eh,1C9Fh
215f:0008  cmp byte ptr [6654h],0
215f:000d  je short 0014h
215f:000f  call far 01F2h,2269h
215f:0014  cmp byte ptr [638Eh],0
215f:0019  je short 0020h
215f:001b  call far 128Dh,1DCEh
215f:0020  call far 0036h,23E1h
215f:0025  call far 0A91h,2295h
215f:002a  mov ax,[6282h]
215f:002d  or ax,[6284h]
215f:0031  je short 0037h
215f:0033  call far dword ptr [6282h]
215f:0037  call far 000Ch,21A9h
215f:003c  cmp ax,[64ECh]
215f:0040  je short 004Dh
215f:0042  mov ax,9
215f:0045  push ax
215f:0046  call far 0033h,21A9h
215f:004b  inc sp
215f:004c  inc sp
215f:004d  call far 82B0h,0
215f:0052  cmp ax,0FFFFh
215f:0055  jne short 0064h
215f:0057  push ds
215f:0058  mov ax,6474h
215f:005b  push ax
215f:005c  call far 6,2246h
215f:0061  add sp,4
215f:0064  push word ptr [0F1C2h]
215f:0068  push word ptr [0F1C0h]
215f:006c  mov ax,3Fh
215f:006f  push ax
215f:0070  call far 6DA4h,0
215f:0075  add sp,6
215f:0078  pop bp
215f:0079  ret far

; Candidate 2166:000a, file offset 0x2486a
2166:000a  push bp
2166:000b  mov bp,sp
2166:000d  sub sp,4
2166:0010  mov ax,[0F092h]
2166:0013  mov dx,[0F090h]
2166:0017  mov [bp-2],ax
2166:001a  mov [bp-4],dx
2166:001d  mov ax,[bp+6]
2166:0020  or ax,[bp+8]
2166:0023  je short 0068h
2166:0025  mov ax,[bp+8]
2166:0028  mov dx,[bp+6]
2166:002b  mov [0F092h],ax
2166:002e  mov [0F090h],dx
2166:0032  les bx,[bp+6]
2166:0035  mov al,es:[bx+103h]
2166:003a  mov [6288h],al
2166:003d  mov al,es:[bx+102h]
2166:0042  mov [6289h],al
2166:0045  cbw
2166:0046  push ax
2166:0047  mov ax,[0F100h]
2166:004a  cwd
2166:004b  pop bx
2166:004c  idiv bx
2166:004e  mov [6504h],ax
2166:0051  mov ax,[0F102h]
2166:0054  shl ax,1
2166:0056  shl ax,1
2166:0058  shl ax,1
2166:005a  push ax
2166:005b  mov al,[6288h]
2166:005e  cbw
2166:005f  mov bx,ax
2166:0061  pop ax
2166:0062  cwd
2166:0063  idiv bx
2166:0065  mov [6506h],ax
2166:0068  mov dx,[bp-2]
2166:006b  mov ax,[bp-4]
2166:006e  mov sp,bp
2166:0070  pop bp
2166:0071  ret far

; Candidate 216d:0002, file offset 0x248d2
216d:0002  push bp
216d:0003  mov bp,sp
216d:0005  dec sp
216d:0006  dec sp
216d:0007  call far 000Ch,21A9h
216d:000c  mov [64ECh],ax
216d:000f  mov ax,[bp+6]
216d:0012  or ax,[bp+8]
216d:0015  je short 005Fh
216d:0017  mov ax,3Fh
216d:001a  push ax
216d:001b  call far 6D95h,0
216d:0020  inc sp
216d:0021  inc sp
216d:0022  mov [0F1C2h],dx
216d:0026  mov [0F1C0h],ax
216d:0029  mov ax,218Eh
216d:002c  push ax
216d:002d  mov ax,3
216d:0030  push ax
216d:0031  mov ax,3Fh
216d:0034  push ax
216d:0035  call far 6DA4h,0
216d:003a  add sp,6
216d:003d  mov ax,9
216d:0040  push ax
216d:0041  push ds
216d:0042  mov ax,648Ah
216d:0045  push ax
216d:0046  push word ptr [0F1C2h]
216d:004a  push word ptr [0F1C0h]
216d:004e  call far 70E3h,0
216d:0053  add sp,0Ah
216d:0056  les bx,[0F1C0h]
216d:005a  mov byte ptr es:[bx+65h],0CBh
216d:005f  call far 6B35h,0
216d:0064  mov [bp-2],ax
216d:0067  call far 0016h,1F42h
216d:006c  call far 2,2263h
216d:0071  mov ax,[bp+6]
216d:0074  or ax,[bp+8]
216d:0077  jne short 007Ch
216d:0079  jmp 0162h
216d:007c  push word ptr [bp+8]
216d:007f  push word ptr [bp+6]
216d:0082  call far 11CFh,1DCEh
216d:0087  add sp,4
216d:008a  or ax,ax
216d:008c  jne short 0091h
216d:008e  jmp 013Ch
216d:0091  mov ax,50h
216d:0094  push ax
216d:0095  push ds
216d:0096  mov ax,0F108h
216d:0099  push ax
216d:009a  call far 5E94h,0
216d:009f  add sp,6
216d:00a2  push ds
216d:00a3  mov ax,0F108h
216d:00a6  push ax
216d:00a7  push ds
216d:00a8  mov ax,0F09Ch
216d:00ab  push ax
216d:00ac  call far 7570h,0
216d:00b1  add sp,8
216d:00b4  push ds
216d:00b5  mov ax,0F108h
216d:00b8  push ax
216d:00b9  call far 7599h,0
216d:00be  add sp,4
216d:00c1  dec ax
216d:00c2  mov bx,ax
216d:00c4  cmp byte ptr [bx-0EF8h],5Ch
216d:00c9  je short 00DDh
216d:00cb  push ds
216d:00cc  mov ax,6493h
216d:00cf  push ax
216d:00d0  push ds
216d:00d1  mov ax,0F108h
216d:00d4  push ax
216d:00d5  call far 74C4h,0
216d:00da  add sp,8
216d:00dd  push word ptr [bp+8]
216d:00e0  push word ptr [bp+6]
216d:00e3  push ds
216d:00e4  mov ax,0F108h
216d:00e7  push ax
216d:00e8  call far 74C4h,0
216d:00ed  add sp,8
216d:00f0  mov ax,2A18h
216d:00f3  mov es,ax
216d:00f5  push word ptr es:[128h]
216d:00fa  call far 5A5Fh,0
216d:00ff  inc sp
216d:0100  inc sp
216d:0101  mov ax,2A18h
216d:0104  mov es,ax
216d:0106  mov word ptr es:[128h],0FFFFh
216d:010d  push word ptr [bp-2]
216d:0110  call far 6B3Bh,0
216d:0115  inc sp
216d:0116  inc sp
216d:0117  cmp word ptr [bp+0Eh],0
216d:011b  je short 0162h
216d:011d  xor ax,ax
216d:011f  xor dx,dx
216d:0121  push ax
216d:0122  push dx
216d:0123  push ax
216d:0124  push dx
216d:0125  call far 0AB6h,1B7Ah
216d:012a  add sp,8
216d:012d  xor ax,ax
216d:012f  push ax
216d:0130  push ax
216d:0131  push ax
216d:0132  call far 08ECh,1B7Ah
216d:0137  add sp,6
216d:013a  jmp short 0162h
216d:013c  push ds
216d:013d  mov ax,6495h
216d:0140  push ax
216d:0141  call far 6,2246h
216d:0146  add sp,4
216d:0149  push word ptr [0F1C2h]
216d:014d  push word ptr [0F1C0h]
216d:0151  mov ax,3Fh
216d:0154  push ax
216d:0155  call far 6DA4h,0
216d:015a  add sp,6
216d:015d  mov ax,1
216d:0160  jmp short 01A5h
216d:0162  call far 0249h,1D0Eh
216d:0167  cmp dx,[bp+0Ch]
216d:016a  jg short 0199h
216d:016c  jl short 0173h
216d:016e  cmp ax,[bp+0Ah]
216d:0171  jae short 0199h
216d:0173  push ds
216d:0174  mov ax,64C6h
216d:0177  push ax
216d:0178  call far 6,2246h
216d:017d  add sp,4
216d:0180  push word ptr [0F1C2h]
216d:0184  push word ptr [0F1C0h]
216d:0188  mov ax,3Fh
216d:018b  push ax
216d:018c  call far 6DA4h,0
216d:0191  add sp,6
216d:0194  mov ax,1
216d:0197  jmp short 01A5h
216d:0199  call far 07B2h,2295h
216d:019e  call far 000Eh,23E1h
216d:01a3  xor ax,ax
216d:01a5  mov sp,bp
216d:01a7  pop bp
216d:01a8  ret far

; Candidate 2187:0009, file offset 0x24a79
2187:0009  push bp
2187:000a  mov bp,sp
2187:000c  dec sp
2187:000d  dec sp
2187:000e  mov dx,[bp+6]
2187:0011  mov ax,1
2187:0014  mov cl,dl
2187:0016  shl ax,cl
2187:0018  test [6690h],ax
2187:001c  je short 0023h
2187:001e  mov ax,1
2187:0021  jmp short 0025h
2187:0023  xor ax,ax
2187:0025  mov [bp-2],ax
2187:0028  mov cl,dl
2187:002a  add cl,0FFh
2187:002d  mov ax,1
2187:0030  shl ax,cl
2187:0032  or [6690h],ax
2187:0036  mov ax,[bp-2]
2187:0039  mov sp,bp
2187:003b  pop bp
2187:003c  ret far

; Candidate 2187:003d, file offset 0x24aad
2187:003d  push bp
2187:003e  mov bp,sp
2187:0040  dec sp
2187:0041  dec sp
2187:0042  mov dx,[bp+6]
2187:0045  mov ax,1
2187:0048  mov cl,dl
2187:004a  shl ax,cl
2187:004c  test [6690h],ax
2187:0050  je short 0057h
2187:0052  mov ax,1
2187:0055  jmp short 0059h
2187:0057  xor ax,ax
2187:0059  mov [bp-2],ax
2187:005c  mov cl,dl
2187:005e  add cl,0FFh
2187:0061  mov ax,1
2187:0064  shl ax,cl
2187:0066  not ax
2187:0068  and [6690h],ax
2187:006c  mov ax,[bp-2]
2187:006f  mov sp,bp
2187:0071  pop bp
2187:0072  ret far

; Candidate 21a9:000c, file offset 0x24c9c
21a9:000c  push bp
21a9:000d  mov bp,sp
21a9:000f  mov word ptr [0F1D4h],0F00h
21a9:0015  push ds
21a9:0016  mov ax,0F1C4h
21a9:0019  push ax
21a9:001a  push ds
21a9:001b  mov ax,0F1D4h
21a9:001e  push ax
21a9:001f  mov ax,10h
21a9:0022  push ax
21a9:0023  call far 6E5Eh,0
21a9:0028  add sp,0Ah
21a9:002b  mov ax,[0F1C4h]
21a9:002e  and ax,0FFh
21a9:0031  pop bp
21a9:0032  ret far

; Candidate 21a9:0033, file offset 0x24cc3
21a9:0033  push bp
21a9:0034  mov bp,sp
21a9:0036  push si
21a9:0037  mov si,[bp+6]
21a9:003a  cmp si,9
21a9:003d  jge short 0049h
21a9:003f  mov bx,si
21a9:0041  shl bx,1
21a9:0043  mov ax,[bx+64EEh]
21a9:0047  jmp short 004Ch
21a9:0049  mov ax,[64ECh]
21a9:004c  mov [0F1D4h],ax
21a9:004f  mov bx,si
21a9:0051  shl bx,1
21a9:0053  mov ax,[bx+64EEh]
21a9:0057  cmp ax,[64ECh]
21a9:005b  je short 0073h
21a9:005d  push ds
21a9:005e  mov ax,0F1C4h
21a9:0061  push ax
21a9:0062  push ds
21a9:0063  mov ax,0F1D4h
21a9:0066  push ax
21a9:0067  mov ax,10h
21a9:006a  push ax
21a9:006b  call far 6E5Eh,0
21a9:0070  add sp,0Ah
21a9:0073  pop si
21a9:0074  pop bp
21a9:0075  ret far

; Candidate 21b0:0129, file offset 0x24e29
21b0:0129  push bp
21b0:012a  mov bp,sp
21b0:012c  mov byte ptr [62A0h],0
21b0:0131  pop bp
21b0:0132  ret far

; Candidate 21b0:0133, file offset 0x24e33
21b0:0133  push bp
21b0:0134  mov bp,sp
21b0:0136  sub sp,6
21b0:0139  push si
21b0:013a  mov si,[bp+6]
21b0:013d  mov ax,[636Fh]
21b0:0140  mov [bp-2],ax
21b0:0143  mov [636Fh],si
21b0:0147  mov ax,si
21b0:0149  mov cl,4
21b0:014b  shl ax,cl
21b0:014d  add ax,1CFCh
21b0:0150  mov [bp-4],ds
21b0:0153  mov [bp-6],ax
21b0:0156  les bx,[bp-6]
21b0:0159  mov ax,es:[bx]
21b0:015c  mov [0F104h],ax
21b0:015f  add word ptr [bp-6],2
21b0:0163  les bx,[bp-6]
21b0:0166  mov ax,es:[bx]
21b0:0169  mov [0F106h],ax
21b0:016c  add word ptr [bp-6],2
21b0:0170  les bx,[bp-6]
21b0:0173  mov ax,es:[bx]
21b0:0176  mov [0F102h],ax
21b0:0179  add word ptr [bp-6],2
21b0:017d  les bx,[bp-6]
21b0:0180  mov ax,es:[bx]
21b0:0183  mov [0F100h],ax
21b0:0186  add word ptr [bp-6],2
21b0:018a  les bx,[bp-6]
21b0:018d  mov ax,es:[bx]
21b0:0190  mov [636Dh],ax
21b0:0193  add word ptr [bp-6],2
21b0:0197  les bx,[bp-6]
21b0:019a  mov ax,es:[bx]
21b0:019d  mov [636Bh],ax
21b0:01a0  add word ptr [bp-6],2
21b0:01a4  les bx,[bp-6]
21b0:01a7  mov ax,es:[bx]
21b0:01aa  mov [0F094h],ax
21b0:01ad  add word ptr [bp-6],2
21b0:01b1  les bx,[bp-6]
21b0:01b4  mov ax,es:[bx]
21b0:01b7  mov [0F096h],ax
21b0:01ba  add word ptr [bp-6],2
21b0:01be  mov word ptr [6502h],0
21b0:01c4  mov al,[6289h]
21b0:01c7  cbw
21b0:01c8  push ax
21b0:01c9  mov ax,[0F100h]
21b0:01cc  cwd
21b0:01cd  pop bx
21b0:01ce  idiv bx
21b0:01d0  mov [6504h],ax
21b0:01d3  mov ax,[0F102h]
21b0:01d6  shl ax,1
21b0:01d8  shl ax,1
21b0:01da  shl ax,1
21b0:01dc  push ax
21b0:01dd  mov al,[6288h]
21b0:01e0  cbw
21b0:01e1  mov bx,ax
21b0:01e3  pop ax
21b0:01e4  cwd
21b0:01e5  idiv bx
21b0:01e7  mov [6506h],ax
21b0:01ea  mov ax,[bp-2]
21b0:01ed  pop si
21b0:01ee  mov sp,bp
21b0:01f0  pop bp
21b0:01f1  ret far

; Candidate 21b0:020f, file offset 0x24f0f
21b0:020f  push bp
21b0:0210  mov bp,sp
21b0:0212  sub sp,8
21b0:0215  mov ax,[0F104h]
21b0:0218  shl ax,1
21b0:021a  shl ax,1
21b0:021c  shl ax,1
21b0:021e  mov [bp-2],ax
21b0:0221  mov ax,[0F106h]
21b0:0224  mov [bp-4],ax
21b0:0227  mov ax,[0F104h]
21b0:022a  add ax,[0F102h]
21b0:022e  shl ax,1
21b0:0230  shl ax,1
21b0:0232  shl ax,1
21b0:0234  mov [bp-6],ax
21b0:0237  mov ax,[0F106h]
21b0:023a  add ax,[0F100h]
21b0:023e  mov [bp-8],ax
21b0:0241  push word ptr [636Bh]
21b0:0245  dec ax
21b0:0246  push ax
21b0:0247  mov ax,[bp-6]
21b0:024a  dec ax
21b0:024b  push ax
21b0:024c  push word ptr [bp-4]
21b0:024f  push word ptr [bp-2]
21b0:0252  call far dword ptr [657Ah]
21b0:0256  add sp,0Ah
21b0:0259  mov word ptr [0F094h],0
21b0:025f  mov word ptr [0F096h],0
21b0:0265  mov word ptr [6502h],0
21b0:026b  mov sp,bp
21b0:026d  pop bp
21b0:026e  ret far

; Candidate 21b0:0284, file offset 0x24f84
21b0:0284  push bp
21b0:0285  mov bp,sp
21b0:0287  sub sp,14h
21b0:028a  push si
21b0:028b  lea ax,[bp+0Ah]
21b0:028e  mov [bp-12h],ss
21b0:0291  mov [bp-14h],ax
21b0:0294  mov word ptr [0F254h],0
21b0:029a  mov byte ptr [0F1ECh],0
21b0:029f  mov al,0
21b0:02a1  mov [0F1E5h],al
21b0:02a4  mov [0F1E4h],al
21b0:02a7  mov ax,[bp+8]
21b0:02aa  mov dx,[bp+6]
21b0:02ad  mov [0F252h],ax
21b0:02b0  mov [0F250h],dx
21b0:02b4  mov word ptr [0F1EAh],0
21b0:02ba  mov word ptr [0F1E8h],0
21b0:02c0  mov ax,[636Dh]
21b0:02c3  mov [bp-0Eh],ax
21b0:02c6  mov ax,[636Bh]
21b0:02c9  mov [bp-10h],ax
21b0:02cc  cmp word ptr [62A5h],0
21b0:02d1  jne short 02DEh
21b0:02d3  push word ptr [636Fh]
21b0:02d7  call far 9,223Fh
21b0:02dc  inc sp
21b0:02dd  inc sp
21b0:02de  call far 08B4h,21B0h
21b0:02e3  mov [bp-1],al
21b0:02e6  cbw
21b0:02e7  or ax,ax
21b0:02e9  jne short 02EEh
21b0:02eb  jmp 0541h
21b0:02ee  mov ax,[0F1E8h]
21b0:02f1  or ax,[0F1EAh]
21b0:02f5  je short 02FAh
21b0:02f7  jmp 0392h
21b0:02fa  cmp byte ptr [bp-1],25h
21b0:02fe  je short 0303h
21b0:0300  jmp 0392h
21b0:0303  mov al,[0F1E4h]
21b0:0306  cbw
21b0:0307  push ax
21b0:0308  call far 68C7h,0
21b0:030d  inc sp
21b0:030e  inc sp
21b0:030f  cmp ax,64h
21b0:0312  je short 0352h
21b0:0314  cmp ax,73h
21b0:0317  je short 031Bh
21b0:0319  jmp short 0392h
21b0:031b  add word ptr [bp-14h],4
21b0:031f  les bx,[bp-14h]
21b0:0322  mov ax,es:[bx-2]
21b0:0326  mov dx,es:[bx-4]
21b0:032a  mov [0F1EAh],ax
21b0:032d  mov [0F1E8h],dx
21b0:0331  mov ax,[0F1E8h]
21b0:0334  or ax,[0F1EAh]
21b0:0338  je short 0392h
21b0:033a  mov al,[0F1E5h]
21b0:033d  mov [0F1E6h],al
21b0:0340  mov al,0
21b0:0342  mov [0F1E5h],al
21b0:0345  mov [0F1E4h],al
21b0:0348  call far 08B4h,21B0h
21b0:034d  mov [bp-1],al
21b0:0350  jmp short 0392h
21b0:0352  lea ax,[bp-0Ch]
21b0:0355  mov [0F1EAh],ss
21b0:0359  mov [0F1E8h],ax
21b0:035c  mov es,[bp-12h]
21b0:035f  add word ptr [bp-14h],2
21b0:0363  mov bx,[bp-14h]
21b0:0366  push word ptr es:[bx-2]
21b0:036a  push ds
21b0:036b  mov ax,6519h
21b0:036e  push ax
21b0:036f  push ss
21b0:0370  lea ax,[bp-0Ch]
21b0:0373  push ax
21b0:0374  call far 64A1h,0
21b0:0379  add sp,0Ah
21b0:037c  mov al,[0F1E5h]
21b0:037f  mov [0F1E6h],al
21b0:0382  mov al,0
21b0:0384  mov [0F1E5h],al
21b0:0387  mov [0F1E4h],al
21b0:038a  call far 08B4h,21B0h
21b0:038f  mov [bp-1],al
21b0:0392  mov al,[bp-1]
21b0:0395  cbw
21b0:0396  dec ax
21b0:0397  mov bx,ax
21b0:0399  cmp bx,1Eh
21b0:039c  jbe short 03A1h
21b0:039e  jmp 050Eh
21b0:03a1  shl bx,1
21b0:03a3  jmp word ptr cs:[bx+59Ah]
21b0:03a8  call far 06BEh,21B0h
21b0:03ad  call far 08B4h,21B0h
21b0:03b2  cbw
21b0:03b3  mov [0F094h],ax
21b0:03b6  cmp word ptr [0F094h],0
21b0:03bb  jge short 03C1h
21b0:03bd  xor ax,ax
21b0:03bf  jmp short 03C4h
21b0:03c1  mov ax,[0F094h]
21b0:03c4  mov [0F094h],ax
21b0:03c7  mov ax,[6506h]
21b0:03ca  dec ax
21b0:03cb  cmp ax,[0F094h]
21b0:03cf  jge short 03D7h
21b0:03d1  mov ax,[6506h]
21b0:03d4  dec ax
21b0:03d5  jmp short 03DAh
21b0:03d7  mov ax,[0F094h]
21b0:03da  mov [0F094h],ax
21b0:03dd  jmp 02DEh
21b0:03e0  call far 06BEh,21B0h
21b0:03e5  call far 08B4h,21B0h
21b0:03ea  cbw
21b0:03eb  mov [0F096h],ax
21b0:03ee  cmp word ptr [0F096h],0
21b0:03f3  jge short 03F9h
21b0:03f5  xor ax,ax
21b0:03f7  jmp short 03FCh
21b0:03f9  mov ax,[0F096h]
21b0:03fc  mov [0F096h],ax
21b0:03ff  mov ax,[6504h]
21b0:0402  dec ax
21b0:0403  cmp ax,[0F096h]
21b0:0407  jge short 040Fh
21b0:0409  mov ax,[6504h]
21b0:040c  dec ax
21b0:040d  jmp short 0412h
21b0:040f  mov ax,[0F096h]
21b0:0412  mov [0F096h],ax
21b0:0415  jmp 02DEh
21b0:0418  call far 06BEh,21B0h
21b0:041d  mov ax,[6367h]
21b0:0420  or ax,[6369h]
21b0:0424  jne short 0429h
21b0:0426  jmp 02DEh
21b0:0429  cmp word ptr [62A5h],0
21b0:042e  jne short 0435h
21b0:0430  call far 006Ch,223Fh
21b0:0435  push word ptr [6510h]
21b0:0439  push word ptr [650Eh]
21b0:043d  push word ptr [650Ch]
21b0:0441  push word ptr [650Ah]
21b0:0445  push word ptr [6508h]
21b0:0449  call far dword ptr [6367h]
21b0:044d  add sp,0Ah
21b0:0450  cmp word ptr [62A5h],0
21b0:0455  je short 045Ah
21b0:0457  jmp 02DEh
21b0:045a  push word ptr [636Fh]
21b0:045e  call far 9,223Fh
21b0:0463  inc sp
21b0:0464  inc sp
21b0:0465  jmp 02DEh
21b0:0468  push cs
21b0:0469  call 020Fh
21b0:046c  jmp 02DEh
21b0:046f  call far 06BEh,21B0h
21b0:0474  inc word ptr [6502h]
21b0:0478  mov word ptr [0F094h],0
21b0:047e  inc word ptr [0F096h]
21b0:0482  jmp 02DEh
21b0:0485  call far 06BEh,21B0h
21b0:048a  call far 08B4h,21B0h
21b0:048f  cbw
21b0:0490  mov [636Bh],ax
21b0:0493  jmp 02DEh
21b0:0496  call far 06BEh,21B0h
21b0:049b  call far 08B4h,21B0h
21b0:04a0  cbw
21b0:04a1  mov [636Dh],ax
21b0:04a4  jmp 02DEh
21b0:04a7  call far 06BEh,21B0h
21b0:04ac  mov ax,[0F094h]
21b0:04af  add ax,[0F254h]
21b0:04b3  add ax,8
21b0:04b6  and ax,0FFF8h
21b0:04b9  dec ax
21b0:04ba  mov [0F094h],ax
21b0:04bd  add ax,[0F254h]
21b0:04c1  cmp ax,[6506h]
21b0:04c5  jge short 04CAh
21b0:04c7  jmp 02DEh
21b0:04ca  mov word ptr [0F094h],0
21b0:04d0  jmp 02DEh
21b0:04d3  call far 06BEh,21B0h
21b0:04d8  mov ax,[0F094h]
21b0:04db  add ax,[0F254h]
21b0:04df  add ax,8
21b0:04e2  and ax,0FFF8h
21b0:04e5  dec ax
21b0:04e6  mov si,ax
21b0:04e8  jmp short 04F7h
21b0:04ea  mov bx,[0F254h]
21b0:04ee  mov byte ptr [bx-0E14h],20h
21b0:04f3  inc word ptr [0F254h]
21b0:04f7  mov ax,[0F094h]
21b0:04fa  add ax,[0F254h]
21b0:04fe  cmp ax,si
21b0:0500  jl short 04EAh
21b0:0502  mov bx,[0F254h]
21b0:0506  mov byte ptr [bx-0E14h],0
21b0:050b  jmp 02DEh
21b0:050e  mov bx,[0F254h]
21b0:0512  mov al,[bp-1]
21b0:0515  mov [bx-0E14h],al
21b0:0519  inc word ptr [0F254h]
21b0:051d  mov bx,[0F254h]
21b0:0521  mov byte ptr [bx-0E14h],0
21b0:0526  mov ax,[0F094h]
21b0:0529  add ax,[0F254h]
21b0:052d  mov dx,[6506h]
21b0:0531  inc dx
21b0:0532  cmp ax,dx
21b0:0534  jg short 0539h
21b0:0536  jmp 02DEh
21b0:0539  call far 06BEh,21B0h
21b0:053e  jmp 02DEh
21b0:0541  cmp word ptr [0F254h],0
21b0:0546  je short 054Dh
21b0:0548  call far 06BEh,21B0h
21b0:054d  mov bx,[636Fh]
21b0:0551  mov cl,4
21b0:0553  shl bx,cl
21b0:0555  mov ax,[0F094h]
21b0:0558  mov [bx+1D08h],ax
21b0:055c  mov bx,[636Fh]
21b0:0560  shl bx,cl
21b0:0562  mov ax,[0F096h]
21b0:0565  mov [bx+1D0Ah],ax
21b0:0569  mov bx,[636Fh]
21b0:056d  shl bx,cl
21b0:056f  mov ax,[bp-0Eh]
21b0:0572  mov [636Dh],ax
21b0:0575  mov [bx+1D04h],ax
21b0:0579  mov bx,[636Fh]
21b0:057d  shl bx,cl
21b0:057f  mov ax,[bp-10h]
21b0:0582  mov [636Bh],ax
21b0:0585  mov [bx+1D06h],ax
21b0:0589  cmp word ptr [62A5h],0
21b0:058e  jne short 0595h
21b0:0590  call far 006Ch,223Fh
21b0:0595  pop si
21b0:0596  mov sp,bp
21b0:0598  pop bp
21b0:0599  ret far

; Candidate 21b0:06be, file offset 0x253be
21b0:06be  push bp
21b0:06bf  mov bp,sp
21b0:06c1  sub sp,8
21b0:06c4  push si
21b0:06c5  push di
21b0:06c6  jmp short 06D9h
21b0:06c8  push cs
21b0:06c9  call 05D8h
21b0:06cc  mov ax,[0F096h]
21b0:06cf  cmp ax,[6504h]
21b0:06d3  jl short 06D9h
21b0:06d5  dec word ptr [0F096h]
21b0:06d9  mov ax,[0F096h]
21b0:06dc  cmp ax,[6504h]
21b0:06e0  jge short 06C8h
21b0:06e2  mov ax,[0F104h]
21b0:06e5  shl ax,1
21b0:06e7  shl ax,1
21b0:06e9  shl ax,1
21b0:06eb  push ax
21b0:06ec  mov al,[6288h]
21b0:06ef  cbw
21b0:06f0  imul word ptr [0F094h]
21b0:06f4  pop dx
21b0:06f5  add dx,ax
21b0:06f7  mov [bp-4],dx
21b0:06fa  mov al,[6289h]
21b0:06fd  cbw
21b0:06fe  imul word ptr [0F096h]
21b0:0702  mov dx,[0F106h]
21b0:0706  add dx,ax
21b0:0708  mov [bp-6],dx
21b0:070b  mov ax,[6506h]
21b0:070e  mov [bp-2],ax
21b0:0711  mov ax,[6504h]
21b0:0714  add ax,0FFFDh
21b0:0717  cmp ax,[6502h]
21b0:071b  jg short 072Ah
21b0:071d  cmp byte ptr [62A0h],0
21b0:0722  je short 072Ah
21b0:0724  mov ax,[650Ch]
21b0:0727  sub [bp-2],ax
21b0:072a  mov si,[0F254h]
21b0:072e  mov ax,[0F094h]
21b0:0731  add ax,[0F254h]
21b0:0735  cmp ax,[bp-2]
21b0:0738  jle short 0767h
21b0:073a  mov ax,[0F094h]
21b0:073d  sub [bp-2],ax
21b0:0740  mov di,[bp-2]
21b0:0743  jmp short 0751h
21b0:0745  cmp byte ptr [di-0E14h],20h
21b0:074a  jne short 0750h
21b0:074c  mov si,di
21b0:074e  jmp short 0755h
21b0:0750  dec di
21b0:0751  or di,di
21b0:0753  jg short 0745h
21b0:0755  or di,di
21b0:0757  jne short 0767h
21b0:0759  cmp word ptr [0F094h],0
21b0:075e  je short 0764h
21b0:0760  xor si,si
21b0:0762  jmp short 0767h
21b0:0764  mov si,[bp-2]
21b0:0767  mov al,[si-0E14h]
21b0:076b  mov [bp-7],al
21b0:076e  mov byte ptr [si-0E14h],0
21b0:0773  push word ptr [636Bh]
21b0:0777  push word ptr [636Dh]
21b0:077b  push word ptr [bp-6]
21b0:077e  push word ptr [bp-4]
21b0:0781  push ds
21b0:0782  mov ax,0F1ECh
21b0:0785  push ax
21b0:0786  call far dword ptr [65F2h]
21b0:078a  add sp,0Ch
21b0:078d  add [0F094h],si
21b0:0791  mov al,[bp-7]
21b0:0794  mov [si-0E14h],al
21b0:0798  cmp byte ptr [bp-7],20h
21b0:079c  jne short 079Fh
21b0:079e  inc si
21b0:079f  cmp byte ptr [si-0E14h],20h
21b0:07a4  jne short 07A7h
21b0:07a6  inc si
21b0:07a7  push ds
21b0:07a8  mov ax,si
21b0:07aa  add ax,0F1ECh
21b0:07ad  push ax
21b0:07ae  push ds
21b0:07af  mov ax,0F1ECh
21b0:07b2  push ax
21b0:07b3  call far 7570h,0
21b0:07b8  add sp,8
21b0:07bb  push ds
21b0:07bc  mov ax,0F1ECh
21b0:07bf  push ax
21b0:07c0  call far 7599h,0
21b0:07c5  add sp,4
21b0:07c8  mov [0F254h],ax
21b0:07cb  cmp word ptr [0F254h],0
21b0:07d0  jne short 07DBh
21b0:07d2  mov ax,[0F094h]
21b0:07d5  cmp ax,[6506h]
21b0:07d9  jl short 07EDh
21b0:07db  inc word ptr [6502h]
21b0:07df  mov word ptr [0F094h],0
21b0:07e5  inc word ptr [0F096h]
21b0:07e9  push cs
21b0:07ea  call 06BEh
21b0:07ed  pop di
21b0:07ee  pop si
21b0:07ef  mov sp,bp
21b0:07f1  pop bp
21b0:07f2  ret far

; Candidate 21b0:08b4, file offset 0x255b4
21b0:08b4  push bp
21b0:08b5  mov bp,sp
21b0:08b7  dec sp
21b0:08b8  dec sp
21b0:08b9  mov al,[0F1E4h]
21b0:08bc  cbw
21b0:08bd  or ax,ax
21b0:08bf  jne short 08CDh
21b0:08c1  push ds
21b0:08c2  mov ax,0F1E4h
21b0:08c5  push ax
21b0:08c6  push cs
21b0:08c7  call 07F3h
21b0:08ca  add sp,4
21b0:08cd  mov al,[0F1E4h]
21b0:08d0  mov [bp-1],al
21b0:08d3  mov al,[0F1E5h]
21b0:08d6  mov [0F1E4h],al
21b0:08d9  mov byte ptr [0F1E5h],0
21b0:08de  mov al,[0F1E4h]
21b0:08e1  cbw
21b0:08e2  or ax,ax
21b0:08e4  jne short 08F2h
21b0:08e6  push ds
21b0:08e7  mov ax,0F1E4h
21b0:08ea  push ax
21b0:08eb  push cs
21b0:08ec  call 07F3h
21b0:08ef  add sp,4
21b0:08f2  mov al,[bp-1]
21b0:08f5  mov sp,bp
21b0:08f7  pop bp
21b0:08f8  ret far

; Candidate 223f:0009, file offset 0x255f9
223f:0009  push bp
223f:000a  mov bp,sp
223f:000c  sub sp,6
223f:000f  push si
223f:0010  push di
223f:0011  mov si,[bp+6]
223f:0014  mov bx,si
223f:0016  mov cl,4
223f:0018  shl bx,cl
223f:001a  mov ax,[bx+1CFCh]
223f:001e  shl ax,1
223f:0020  shl ax,1
223f:0022  shl ax,1
223f:0024  mov di,ax
223f:0026  mov bx,si
223f:0028  shl bx,cl
223f:002a  mov ax,[bx+1CFEh]
223f:002e  mov [bp-2],ax
223f:0031  mov bx,si
223f:0033  shl bx,cl
223f:0035  mov ax,[bx+1D00h]
223f:0039  shl ax,1
223f:003b  shl ax,1
223f:003d  shl ax,1
223f:003f  mov [bp-4],ax
223f:0042  mov bx,si
223f:0044  shl bx,cl
223f:0046  mov ax,[bx+1D02h]
223f:004a  mov [bp-6],ax
223f:004d  mov ax,[bp-2]
223f:0050  add ax,[bp-6]
223f:0053  push ax
223f:0054  mov ax,di
223f:0056  add ax,[bp-4]
223f:0059  push ax
223f:005a  push word ptr [bp-2]
223f:005d  push di
223f:005e  call far 0206h,238Bh
223f:0063  add sp,8
223f:0066  pop di
223f:0067  pop si
223f:0068  mov sp,bp
223f:006a  pop bp
223f:006b  ret far

; Candidate 223f:006c, file offset 0x2565c
223f:006c  push bp
223f:006d  mov bp,sp
223f:006f  call far 02CAh,238Bh
223f:0074  pop bp
223f:0075  ret far

; Candidate 2246:0006, file offset 0x25666
2246:0006  push bp
2246:0007  mov bp,sp
2246:0009  push ax
2246:000a  push di
2246:000b  push ds
2246:000c  push dx
2246:000d  push si
2246:000e  cld
2246:000f  mov si,[bp+6]
2246:0012  mov ds,[bp+8]
2246:0015  lodsb [si]
2246:0016  or al,al
2246:0018  je short 0022h
2246:001a  mov dl,al
2246:001c  mov ah,6
2246:001e  int 21h
2246:0020  jmp short 0015h
2246:0022  pop si
2246:0023  pop dx
2246:0024  pop ds
2246:0025  pop di
2246:0026  pop ax
2246:0027  pop bp
2246:0028  ret far

; Candidate 2263:0002, file offset 0x25832
2263:0002  push bp
2263:0003  mov bp,sp
2263:0005  push ax
2263:0006  push bx
2263:0007  push dx
2263:0008  mov ah,19h
2263:000a  int 21h
2263:000c  mov [0F002h],al
2263:000f  mov dl,al
2263:0011  mov ah,0Eh
2263:0013  int 21h
2263:0015  dec al
2263:0017  xor ah,ah
2263:0019  mov dx,ax
2263:001b  mov bl,dl
2263:001d  inc bl
2263:001f  mov ax,440Eh
2263:0022  int 21h
2263:0024  jae short 002Dh
2263:0026  cmp al,0Fh
2263:0028  jne short 002Dh
2263:002a  dec dx
2263:002b  jmp short 001Bh
2263:002d  mov ax,dx
2263:002f  mov [0F042h],al
2263:0032  pop dx
2263:0033  pop bx
2263:0034  pop ax
2263:0035  pop bp
2263:0036  ret far

; Candidate 2263:0037, file offset 0x25867
2263:0037  push bp
2263:0038  mov bp,sp
2263:003a  push bx
2263:003b  push dx
2263:003c  mov dl,[bp+6]
2263:003f  push bx
2263:0040  mov bl,dl
2263:0042  inc bl
2263:0044  mov ax,440Eh
2263:0047  int 21h
2263:0049  pop bx
2263:004a  jae short 0052h
2263:004c  cmp al,1
2263:004e  je short 0061h
2263:0050  jmp short 005Ch
2263:0052  cmp al,0
2263:0054  je short 0061h
2263:0056  dec al
2263:0058  cmp al,dl
2263:005a  je short 0061h
2263:005c  mov ax,0
2263:005f  jmp short 0064h
2263:0061  mov ax,1
2263:0064  pop dx
2263:0065  pop bx
2263:0066  pop bp
2263:0067  ret far

; Candidate 2269:0008, file offset 0x25898
2269:0008  push bp
2269:0009  mov bp,sp
2269:000b  push bx
2269:000c  push cx
2269:000d  push dx
2269:000e  push es
2269:000f  mov ax,3533h
2269:0012  int 21h
2269:0014  mov word ptr [661Ah],0A0h
2269:001a  mov word ptr [661Ch],64h
2269:0020  mov word ptr [6628h],1
2269:0026  mov word ptr [663Eh],0
2269:002c  mov word ptr [662Ch],13Fh
2269:0032  mov word ptr [6630h],0C7h
2269:0038  mov ax,es
2269:003a  or ax,bx
2269:003c  je short 0046h
2269:003e  mov bl,es:[bx]
2269:0041  cmp bl,0CFh
2269:0044  jne short 0050h
2269:0046  mov ax,0
2269:0049  mov byte ptr [6654h],0
2269:004e  jmp short 009Fh
2269:0050  mov ax,0
2269:0053  int 33h
2269:0055  cmp ax,0FFFFh
2269:0058  jne short 0046h
2269:005a  mov word ptr [6626h],0
2269:0060  mov ax,3
2269:0063  int 33h
2269:0065  cmp cx,0A0h
2269:0069  je short 0071h
2269:006b  mov word ptr [6626h],1
2269:0071  mov cx,0A0h
2269:0074  mov dx,64h
2269:0077  mov byte ptr [6654h],1
2269:007c  mov byte ptr [6655h],1
2269:0081  cmp word ptr [6626h],1
2269:0086  jne short 008Ah
2269:0088  shl cx,1
2269:008a  mov ax,4
2269:008d  int 33h
2269:008f  mov ax,0Ch
2269:0092  mov cx,1Fh
2269:0095  push cs
2269:0096  pop es
2269:0097  mov dx,0A5h
2269:009a  int 33h
2269:009c  mov ax,1
2269:009f  pop es
2269:00a0  pop dx
2269:00a1  pop cx
2269:00a2  pop bx
2269:00a3  pop bp
2269:00a4  ret far

; Candidate 2269:01f2, file offset 0x25a82
2269:01f2  push bp
2269:01f3  mov bp,sp
2269:01f5  cmp byte ptr [6654h],0
2269:01fa  je short 0211h
2269:01fc  push ax
2269:01fd  push cx
2269:01fe  push dx
2269:01ff  push es
2269:0200  mov ax,0Ch
2269:0203  mov cx,0
2269:0206  push cs
2269:0207  pop es
2269:0208  mov dx,0A5h
2269:020b  int 33h
2269:020d  pop es
2269:020e  pop dx
2269:020f  pop cx
2269:0210  pop ax
2269:0211  pop bp
2269:0212  ret far

; Candidate 2269:0213, file offset 0x25aa3
2269:0213  push bp
2269:0214  mov bp,sp
2269:0216  push cx
2269:0217  push di
2269:0218  push dx
2269:0219  push si
2269:021a  mov cx,[bp+6]
2269:021d  mov si,[bp+0Ah]
2269:0220  mov dx,[bp+8]
2269:0223  mov di,[bp+0Ch]
2269:0226  cmp word ptr [6610h],0
2269:022b  jne short 0226h
2269:022d  inc word ptr [6610h]
2269:0231  mov ax,[663Ah]
2269:0234  mov [651Eh],ax
2269:0237  mov ax,[663Ch]
2269:023a  mov [6520h],ax
2269:023d  cmp [651Eh],cx
2269:0241  jl short 025Ah
2269:0243  cmp [651Eh],si
2269:0247  jg short 025Ah
2269:0249  cmp [6520h],dx
2269:024d  jl short 025Ah
2269:024f  cmp [6520h],di
2269:0253  jg short 025Ah
2269:0255  mov ax,1
2269:0258  jmp short 025Dh
2269:025a  mov ax,0
2269:025d  dec word ptr [6610h]
2269:0261  pop si
2269:0262  pop dx
2269:0263  pop di
2269:0264  pop cx
2269:0265  pop bp
2269:0266  ret far

; Candidate 2269:0267, file offset 0x25af7
2269:0267  sti
2269:0268  ret far

; Candidate 2269:0269, file offset 0x25af9
2269:0269  cli
2269:026a  ret far

; Candidate 2269:026b, file offset 0x25afb
2269:026b  push bp
2269:026c  mov bp,sp
2269:026e  push ax
2269:026f  push bx
2269:0270  push cx
2269:0271  push ds
2269:0272  push si
2269:0273  push es
2269:0274  push di
2269:0275  pushf
2269:0276  cld
2269:0277  mov ax,2B16h
2269:027a  mov ds,ax
2269:027c  mov ax,[bp+6]
2269:027f  mov bx,[bp+8]
2269:0282  cli
2269:0283  mov si,[6650h]
2269:0287  mov cx,[6652h]
2269:028b  mov [6650h],ax
2269:028e  mov [6652h],bx
2269:0292  jcxz 029Fh
2269:0294  mov ds,cx
2269:0296  mov di,ax
2269:0298  mov es,bx
2269:029a  mov cx,10h
2269:029d  rep movsb [di],[si]
2269:029f  sti
2269:02a0  popf
2269:02a1  pop di
2269:02a2  pop es
2269:02a3  pop si
2269:02a4  pop ds
2269:02a5  pop cx
2269:02a6  pop bx
2269:02a7  pop ax
2269:02a8  pop bp
2269:02a9  ret far

; Candidate 2269:02aa, file offset 0x25b3a
2269:02aa  push bp
2269:02ab  mov bp,sp
2269:02ad  push ds
2269:02ae  mov ax,2B16h
2269:02b1  mov ds,ax
2269:02b3  cli
2269:02b4  mov ax,[6650h]
2269:02b7  mov dx,[6652h]
2269:02bb  sti
2269:02bc  pop ds
2269:02bd  pop bp
2269:02be  ret far

; Candidate 2295:041e, file offset 0x25f6e
2295:041e  call 0DC1h
2295:0421  push cx
2295:0422  push di
2295:0423  push si
2295:0424  push es
2295:0425  cld
2295:0426  mov ax,cs
2295:0428  mov es,ax
2295:042a  cli
2295:042b  mov ax,cs:[170h]
2295:042f  cmp byte ptr [6600h],2
2295:0434  je short 043Dh
2295:0436  cmp ax,cs:[172h]
2295:043b  je short 047Eh
2295:043d  mov si,ax
2295:043f  mov ax,cs:[si+70h]
2295:0444  cmp byte ptr [6600h],2
2295:0449  jne short 044Fh
2295:044b  or ax,ax
2295:044d  je short 0480h
2295:044f  mov di,20Dh
2295:0452  mov cx,9
2295:0455  repne scasb [di]
2295:0457  or cx,cx
2295:0459  jne short 0464h
2295:045b  test ah,8
2295:045e  jne short 0464h
2295:0460  cmp al,7Ah
2295:0462  jb short 0480h
2295:0464  cmp al,41h
2295:0466  jb short 046Fh
2295:0468  cmp al,44h
2295:046a  ja short 046Fh
2295:046c  add si,4
2295:046f  add si,2
2295:0472  and si,0FFh
2295:0476  mov cs:[170h],si
2295:047b  sti
2295:047c  jmp short 042Ah
2295:047e  xor ax,ax
2295:0480  mov cx,cs:[176h]
2295:0485  mov cs:[178h],cx
2295:048a  sti
2295:048b  or ax,ax
2295:048d  je short 0494h
2295:048f  call 0217h
2295:0492  xor ah,ah
2295:0494  sti
2295:0495  pop es
2295:0496  pop si
2295:0497  pop di
2295:0498  pop cx
2295:0499  ret far

; Candidate 2295:049a, file offset 0x25fea
2295:049a  call 0DC1h
2295:049d  push cx
2295:049e  push di
2295:049f  push si
2295:04a0  push es
2295:04a1  cld
2295:04a2  mov ax,cs
2295:04a4  mov es,ax
2295:04a6  cli
2295:04a7  mov ax,cs:[170h]
2295:04ab  cmp byte ptr [6600h],2
2295:04b0  je short 04B9h
2295:04b2  cmp ax,cs:[172h]
2295:04b7  je short 04EEh
2295:04b9  mov si,ax
2295:04bb  mov ax,cs:[si+70h]
2295:04c0  cmp byte ptr [6600h],2
2295:04c5  jne short 04CBh
2295:04c7  or ax,ax
2295:04c9  je short 04F0h
2295:04cb  mov di,20Dh
2295:04ce  mov cx,9
2295:04d1  repne scasb [di]
2295:04d3  or cx,cx
2295:04d5  jne short 04DFh
2295:04d7  or al,al
2295:04d9  je short 04DFh
2295:04db  cmp al,7Ah
2295:04dd  jb short 04F0h
2295:04df  add si,2
2295:04e2  and si,0FFh
2295:04e6  mov cs:[170h],si
2295:04eb  sti
2295:04ec  jmp short 04A6h
2295:04ee  xor ax,ax
2295:04f0  mov cx,cs:[176h]
2295:04f5  mov cs:[178h],cx
2295:04fa  sti
2295:04fb  or ax,ax
2295:04fd  je short 0502h
2295:04ff  call 0217h
2295:0502  pop es
2295:0503  pop si
2295:0504  pop di
2295:0505  pop cx
2295:0506  ret far

; Candidate 2295:0507, file offset 0x26057
2295:0507  cli
2295:0508  mov ax,cs:[170h]
2295:050c  xor ax,cs:[172h]
2295:0511  sti
2295:0512  call 0DC1h
2295:0515  ret far

; Candidate 2295:0516, file offset 0x26066
2295:0516  push ax
2295:0517  cli
2295:0518  mov ax,cs:[170h]
2295:051c  mov cs:[172h],ax
2295:0520  sti
2295:0521  pop ax
2295:0522  ret far

; Candidate 2295:05d0, file offset 0x26120
2295:05d0  push bx
2295:05d1  push cx
2295:05d2  push di
2295:05d3  push ds
2295:05d4  push es
2295:05d5  cld
2295:05d6  mov ax,cs
2295:05d8  mov es,ax
2295:05da  cli
2295:05db  cmp byte ptr [6600h],2
2295:05e0  je short 05F0h
2295:05e2  mov ax,cs:[170h]
2295:05e6  cmp ax,cs:[172h]
2295:05eb  jne short 05F0h
2295:05ed  sti
2295:05ee  jmp short 05DAh
2295:05f0  call 0523h
2295:05f3  mov cx,cs:[176h]
2295:05f8  mov cs:[178h],cx
2295:05fd  sti
2295:05fe  mov di,20Dh
2295:0601  mov cx,9
2295:0604  repne scasb [di]
2295:0606  or cx,cx
2295:0608  jne short 05DAh
2295:060a  test ah,8
2295:060d  jne short 05DAh
2295:060f  cmp al,7Ah
2295:0611  jae short 05DAh
2295:0613  call 0217h
2295:0616  pop es
2295:0617  pop ds
2295:0618  pop di
2295:0619  pop cx
2295:061a  pop bx
2295:061b  call 0CB2h
2295:061e  xor ah,ah
2295:0620  ret far

; Candidate 2295:0621, file offset 0x26171
2295:0621  push bx
2295:0622  push cx
2295:0623  push di
2295:0624  push ds
2295:0625  push es
2295:0626  cld
2295:0627  mov ax,cs
2295:0629  mov es,ax
2295:062b  mov ds,ax
2295:062d  cli
2295:062e  cmp byte ptr [6600h],2
2295:0633  je short 0643h
2295:0635  mov ax,cs:[170h]
2295:0639  cmp ax,cs:[172h]
2295:063e  jne short 0643h
2295:0640  sti
2295:0641  jmp short 062Dh
2295:0643  call 0523h
2295:0646  mov cx,cs:[176h]
2295:064b  mov cs:[178h],cx
2295:0650  sti
2295:0651  mov di,20Dh
2295:0654  mov cx,9
2295:0657  repne scasb [di]
2295:0659  or cx,cx
2295:065b  jne short 062Dh
2295:065d  cmp al,7Ah
2295:065f  jae short 062Dh
2295:0661  call 0217h
2295:0664  pop es
2295:0665  pop ds
2295:0666  pop di
2295:0667  pop cx
2295:0668  pop bx
2295:0669  call 0CB2h
2295:066c  ret far

; Candidate 2295:066d, file offset 0x261bd
2295:066d  cli
2295:066e  cmp byte ptr [6600h],2
2295:0673  je short 0683h
2295:0675  mov ax,cs:[170h]
2295:0679  cmp ax,cs:[172h]
2295:067e  jne short 0683h
2295:0680  sti
2295:0681  jmp short 066Dh
2295:0683  call 0523h
2295:0686  sti
2295:0687  call 0CB2h
2295:068a  ret far

; Candidate 2295:068b, file offset 0x261db
2295:068b  push bp
2295:068c  mov bp,sp
2295:068e  mov ax,[bp+6]
2295:0691  pop bp
2295:0692  push di
2295:0693  push bx
2295:0694  mov byte ptr cs:[708h],0
2295:069a  push ds
2295:069b  push ax
2295:069c  mov ax,2B16h
2295:069f  mov ds,ax
2295:06a1  mov ax,[65FEh]
2295:06a4  mov cs:[174h],ax
2295:06a8  pop ax
2295:06a9  pop ds
2295:06aa  test word ptr cs:[174h],2
2295:06b1  jne short 06E5h
2295:06b3  mov di,0Eh
2295:06b6  dec di
2295:06b7  jl short 06E5h
2295:06b9  cmp al,cs:[di+711h]
2295:06be  jne short 06B6h
2295:06c0  push ax
2295:06c1  mov al,cs:[di+71Fh]
2295:06c6  xor ah,ah
2295:06c8  mov di,ax
2295:06ca  shr di,1
2295:06cc  shr di,1
2295:06ce  shr di,1
2295:06d0  mov bx,ax
2295:06d2  and bx,7
2295:06d5  mov al,cs:[bx+709h]
2295:06da  cli
2295:06db  and al,cs:[di+1F3h]
2295:06e0  mov cs:[708h],al
2295:06e4  pop ax
2295:06e5  xor ah,ah
2295:06e7  mov di,ax
2295:06e9  shr di,1
2295:06eb  shr di,1
2295:06ed  shr di,1
2295:06ef  mov bx,ax
2295:06f1  and bx,7
2295:06f4  mov al,cs:[bx+709h]
2295:06f9  cli
2295:06fa  and al,cs:[di+1F3h]
2295:06ff  or al,cs:[708h]
2295:0704  sti
2295:0705  pop bx
2295:0706  pop di
2295:0707  ret far

; Candidate 2295:07b2, file offset 0x26302
2295:07b2  push ax
2295:07b3  push bx
2295:07b4  push ds
2295:07b5  push dx
2295:07b6  push es
2295:07b7  mov ax,40h
2295:07ba  mov es,ax
2295:07bc  mov al,es:[17h]
2295:07c0  test al,40h
2295:07c2  je short 07CAh
2295:07c4  or word ptr cs:[176h],1
2295:07ca  test al,20h
2295:07cc  je short 07D4h
2295:07ce  or word ptr cs:[176h],2
2295:07d4  test al,2
2295:07d6  je short 07DEh
2295:07d8  or byte ptr cs:[1F8h],10h
2295:07de  and al,1
2295:07e0  shl al,1
2295:07e2  mov ah,al
2295:07e4  mov al,es:[18h]
2295:07e8  shl al,1
2295:07ea  shl al,1
2295:07ec  and al,0Ch
2295:07ee  or ah,al
2295:07f0  mov al,es:[96h]
2295:07f4  test al,8
2295:07f6  je short 07FBh
2295:07f8  or ah,40h
2295:07fb  mov cs:[1FAh],ah
2295:0800  test al,4
2295:0802  je short 080Ah
2295:0804  or byte ptr cs:[1FBh],1
2295:080a  test al,2
2295:080c  je short 0814h
2295:080e  mov byte ptr cs:[203h],1
2295:0814  test al,1
2295:0816  je short 081Eh
2295:0818  mov byte ptr cs:[204h],2
2295:081e  mov ax,3509h
2295:0821  int 21h
2295:0823  mov cs:[205h],bx
2295:0828  mov cs:[207h],es
2295:082d  mov bx,cs
2295:082f  mov ds,bx
2295:0831  mov dx,85Ah
2295:0834  mov ax,2509h
2295:0837  int 21h
2295:0839  mov ax,3523h
2295:083c  int 21h
2295:083e  mov cs:[209h],bx
2295:0843  mov cs:[20Bh],es
2295:0848  mov bx,cs
2295:084a  mov ds,bx
2295:084c  mov dx,0A90h
2295:084f  mov ax,2523h
2295:0852  int 21h
2295:0854  pop es
2295:0855  pop dx
2295:0856  pop ds
2295:0857  pop bx
2295:0858  pop ax
2295:0859  ret far

; Candidate 2295:0a91, file offset 0x265e1
2295:0a91  push ax
2295:0a92  push ds
2295:0a93  push dx
2295:0a94  mov dx,cs:[20Bh]
2295:0a99  mov ds,dx
2295:0a9b  mov dx,cs:[209h]
2295:0aa0  mov ax,2523h
2295:0aa3  int 21h
2295:0aa5  mov dx,cs:[207h]
2295:0aaa  mov ds,dx
2295:0aac  mov dx,cs:[205h]
2295:0ab1  mov ax,2509h
2295:0ab4  int 21h
2295:0ab6  pop dx
2295:0ab7  pop ds
2295:0ab8  pop ax
2295:0ab9  ret far

; Candidate 2295:0ba9, file offset 0x266f9
2295:0ba9  push bp
2295:0baa  mov bp,sp
2295:0bac  push bx
2295:0bad  push cx
2295:0bae  push dx
2295:0baf  push di
2295:0bb0  push si
2295:0bb1  push ds
2295:0bb2  push es
2295:0bb3  mov dl,[bp+6]
2295:0bb6  mov ch,cs:[0CB1h]
2295:0bbb  xor ch,dl
2295:0bbd  mov ax,ds
2295:0bbf  mov es,ax
2295:0bc1  mov ax,cs
2295:0bc3  mov ds,ax
2295:0bc5  xor ax,ax
2295:0bc7  test ch,1
2295:0bca  je short 0BF9h
2295:0bcc  mov bx,101h
2295:0bcf  mov ax,41h
2295:0bd2  test dl,1
2295:0bd5  jne short 0BD9h
2295:0bd7  xor bl,bl
2295:0bd9  call 0C8Ch
2295:0bdc  mov ah,cs:[216h]
2295:0be1  test word ptr cs:[176h],1
2295:0be8  je short 0BEDh
2295:0bea  or ah,1
2295:0bed  or bl,bl
2295:0bef  jne short 0BF4h
2295:0bf1  or ah,8
2295:0bf4  call 0C37h
2295:0bf7  je short 0C29h
2295:0bf9  test ch,2
2295:0bfc  je short 0C29h
2295:0bfe  mov bx,101h
2295:0c01  mov ax,42h
2295:0c04  test dl,2
2295:0c07  jne short 0C0Bh
2295:0c09  xor bl,bl
2295:0c0b  call 0C8Ch
2295:0c0e  mov ah,cs:[216h]
2295:0c13  test word ptr cs:[176h],1
2295:0c1a  je short 0C1Fh
2295:0c1c  or ah,1
2295:0c1f  or bl,bl
2295:0c21  jne short 0C26h
2295:0c23  or ah,8
2295:0c26  call 0C37h
2295:0c29  mov cs:[0CB1h],dl
2295:0c2e  pop es
2295:0c2f  pop ds
2295:0c30  pop si
2295:0c31  pop di
2295:0c32  pop dx
2295:0c33  pop cx
2295:0c34  pop bx
2295:0c35  pop bp
2295:0c36  ret far

; Candidate 2374:0004, file offset 0x26944
2374:0004  push bp
2374:0005  mov bp,sp
2374:0007  push ax
2374:0008  push bx
2374:0009  push cx
2374:000a  push di
2374:000b  push dx
2374:000c  push ds
2374:000d  push es
2374:000e  push si
2374:000f  cld
2374:0010  mov si,[bp+6]
2374:0013  mov ds,[bp+8]
2374:0016  mov di,[bp+0Ah]
2374:0019  mov es,[bp+0Ch]
2374:001c  mov ax,di
2374:001e  mov dx,es
2374:0020  push cs
2374:0021  call 0080h
2374:0024  mov di,ax
2374:0026  mov es,dx
2374:0028  mov ax,si
2374:002a  mov dx,ds
2374:002c  push cs
2374:002d  call 0080h
2374:0030  mov si,ax
2374:0032  mov ds,dx
2374:0034  mov cx,[bp+0Eh]
2374:0037  mov bx,[bp+10h]
2374:003a  shr cx,1
2374:003c  je short 0040h
2374:003e  rep movsw [di],[si]
2374:0040  jae short 0043h
2374:0042  movsb [di],[si]
2374:0043  or bx,bx
2374:0045  je short 0067h
2374:0047  mov ax,di
2374:0049  mov dx,es
2374:004b  push cs
2374:004c  call 0080h
2374:004f  mov di,ax
2374:0051  mov es,dx
2374:0053  mov ax,si
2374:0055  mov dx,ds
2374:0057  push cs
2374:0058  call 0080h
2374:005b  mov si,ax
2374:005d  mov ds,dx
2374:005f  mov cx,8000h
2374:0062  rep movsw [di],[si]
2374:0064  dec bx
2374:0065  jne short 0047h
2374:0067  pop si
2374:0068  pop es
2374:0069  pop ds
2374:006a  pop dx
2374:006b  pop di
2374:006c  pop cx
2374:006d  pop bx
2374:006e  pop ax
2374:006f  pop bp
2374:0070  ret far

; Candidate 2374:0071, file offset 0x269b1
2374:0071  push bp
2374:0072  mov bp,sp
2374:0074  mov ax,[bp+6]
2374:0077  mov dx,[bp+8]
2374:007a  push cs
2374:007b  call 0080h
2374:007e  pop bp
2374:007f  ret far

; Candidate 2374:0080, file offset 0x269c0
2374:0080  push ax
2374:0081  shr ax,1
2374:0083  shr ax,1
2374:0085  shr ax,1
2374:0087  shr ax,1
2374:0089  add dx,ax
2374:008b  pop ax
2374:008c  and ax,0Fh
2374:008f  ret far

; Candidate 237d:0000, file offset 0x269d0
237d:0000  push bp
237d:0001  mov bp,sp
237d:0003  cmp byte ptr [6654h],1
237d:0008  jne short 0011h
237d:000a  cmp byte ptr [6655h],0
237d:000f  je short 0016h
237d:0011  xor ax,ax
237d:0013  jmp 00E8h
237d:0016  push dx
237d:0017  push si
237d:0018  push es
237d:0019  cmp word ptr [6610h],0
237d:001e  jne short 0019h
237d:0020  inc word ptr [6610h]
237d:0024  call far 000Ah,238Bh
237d:0029  mov ax,[bp+6]
237d:002c  mov [6636h],ax
237d:002f  mov ax,[bp+8]
237d:0032  mov [6638h],ax
237d:0035  mov si,[bp+0Ah]
237d:0038  mov [664Ch],si
237d:003c  mov es,[bp+0Ch]
237d:003f  mov [664Eh],es
237d:0043  xor ah,ah
237d:0045  mov al,es:[si+3]
237d:0049  xor dh,dh
237d:004b  mov dl,es:[si+2]
237d:004f  inc dx
237d:0050  cmp word ptr [664Ah],0
237d:0055  je short 007Ch
237d:0057  push ax
237d:0058  push dx
237d:0059  call far dword ptr [65EEh]
237d:005d  add ax,10h
237d:0060  cmp [660Eh],ax
237d:0064  pop dx
237d:0065  pop ax
237d:0066  jge short 00C2h
237d:0068  push ax
237d:0069  push dx
237d:006a  push word ptr [664Ah]
237d:006e  push word ptr [6648h]
237d:0072  call far 013Fh,1D0Eh
237d:0077  add sp,4
237d:007a  pop dx
237d:007b  pop ax
237d:007c  mov [6632h],ax
237d:007f  push ax
237d:0080  mov [6634h],dx
237d:0084  push dx
237d:0085  call far dword ptr [65EEh]
237d:0089  add sp,4
237d:008c  add ax,10h
237d:008f  mov si,ax
237d:0091  mov [660Eh],ax
237d:0094  call far 0249h,1D0Eh
237d:0099  or dx,dx
237d:009b  jne short 00A1h
237d:009d  cmp ax,si
237d:009f  jb short 00DFh
237d:00a1  mov ax,0
237d:00a4  push ax
237d:00a5  xor ax,ax
237d:00a7  push ax
237d:00a8  mov ax,si
237d:00aa  sub ax,10h
237d:00ad  push ax
237d:00ae  call far 000Bh,1D0Eh
237d:00b3  add sp,6
237d:00b6  cmp dx,0
237d:00b9  je short 00DFh
237d:00bb  mov [6648h],ax
237d:00be  mov [664Ah],dx
237d:00c2  push word ptr [6652h]
237d:00c6  push word ptr [6650h]
237d:00ca  call far dword ptr [65C6h]
237d:00ce  add sp,4
237d:00d1  call far 00F5h,238Bh
237d:00d6  call far dword ptr [65B6h]
237d:00da  mov ax,1
237d:00dd  jmp short 00E1h
237d:00df  xor ax,ax
237d:00e1  dec word ptr [6610h]
237d:00e5  pop es
237d:00e6  pop si
237d:00e7  pop dx
237d:00e8  pop bp
237d:00e9  ret far

; Candidate 238b:000a, file offset 0x26aba
238b:000a  push bp
238b:000b  mov bp,sp
238b:000d  push ax
238b:000e  cmp byte ptr [6655h],0
238b:0013  je short 0018h
238b:0015  jmp 00F2h
238b:0018  cmp word ptr [6628h],0
238b:001d  jne short 007Dh
238b:001f  cmp word ptr [664Ah],0
238b:0024  je short 0015h
238b:0026  mov ax,[663Ah]
238b:0029  sub ax,[6636h]
238b:002d  mov [6656h],ax
238b:0030  mov ax,[663Ch]
238b:0033  sub ax,[6638h]
238b:0037  mov [6658h],ax
238b:003a  mov ax,[6632h]
238b:003d  mov [6662h],ax
238b:0040  neg ax
238b:0042  mov [6664h],ax
238b:0045  mov ax,[6634h]
238b:0048  mov [6666h],ax
238b:004b  neg ax
238b:004d  mov [6668h],ax
238b:0050  mov ax,[6656h]
238b:0053  sar ax,1
238b:0055  sar ax,1
238b:0057  sar ax,1
238b:0059  cmp ax,[6668h]
238b:005d  jle short 007Dh
238b:005f  cmp ax,28h
238b:0062  jge short 007Dh
238b:0064  mov [6656h],ax
238b:0067  add ax,[6666h]
238b:006b  mov [665Ah],ax
238b:006e  cmp word ptr [6656h],0
238b:0073  jge short 007Fh
238b:0075  mov word ptr [6656h],0
238b:007b  jmp short 008Ch
238b:007d  jmp short 00E8h
238b:007f  cmp word ptr [665Ah],28h
238b:0084  jle short 008Ch
238b:0086  mov word ptr [665Ah],28h
238b:008c  mov ax,[6658h]
238b:008f  cmp ax,[6664h]
238b:0093  jle short 00E8h
238b:0095  cmp ax,0C8h
238b:0098  jge short 00E8h
238b:009a  mov [6658h],ax
238b:009d  add ax,[6662h]
238b:00a1  mov [665Ch],ax
238b:00a4  cmp word ptr [6658h],0
238b:00a9  jge short 00B3h
238b:00ab  mov word ptr [6658h],0
238b:00b1  jmp short 00C1h
238b:00b3  cmp word ptr [665Ch],0C8h
238b:00b9  jle short 00C1h
238b:00bb  mov word ptr [665Ch],0C8h
238b:00c1  push word ptr [664Ah]
238b:00c5  push word ptr [6648h]
238b:00c9  mov ax,[665Ch]
238b:00cc  sub ax,[6658h]
238b:00d0  push ax
238b:00d1  mov ax,[665Ah]
238b:00d4  sub ax,[6656h]
238b:00d8  push ax
238b:00d9  mov ax,[6658h]
238b:00dc  push ax
238b:00dd  push word ptr [6656h]
238b:00e1  call far dword ptr [6546h]
238b:00e5  add sp,0Ch
238b:00e8  inc word ptr [6628h]
238b:00ec  jne short 00F2h
238b:00ee  dec word ptr [6628h]
238b:00f2  pop ax
238b:00f3  pop bp
238b:00f4  ret far

; Candidate 238b:00f5, file offset 0x26ba5
238b:00f5  push bp
238b:00f6  mov bp,sp
238b:00f8  push ax
238b:00f9  cmp byte ptr [6655h],0
238b:00fe  jne short 0163h
238b:0100  cmp word ptr [6628h],0
238b:0105  je short 0163h
238b:0107  dec word ptr [6628h]
238b:010b  cmp word ptr [6628h],0
238b:0110  jne short 0163h
238b:0112  cmp word ptr [664Ah],0
238b:0117  je short 0163h
238b:0119  mov ax,[661Ah]
238b:011c  mov [663Ah],ax
238b:011f  sub ax,[6636h]
238b:0123  mov [6656h],ax
238b:0126  mov [665Eh],ax
238b:0129  mov ax,[661Ch]
238b:012c  mov [663Ch],ax
238b:012f  sub ax,[6638h]
238b:0133  mov [6658h],ax
238b:0136  mov [6660h],ax
238b:0139  mov ax,[6632h]
238b:013c  mov [6662h],ax
238b:013f  neg ax
238b:0141  mov [6664h],ax
238b:0144  mov ax,[6634h]
238b:0147  mov [6666h],ax
238b:014a  neg ax
238b:014c  mov [6668h],ax
238b:014f  mov ax,[6656h]
238b:0152  sar ax,1
238b:0154  sar ax,1
238b:0156  sar ax,1
238b:0158  cmp ax,[6668h]
238b:015c  jle short 0163h
238b:015e  cmp ax,28h
238b:0161  jl short 0166h
238b:0163  jmp 0203h
238b:0166  mov [6656h],ax
238b:0169  add ax,[6666h]
238b:016d  mov [665Ah],ax
238b:0170  cmp word ptr [6656h],0
238b:0175  jge short 017Fh
238b:0177  mov word ptr [6656h],0
238b:017d  jmp short 018Ch
238b:017f  cmp word ptr [665Ah],28h
238b:0184  jle short 018Ch
238b:0186  mov word ptr [665Ah],28h
238b:018c  mov ax,[6658h]
238b:018f  cmp ax,[6664h]
238b:0193  jle short 0163h
238b:0195  cmp ax,0C8h
238b:0198  jge short 0163h
238b:019a  mov [6658h],ax
238b:019d  add ax,[6662h]
238b:01a1  mov [665Ch],ax
238b:01a4  cmp word ptr [6658h],0
238b:01a9  jge short 01B3h
238b:01ab  mov word ptr [6658h],0
238b:01b1  jmp short 01C1h
238b:01b3  cmp word ptr [665Ch],0C8h
238b:01b9  jle short 01C1h
238b:01bb  mov word ptr [665Ch],0C8h
238b:01c1  push word ptr [664Ah]
238b:01c5  push word ptr [6648h]
238b:01c9  mov ax,[665Ch]
238b:01cc  sub ax,[6658h]
238b:01d0  push ax
238b:01d1  mov ax,[665Ah]
238b:01d4  sub ax,[6656h]
238b:01d8  push ax
238b:01d9  mov ax,[6658h]
238b:01dc  push ax
238b:01dd  push word ptr [6656h]
238b:01e1  call far dword ptr [65D2h]
238b:01e5  add sp,0Ch
238b:01e8  push word ptr [6660h]
238b:01ec  push word ptr [665Eh]
238b:01f0  push word ptr [664Eh]
238b:01f4  push word ptr [664Ch]
238b:01f8  mov ax,0
238b:01fb  push ax
238b:01fc  call far dword ptr [656Ah]
238b:0200  add sp,0Ah
238b:0203  pop ax
238b:0204  pop bp
238b:0205  ret far

; Candidate 238b:0206, file offset 0x26cb6
238b:0206  push bp
238b:0207  mov bp,sp
238b:0209  push ax
238b:020a  push bx
238b:020b  push cx
238b:020c  push di
238b:020d  push dx
238b:020e  push si
238b:020f  mov cx,[bp+6]
238b:0212  mov dx,[bp+8]
238b:0215  mov si,[bp+0Ah]
238b:0218  mov di,[bp+0Ch]
238b:021b  cmp word ptr [6610h],0
238b:0220  jne short 021Bh
238b:0222  inc word ptr [6610h]
238b:0226  test word ptr [663Eh],8000h
238b:022c  je short 023Ch
238b:022e  mov ax,[663Eh]
238b:0231  inc al
238b:0233  jne short 0237h
238b:0235  dec al
238b:0237  mov [663Eh],ax
238b:023a  jmp short 02A7h
238b:023c  mov [6640h],cx
238b:0240  mov [6642h],dx
238b:0244  mov [6644h],si
238b:0248  mov [6646h],di
238b:024c  mov ax,[663Ah]
238b:024f  sub ax,[6636h]
238b:0253  and ax,0FFF8h
238b:0256  mov [6656h],ax
238b:0259  mov bx,[6634h]
238b:025d  shl bx,1
238b:025f  shl bx,1
238b:0261  shl bx,1
238b:0263  sub [6640h],bx
238b:0267  add ax,bx
238b:0269  mov [665Ah],ax
238b:026c  mov ax,[663Ch]
238b:026f  sub ax,[6638h]
238b:0273  mov [6658h],ax
238b:0276  mov bx,[6632h]
238b:027a  sub [6642h],bx
238b:027e  add ax,bx
238b:0280  mov [665Ch],ax
238b:0283  mov word ptr [663Eh],8000h
238b:0289  cmp [665Ah],cx
238b:028d  jl short 02BEh
238b:028f  cmp [6656h],si
238b:0293  jg short 02BEh
238b:0295  cmp [665Ch],dx
238b:0299  jle short 02BEh
238b:029b  cmp [6658h],di
238b:029f  jg short 02BEh
238b:02a1  or word ptr [663Eh],4000h
238b:02a7  push word ptr [6652h]
238b:02ab  push word ptr [6650h]
238b:02af  call far dword ptr [65C6h]
238b:02b3  add sp,4
238b:02b6  push cs
238b:02b7  call 000Ah
238b:02ba  call far dword ptr [65B6h]
238b:02be  dec word ptr [6610h]
238b:02c2  pop si
238b:02c3  pop dx
238b:02c4  pop di
238b:02c5  pop cx
238b:02c6  pop bx
238b:02c7  pop ax
238b:02c8  pop bp
238b:02c9  ret far

; Candidate 238b:02ca, file offset 0x26d7a
238b:02ca  push bp
238b:02cb  mov bp,sp
238b:02cd  push ax
238b:02ce  cmp word ptr [6610h],0
238b:02d3  jne short 02CEh
238b:02d5  inc word ptr [6610h]
238b:02d9  mov ax,[663Eh]
238b:02dc  cmp al,0
238b:02de  je short 02E6h
238b:02e0  dec word ptr [663Eh]
238b:02e4  jmp short 02F1h
238b:02e6  mov word ptr [663Eh],0
238b:02ec  test ax,4000h
238b:02ef  je short 0308h
238b:02f1  push word ptr [6652h]
238b:02f5  push word ptr [6650h]
238b:02f9  call far dword ptr [65C6h]
238b:02fd  add sp,4
238b:0300  push cs
238b:0301  call 00F5h
238b:0304  call far dword ptr [65B6h]
238b:0308  dec word ptr [6610h]
238b:030c  pop ax
238b:030d  pop bp
238b:030e  ret far

; Candidate 238b:030f, file offset 0x26dbf
238b:030f  push bp
238b:0310  mov bp,sp
238b:0312  cmp word ptr [6610h],0
238b:0317  jne short 0312h
238b:0319  inc word ptr [6610h]
238b:031d  push word ptr [6652h]
238b:0321  push word ptr [6650h]
238b:0325  call far dword ptr [65C6h]
238b:0329  add sp,4
238b:032c  push cs
238b:032d  call 000Ah
238b:0330  call far dword ptr [65B6h]
238b:0334  dec word ptr [6610h]
238b:0338  pop bp
238b:0339  ret far

; Candidate 238b:033a, file offset 0x26dea
238b:033a  push bp
238b:033b  mov bp,sp
238b:033d  cmp word ptr [6610h],0
238b:0342  jne short 033Dh
238b:0344  inc word ptr [6610h]
238b:0348  push word ptr [6652h]
238b:034c  push word ptr [6650h]
238b:0350  call far dword ptr [65C6h]
238b:0354  add sp,4
238b:0357  push cs
238b:0358  call 00F5h
238b:035b  call far dword ptr [65B6h]
238b:035f  dec word ptr [6610h]
238b:0363  pop bp
238b:0364  ret far

; Candidate 23c1:00a0, file offset 0x26eb0
23c1:00a0  push bp
23c1:00a1  mov bp,sp
23c1:00a3  push cx
23c1:00a4  push dx
23c1:00a5  mov cx,[bp+6]
23c1:00a8  mov dx,[bp+8]
23c1:00ab  cmp word ptr [6610h],0
23c1:00b0  jne short 00ABh
23c1:00b2  inc word ptr [6610h]
23c1:00b6  add cx,[661Ah]
23c1:00ba  add dx,[661Ch]
23c1:00be  call 6
23c1:00c1  dec word ptr [6610h]
23c1:00c5  pop dx
23c1:00c6  pop cx
23c1:00c7  pop bp
23c1:00c8  ret far

; Candidate 23cd:005d, file offset 0x26f2d
23cd:005d  push bp
23cd:005e  mov bp,sp
23cd:0060  push bx
23cd:0061  push cx
23cd:0062  push di
23cd:0063  push ds
23cd:0064  push dx
23cd:0065  push es
23cd:0066  push si
23cd:0067  cld
23cd:0068  mov si,[bp+6]
23cd:006b  mov ds,[bp+8]
23cd:006e  mov dx,[si]
23cd:0070  add si,4
23cd:0073  push ds
23cd:0074  push si
23cd:0075  mov bx,666Ah
23cd:0078  mov ax,ds
23cd:007a  mov es,ax
23cd:007c  push cs
23cd:007d  call 000Ah
23cd:0080  cmp bx,0FFFFh
23cd:0083  je short 00E6h
23cd:0085  mov ax,[666Ah]
23cd:0088  xor bx,bx
23cd:008a  mov [666Eh],bx
23cd:008e  mov [6670h],ax
23cd:0091  push ax
23cd:0092  mov bx,1D9Bh
23cd:0095  push bx
23cd:0096  mov bx,21h
23cd:0099  push bx
23cd:009a  call far dword ptr [666Eh]
23cd:009e  pop cx
23cd:009f  pop cx
23cd:00a0  pop cx
23cd:00a1  mov [666Eh],ax
23cd:00a4  shl bx,1
23cd:00a6  shl bx,1
23cd:00a8  shl bx,1
23cd:00aa  shl bx,1
23cd:00ac  push bx
23cd:00ad  push cx
23cd:00ae  xor bx,bx
23cd:00b0  push bx
23cd:00b1  call far 0194h,1D0Eh
23cd:00b6  add sp,6
23cd:00b9  or ax,dx
23cd:00bb  je short 00E6h
23cd:00bd  mov [6670h],dx
23cd:00c1  pop si
23cd:00c2  pop ds
23cd:00c3  lodsw [si]
23cd:00c4  mov bx,ax
23cd:00c6  lodsw [si]
23cd:00c7  push ax
23cd:00c8  push bx
23cd:00c9  call far dword ptr [666Eh]
23cd:00cd  pop cx
23cd:00ce  pop cx
23cd:00cf  jb short 00E8h
23cd:00d1  mov ax,2B16h
23cd:00d4  mov ds,ax
23cd:00d6  cmp byte ptr [6654h],0
23cd:00db  je short 00E2h
23cd:00dd  mov byte ptr [6655h],0
23cd:00e2  xor ax,ax
23cd:00e4  jmp short 00EBh
23cd:00e6  pop ds
23cd:00e7  pop si
23cd:00e8  mov ax,0FFFFh
23cd:00eb  pop si
23cd:00ec  pop es
23cd:00ed  pop dx
23cd:00ee  pop ds
23cd:00ef  pop di
23cd:00f0  pop cx
23cd:00f1  pop bx
23cd:00f2  pop bp
23cd:00f3  ret far

; Candidate 23dc:0004, file offset 0x26fc4
23dc:0004  push bp
23dc:0005  mov bp,sp
23dc:0007  push es
23dc:0008  push si
23dc:0009  mov ax,2B16h
23dc:000c  mov es,ax
23dc:000e  mov si,6676h
23dc:0011  xor ah,ah
23dc:0013  mov al,es:[si]
23dc:0016  shr al,1
23dc:0018  shr al,1
23dc:001a  rcl byte ptr es:[si+2],1
23dc:001e  rcl byte ptr es:[si+1],1
23dc:0022  cmc
23dc:0023  sbb al,es:[si]
23dc:0026  shr al,1
23dc:0028  rcr byte ptr es:[si],1
23dc:002b  mov al,es:[si]
23dc:002e  xor al,es:[si+1]
23dc:0032  pop si
23dc:0033  pop es
23dc:0034  pop bp
23dc:0035  ret far

; Candidate 23df:0006, file offset 0x26ff6
23df:0006  push bp
23df:0007  mov bp,sp
23df:0009  mov ax,[bp+6]
23df:000c  mov dx,[bp+8]
23df:000f  xchg dl,ah
23df:0011  xchg dh,al
23df:0013  pop bp
23df:0014  ret far

; Candidate 23df:0015, file offset 0x27005
23df:0015  push bp
23df:0016  mov bp,sp
23df:0018  mov ax,[bp+6]
23df:001b  xchg al,ah
23df:001d  pop bp
23df:001e  ret far

; Candidate 23e1:000e, file offset 0x2701e
23e1:000e  push bp
23e1:000f  mov bp,sp
23e1:0011  push ax
23e1:0012  push bx
23e1:0013  push ds
23e1:0014  push es
23e1:0015  mov ah,35h
23e1:0017  mov al,1Ch
23e1:0019  int 21h
23e1:001b  mov cs:[2],es
23e1:0020  mov cs:[0],bx
23e1:0025  mov ah,25h
23e1:0027  mov al,1Ch
23e1:0029  push cs
23e1:002a  pop ds
23e1:002b  mov dx,53h
23e1:002e  int 21h
23e1:0030  pop es
23e1:0031  pop ds
23e1:0032  pop bx
23e1:0033  pop ax
23e1:0034  pop bp
23e1:0035  ret far

; Candidate 23e1:0036, file offset 0x27046
23e1:0036  push bp
23e1:0037  mov bp,sp
23e1:0039  push ax
23e1:003a  push ds
23e1:003b  push dx
23e1:003c  push es
23e1:003d  mov ah,25h
23e1:003f  mov al,1Ch
23e1:0041  mov ds,cs:[2]
23e1:0046  mov dx,cs:[0]
23e1:004b  int 21h
23e1:004d  pop es
23e1:004e  pop dx
23e1:004f  pop ds
23e1:0050  pop ax
23e1:0051  pop bp
23e1:0052  ret far

; Candidate 23ec:0004, file offset 0x270c4
23ec:0004  push bp
23ec:0005  mov bp,sp
23ec:0007  push bx
23ec:0008  push cx
23ec:0009  push di
23ec:000a  push ds
23ec:000b  push dx
23ec:000c  push es
23ec:000d  push si
23ec:000e  mov ax,[bp+6]
23ec:0011  mov dx,[bp+8]
23ec:0014  call far 0080h,2374h
23ec:0019  mov si,ax
23ec:001b  mov ds,dx
23ec:001d  mov ax,[bp+0Ah]
23ec:0020  mov dx,[bp+0Ch]
23ec:0023  call far 0080h,2374h
23ec:0028  mov di,ax
23ec:002a  mov es,dx
23ec:002c  mov dx,[bp+0Eh]
23ec:002f  mov cs:[0FAh],di
23ec:0034  add dx,di
23ec:0036  mov cs:[0FEh],dx
23ec:003b  cld
23ec:003c  mov bx,si
23ec:003e  mov dx,ds
23ec:0040  mov bp,es
23ec:0042  mov ax,cs:[0FEh]
23ec:0046  sub ax,di
23ec:0048  je short 00A1h
23ec:004a  mov cs:[0FCh],ax
23ec:004e  mov si,bx
23ec:0050  mov ds,dx
23ec:0052  lodsb [si]
23ec:0053  or al,al
23ec:0055  js short 0082h
23ec:0057  mov ah,al
23ec:0059  and ah,0Fh
23ec:005c  mov ch,al
23ec:005e  mov cl,4
23ec:0060  shr ch,cl
23ec:0062  mov cl,ch
23ec:0064  xor ch,ch
23ec:0066  add cx,3
23ec:0069  cmp cx,cs:[0FCh]
23ec:006e  jbe short 0075h
23ec:0070  mov cx,cs:[0FCh]
23ec:0075  lodsb [si]
23ec:0076  mov bx,si
23ec:0078  mov si,di
23ec:007a  sub si,ax
23ec:007c  mov ds,bp
23ec:007e  rep movsb [di],[si]
23ec:0080  jmp short 0042h
23ec:0082  test al,40h
23ec:0084  jne short 00AAh
23ec:0086  cmp al,80h
23ec:0088  je short 00A1h
23ec:008a  mov cl,al
23ec:008c  and cx,3Fh
23ec:008f  cmp cx,cs:[0FCh]
23ec:0094  jbe short 009Bh
23ec:0096  mov cx,cs:[0FCh]
23ec:009b  rep movsb [di],[si]
23ec:009d  mov bx,si
23ec:009f  jmp short 0042h
23ec:00a1  mov ax,di
23ec:00a3  sub ax,cs:[0FAh]
23ec:00a8  jmp short 00F1h
23ec:00aa  mov cl,al
23ec:00ac  and cx,3Fh
23ec:00af  add cx,3
23ec:00b2  cmp al,0FEh
23ec:00b4  jne short 00CDh
23ec:00b6  lodsw [si]
23ec:00b7  mov cx,ax
23ec:00b9  lodsb [si]
23ec:00ba  mov bx,si
23ec:00bc  cmp cx,cs:[0FCh]
23ec:00c1  jbe short 00C8h
23ec:00c3  mov cx,cs:[0FCh]
23ec:00c8  rep stosb [di]
23ec:00ca  jmp 0042h
23ec:00cd  cmp al,0FFh
23ec:00cf  jne short 00D4h
23ec:00d1  lodsw [si]
23ec:00d2  mov cx,ax
23ec:00d4  lodsw [si]
23ec:00d5  mov bx,si
23ec:00d7  add ax,cs:[0FAh]
23ec:00dc  mov si,ax
23ec:00de  mov ds,bp
23ec:00e0  cmp cx,cs:[0FCh]
23ec:00e5  jbe short 00ECh
23ec:00e7  mov cx,cs:[0FCh]
23ec:00ec  rep movsb [di],[si]
23ec:00ee  jmp 0042h
23ec:00f1  pop si
23ec:00f2  pop es
23ec:00f3  pop dx
23ec:00f4  pop ds
23ec:00f5  pop di
23ec:00f6  pop cx
23ec:00f7  pop bx
23ec:00f8  pop bp
23ec:00f9  ret far

; Candidate 23ec:0104, file offset 0x271c4
23ec:0104  push bp
23ec:0105  mov bp,sp
23ec:0107  push bx
23ec:0108  push cx
23ec:0109  push di
23ec:010a  push ds
23ec:010b  push dx
23ec:010c  push es
23ec:010d  push si
23ec:010e  cld
23ec:010f  mov word ptr cs:[17Ch],0
23ec:0116  mov es,[bp+8]
23ec:0119  mov ds,[bp+6]
23ec:011c  xor cx,cx
23ec:011e  xor di,di
23ec:0120  xor si,si
23ec:0122  add si,2
23ec:0125  mov bx,[si]
23ec:0127  mov dx,[si+2]
23ec:012a  add si,4
23ec:012d  lodsw [si]
23ec:012e  add si,ax
23ec:0130  mov cl,[si]
23ec:0132  inc si
23ec:0133  or cl,cl
23ec:0135  je short 0145h
23ec:0137  js short 014Eh
23ec:0139  add cs:[17Ch],cx
23ec:013e  call 0163h
23ec:0141  rep movsb [di],[si]
23ec:0143  jmp short 015Bh
23ec:0145  mov cx,[si]
23ec:0147  xchg ch,cl
23ec:0149  add si,2
23ec:014c  jmp short 0150h
23ec:014e  neg cl
23ec:0150  call 0163h
23ec:0153  lodsb [si]
23ec:0154  add cs:[17Ch],cx
23ec:0159  rep stosb [di]
23ec:015b  mov ax,bx
23ec:015d  or ax,dx
23ec:015f  jne short 0130h
23ec:0161  jmp short 017Eh
23ec:0163  sub bx,cx
23ec:0165  sbb dx,0
23ec:0168  push di
23ec:0169  shr di,1
23ec:016b  shr di,1
23ec:016d  shr di,1
23ec:016f  shr di,1
23ec:0171  mov ax,es
23ec:0173  add ax,di
23ec:0175  mov es,ax
23ec:0177  pop di
23ec:0178  and di,0Fh
23ec:017b  ret

; Candidate 2404:000c, file offset 0x2724c
2404:000c  push bp
2404:000d  mov bp,sp
2404:000f  mov dx,3DAh
2404:0012  in al,dx
2404:0013  and al,8
2404:0015  xor ah,ah
2404:0017  pop bp
2404:0018  ret far

; Candidate 2404:0019, file offset 0x27259
2404:0019  push bp
2404:001a  mov bp,sp
2404:001c  push ax
2404:001d  push bx
2404:001e  push dx
2404:001f  mov bl,[bp+6]
2404:0022  mov dx,3DAh
2404:0025  cmp bl,1
2404:0028  je short 0036h
2404:002a  in al,dx
2404:002b  test al,8
2404:002d  je short 002Ah
2404:002f  in al,dx
2404:0030  test al,8
2404:0032  jne short 002Fh
2404:0034  je short 0040h
2404:0036  in al,dx
2404:0037  test al,8
2404:0039  jne short 0036h
2404:003b  in al,dx
2404:003c  test al,8
2404:003e  je short 003Bh
2404:0040  pop dx
2404:0041  pop bx
2404:0042  pop ax
2404:0043  pop bp
2404:0044  ret far

; Candidate 2aba:002f, file offset 0x2ddcf
2aba:002f  int 3Fh
2aba:0031  inc sp
2aba:0032  push ds
2aba:0033  add ch,cl
2aba:0035  aas
2aba:0036  fistp word ptr [bx+si],st
2aba:0038  add ch,cl
2aba:003a  aas
2aba:003b  add [bx+si],al
2aba:003e  int 3Fh
2aba:0040  jp short 0061h
2aba:0042  add ch,cl
2aba:0044  aas
2aba:0045  xor [si],bx
2aba:0047  add ch,cl
2aba:0049  aas
2aba:004a  in al,dx
2aba:004b  sbb ax,0CD00h
2aba:004e  aas
2aba:004f  sub bl,[di]
2aba:0051  add ch,cl
2aba:0053  aas
2aba:0054  in al,12h
2aba:0056  add ch,cl
2aba:0058  aas
2aba:0059  or [bp+di],cx
2aba:005b  add ch,cl
2aba:005d  aas
2aba:005e  daa
2aba:005f  and [bx+si],ax
2aba:0061  int 3Fh
2aba:0063  mov bx,0Dh
2aba:0066  int 3Fh
2aba:0068  or al,3
2aba:006a  add ch,cl
2aba:006c  aas
2aba:006d  push ax
2aba:006e  or ax,[bx+si]
2aba:0070  int 3Fh
2aba:0072  pushf
2aba:0073  add [bx+si],al
2aba:0075  int 3Fh
2aba:0077  mov [2],al
2aba:007a  int 3Fh
2aba:007c  hlt
2aba:007d  pop ds
2aba:007e  add ch,cl
2aba:0080  aas
2aba:0081  rol word ptr [bp+di],1
2aba:0083  add ch,cl
2aba:0085  aas
2aba:0086  push 16h
2aba:0088  add ch,cl
2aba:008a  aas
2aba:008b  add [bx+si],al
2aba:008d  add [bx+si],al
2aba:008f  add ch,cl
2aba:0091  aas
2aba:0092  add [bx+si],al
2aba:0094  and byte ptr [bx+di],0
2aba:0097  add [bp+si],cl
2aba:0099  sub [bx+si+1901h],al
2aba:009d  add [bx+si],al
2aba:009f  add [bx+si],al
2aba:00a1  add [bx+si],al
2aba:00a3  add [bx+si],al
2aba:00a5  add [bx+si],al
2aba:00a7  add [bx+si],al
2aba:00a9  add [bx+si],al
2aba:00ab  add [bx+si],al
2aba:00ad  add [bx+si],al
2aba:00af  add ch,cl
2aba:00b1  aas
2aba:00b2  les cx,[di]
2aba:00b4  add ch,cl
2aba:00b6  aas
2aba:00b7  xor [0CD00h],bl
2aba:00bb  aas
2aba:00bc  ja short 00CEh
2aba:00be  add ch,cl
2aba:00c0  aas
2aba:00c1  ror word ptr [0CD00h],cl
2aba:00c5  aas
2aba:00c6  and al,0
2aba:00c9  int 3Fh
2aba:00cb  and al,6
2aba:00cd  add ch,cl
2aba:00cf  aas
2aba:00d0  push es
2aba:00d1  sbb al,0
2aba:00d3  int 3Fh
2aba:00d5  sub cl,[bp+si]
2aba:00d7  add ch,cl
2aba:00d9  aas
2aba:00da  add word ptr [di],0CD00h
2aba:00de  aas
2aba:00df  insb [di],dx
2aba:00e0  add ch,cl
2aba:00e3  aas
2aba:00e4  leave
2aba:00e5  add al,0
2aba:00e7  int 3Fh
2aba:00e9  mov dh,11h
2aba:00eb  add ch,cl
2aba:00ed  aas
2aba:00ee  hlt
2aba:00ef  add ax,[bx+si]
2aba:00f1  int 3Fh
2aba:00f3  in ax,dx
2aba:00f4  push ds
2aba:00f5  add ch,cl
2aba:00f7  aas
2aba:00f8  add dl,[bx+di]
2aba:00fa  add ch,cl
2aba:00fc  aas
2aba:00fd  (bad)
2aba:00ff  add ch,cl
2aba:0101  aas
2aba:0102  mov bl,[bp+si]
2aba:0104  add ch,cl
2aba:0106  aas
2aba:0107  inc bx
2aba:0108  or ax,0CD00h
2aba:010b  aas
2aba:010c  out dx,ax
2aba:010d  adc al,[bx+si]
2aba:010f  int 3Fh
2aba:0111  frstor [bx+di]
2aba:0113  add ch,cl
2aba:0115  aas
2aba:0116  jo short 011Bh
2aba:0118  add ch,cl
2aba:011a  aas
2aba:011b  pop es
2aba:011c  and [bx+si],al
2aba:011e  int 3Fh
2aba:0120  sbb cl,[bp+si]
2aba:0122  add ch,cl
2aba:0124  aas
2aba:0125  fcomp st,dword ptr [bx]
2aba:0127  add ch,cl
2aba:0129  aas
2aba:012a  dec bx
2aba:012b  adc [bx+si],ax
2aba:012d  add [bx+si],al
2aba:012f  add ch,cl
2aba:0131  aas
2aba:0132  add [bx+si],al
2aba:0134  xor [bp+di],cl
2aba:0137  add [bx+2006h],dl
2aba:013b  add [bx+si],cl
2aba:013d  add [bx+si],al
2aba:013f  add [bx+si],al
2aba:0141  add [bx+si],al
2aba:0143  add [bx+si],al
2aba:0145  add [bx+si],al
2aba:0147  add [bx+si],al
2aba:0149  add [bx+si],al
2aba:014b  add [bx+si],al
2aba:014d  add [bx+si],al
2aba:014f  add ch,cl
2aba:0151  aas
2aba:0152  xchg [bx+si],ax
2aba:0154  add ch,cl
2aba:0156  aas
2aba:0157  add byte ptr [si],0
2aba:015a  int 3Fh
2aba:015c  dec dx
2aba:015d  add [bx+si],ax
2aba:015f  int 3Fh
2aba:0161  das
2aba:0162  add ax,0CD00h
2aba:0165  aas
2aba:0166  add [bx+si],al
2aba:0168  add ch,cl
2aba:016a  aas
2aba:016b  cbw
2aba:016c  add ax,0CD00h
2aba:016f  aas
2aba:0170  jp short 0177h
2aba:0172  add ch,cl
2aba:0174  aas
2aba:0175  push ds
2aba:0176  add al,0
2aba:0178  add [bx+si],al
2aba:017a  add [bx+si],al
2aba:017c  add [bx+si],al
2aba:017e  add [bx+si],al
2aba:0180  int 3Fh
2aba:0182  add [bx+si],al
2aba:0184  (bad)
2aba:0186  add [bx+si],al
2aba:0188  dec di
2aba:0189  nop
2aba:018b  add [bx+si],cx
2aba:018d  add [bx+si],al
2aba:018f  add [bx+si],al
2aba:0191  add [bx+si],al
2aba:0193  add [bx+si],al
2aba:0195  add [bx+si],al
2aba:0197  add [bx+si],al
2aba:0199  add [bx+si],al
2aba:019b  add [bx+si],al
2aba:019d  add [bx+si],al
2aba:019f  add ch,cl
2aba:01a1  aas
2aba:01a2  mov sp,1Bh
2aba:01a5  int 3Fh
2aba:01a7  sub [bp+si],dl
2aba:01a9  add ch,cl
2aba:01ab  aas
2aba:01ac  enter 11h,0CDh
2aba:01b0  aas
2aba:01b1  clc
2aba:01b2  adc [bx+si],ax
2aba:01b4  int 3Fh
2aba:01b6  daa
2aba:01b7  push ss
2aba:01b8  add ch,cl
2aba:01ba  aas
2aba:01bb  ret 14h

; Candidate 2aba:003e, file offset 0x2ddde
2aba:003e  int 3Fh
2aba:0040  jp short 0061h
2aba:0042  add ch,cl
2aba:0044  aas
2aba:0045  xor [si],bx
2aba:0047  add ch,cl
2aba:0049  aas
2aba:004a  in al,dx
2aba:004b  sbb ax,0CD00h
2aba:004e  aas
2aba:004f  sub bl,[di]
2aba:0051  add ch,cl
2aba:0053  aas
2aba:0054  in al,12h
2aba:0056  add ch,cl
2aba:0058  aas
2aba:0059  or [bp+di],cx
2aba:005b  add ch,cl
2aba:005d  aas
2aba:005e  daa
2aba:005f  and [bx+si],ax
2aba:0061  int 3Fh
2aba:0063  mov bx,0Dh
2aba:0066  int 3Fh
2aba:0068  or al,3
2aba:006a  add ch,cl
2aba:006c  aas
2aba:006d  push ax
2aba:006e  or ax,[bx+si]
2aba:0070  int 3Fh
2aba:0072  pushf
2aba:0073  add [bx+si],al
2aba:0075  int 3Fh
2aba:0077  mov [2],al
2aba:007a  int 3Fh
2aba:007c  hlt
2aba:007d  pop ds
2aba:007e  add ch,cl
2aba:0080  aas
2aba:0081  rol word ptr [bp+di],1
2aba:0083  add ch,cl
2aba:0085  aas
2aba:0086  push 16h
2aba:0088  add ch,cl
2aba:008a  aas
2aba:008b  add [bx+si],al
2aba:008d  add [bx+si],al
2aba:008f  add ch,cl
2aba:0091  aas
2aba:0092  add [bx+si],al
2aba:0094  and byte ptr [bx+di],0
2aba:0097  add [bp+si],cl
2aba:0099  sub [bx+si+1901h],al
2aba:009d  add [bx+si],al
2aba:009f  add [bx+si],al
2aba:00a1  add [bx+si],al
2aba:00a3  add [bx+si],al
2aba:00a5  add [bx+si],al
2aba:00a7  add [bx+si],al
2aba:00a9  add [bx+si],al
2aba:00ab  add [bx+si],al
2aba:00ad  add [bx+si],al
2aba:00af  add ch,cl
2aba:00b1  aas
2aba:00b2  les cx,[di]
2aba:00b4  add ch,cl
2aba:00b6  aas
2aba:00b7  xor [0CD00h],bl
2aba:00bb  aas
2aba:00bc  ja short 00CEh
2aba:00be  add ch,cl
2aba:00c0  aas
2aba:00c1  ror word ptr [0CD00h],cl
2aba:00c5  aas
2aba:00c6  and al,0
2aba:00c9  int 3Fh
2aba:00cb  and al,6
2aba:00cd  add ch,cl
2aba:00cf  aas
2aba:00d0  push es
2aba:00d1  sbb al,0
2aba:00d3  int 3Fh
2aba:00d5  sub cl,[bp+si]
2aba:00d7  add ch,cl
2aba:00d9  aas
2aba:00da  add word ptr [di],0CD00h
2aba:00de  aas
2aba:00df  insb [di],dx
2aba:00e0  add ch,cl
2aba:00e3  aas
2aba:00e4  leave
2aba:00e5  add al,0
2aba:00e7  int 3Fh
2aba:00e9  mov dh,11h
2aba:00eb  add ch,cl
2aba:00ed  aas
2aba:00ee  hlt
2aba:00ef  add ax,[bx+si]
2aba:00f1  int 3Fh
2aba:00f3  in ax,dx
2aba:00f4  push ds
2aba:00f5  add ch,cl
2aba:00f7  aas
2aba:00f8  add dl,[bx+di]
2aba:00fa  add ch,cl
2aba:00fc  aas
2aba:00fd  (bad)
2aba:00ff  add ch,cl
2aba:0101  aas
2aba:0102  mov bl,[bp+si]
2aba:0104  add ch,cl
2aba:0106  aas
2aba:0107  inc bx
2aba:0108  or ax,0CD00h
2aba:010b  aas
2aba:010c  out dx,ax
2aba:010d  adc al,[bx+si]
2aba:010f  int 3Fh
2aba:0111  frstor [bx+di]
2aba:0113  add ch,cl
2aba:0115  aas
2aba:0116  jo short 011Bh
2aba:0118  add ch,cl
2aba:011a  aas
2aba:011b  pop es
2aba:011c  and [bx+si],al
2aba:011e  int 3Fh
2aba:0120  sbb cl,[bp+si]
2aba:0122  add ch,cl
2aba:0124  aas
2aba:0125  fcomp st,dword ptr [bx]
2aba:0127  add ch,cl
2aba:0129  aas
2aba:012a  dec bx
2aba:012b  adc [bx+si],ax
2aba:012d  add [bx+si],al
2aba:012f  add ch,cl
2aba:0131  aas
2aba:0132  add [bx+si],al
2aba:0134  xor [bp+di],cl
2aba:0137  add [bx+2006h],dl
2aba:013b  add [bx+si],cl
2aba:013d  add [bx+si],al
2aba:013f  add [bx+si],al
2aba:0141  add [bx+si],al
2aba:0143  add [bx+si],al
2aba:0145  add [bx+si],al
2aba:0147  add [bx+si],al
2aba:0149  add [bx+si],al
2aba:014b  add [bx+si],al
2aba:014d  add [bx+si],al
2aba:014f  add ch,cl
2aba:0151  aas
2aba:0152  xchg [bx+si],ax
2aba:0154  add ch,cl
2aba:0156  aas
2aba:0157  add byte ptr [si],0
2aba:015a  int 3Fh
2aba:015c  dec dx
2aba:015d  add [bx+si],ax
2aba:015f  int 3Fh
2aba:0161  das
2aba:0162  add ax,0CD00h
2aba:0165  aas
2aba:0166  add [bx+si],al
2aba:0168  add ch,cl
2aba:016a  aas
2aba:016b  cbw
2aba:016c  add ax,0CD00h
2aba:016f  aas
2aba:0170  jp short 0177h
2aba:0172  add ch,cl
2aba:0174  aas
2aba:0175  push ds
2aba:0176  add al,0
2aba:0178  add [bx+si],al
2aba:017a  add [bx+si],al
2aba:017c  add [bx+si],al
2aba:017e  add [bx+si],al
2aba:0180  int 3Fh
2aba:0182  add [bx+si],al
2aba:0184  (bad)
2aba:0186  add [bx+si],al
2aba:0188  dec di
2aba:0189  nop
2aba:018b  add [bx+si],cx
2aba:018d  add [bx+si],al
2aba:018f  add [bx+si],al
2aba:0191  add [bx+si],al
2aba:0193  add [bx+si],al
2aba:0195  add [bx+si],al
2aba:0197  add [bx+si],al
2aba:0199  add [bx+si],al
2aba:019b  add [bx+si],al
2aba:019d  add [bx+si],al
2aba:019f  add ch,cl
2aba:01a1  aas
2aba:01a2  mov sp,1Bh
2aba:01a5  int 3Fh
2aba:01a7  sub [bp+si],dl
2aba:01a9  add ch,cl
2aba:01ab  aas
2aba:01ac  enter 11h,0CDh
2aba:01b0  aas
2aba:01b1  clc
2aba:01b2  adc [bx+si],ax
2aba:01b4  int 3Fh
2aba:01b6  daa
2aba:01b7  push ss
2aba:01b8  add ch,cl
2aba:01ba  aas
2aba:01bb  ret 14h

; Candidate 2aba:0048, file offset 0x2dde8
2aba:0048  int 3Fh
2aba:004a  in al,dx
2aba:004b  sbb ax,0CD00h
2aba:004e  aas
2aba:004f  sub bl,[di]
2aba:0051  add ch,cl
2aba:0053  aas
2aba:0054  in al,12h
2aba:0056  add ch,cl
2aba:0058  aas
2aba:0059  or [bp+di],cx
2aba:005b  add ch,cl
2aba:005d  aas
2aba:005e  daa
2aba:005f  and [bx+si],ax
2aba:0061  int 3Fh
2aba:0063  mov bx,0Dh
2aba:0066  int 3Fh
2aba:0068  or al,3
2aba:006a  add ch,cl
2aba:006c  aas
2aba:006d  push ax
2aba:006e  or ax,[bx+si]
2aba:0070  int 3Fh
2aba:0072  pushf
2aba:0073  add [bx+si],al
2aba:0075  int 3Fh
2aba:0077  mov [2],al
2aba:007a  int 3Fh
2aba:007c  hlt
2aba:007d  pop ds
2aba:007e  add ch,cl
2aba:0080  aas
2aba:0081  rol word ptr [bp+di],1
2aba:0083  add ch,cl
2aba:0085  aas
2aba:0086  push 16h
2aba:0088  add ch,cl
2aba:008a  aas
2aba:008b  add [bx+si],al
2aba:008d  add [bx+si],al
2aba:008f  add ch,cl
2aba:0091  aas
2aba:0092  add [bx+si],al
2aba:0094  and byte ptr [bx+di],0
2aba:0097  add [bp+si],cl
2aba:0099  sub [bx+si+1901h],al
2aba:009d  add [bx+si],al
2aba:009f  add [bx+si],al
2aba:00a1  add [bx+si],al
2aba:00a3  add [bx+si],al
2aba:00a5  add [bx+si],al
2aba:00a7  add [bx+si],al
2aba:00a9  add [bx+si],al
2aba:00ab  add [bx+si],al
2aba:00ad  add [bx+si],al
2aba:00af  add ch,cl
2aba:00b1  aas
2aba:00b2  les cx,[di]
2aba:00b4  add ch,cl
2aba:00b6  aas
2aba:00b7  xor [0CD00h],bl
2aba:00bb  aas
2aba:00bc  ja short 00CEh
2aba:00be  add ch,cl
2aba:00c0  aas
2aba:00c1  ror word ptr [0CD00h],cl
2aba:00c5  aas
2aba:00c6  and al,0
2aba:00c9  int 3Fh
2aba:00cb  and al,6
2aba:00cd  add ch,cl
2aba:00cf  aas
2aba:00d0  push es
2aba:00d1  sbb al,0
2aba:00d3  int 3Fh
2aba:00d5  sub cl,[bp+si]
2aba:00d7  add ch,cl
2aba:00d9  aas
2aba:00da  add word ptr [di],0CD00h
2aba:00de  aas
2aba:00df  insb [di],dx
2aba:00e0  add ch,cl
2aba:00e3  aas
2aba:00e4  leave
2aba:00e5  add al,0
2aba:00e7  int 3Fh
2aba:00e9  mov dh,11h
2aba:00eb  add ch,cl
2aba:00ed  aas
2aba:00ee  hlt
2aba:00ef  add ax,[bx+si]
2aba:00f1  int 3Fh
2aba:00f3  in ax,dx
2aba:00f4  push ds
2aba:00f5  add ch,cl
2aba:00f7  aas
2aba:00f8  add dl,[bx+di]
2aba:00fa  add ch,cl
2aba:00fc  aas
2aba:00fd  (bad)
2aba:00ff  add ch,cl
2aba:0101  aas
2aba:0102  mov bl,[bp+si]
2aba:0104  add ch,cl
2aba:0106  aas
2aba:0107  inc bx
2aba:0108  or ax,0CD00h
2aba:010b  aas
2aba:010c  out dx,ax
2aba:010d  adc al,[bx+si]
2aba:010f  int 3Fh
2aba:0111  frstor [bx+di]
2aba:0113  add ch,cl
2aba:0115  aas
2aba:0116  jo short 011Bh
2aba:0118  add ch,cl
2aba:011a  aas
2aba:011b  pop es
2aba:011c  and [bx+si],al
2aba:011e  int 3Fh
2aba:0120  sbb cl,[bp+si]
2aba:0122  add ch,cl
2aba:0124  aas
2aba:0125  fcomp st,dword ptr [bx]
2aba:0127  add ch,cl
2aba:0129  aas
2aba:012a  dec bx
2aba:012b  adc [bx+si],ax
2aba:012d  add [bx+si],al
2aba:012f  add ch,cl
2aba:0131  aas
2aba:0132  add [bx+si],al
2aba:0134  xor [bp+di],cl
2aba:0137  add [bx+2006h],dl
2aba:013b  add [bx+si],cl
2aba:013d  add [bx+si],al
2aba:013f  add [bx+si],al
2aba:0141  add [bx+si],al
2aba:0143  add [bx+si],al
2aba:0145  add [bx+si],al
2aba:0147  add [bx+si],al
2aba:0149  add [bx+si],al
2aba:014b  add [bx+si],al
2aba:014d  add [bx+si],al
2aba:014f  add ch,cl
2aba:0151  aas
2aba:0152  xchg [bx+si],ax
2aba:0154  add ch,cl
2aba:0156  aas
2aba:0157  add byte ptr [si],0
2aba:015a  int 3Fh
2aba:015c  dec dx
2aba:015d  add [bx+si],ax
2aba:015f  int 3Fh
2aba:0161  das
2aba:0162  add ax,0CD00h
2aba:0165  aas
2aba:0166  add [bx+si],al
2aba:0168  add ch,cl
2aba:016a  aas
2aba:016b  cbw
2aba:016c  add ax,0CD00h
2aba:016f  aas
2aba:0170  jp short 0177h
2aba:0172  add ch,cl
2aba:0174  aas
2aba:0175  push ds
2aba:0176  add al,0
2aba:0178  add [bx+si],al
2aba:017a  add [bx+si],al
2aba:017c  add [bx+si],al
2aba:017e  add [bx+si],al
2aba:0180  int 3Fh
2aba:0182  add [bx+si],al
2aba:0184  (bad)
2aba:0186  add [bx+si],al
2aba:0188  dec di
2aba:0189  nop
2aba:018b  add [bx+si],cx
2aba:018d  add [bx+si],al
2aba:018f  add [bx+si],al
2aba:0191  add [bx+si],al
2aba:0193  add [bx+si],al
2aba:0195  add [bx+si],al
2aba:0197  add [bx+si],al
2aba:0199  add [bx+si],al
2aba:019b  add [bx+si],al
2aba:019d  add [bx+si],al
2aba:019f  add ch,cl
2aba:01a1  aas
2aba:01a2  mov sp,1Bh
2aba:01a5  int 3Fh
2aba:01a7  sub [bp+si],dl
2aba:01a9  add ch,cl
2aba:01ab  aas
2aba:01ac  enter 11h,0CDh
2aba:01b0  aas
2aba:01b1  clc
2aba:01b2  adc [bx+si],ax
2aba:01b4  int 3Fh
2aba:01b6  daa
2aba:01b7  push ss
2aba:01b8  add ch,cl
2aba:01ba  aas
2aba:01bb  ret 14h

; Candidate 2aba:005c, file offset 0x2ddfc
2aba:005c  int 3Fh
2aba:005e  daa
2aba:005f  and [bx+si],ax
2aba:0061  int 3Fh
2aba:0063  mov bx,0Dh
2aba:0066  int 3Fh
2aba:0068  or al,3
2aba:006a  add ch,cl
2aba:006c  aas
2aba:006d  push ax
2aba:006e  or ax,[bx+si]
2aba:0070  int 3Fh
2aba:0072  pushf
2aba:0073  add [bx+si],al
2aba:0075  int 3Fh
2aba:0077  mov [2],al
2aba:007a  int 3Fh
2aba:007c  hlt
2aba:007d  pop ds
2aba:007e  add ch,cl
2aba:0080  aas
2aba:0081  rol word ptr [bp+di],1
2aba:0083  add ch,cl
2aba:0085  aas
2aba:0086  push 16h
2aba:0088  add ch,cl
2aba:008a  aas
2aba:008b  add [bx+si],al
2aba:008d  add [bx+si],al
2aba:008f  add ch,cl
2aba:0091  aas
2aba:0092  add [bx+si],al
2aba:0094  and byte ptr [bx+di],0
2aba:0097  add [bp+si],cl
2aba:0099  sub [bx+si+1901h],al
2aba:009d  add [bx+si],al
2aba:009f  add [bx+si],al
2aba:00a1  add [bx+si],al
2aba:00a3  add [bx+si],al
2aba:00a5  add [bx+si],al
2aba:00a7  add [bx+si],al
2aba:00a9  add [bx+si],al
2aba:00ab  add [bx+si],al
2aba:00ad  add [bx+si],al
2aba:00af  add ch,cl
2aba:00b1  aas
2aba:00b2  les cx,[di]
2aba:00b4  add ch,cl
2aba:00b6  aas
2aba:00b7  xor [0CD00h],bl
2aba:00bb  aas
2aba:00bc  ja short 00CEh
2aba:00be  add ch,cl
2aba:00c0  aas
2aba:00c1  ror word ptr [0CD00h],cl
2aba:00c5  aas
2aba:00c6  and al,0
2aba:00c9  int 3Fh
2aba:00cb  and al,6
2aba:00cd  add ch,cl
2aba:00cf  aas
2aba:00d0  push es
2aba:00d1  sbb al,0
2aba:00d3  int 3Fh
2aba:00d5  sub cl,[bp+si]
2aba:00d7  add ch,cl
2aba:00d9  aas
2aba:00da  add word ptr [di],0CD00h
2aba:00de  aas
2aba:00df  insb [di],dx
2aba:00e0  add ch,cl
2aba:00e3  aas
2aba:00e4  leave
2aba:00e5  add al,0
2aba:00e7  int 3Fh
2aba:00e9  mov dh,11h
2aba:00eb  add ch,cl
2aba:00ed  aas
2aba:00ee  hlt
2aba:00ef  add ax,[bx+si]
2aba:00f1  int 3Fh
2aba:00f3  in ax,dx
2aba:00f4  push ds
2aba:00f5  add ch,cl
2aba:00f7  aas
2aba:00f8  add dl,[bx+di]
2aba:00fa  add ch,cl
2aba:00fc  aas
2aba:00fd  (bad)
2aba:00ff  add ch,cl
2aba:0101  aas
2aba:0102  mov bl,[bp+si]
2aba:0104  add ch,cl
2aba:0106  aas
2aba:0107  inc bx
2aba:0108  or ax,0CD00h
2aba:010b  aas
2aba:010c  out dx,ax
2aba:010d  adc al,[bx+si]
2aba:010f  int 3Fh
2aba:0111  frstor [bx+di]
2aba:0113  add ch,cl
2aba:0115  aas
2aba:0116  jo short 011Bh
2aba:0118  add ch,cl
2aba:011a  aas
2aba:011b  pop es
2aba:011c  and [bx+si],al
2aba:011e  int 3Fh
2aba:0120  sbb cl,[bp+si]
2aba:0122  add ch,cl
2aba:0124  aas
2aba:0125  fcomp st,dword ptr [bx]
2aba:0127  add ch,cl
2aba:0129  aas
2aba:012a  dec bx
2aba:012b  adc [bx+si],ax
2aba:012d  add [bx+si],al
2aba:012f  add ch,cl
2aba:0131  aas
2aba:0132  add [bx+si],al
2aba:0134  xor [bp+di],cl
2aba:0137  add [bx+2006h],dl
2aba:013b  add [bx+si],cl
2aba:013d  add [bx+si],al
2aba:013f  add [bx+si],al
2aba:0141  add [bx+si],al
2aba:0143  add [bx+si],al
2aba:0145  add [bx+si],al
2aba:0147  add [bx+si],al
2aba:0149  add [bx+si],al
2aba:014b  add [bx+si],al
2aba:014d  add [bx+si],al
2aba:014f  add ch,cl
2aba:0151  aas
2aba:0152  xchg [bx+si],ax
2aba:0154  add ch,cl
2aba:0156  aas
2aba:0157  add byte ptr [si],0
2aba:015a  int 3Fh
2aba:015c  dec dx
2aba:015d  add [bx+si],ax
2aba:015f  int 3Fh
2aba:0161  das
2aba:0162  add ax,0CD00h
2aba:0165  aas
2aba:0166  add [bx+si],al
2aba:0168  add ch,cl
2aba:016a  aas
2aba:016b  cbw
2aba:016c  add ax,0CD00h
2aba:016f  aas
2aba:0170  jp short 0177h
2aba:0172  add ch,cl
2aba:0174  aas
2aba:0175  push ds
2aba:0176  add al,0
2aba:0178  add [bx+si],al
2aba:017a  add [bx+si],al
2aba:017c  add [bx+si],al
2aba:017e  add [bx+si],al
2aba:0180  int 3Fh
2aba:0182  add [bx+si],al
2aba:0184  (bad)
2aba:0186  add [bx+si],al
2aba:0188  dec di
2aba:0189  nop
2aba:018b  add [bx+si],cx
2aba:018d  add [bx+si],al
2aba:018f  add [bx+si],al
2aba:0191  add [bx+si],al
2aba:0193  add [bx+si],al
2aba:0195  add [bx+si],al
2aba:0197  add [bx+si],al
2aba:0199  add [bx+si],al
2aba:019b  add [bx+si],al
2aba:019d  add [bx+si],al
2aba:019f  add ch,cl
2aba:01a1  aas
2aba:01a2  mov sp,1Bh
2aba:01a5  int 3Fh
2aba:01a7  sub [bp+si],dl
2aba:01a9  add ch,cl
2aba:01ab  aas
2aba:01ac  enter 11h,0CDh
2aba:01b0  aas
2aba:01b1  clc
2aba:01b2  adc [bx+si],ax
2aba:01b4  int 3Fh
2aba:01b6  daa
2aba:01b7  push ss
2aba:01b8  add ch,cl
2aba:01ba  aas
2aba:01bb  ret 14h

; Candidate 2aba:0070, file offset 0x2de10
2aba:0070  int 3Fh
2aba:0072  pushf
2aba:0073  add [bx+si],al
2aba:0075  int 3Fh
2aba:0077  mov [2],al
2aba:007a  int 3Fh
2aba:007c  hlt
2aba:007d  pop ds
2aba:007e  add ch,cl
2aba:0080  aas
2aba:0081  rol word ptr [bp+di],1
2aba:0083  add ch,cl
2aba:0085  aas
2aba:0086  push 16h
2aba:0088  add ch,cl
2aba:008a  aas
2aba:008b  add [bx+si],al
2aba:008d  add [bx+si],al
2aba:008f  add ch,cl
2aba:0091  aas
2aba:0092  add [bx+si],al
2aba:0094  and byte ptr [bx+di],0
2aba:0097  add [bp+si],cl
2aba:0099  sub [bx+si+1901h],al
2aba:009d  add [bx+si],al
2aba:009f  add [bx+si],al
2aba:00a1  add [bx+si],al
2aba:00a3  add [bx+si],al
2aba:00a5  add [bx+si],al
2aba:00a7  add [bx+si],al
2aba:00a9  add [bx+si],al
2aba:00ab  add [bx+si],al
2aba:00ad  add [bx+si],al
2aba:00af  add ch,cl
2aba:00b1  aas
2aba:00b2  les cx,[di]
2aba:00b4  add ch,cl
2aba:00b6  aas
2aba:00b7  xor [0CD00h],bl
2aba:00bb  aas
2aba:00bc  ja short 00CEh
2aba:00be  add ch,cl
2aba:00c0  aas
2aba:00c1  ror word ptr [0CD00h],cl
2aba:00c5  aas
2aba:00c6  and al,0
2aba:00c9  int 3Fh
2aba:00cb  and al,6
2aba:00cd  add ch,cl
2aba:00cf  aas
2aba:00d0  push es
2aba:00d1  sbb al,0
2aba:00d3  int 3Fh
2aba:00d5  sub cl,[bp+si]
2aba:00d7  add ch,cl
2aba:00d9  aas
2aba:00da  add word ptr [di],0CD00h
2aba:00de  aas
2aba:00df  insb [di],dx
2aba:00e0  add ch,cl
2aba:00e3  aas
2aba:00e4  leave
2aba:00e5  add al,0
2aba:00e7  int 3Fh
2aba:00e9  mov dh,11h
2aba:00eb  add ch,cl
2aba:00ed  aas
2aba:00ee  hlt
2aba:00ef  add ax,[bx+si]
2aba:00f1  int 3Fh
2aba:00f3  in ax,dx
2aba:00f4  push ds
2aba:00f5  add ch,cl
2aba:00f7  aas
2aba:00f8  add dl,[bx+di]
2aba:00fa  add ch,cl
2aba:00fc  aas
2aba:00fd  (bad)
2aba:00ff  add ch,cl
2aba:0101  aas
2aba:0102  mov bl,[bp+si]
2aba:0104  add ch,cl
2aba:0106  aas
2aba:0107  inc bx
2aba:0108  or ax,0CD00h
2aba:010b  aas
2aba:010c  out dx,ax
2aba:010d  adc al,[bx+si]
2aba:010f  int 3Fh
2aba:0111  frstor [bx+di]
2aba:0113  add ch,cl
2aba:0115  aas
2aba:0116  jo short 011Bh
2aba:0118  add ch,cl
2aba:011a  aas
2aba:011b  pop es
2aba:011c  and [bx+si],al
2aba:011e  int 3Fh
2aba:0120  sbb cl,[bp+si]
2aba:0122  add ch,cl
2aba:0124  aas
2aba:0125  fcomp st,dword ptr [bx]
2aba:0127  add ch,cl
2aba:0129  aas
2aba:012a  dec bx
2aba:012b  adc [bx+si],ax
2aba:012d  add [bx+si],al
2aba:012f  add ch,cl
2aba:0131  aas
2aba:0132  add [bx+si],al
2aba:0134  xor [bp+di],cl
2aba:0137  add [bx+2006h],dl
2aba:013b  add [bx+si],cl
2aba:013d  add [bx+si],al
2aba:013f  add [bx+si],al
2aba:0141  add [bx+si],al
2aba:0143  add [bx+si],al
2aba:0145  add [bx+si],al
2aba:0147  add [bx+si],al
2aba:0149  add [bx+si],al
2aba:014b  add [bx+si],al
2aba:014d  add [bx+si],al
2aba:014f  add ch,cl
2aba:0151  aas
2aba:0152  xchg [bx+si],ax
2aba:0154  add ch,cl
2aba:0156  aas
2aba:0157  add byte ptr [si],0
2aba:015a  int 3Fh
2aba:015c  dec dx
2aba:015d  add [bx+si],ax
2aba:015f  int 3Fh
2aba:0161  das
2aba:0162  add ax,0CD00h
2aba:0165  aas
2aba:0166  add [bx+si],al
2aba:0168  add ch,cl
2aba:016a  aas
2aba:016b  cbw
2aba:016c  add ax,0CD00h
2aba:016f  aas
2aba:0170  jp short 0177h
2aba:0172  add ch,cl
2aba:0174  aas
2aba:0175  push ds
2aba:0176  add al,0
2aba:0178  add [bx+si],al
2aba:017a  add [bx+si],al
2aba:017c  add [bx+si],al
2aba:017e  add [bx+si],al
2aba:0180  int 3Fh
2aba:0182  add [bx+si],al
2aba:0184  (bad)
2aba:0186  add [bx+si],al
2aba:0188  dec di
2aba:0189  nop
2aba:018b  add [bx+si],cx
2aba:018d  add [bx+si],al
2aba:018f  add [bx+si],al
2aba:0191  add [bx+si],al
2aba:0193  add [bx+si],al
2aba:0195  add [bx+si],al
2aba:0197  add [bx+si],al
2aba:0199  add [bx+si],al
2aba:019b  add [bx+si],al
2aba:019d  add [bx+si],al
2aba:019f  add ch,cl
2aba:01a1  aas
2aba:01a2  mov sp,1Bh
2aba:01a5  int 3Fh
2aba:01a7  sub [bp+si],dl
2aba:01a9  add ch,cl
2aba:01ab  aas
2aba:01ac  enter 11h,0CDh
2aba:01b0  aas
2aba:01b1  clc
2aba:01b2  adc [bx+si],ax
2aba:01b4  int 3Fh
2aba:01b6  daa
2aba:01b7  push ss
2aba:01b8  add ch,cl
2aba:01ba  aas
2aba:01bb  ret 14h

; Candidate 2aba:007a, file offset 0x2de1a
2aba:007a  int 3Fh
2aba:007c  hlt
2aba:007d  pop ds
2aba:007e  add ch,cl
2aba:0080  aas
2aba:0081  rol word ptr [bp+di],1
2aba:0083  add ch,cl
2aba:0085  aas
2aba:0086  push 16h
2aba:0088  add ch,cl
2aba:008a  aas
2aba:008b  add [bx+si],al
2aba:008d  add [bx+si],al
2aba:008f  add ch,cl
2aba:0091  aas
2aba:0092  add [bx+si],al
2aba:0094  and byte ptr [bx+di],0
2aba:0097  add [bp+si],cl
2aba:0099  sub [bx+si+1901h],al
2aba:009d  add [bx+si],al
2aba:009f  add [bx+si],al
2aba:00a1  add [bx+si],al
2aba:00a3  add [bx+si],al
2aba:00a5  add [bx+si],al
2aba:00a7  add [bx+si],al
2aba:00a9  add [bx+si],al
2aba:00ab  add [bx+si],al
2aba:00ad  add [bx+si],al
2aba:00af  add ch,cl
2aba:00b1  aas
2aba:00b2  les cx,[di]
2aba:00b4  add ch,cl
2aba:00b6  aas
2aba:00b7  xor [0CD00h],bl
2aba:00bb  aas
2aba:00bc  ja short 00CEh
2aba:00be  add ch,cl
2aba:00c0  aas
2aba:00c1  ror word ptr [0CD00h],cl
2aba:00c5  aas
2aba:00c6  and al,0
2aba:00c9  int 3Fh
2aba:00cb  and al,6
2aba:00cd  add ch,cl
2aba:00cf  aas
2aba:00d0  push es
2aba:00d1  sbb al,0
2aba:00d3  int 3Fh
2aba:00d5  sub cl,[bp+si]
2aba:00d7  add ch,cl
2aba:00d9  aas
2aba:00da  add word ptr [di],0CD00h
2aba:00de  aas
2aba:00df  insb [di],dx
2aba:00e0  add ch,cl
2aba:00e3  aas
2aba:00e4  leave
2aba:00e5  add al,0
2aba:00e7  int 3Fh
2aba:00e9  mov dh,11h
2aba:00eb  add ch,cl
2aba:00ed  aas
2aba:00ee  hlt
2aba:00ef  add ax,[bx+si]
2aba:00f1  int 3Fh
2aba:00f3  in ax,dx
2aba:00f4  push ds
2aba:00f5  add ch,cl
2aba:00f7  aas
2aba:00f8  add dl,[bx+di]
2aba:00fa  add ch,cl
2aba:00fc  aas
2aba:00fd  (bad)
2aba:00ff  add ch,cl
2aba:0101  aas
2aba:0102  mov bl,[bp+si]
2aba:0104  add ch,cl
2aba:0106  aas
2aba:0107  inc bx
2aba:0108  or ax,0CD00h
2aba:010b  aas
2aba:010c  out dx,ax
2aba:010d  adc al,[bx+si]
2aba:010f  int 3Fh
2aba:0111  frstor [bx+di]
2aba:0113  add ch,cl
2aba:0115  aas
2aba:0116  jo short 011Bh
2aba:0118  add ch,cl
2aba:011a  aas
2aba:011b  pop es
2aba:011c  and [bx+si],al
2aba:011e  int 3Fh
2aba:0120  sbb cl,[bp+si]
2aba:0122  add ch,cl
2aba:0124  aas
2aba:0125  fcomp st,dword ptr [bx]
2aba:0127  add ch,cl
2aba:0129  aas
2aba:012a  dec bx
2aba:012b  adc [bx+si],ax
2aba:012d  add [bx+si],al
2aba:012f  add ch,cl
2aba:0131  aas
2aba:0132  add [bx+si],al
2aba:0134  xor [bp+di],cl
2aba:0137  add [bx+2006h],dl
2aba:013b  add [bx+si],cl
2aba:013d  add [bx+si],al
2aba:013f  add [bx+si],al
2aba:0141  add [bx+si],al
2aba:0143  add [bx+si],al
2aba:0145  add [bx+si],al
2aba:0147  add [bx+si],al
2aba:0149  add [bx+si],al
2aba:014b  add [bx+si],al
2aba:014d  add [bx+si],al
2aba:014f  add ch,cl
2aba:0151  aas
2aba:0152  xchg [bx+si],ax
2aba:0154  add ch,cl
2aba:0156  aas
2aba:0157  add byte ptr [si],0
2aba:015a  int 3Fh
2aba:015c  dec dx
2aba:015d  add [bx+si],ax
2aba:015f  int 3Fh
2aba:0161  das
2aba:0162  add ax,0CD00h
2aba:0165  aas
2aba:0166  add [bx+si],al
2aba:0168  add ch,cl
2aba:016a  aas
2aba:016b  cbw
2aba:016c  add ax,0CD00h
2aba:016f  aas
2aba:0170  jp short 0177h
2aba:0172  add ch,cl
2aba:0174  aas
2aba:0175  push ds
2aba:0176  add al,0
2aba:0178  add [bx+si],al
2aba:017a  add [bx+si],al
2aba:017c  add [bx+si],al
2aba:017e  add [bx+si],al
2aba:0180  int 3Fh
2aba:0182  add [bx+si],al
2aba:0184  (bad)
2aba:0186  add [bx+si],al
2aba:0188  dec di
2aba:0189  nop
2aba:018b  add [bx+si],cx
2aba:018d  add [bx+si],al
2aba:018f  add [bx+si],al
2aba:0191  add [bx+si],al
2aba:0193  add [bx+si],al
2aba:0195  add [bx+si],al
2aba:0197  add [bx+si],al
2aba:0199  add [bx+si],al
2aba:019b  add [bx+si],al
2aba:019d  add [bx+si],al
2aba:019f  add ch,cl
2aba:01a1  aas
2aba:01a2  mov sp,1Bh
2aba:01a5  int 3Fh
2aba:01a7  sub [bp+si],dl
2aba:01a9  add ch,cl
2aba:01ab  aas
2aba:01ac  enter 11h,0CDh
2aba:01b0  aas
2aba:01b1  clc
2aba:01b2  adc [bx+si],ax
2aba:01b4  int 3Fh
2aba:01b6  daa
2aba:01b7  push ss
2aba:01b8  add ch,cl
2aba:01ba  aas
2aba:01bb  ret 14h

; Candidate 2ad7:0039, file offset 0x2dfa9
2ad7:0039  int 3Fh
2ad7:003b  mov si,13h
2ad7:003e  int 3Fh
2ad7:0040  adc [bp+di],cl
2ad7:0042  add ch,cl
2ad7:0044  aas
2ad7:0045  sbb ax,9
2ad7:0048  int 3Fh
2ad7:004a  pop di
2ad7:004b  or al,0
2ad7:004d  int 3Fh
2ad7:004f  add [bx+si],al
2ad7:0051  add ch,cl
2ad7:0053  aas
2ad7:0054  pop ss
2ad7:0055  adc [bx+si],al
2ad7:0057  add [bx+si],al
2ad7:0059  add [bx+si],al
2ad7:005b  add [bx+si],al
2ad7:005d  add [bx+si],al
2ad7:005f  add ch,cl
2ad7:0061  aas
2ad7:0062  add [bx+si],al
2ad7:0064  adc byte ptr [bx+si],5Ah
2ad7:0069  or ax,8Ch
2ad7:006c  or ax,[bx+si]
2ad7:006e  add [bx+si],al
2ad7:0070  add [bx+si],al
2ad7:0072  add [bx+si],al
2ad7:0074  add [bx+si],al
2ad7:0076  add [bx+si],al
2ad7:0078  add [bx+si],al
2ad7:007a  add [bx+si],al
2ad7:007c  add [bx+si],al
2ad7:007e  add [bx+si],al
2ad7:0080  int 3Fh
2ad7:0082  fisttp dword ptr [bx+si],st
2ad7:0084  add ch,cl
2ad7:0086  aas
2ad7:0087  adc ax,1
2ad7:008a  int 3Fh
2ad7:008c  bound ax,dword ptr [bx+si]
2ad7:008e  add ch,cl
2ad7:0090  aas
2ad7:0091  or es:[bx+si],ax
2ad7:0094  int 3Fh
2ad7:0096  out 3,al
2ad7:0098  add ch,cl
2ad7:009a  aas
2ad7:009b  ja short 009Eh
2ad7:009d  add ch,cl
2ad7:009f  aas
2ad7:00a0  and [bp+si],cx
2ad7:00a2  add ch,cl
2ad7:00a4  aas
2ad7:00a5  add [bx+si],al
2ad7:00a7  add ch,cl
2ad7:00a9  aas
2ad7:00aa  insw [di],dx
2ad7:00ab  or [bx+si],al
2ad7:00ad  int 3Fh
2ad7:00af  mov word ptr [si],0CD00h
2ad7:00b3  aas
2ad7:00b4  pop word ptr [bx]
2ad7:00b6  add [bx+si],al
2ad7:00b8  add [bx+si],al
2ad7:00ba  add [bx+si],al
2ad7:00bc  add [bx+si],al
2ad7:00be  add [bx+si],al
2ad7:00c0  int 3Fh
2ad7:00c2  add [bx+si],al
2ad7:00c4  jo short 0064h
2ad7:00c6  add [bx+si],al
2ad7:00c8  ret 0C61Ah

; Candidate 2add:002f, file offset 0x2dfff
2add:002f  int 3Fh
2add:0031  or es:[bx+si],ax
2add:0034  int 3Fh
2add:0036  out 3,al
2add:0038  add ch,cl
2add:003a  aas
2add:003b  ja short 003Eh
2add:003d  add ch,cl
2add:003f  aas
2add:0040  and [bp+si],cx
2add:0042  add ch,cl
2add:0044  aas
2add:0045  add [bx+si],al
2add:0047  add ch,cl
2add:0049  aas
2add:004a  insw [di],dx
2add:004b  or [bx+si],al
2add:004d  int 3Fh
2add:004f  mov word ptr [si],0CD00h
2add:0053  aas
2add:0054  pop word ptr [bx]
2add:0056  add [bx+si],al
2add:0058  add [bx+si],al
2add:005a  add [bx+si],al
2add:005c  add [bx+si],al
2add:005e  add [bx+si],al
2add:0060  int 3Fh
2add:0062  add [bx+si],al
2add:0064  jo short 4
2add:0066  add [bx+si],al
2add:0068  ret 0C61Ah

; Candidate 2add:004d, file offset 0x2e01d
2add:004d  int 3Fh
2add:004f  mov word ptr [si],0CD00h
2add:0053  aas
2add:0054  pop word ptr [bx]
2add:0056  add [bx+si],al
2add:0058  add [bx+si],al
2add:005a  add [bx+si],al
2add:005c  add [bx+si],al
2add:005e  add [bx+si],al
2add:0060  int 3Fh
2add:0062  add [bx+si],al
2add:0064  jo short 4
2add:0066  add [bx+si],al
2add:0068  ret 0C61Ah

; Candidate 2ae3:0048, file offset 0x2e078
2ae3:0048  int 3Fh
2ae3:004a  into
2ae3:004b  or ax,[bx+si]
2ae3:004d  int 3Fh
2ae3:004f  call far 0016h,3FCDh
2ae3:0054  add [bx],al
2ae3:0056  add ch,cl
2ae3:0058  aas
2ae3:0059  stosb [di]
2ae3:005a  add [bx+si],ax
2ae3:005c  int 3Fh
2ae3:005e  dec sp
2ae3:005f  push cs
2ae3:0060  add ch,cl
2ae3:0062  aas
2ae3:0063  sbb [bp+si],bx
2ae3:0065  add ch,cl
2ae3:0067  aas
2ae3:0068  or al,5
2ae3:006a  add ch,cl
2ae3:006c  aas
2ae3:006d  and ax,4
2ae3:0070  int 3Fh
2ae3:0072  (bad)
2ae3:0074  add ch,cl
2ae3:0076  aas
2ae3:0077  enter 1,0CDh
2ae3:007b  aas
2ae3:007c  insb [di],dx
2ae3:007d  or ax,[bx+si]
2ae3:007f  int 3Fh
2ae3:0081  cmc
2ae3:0082  pop ss
2ae3:0083  add ch,cl
2ae3:0085  aas
2ae3:0086  push di
2ae3:0087  adc al,[bx+si]
2ae3:0089  int 3Fh
2ae3:008b  jnp short 0097h
2ae3:008d  add ch,cl
2ae3:008f  aas
2ae3:0090  sbb [bp+si],dx
2ae3:0092  add ch,cl
2ae3:0094  aas
2ae3:0095  push ax
2ae3:0096  add [bx+si],al
2ae3:0098  add [bx+si],al
2ae3:009a  add [bx+si],al
2ae3:009c  add [bx+si],al
2ae3:009e  add [bx+si],al
2ae3:00a0  int 3Fh
2ae3:00a2  add [bx+si],al
2ae3:00a4  add [bp+si],bh
2ae3:00a8  sbb dx,[si]
2ae3:00aa  fiadd st,dword ptr [bx+si]
2ae3:00ac  sldt [bx+si]
2ae3:00af  add [bx+si],al
2ae3:00b1  add [bx+si],al
2ae3:00b3  add [bx+si],al
2ae3:00b5  add [bx+si],al
2ae3:00b7  add [bx+si],al
2ae3:00b9  add [bx+si],al
2ae3:00bb  add [bx+si],al
2ae3:00bd  add [bx+si],al
2ae3:00bf  add ch,cl
2ae3:00c1  aas
2ae3:00c2  xchg [bx+di],al
2ae3:00c4  add ch,cl
2ae3:00c6  aas
2ae3:00c7  jne short 00DBh
2ae3:00c9  add ch,cl
2ae3:00cb  aas
2ae3:00cc  or byte ptr [bp+si],0
2ae3:00cf  int 3Fh
2ae3:00d1  int1
2ae3:00d2  adc [bx+si],al
2ae3:00d4  int 3Fh
2ae3:00d6  jmp far 2,3FCDh
2ae3:00db  cmpsw [si],[di]
2ae3:00dc  add al,0
2ae3:00de  int 3Fh
2ae3:00e0  jp short 00E5h
2ae3:00e2  add ch,cl
2ae3:00e4  aas
2ae3:00e5  fcom st,dword ptr [bx+di]
2ae3:00e7  add ch,cl
2ae3:00e9  aas
2ae3:00ea  in ax,7
2ae3:00ec  add ch,cl
2ae3:00ee  aas
2ae3:00ef  das
2ae3:00f0  add al,0
2ae3:00f2  int 3Fh
2ae3:00f4  add [bx+si],al
2ae3:00f6  add ch,cl
2ae3:00f8  aas
2ae3:00f9  lds cx,[0CD00h]
2ae3:00fd  aas
2ae3:00fe  mov [bp+si],al
2ae3:0100  add ch,cl
2ae3:0102  aas
2ae3:0103  movsb [di],[si]
2ae3:0104  add ax,0CD00h
2ae3:0107  aas
2ae3:0108  aaa
2ae3:0109  adc [bx+si],al
2ae3:010b  add [bx+si],al
2ae3:010d  add [bx+si],al
2ae3:010f  add ch,cl
2ae3:0111  aas
2ae3:0112  add [bx+si],al
2ae3:0114  adc bh,cl
2ae3:0116  add [bx+si],al
2ae3:0118  popa
2ae3:0119  sbb [1D01h],dh
2ae3:011d  add [bx+si],al
2ae3:011f  add [bx+si],al
2ae3:0121  add [bx+si],al
2ae3:0123  add [bx+si],al
2ae3:0125  add [bx+si],al
2ae3:0127  add [bx+si],al
2ae3:0129  add [bx+si],al
2ae3:012b  add [bx+si],al
2ae3:012d  add [bx+si],al
2ae3:012f  add ch,cl
2ae3:0131  aas
2ae3:0132  pop dx
2ae3:0133  adc al,[bx+si]
2ae3:0135  int 3Fh
2ae3:0137  sub al,2
2ae3:0139  add ch,cl
2ae3:013b  aas
2ae3:013c  insb [di],dx
2ae3:013d  or [bx+si],ax
2ae3:013f  int 3Fh
2ae3:0141  add ax,[bx+si]
2ae3:0144  int 3Fh
2ae3:0146  push es
2ae3:0148  add ch,cl
2ae3:014a  aas
2ae3:014b  xor [bp+si],cl
2ae3:014d  add ch,cl
2ae3:014f  aas
2ae3:0150  add [bx+si],al
2ae3:0152  add ch,cl
2ae3:0154  aas
2ae3:0155  aaa
2ae3:0156  or ax,0CD00h
2ae3:0159  aas
2ae3:015a  fimul st,word ptr [di]
2ae3:015c  add ch,cl
2ae3:015e  aas
2ae3:015f  sbb ax,[bx]
2ae3:0161  add ch,cl
2ae3:0163  aas
2ae3:0164  push sp
2ae3:0165  or [bx+si],al
2ae3:0167  int 3Fh
2ae3:0169  lea ax,[bx+di]
2ae3:016b  add ch,cl
2ae3:016d  aas
2ae3:016e  sub al,[si]
2ae3:0170  add ch,cl
2ae3:0172  aas
2ae3:0173  ret 16h

; Candidate 2ae3:0061, file offset 0x2e091
2ae3:0061  int 3Fh
2ae3:0063  sbb [bp+si],bx
2ae3:0065  add ch,cl
2ae3:0067  aas
2ae3:0068  or al,5
2ae3:006a  add ch,cl
2ae3:006c  aas
2ae3:006d  and ax,4
2ae3:0070  int 3Fh
2ae3:0072  (bad)
2ae3:0074  add ch,cl
2ae3:0076  aas
2ae3:0077  enter 1,0CDh
2ae3:007b  aas
2ae3:007c  insb [di],dx
2ae3:007d  or ax,[bx+si]
2ae3:007f  int 3Fh
2ae3:0081  cmc
2ae3:0082  pop ss
2ae3:0083  add ch,cl
2ae3:0085  aas
2ae3:0086  push di
2ae3:0087  adc al,[bx+si]
2ae3:0089  int 3Fh
2ae3:008b  jnp short 0097h
2ae3:008d  add ch,cl
2ae3:008f  aas
2ae3:0090  sbb [bp+si],dx
2ae3:0092  add ch,cl
2ae3:0094  aas
2ae3:0095  push ax
2ae3:0096  add [bx+si],al
2ae3:0098  add [bx+si],al
2ae3:009a  add [bx+si],al
2ae3:009c  add [bx+si],al
2ae3:009e  add [bx+si],al
2ae3:00a0  int 3Fh
2ae3:00a2  add [bx+si],al
2ae3:00a4  add [bp+si],bh
2ae3:00a8  sbb dx,[si]
2ae3:00aa  fiadd st,dword ptr [bx+si]
2ae3:00ac  sldt [bx+si]
2ae3:00af  add [bx+si],al
2ae3:00b1  add [bx+si],al
2ae3:00b3  add [bx+si],al
2ae3:00b5  add [bx+si],al
2ae3:00b7  add [bx+si],al
2ae3:00b9  add [bx+si],al
2ae3:00bb  add [bx+si],al
2ae3:00bd  add [bx+si],al
2ae3:00bf  add ch,cl
2ae3:00c1  aas
2ae3:00c2  xchg [bx+di],al
2ae3:00c4  add ch,cl
2ae3:00c6  aas
2ae3:00c7  jne short 00DBh
2ae3:00c9  add ch,cl
2ae3:00cb  aas
2ae3:00cc  or byte ptr [bp+si],0
2ae3:00cf  int 3Fh
2ae3:00d1  int1
2ae3:00d2  adc [bx+si],al
2ae3:00d4  int 3Fh
2ae3:00d6  jmp far 2,3FCDh
2ae3:00db  cmpsw [si],[di]
2ae3:00dc  add al,0
2ae3:00de  int 3Fh
2ae3:00e0  jp short 00E5h
2ae3:00e2  add ch,cl
2ae3:00e4  aas
2ae3:00e5  fcom st,dword ptr [bx+di]
2ae3:00e7  add ch,cl
2ae3:00e9  aas
2ae3:00ea  in ax,7
2ae3:00ec  add ch,cl
2ae3:00ee  aas
2ae3:00ef  das
2ae3:00f0  add al,0
2ae3:00f2  int 3Fh
2ae3:00f4  add [bx+si],al
2ae3:00f6  add ch,cl
2ae3:00f8  aas
2ae3:00f9  lds cx,[0CD00h]
2ae3:00fd  aas
2ae3:00fe  mov [bp+si],al
2ae3:0100  add ch,cl
2ae3:0102  aas
2ae3:0103  movsb [di],[si]
2ae3:0104  add ax,0CD00h
2ae3:0107  aas
2ae3:0108  aaa
2ae3:0109  adc [bx+si],al
2ae3:010b  add [bx+si],al
2ae3:010d  add [bx+si],al
2ae3:010f  add ch,cl
2ae3:0111  aas
2ae3:0112  add [bx+si],al
2ae3:0114  adc bh,cl
2ae3:0116  add [bx+si],al
2ae3:0118  popa
2ae3:0119  sbb [1D01h],dh
2ae3:011d  add [bx+si],al
2ae3:011f  add [bx+si],al
2ae3:0121  add [bx+si],al
2ae3:0123  add [bx+si],al
2ae3:0125  add [bx+si],al
2ae3:0127  add [bx+si],al
2ae3:0129  add [bx+si],al
2ae3:012b  add [bx+si],al
2ae3:012d  add [bx+si],al
2ae3:012f  add ch,cl
2ae3:0131  aas
2ae3:0132  pop dx
2ae3:0133  adc al,[bx+si]
2ae3:0135  int 3Fh
2ae3:0137  sub al,2
2ae3:0139  add ch,cl
2ae3:013b  aas
2ae3:013c  insb [di],dx
2ae3:013d  or [bx+si],ax
2ae3:013f  int 3Fh
2ae3:0141  add ax,[bx+si]
2ae3:0144  int 3Fh
2ae3:0146  push es
2ae3:0148  add ch,cl
2ae3:014a  aas
2ae3:014b  xor [bp+si],cl
2ae3:014d  add ch,cl
2ae3:014f  aas
2ae3:0150  add [bx+si],al
2ae3:0152  add ch,cl
2ae3:0154  aas
2ae3:0155  aaa
2ae3:0156  or ax,0CD00h
2ae3:0159  aas
2ae3:015a  fimul st,word ptr [di]
2ae3:015c  add ch,cl
2ae3:015e  aas
2ae3:015f  sbb ax,[bx]
2ae3:0161  add ch,cl
2ae3:0163  aas
2ae3:0164  push sp
2ae3:0165  or [bx+si],al
2ae3:0167  int 3Fh
2ae3:0169  lea ax,[bx+di]
2ae3:016b  add ch,cl
2ae3:016d  aas
2ae3:016e  sub al,[si]
2ae3:0170  add ch,cl
2ae3:0172  aas
2ae3:0173  ret 16h

; Candidate 2ae3:0066, file offset 0x2e096
2ae3:0066  int 3Fh
2ae3:0068  or al,5
2ae3:006a  add ch,cl
2ae3:006c  aas
2ae3:006d  and ax,4
2ae3:0070  int 3Fh
2ae3:0072  (bad)
2ae3:0074  add ch,cl
2ae3:0076  aas
2ae3:0077  enter 1,0CDh
2ae3:007b  aas
2ae3:007c  insb [di],dx
2ae3:007d  or ax,[bx+si]
2ae3:007f  int 3Fh
2ae3:0081  cmc
2ae3:0082  pop ss
2ae3:0083  add ch,cl
2ae3:0085  aas
2ae3:0086  push di
2ae3:0087  adc al,[bx+si]
2ae3:0089  int 3Fh
2ae3:008b  jnp short 0097h
2ae3:008d  add ch,cl
2ae3:008f  aas
2ae3:0090  sbb [bp+si],dx
2ae3:0092  add ch,cl
2ae3:0094  aas
2ae3:0095  push ax
2ae3:0096  add [bx+si],al
2ae3:0098  add [bx+si],al
2ae3:009a  add [bx+si],al
2ae3:009c  add [bx+si],al
2ae3:009e  add [bx+si],al
2ae3:00a0  int 3Fh
2ae3:00a2  add [bx+si],al
2ae3:00a4  add [bp+si],bh
2ae3:00a8  sbb dx,[si]
2ae3:00aa  fiadd st,dword ptr [bx+si]
2ae3:00ac  sldt [bx+si]
2ae3:00af  add [bx+si],al
2ae3:00b1  add [bx+si],al
2ae3:00b3  add [bx+si],al
2ae3:00b5  add [bx+si],al
2ae3:00b7  add [bx+si],al
2ae3:00b9  add [bx+si],al
2ae3:00bb  add [bx+si],al
2ae3:00bd  add [bx+si],al
2ae3:00bf  add ch,cl
2ae3:00c1  aas
2ae3:00c2  xchg [bx+di],al
2ae3:00c4  add ch,cl
2ae3:00c6  aas
2ae3:00c7  jne short 00DBh
2ae3:00c9  add ch,cl
2ae3:00cb  aas
2ae3:00cc  or byte ptr [bp+si],0
2ae3:00cf  int 3Fh
2ae3:00d1  int1
2ae3:00d2  adc [bx+si],al
2ae3:00d4  int 3Fh
2ae3:00d6  jmp far 2,3FCDh
2ae3:00db  cmpsw [si],[di]
2ae3:00dc  add al,0
2ae3:00de  int 3Fh
2ae3:00e0  jp short 00E5h
2ae3:00e2  add ch,cl
2ae3:00e4  aas
2ae3:00e5  fcom st,dword ptr [bx+di]
2ae3:00e7  add ch,cl
2ae3:00e9  aas
2ae3:00ea  in ax,7
2ae3:00ec  add ch,cl
2ae3:00ee  aas
2ae3:00ef  das
2ae3:00f0  add al,0
2ae3:00f2  int 3Fh
2ae3:00f4  add [bx+si],al
2ae3:00f6  add ch,cl
2ae3:00f8  aas
2ae3:00f9  lds cx,[0CD00h]
2ae3:00fd  aas
2ae3:00fe  mov [bp+si],al
2ae3:0100  add ch,cl
2ae3:0102  aas
2ae3:0103  movsb [di],[si]
2ae3:0104  add ax,0CD00h
2ae3:0107  aas
2ae3:0108  aaa
2ae3:0109  adc [bx+si],al
2ae3:010b  add [bx+si],al
2ae3:010d  add [bx+si],al
2ae3:010f  add ch,cl
2ae3:0111  aas
2ae3:0112  add [bx+si],al
2ae3:0114  adc bh,cl
2ae3:0116  add [bx+si],al
2ae3:0118  popa
2ae3:0119  sbb [1D01h],dh
2ae3:011d  add [bx+si],al
2ae3:011f  add [bx+si],al
2ae3:0121  add [bx+si],al
2ae3:0123  add [bx+si],al
2ae3:0125  add [bx+si],al
2ae3:0127  add [bx+si],al
2ae3:0129  add [bx+si],al
2ae3:012b  add [bx+si],al
2ae3:012d  add [bx+si],al
2ae3:012f  add ch,cl
2ae3:0131  aas
2ae3:0132  pop dx
2ae3:0133  adc al,[bx+si]
2ae3:0135  int 3Fh
2ae3:0137  sub al,2
2ae3:0139  add ch,cl
2ae3:013b  aas
2ae3:013c  insb [di],dx
2ae3:013d  or [bx+si],ax
2ae3:013f  int 3Fh
2ae3:0141  add ax,[bx+si]
2ae3:0144  int 3Fh
2ae3:0146  push es
2ae3:0148  add ch,cl
2ae3:014a  aas
2ae3:014b  xor [bp+si],cl
2ae3:014d  add ch,cl
2ae3:014f  aas
2ae3:0150  add [bx+si],al
2ae3:0152  add ch,cl
2ae3:0154  aas
2ae3:0155  aaa
2ae3:0156  or ax,0CD00h
2ae3:0159  aas
2ae3:015a  fimul st,word ptr [di]
2ae3:015c  add ch,cl
2ae3:015e  aas
2ae3:015f  sbb ax,[bx]
2ae3:0161  add ch,cl
2ae3:0163  aas
2ae3:0164  push sp
2ae3:0165  or [bx+si],al
2ae3:0167  int 3Fh
2ae3:0169  lea ax,[bx+di]
2ae3:016b  add ch,cl
2ae3:016d  aas
2ae3:016e  sub al,[si]
2ae3:0170  add ch,cl
2ae3:0172  aas
2ae3:0173  ret 16h

; Candidate 2ae3:007f, file offset 0x2e0af
2ae3:007f  int 3Fh
2ae3:0081  cmc
2ae3:0082  pop ss
2ae3:0083  add ch,cl
2ae3:0085  aas
2ae3:0086  push di
2ae3:0087  adc al,[bx+si]
2ae3:0089  int 3Fh
2ae3:008b  jnp short 0097h
2ae3:008d  add ch,cl
2ae3:008f  aas
2ae3:0090  sbb [bp+si],dx
2ae3:0092  add ch,cl
2ae3:0094  aas
2ae3:0095  push ax
2ae3:0096  add [bx+si],al
2ae3:0098  add [bx+si],al
2ae3:009a  add [bx+si],al
2ae3:009c  add [bx+si],al
2ae3:009e  add [bx+si],al
2ae3:00a0  int 3Fh
2ae3:00a2  add [bx+si],al
2ae3:00a4  add [bp+si],bh
2ae3:00a8  sbb dx,[si]
2ae3:00aa  fiadd st,dword ptr [bx+si]
2ae3:00ac  sldt [bx+si]
2ae3:00af  add [bx+si],al
2ae3:00b1  add [bx+si],al
2ae3:00b3  add [bx+si],al
2ae3:00b5  add [bx+si],al
2ae3:00b7  add [bx+si],al
2ae3:00b9  add [bx+si],al
2ae3:00bb  add [bx+si],al
2ae3:00bd  add [bx+si],al
2ae3:00bf  add ch,cl
2ae3:00c1  aas
2ae3:00c2  xchg [bx+di],al
2ae3:00c4  add ch,cl
2ae3:00c6  aas
2ae3:00c7  jne short 00DBh
2ae3:00c9  add ch,cl
2ae3:00cb  aas
2ae3:00cc  or byte ptr [bp+si],0
2ae3:00cf  int 3Fh
2ae3:00d1  int1
2ae3:00d2  adc [bx+si],al
2ae3:00d4  int 3Fh
2ae3:00d6  jmp far 2,3FCDh
2ae3:00db  cmpsw [si],[di]
2ae3:00dc  add al,0
2ae3:00de  int 3Fh
2ae3:00e0  jp short 00E5h
2ae3:00e2  add ch,cl
2ae3:00e4  aas
2ae3:00e5  fcom st,dword ptr [bx+di]
2ae3:00e7  add ch,cl
2ae3:00e9  aas
2ae3:00ea  in ax,7
2ae3:00ec  add ch,cl
2ae3:00ee  aas
2ae3:00ef  das
2ae3:00f0  add al,0
2ae3:00f2  int 3Fh
2ae3:00f4  add [bx+si],al
2ae3:00f6  add ch,cl
2ae3:00f8  aas
2ae3:00f9  lds cx,[0CD00h]
2ae3:00fd  aas
2ae3:00fe  mov [bp+si],al
2ae3:0100  add ch,cl
2ae3:0102  aas
2ae3:0103  movsb [di],[si]
2ae3:0104  add ax,0CD00h
2ae3:0107  aas
2ae3:0108  aaa
2ae3:0109  adc [bx+si],al
2ae3:010b  add [bx+si],al
2ae3:010d  add [bx+si],al
2ae3:010f  add ch,cl
2ae3:0111  aas
2ae3:0112  add [bx+si],al
2ae3:0114  adc bh,cl
2ae3:0116  add [bx+si],al
2ae3:0118  popa
2ae3:0119  sbb [1D01h],dh
2ae3:011d  add [bx+si],al
2ae3:011f  add [bx+si],al
2ae3:0121  add [bx+si],al
2ae3:0123  add [bx+si],al
2ae3:0125  add [bx+si],al
2ae3:0127  add [bx+si],al
2ae3:0129  add [bx+si],al
2ae3:012b  add [bx+si],al
2ae3:012d  add [bx+si],al
2ae3:012f  add ch,cl
2ae3:0131  aas
2ae3:0132  pop dx
2ae3:0133  adc al,[bx+si]
2ae3:0135  int 3Fh
2ae3:0137  sub al,2
2ae3:0139  add ch,cl
2ae3:013b  aas
2ae3:013c  insb [di],dx
2ae3:013d  or [bx+si],ax
2ae3:013f  int 3Fh
2ae3:0141  add ax,[bx+si]
2ae3:0144  int 3Fh
2ae3:0146  push es
2ae3:0148  add ch,cl
2ae3:014a  aas
2ae3:014b  xor [bp+si],cl
2ae3:014d  add ch,cl
2ae3:014f  aas
2ae3:0150  add [bx+si],al
2ae3:0152  add ch,cl
2ae3:0154  aas
2ae3:0155  aaa
2ae3:0156  or ax,0CD00h
2ae3:0159  aas
2ae3:015a  fimul st,word ptr [di]
2ae3:015c  add ch,cl
2ae3:015e  aas
2ae3:015f  sbb ax,[bx]
2ae3:0161  add ch,cl
2ae3:0163  aas
2ae3:0164  push sp
2ae3:0165  or [bx+si],al
2ae3:0167  int 3Fh
2ae3:0169  lea ax,[bx+di]
2ae3:016b  add ch,cl
2ae3:016d  aas
2ae3:016e  sub al,[si]
2ae3:0170  add ch,cl
2ae3:0172  aas
2ae3:0173  ret 16h

; Candidate 2aed:0034, file offset 0x2e104
2aed:0034  int 3Fh
2aed:0036  jmp far 2,3FCDh
2aed:003b  cmpsw [si],[di]
2aed:003c  add al,0
2aed:003e  int 3Fh
2aed:0040  jp short 0045h
2aed:0042  add ch,cl
2aed:0044  aas
2aed:0045  fcom st,dword ptr [bx+di]
2aed:0047  add ch,cl
2aed:0049  aas
2aed:004a  in ax,7
2aed:004c  add ch,cl
2aed:004e  aas
2aed:004f  das
2aed:0050  add al,0
2aed:0052  int 3Fh
2aed:0054  add [bx+si],al
2aed:0056  add ch,cl
2aed:0058  aas
2aed:0059  lds cx,[0CD00h]
2aed:005d  aas
2aed:005e  mov [bp+si],al
2aed:0060  add ch,cl
2aed:0062  aas
2aed:0063  movsb [di],[si]
2aed:0064  add ax,0CD00h
2aed:0067  aas
2aed:0068  aaa
2aed:0069  adc [bx+si],al
2aed:006b  add [bx+si],al
2aed:006d  add [bx+si],al
2aed:006f  add ch,cl
2aed:0071  aas
2aed:0072  add [bx+si],al
2aed:0074  adc bh,cl
2aed:0076  add [bx+si],al
2aed:0078  popa
2aed:0079  sbb [1D01h],dh
2aed:007d  add [bx+si],al
2aed:007f  add [bx+si],al
2aed:0081  add [bx+si],al
2aed:0083  add [bx+si],al
2aed:0085  add [bx+si],al
2aed:0087  add [bx+si],al
2aed:0089  add [bx+si],al
2aed:008b  add [bx+si],al
2aed:008d  add [bx+si],al
2aed:008f  add ch,cl
2aed:0091  aas
2aed:0092  pop dx
2aed:0093  adc al,[bx+si]
2aed:0095  int 3Fh
2aed:0097  sub al,2
2aed:0099  add ch,cl
2aed:009b  aas
2aed:009c  insb [di],dx
2aed:009d  or [bx+si],ax
2aed:009f  int 3Fh
2aed:00a1  add ax,[bx+si]
2aed:00a4  int 3Fh
2aed:00a6  push es
2aed:00a8  add ch,cl
2aed:00aa  aas
2aed:00ab  xor [bp+si],cl
2aed:00ad  add ch,cl
2aed:00af  aas
2aed:00b0  add [bx+si],al
2aed:00b2  add ch,cl
2aed:00b4  aas
2aed:00b5  aaa
2aed:00b6  or ax,0CD00h
2aed:00b9  aas
2aed:00ba  fimul st,word ptr [di]
2aed:00bc  add ch,cl
2aed:00be  aas
2aed:00bf  sbb ax,[bx]
2aed:00c1  add ch,cl
2aed:00c3  aas
2aed:00c4  push sp
2aed:00c5  or [bx+si],al
2aed:00c7  int 3Fh
2aed:00c9  lea ax,[bx+di]
2aed:00cb  add ch,cl
2aed:00cd  aas
2aed:00ce  sub al,[si]
2aed:00d0  add ch,cl
2aed:00d2  aas
2aed:00d3  ret 16h

; Candidate 2aed:0039, file offset 0x2e109
2aed:0039  int 3Fh
2aed:003b  cmpsw [si],[di]
2aed:003c  add al,0
2aed:003e  int 3Fh
2aed:0040  jp short 0045h
2aed:0042  add ch,cl
2aed:0044  aas
2aed:0045  fcom st,dword ptr [bx+di]
2aed:0047  add ch,cl
2aed:0049  aas
2aed:004a  in ax,7
2aed:004c  add ch,cl
2aed:004e  aas
2aed:004f  das
2aed:0050  add al,0
2aed:0052  int 3Fh
2aed:0054  add [bx+si],al
2aed:0056  add ch,cl
2aed:0058  aas
2aed:0059  lds cx,[0CD00h]
2aed:005d  aas
2aed:005e  mov [bp+si],al
2aed:0060  add ch,cl
2aed:0062  aas
2aed:0063  movsb [di],[si]
2aed:0064  add ax,0CD00h
2aed:0067  aas
2aed:0068  aaa
2aed:0069  adc [bx+si],al
2aed:006b  add [bx+si],al
2aed:006d  add [bx+si],al
2aed:006f  add ch,cl
2aed:0071  aas
2aed:0072  add [bx+si],al
2aed:0074  adc bh,cl
2aed:0076  add [bx+si],al
2aed:0078  popa
2aed:0079  sbb [1D01h],dh
2aed:007d  add [bx+si],al
2aed:007f  add [bx+si],al
2aed:0081  add [bx+si],al
2aed:0083  add [bx+si],al
2aed:0085  add [bx+si],al
2aed:0087  add [bx+si],al
2aed:0089  add [bx+si],al
2aed:008b  add [bx+si],al
2aed:008d  add [bx+si],al
2aed:008f  add ch,cl
2aed:0091  aas
2aed:0092  pop dx
2aed:0093  adc al,[bx+si]
2aed:0095  int 3Fh
2aed:0097  sub al,2
2aed:0099  add ch,cl
2aed:009b  aas
2aed:009c  insb [di],dx
2aed:009d  or [bx+si],ax
2aed:009f  int 3Fh
2aed:00a1  add ax,[bx+si]
2aed:00a4  int 3Fh
2aed:00a6  push es
2aed:00a8  add ch,cl
2aed:00aa  aas
2aed:00ab  xor [bp+si],cl
2aed:00ad  add ch,cl
2aed:00af  aas
2aed:00b0  add [bx+si],al
2aed:00b2  add ch,cl
2aed:00b4  aas
2aed:00b5  aaa
2aed:00b6  or ax,0CD00h
2aed:00b9  aas
2aed:00ba  fimul st,word ptr [di]
2aed:00bc  add ch,cl
2aed:00be  aas
2aed:00bf  sbb ax,[bx]
2aed:00c1  add ch,cl
2aed:00c3  aas
2aed:00c4  push sp
2aed:00c5  or [bx+si],al
2aed:00c7  int 3Fh
2aed:00c9  lea ax,[bx+di]
2aed:00cb  add ch,cl
2aed:00cd  aas
2aed:00ce  sub al,[si]
2aed:00d0  add ch,cl
2aed:00d2  aas
2aed:00d3  ret 16h

; Candidate 2aed:0057, file offset 0x2e127
2aed:0057  int 3Fh
2aed:0059  lds cx,[0CD00h]
2aed:005d  aas
2aed:005e  mov [bp+si],al
2aed:0060  add ch,cl
2aed:0062  aas
2aed:0063  movsb [di],[si]
2aed:0064  add ax,0CD00h
2aed:0067  aas
2aed:0068  aaa
2aed:0069  adc [bx+si],al
2aed:006b  add [bx+si],al
2aed:006d  add [bx+si],al
2aed:006f  add ch,cl
2aed:0071  aas
2aed:0072  add [bx+si],al
2aed:0074  adc bh,cl
2aed:0076  add [bx+si],al
2aed:0078  popa
2aed:0079  sbb [1D01h],dh
2aed:007d  add [bx+si],al
2aed:007f  add [bx+si],al
2aed:0081  add [bx+si],al
2aed:0083  add [bx+si],al
2aed:0085  add [bx+si],al
2aed:0087  add [bx+si],al
2aed:0089  add [bx+si],al
2aed:008b  add [bx+si],al
2aed:008d  add [bx+si],al
2aed:008f  add ch,cl
2aed:0091  aas
2aed:0092  pop dx
2aed:0093  adc al,[bx+si]
2aed:0095  int 3Fh
2aed:0097  sub al,2
2aed:0099  add ch,cl
2aed:009b  aas
2aed:009c  insb [di],dx
2aed:009d  or [bx+si],ax
2aed:009f  int 3Fh
2aed:00a1  add ax,[bx+si]
2aed:00a4  int 3Fh
2aed:00a6  push es
2aed:00a8  add ch,cl
2aed:00aa  aas
2aed:00ab  xor [bp+si],cl
2aed:00ad  add ch,cl
2aed:00af  aas
2aed:00b0  add [bx+si],al
2aed:00b2  add ch,cl
2aed:00b4  aas
2aed:00b5  aaa
2aed:00b6  or ax,0CD00h
2aed:00b9  aas
2aed:00ba  fimul st,word ptr [di]
2aed:00bc  add ch,cl
2aed:00be  aas
2aed:00bf  sbb ax,[bx]
2aed:00c1  add ch,cl
2aed:00c3  aas
2aed:00c4  push sp
2aed:00c5  or [bx+si],al
2aed:00c7  int 3Fh
2aed:00c9  lea ax,[bx+di]
2aed:00cb  add ch,cl
2aed:00cd  aas
2aed:00ce  sub al,[si]
2aed:00d0  add ch,cl
2aed:00d2  aas
2aed:00d3  ret 16h

; Candidate 2af4:002f, file offset 0x2e16f
2af4:002f  int 3Fh
2af4:0031  add ax,[bx+si]
2af4:0034  int 3Fh
2af4:0036  push es
2af4:0038  add ch,cl
2af4:003a  aas
2af4:003b  xor [bp+si],cl
2af4:003d  add ch,cl
2af4:003f  aas
2af4:0040  add [bx+si],al
2af4:0042  add ch,cl
2af4:0044  aas
2af4:0045  aaa
2af4:0046  or ax,0CD00h
2af4:0049  aas
2af4:004a  fimul st,word ptr [di]
2af4:004c  add ch,cl
2af4:004e  aas
2af4:004f  sbb ax,[bx]
2af4:0051  add ch,cl
2af4:0053  aas
2af4:0054  push sp
2af4:0055  or [bx+si],al
2af4:0057  int 3Fh
2af4:0059  lea ax,[bx+di]
2af4:005b  add ch,cl
2af4:005d  aas
2af4:005e  sub al,[si]
2af4:0060  add ch,cl
2af4:0062  aas
2af4:0063  ret 16h

; Candidate 2af4:0034, file offset 0x2e174
2af4:0034  int 3Fh
2af4:0036  push es
2af4:0038  add ch,cl
2af4:003a  aas
2af4:003b  xor [bp+si],cl
2af4:003d  add ch,cl
2af4:003f  aas
2af4:0040  add [bx+si],al
2af4:0042  add ch,cl
2af4:0044  aas
2af4:0045  aaa
2af4:0046  or ax,0CD00h
2af4:0049  aas
2af4:004a  fimul st,word ptr [di]
2af4:004c  add ch,cl
2af4:004e  aas
2af4:004f  sbb ax,[bx]
2af4:0051  add ch,cl
2af4:0053  aas
2af4:0054  push sp
2af4:0055  or [bx+si],al
2af4:0057  int 3Fh
2af4:0059  lea ax,[bx+di]
2af4:005b  add ch,cl
2af4:005d  aas
2af4:005e  sub al,[si]
2af4:0060  add ch,cl
2af4:0062  aas
2af4:0063  ret 16h

; Candidate 2af4:0043, file offset 0x2e183
2af4:0043  int 3Fh
2af4:0045  aaa
2af4:0046  or ax,0CD00h
2af4:0049  aas
2af4:004a  fimul st,word ptr [di]
2af4:004c  add ch,cl
2af4:004e  aas
2af4:004f  sbb ax,[bx]
2af4:0051  add ch,cl
2af4:0053  aas
2af4:0054  push sp
2af4:0055  or [bx+si],al
2af4:0057  int 3Fh
2af4:0059  lea ax,[bx+di]
2af4:005b  add ch,cl
2af4:005d  aas
2af4:005e  sub al,[si]
2af4:0060  add ch,cl
2af4:0062  aas
2af4:0063  ret 16h

; Candidate 2af4:0048, file offset 0x2e188
2af4:0048  int 3Fh
2af4:004a  fimul st,word ptr [di]
2af4:004c  add ch,cl
2af4:004e  aas
2af4:004f  sbb ax,[bx]
2af4:0051  add ch,cl
2af4:0053  aas
2af4:0054  push sp
2af4:0055  or [bx+si],al
2af4:0057  int 3Fh
2af4:0059  lea ax,[bx+di]
2af4:005b  add ch,cl
2af4:005d  aas
2af4:005e  sub al,[si]
2af4:0060  add ch,cl
2af4:0062  aas
2af4:0063  ret 16h

; Candidate 2af4:004d, file offset 0x2e18d
2af4:004d  int 3Fh
2af4:004f  sbb ax,[bx]
2af4:0051  add ch,cl
2af4:0053  aas
2af4:0054  push sp
2af4:0055  or [bx+si],al
2af4:0057  int 3Fh
2af4:0059  lea ax,[bx+di]
2af4:005b  add ch,cl
2af4:005d  aas
2af4:005e  sub al,[si]
2af4:0060  add ch,cl
2af4:0062  aas
2af4:0063  ret 16h

; Candidate 2af4:0066, file offset 0x2e1a6
2af4:0066  int 3Fh
2af4:0068  sbb ax,0Ch
2af4:006b  int 3Fh
2af4:006d  cmp al,[bx+si]
2af4:006f  add ch,cl
2af4:0071  aas
2af4:0072  loope 0080h
2af4:0074  add ch,cl
2af4:0076  aas
2af4:0077  add word ptr [bx+si],0CD00h
2af4:007b  aas
2af4:007c  je short 0095h
2af4:007e  add ch,cl
2af4:0080  aas
2af4:0081  scasb [di]
2af4:0082  or ax,[bx+si]
2af4:0084  int 3Fh
2af4:0086  xor ax,10h
2af4:0089  int 3Fh
2af4:008b  fiadd st,dword ptr [bx+si]
2af4:008d  add ch,cl
2af4:008f  aas
2af4:0090  mov [9],al
2af4:0093  int 3Fh
2af4:0095  ret far

; Candidate 2af4:0070, file offset 0x2e1b0
2af4:0070  int 3Fh
2af4:0072  loope 0080h
2af4:0074  add ch,cl
2af4:0076  aas
2af4:0077  add word ptr [bx+si],0CD00h
2af4:007b  aas
2af4:007c  je short 0095h
2af4:007e  add ch,cl
2af4:0080  aas
2af4:0081  scasb [di]
2af4:0082  or ax,[bx+si]
2af4:0084  int 3Fh
2af4:0086  xor ax,10h
2af4:0089  int 3Fh
2af4:008b  fiadd st,dword ptr [bx+si]
2af4:008d  add ch,cl
2af4:008f  aas
2af4:0090  mov [9],al
2af4:0093  int 3Fh
2af4:0095  ret far

; Candidate 2af4:007a, file offset 0x2e1ba
2af4:007a  int 3Fh
2af4:007c  je short 0095h
2af4:007e  add ch,cl
2af4:0080  aas
2af4:0081  scasb [di]
2af4:0082  or ax,[bx+si]
2af4:0084  int 3Fh
2af4:0086  xor ax,10h
2af4:0089  int 3Fh
2af4:008b  fiadd st,dword ptr [bx+si]
2af4:008d  add ch,cl
2af4:008f  aas
2af4:0090  mov [9],al
2af4:0093  int 3Fh
2af4:0095  ret far

; Candidate 2af4:007f, file offset 0x2e1bf
2af4:007f  int 3Fh
2af4:0081  scasb [di]
2af4:0082  or ax,[bx+si]
2af4:0084  int 3Fh
2af4:0086  xor ax,10h
2af4:0089  int 3Fh
2af4:008b  fiadd st,dword ptr [bx+si]
2af4:008d  add ch,cl
2af4:008f  aas
2af4:0090  mov [9],al
2af4:0093  int 3Fh
2af4:0095  ret far

; Candidate 2af4:0084, file offset 0x2e1c4
2af4:0084  int 3Fh
2af4:0086  xor ax,10h
2af4:0089  int 3Fh
2af4:008b  fiadd st,dword ptr [bx+si]
2af4:008d  add ch,cl
2af4:008f  aas
2af4:0090  mov [9],al
2af4:0093  int 3Fh
2af4:0095  ret far

; Candidate 2af4:009d, file offset 0x2e1dd
2af4:009d  int 3Fh
2af4:009f  jns short 00B0h
2af4:00a1  add ch,cl
2af4:00a3  aas
2af4:00a4  rol byte ptr [bp+di],0
2af4:00a7  int 3Fh
2af4:00a9  fld st,qword ptr [bx+di]
2af4:00ab  add ch,cl
2af4:00ad  aas
2af4:00ae  jae short 00BDh
2af4:00b0  add [bx+si],al
2af4:00b2  add [bx+si],al
2af4:00b4  add [bx+si],al
2af4:00b6  add [bx+si],al
2af4:00b8  add [bx+si],al
2af4:00ba  add [bx+si],al
2af4:00bc  add [bx+si],al
2af4:00be  add [bx+si],al
2af4:00c0  int 3Fh
2af4:00c2  add [bx+si],al
2af4:00c4  mov al,0E8h
2af4:00c6  add [bx+si],al
2af4:00c8  mov al,1
2af4:00ca  add al,0
2af4:00cc  add [bx+si],ax
2af4:00ce  add [bx+si],al
2af4:00d0  add [bx+si],al
2af4:00d2  add [bx+si],al
2af4:00d4  add [bx+si],al
2af4:00d6  add [bx+si],al
2af4:00d8  add [bx+si],al
2af4:00da  add [bx+si],al
2af4:00dc  add [bx+si],al
2af4:00de  add [bx+si],al
2af4:00e0  int 3Fh
2af4:00e2  add [bx+si],al
2af4:00e4  add [bx+si],al
2af4:00e6  add [bx+si],al
2af4:00e8  add [bx+si],al
2af4:00ea  add [bx+si],al
2af4:00ec  add [bx+si],al
2af4:00ee  add [bx+si],al
2af4:00f0  int 3Fh
2af4:00f2  add [bx+si],al
2af4:00f4  jo short 00E0h
2af4:00f6  add [bx+si],al
2af4:00f8  push 8E10h
2af4:00fb  add [si],cl
2af4:00fd  add [bx+si],al
2af4:00ff  add [bx+si],al
2af4:0101  add [bx+si],al
2af4:0103  add [bx+si],al
2af4:0105  add [bx+si],al
2af4:0107  add [bx+si],al
2af4:0109  add [bx+si],al
2af4:010b  add [bx+si],al
2af4:010d  add [bx+si],al
2af4:010f  add ch,cl
2af4:0111  aas
2af4:0112  (bad)
2af4:0114  add ch,cl
2af4:0116  aas
2af4:0117  mov byte ptr [bx+si],0
2af4:011a  int 3Fh
2af4:011c  lds cx,[bp+di]
2af4:011e  add ch,cl
2af4:0120  aas
2af4:0121  xor ax,[bx+di]
2af4:0123  add ch,cl
2af4:0125  aas
2af4:0126  data32 push cs
2af4:0128  add ch,cl
2af4:012a  aas
2af4:012b  jg short 0130h
2af4:012d  add ch,cl
2af4:012f  aas
2af4:0130  mov ch,7
2af4:0132  add ch,cl
2af4:0134  aas
2af4:0135  xlat [bx]
2af4:0136  push es
2af4:0137  add ch,cl
2af4:0139  aas
2af4:013a  pop ss
2af4:013b  or al,0
2af4:013d  int 3Fh
2af4:013f  mov ah,0Eh
2af4:0141  add ch,cl
2af4:0143  aas
2af4:0144  add [bx+si],al
2af4:0146  add ch,cl
2af4:0148  aas
2af4:0149  jne short 0155h
2af4:014b  add [bx+si],al
2af4:014d  add [bx+si],al
2af4:014f  add ch,cl
2af4:0151  aas
2af4:0152  add [bx+si],al
2af4:0154  jo short 0151h
2af4:0156  add [bx+si],al
2af4:0158  sahf
2af4:0159  sbb ax,0E4h
2af4:015c  sldt [bx+si]
2af4:015f  add [bx+si],al
2af4:0161  add [bx+si],al
2af4:0163  add [bx+si],al
2af4:0165  add [bx+si],al
2af4:0167  add [bx+si],al
2af4:0169  add [bx+si],al
2af4:016b  add [bx+si],al
2af4:016d  add [bx+si],al
2af4:016f  add ch,cl
2af4:0171  aas
2af4:0172  mov dl,0Ch
2af4:0174  add ch,cl
2af4:0176  aas
2af4:0177  xchg [bp+di],ax
2af4:0179  add ch,cl
2af4:017b  aas
2af4:017c  arpl [0CD00h],cx
2af4:0180  aas
2af4:0181  (bad)
2af4:0184  int 3Fh
2af4:0186  movsw [di],[si]
2af4:0187  add [bx+si],al
2af4:0189  int 3Fh
2af4:018b  pusha
2af4:018c  add [bx+si],al
2af4:018e  int 3Fh
2af4:0190  aas
2af4:0191  add al,0
2af4:0193  int 3Fh
2af4:0195  fadd st,dword ptr [bx+si]
2af4:0197  add ch,cl
2af4:0199  aas
2af4:019a  loope 01A7h
2af4:019c  add ch,cl
2af4:019e  aas
2af4:019f  or [bx+di],al
2af4:01a1  add ch,cl
2af4:01a3  aas
2af4:01a4  push bp
2af4:01a5  add al,[bx+si]
2af4:01a7  int 3Fh
2af4:01a9  add [bx+si],al
2af4:01ab  add ch,cl
2af4:01ad  aas
2af4:01ae  dec bp
2af4:01af  push cs
2af4:01b0  add ch,cl
2af4:01b2  aas
2af4:01b3  pop es
2af4:01b4  add ax,0CD00h
2af4:01b7  aas
2af4:01b8  jle short 01C4h
2af4:01ba  add [bx+si],al
2af4:01bc  add [bx+si],al
2af4:01be  add [bx+si],al
2af4:01c0  int 3Fh
2af4:01c2  add [bx+si],al
2af4:01c4  adc [bp+si],bl
2af4:01c6  add [bx+si],ax
2af4:01c8  and byte ptr [bp+di],7Eh
2af4:01cb  add [bp+si],cx
2af4:01cd  add [bx+si],al
2af4:01cf  add [bx+si],al
2af4:01d1  add [bx+si],al
2af4:01d3  add [bx+si],al
2af4:01d5  add [bx+si],al
2af4:01d7  add [bx+si],al
2af4:01d9  add [bx+si],al
2af4:01db  add [bx+si],al
2af4:01dd  add [bx+si],al
2af4:01df  add ch,cl
2af4:01e1  aas
2af4:01e2  xlat [bx]
2af4:01e3  adc [bx+si],ax
2af4:01e5  int 3Fh
2af4:01e7  adc ax,es:[bx+si]
2af4:01ea  int 3Fh
2af4:01ec  mov ah,12h
2af4:01ee  add ch,cl
2af4:01f0  aas
2af4:01f1  (bad)
2af4:01f5  aas
2af4:01f6  add [bx+si],al
2af4:01f8  add ch,cl
2af4:01fa  aas
2af4:01fb  or cx,[bp+si]
2af4:01fd  add ch,cl
2af4:01ff  aas
2af4:0200  cbw
2af4:0201  or [bx+si],al
2af4:0203  int 3Fh
2af4:0205  adc al,gs:[bx+si]
2af4:0208  int 3Fh
2af4:020a  lodsb [si]
2af4:020b  or [bx+si],al
2af4:020d  int 3Fh
2af4:020f  push si
2af4:0210  adc al,[bx+si]
2af4:0212  add [bx+si],al
2af4:0214  add [bx+si],al
2af4:0216  add [bx+si],al
2af4:0218  add [bx+si],al
2af4:021a  add [bx+si],al
2af4:021c  add [bx+si],al
2af4:021e  add [bx+si],al
2af4:0220  add [bx+si],al
2af4:0222  add [bx+si],al
2af4:0224  inc dx
2af4:0225  outsw dx,[si]
2af4:0226  jb short 0294h
2af4:0228  popa
2af4:0229  outsb dx,[si]
2af4:022a  and fs:[bp+di+2Bh],al
2af4:022e  sub sp,[bx+si]
2af4:0230  sub ax,4320h
2af4:0233  outsw dx,[si]
2af4:0234  jo short 02AFh
2af4:0236  jb short 02A1h
2af4:0238  push 2074h
2af4:023c  xor [bx+di],di
2af4:023e  cmp [bx+di],si
2af4:0240  and [bp+si+6Fh],al
2af4:0243  jb short 02B1h
2af4:0245  popa
2af4:0246  outsb dx,[si]
2af4:0247  and fs:[bx+di+6Eh],cl
2af4:024b  je short 02B9h
2af4:024d  add cs:[si+69h],al
2af4:0251  jbe short 02BCh
2af4:0253  and gs:[di+72h],ah
2af4:0258  jb short 02C9h
2af4:025a  jb short 0269h
2af4:025c  or al,[bx+di+62h]
2af4:025f  outsb dx,[si]
2af4:0260  outsw dx,[si]
2af4:0261  jb short 02D0h
2af4:0263  popa
2af4:0264  insb [di],dx
2af4:0265  and [bx+si+72h],dh
2af4:0268  outsw dx,[si]
2af4:0269  jb short 02CDh
2af4:026c  insw [di],dx
2af4:026d  and [si+65h],dh
2af4:0270  jb short 02DFh
2af4:0272  imul bp,[bp+61h],6974h
2af4:0277  outsw dx,[si]
2af4:0278  outsb dx,[si]
2af4:0279  or ax,0Ah
2af4:027c  add [bx+si],al
2af4:027e  add [bx+si],al
2af4:0280  add [bx+si],al
2af4:0282  add [bx+si],al
2af4:0284  add [bx+si],al
2af4:0286  add [bx+si],al
2af4:0288  add [bx+si],al
2af4:028a  add [bx+si],al
2af4:028c  add [bx+si],al
2af4:028e  add [bx+si],al
2af4:0290  add [bx+si],al
2af4:0292  add [bx+si],al
2af4:0294  add [bx+si],al
2af4:0296  add [bx+si],al
2af4:0298  add [bx+si],al
2af4:029a  add [bx+si],al
2af4:029c  add [bx+si],al
2af4:029e  add [bx+si],al
2af4:02a0  add [bx+si],al
2af4:02a2  add [bx+si],al
2af4:02a4  add [bx+si],al
2af4:02a6  add [bx+si],al
2af4:02a8  add [bx+si],al
2af4:02aa  add [bx+si],al
2af4:02ac  add [bx+si],al
2af4:02ae  add [bx+si],al
2af4:02b0  add [bx+si],al
2af4:02b2  xlat [bx]
2af4:02b3  xlat [bx]
2af4:02b4  xlat [bx]
2af4:02b5  xlat [bx]
2af4:02b6  xlat [bx]
2af4:02b7  xlat [bx]
2af4:02b8  xlat [bx]
2af4:02b9  xlat [bx]
2af4:02ba  xlat [bx]
2af4:02bb  xlat [bx]
2af4:02bc  xlat [bx]
2af4:02bd  xlat [bx]
2af4:02be  xlat [bx]
2af4:02bf  xlat [bx]
2af4:02c0  xlat [bx]
2af4:02c1  xlat [bx]
2af4:02c2  fcom st,st(7)
2af4:02c4  fcomp st,st(0)
2af4:02c6  add bl,al
2af4:02c8  fcomp st,st(0)
2af4:02ca  fdivr st,st(6)
2af4:02cc  xlat [bx]
2af4:02cd  fcomp st,st(0)
2af4:02cf  fcom st,st(7)
2af4:02d1  add bx,ax
2af4:02d3  std
2af4:02d4  fcomp st,st(0)
2af4:02d6  fdivr st,st(6)
2af4:02d8  fmul st,dword ptr [bx+si]
2af4:02da  fcomp st,st(0)
2af4:02dc  fdivr st,st(6)
2af4:02de  xlat [bx]
2af4:02df  push es
2af4:02e0  fcomp st,st(0)
2af4:02e2  cli
2af4:02e3  add bx,ax
2af4:02e5  std
2af4:02e6  fcomp st,st(0)
2af4:02e8  fcomp st,st(0)
2af4:02ea  fcomp st,st(0)
2af4:02ec  fcomp st,st(0)
2af4:02ee  fcomp st,st(0)
2af4:02f0  cli
2af4:02f1  xlat [bx]
2af4:02f2  adc al,bl
2af4:02f4  std
2af4:02f5  xlat [bx]
2af4:02f6  adc bx,ax
2af4:02f8  fcomp st,st(0)
2af4:02fa  fcomp st,st(0)
2af4:02fc  fdiv st,st(2)
2af4:02fe  fcom st,dword ptr [si]
2af4:0300  fcomp st,st(0)
2af4:0302  fdiv st,st(0)
2af4:0304  xlat [bx]
2af4:0305  adc al,0D8h
2af4:0307  in ax,dx
2af4:0308  adc al,bl
2af4:030a  fcom st,dword ptr [bp+di]
2af4:030c  fcomp st,st(0)
2af4:030e  fcomp st,st(0)
2af4:0310  in al,dx
2af4:0311  fcomp st,st(0)
2af4:0313  fcomp st,st(0)
2af4:0315  fcom st,st(7)
2af4:0317  adc al,0D8h
2af4:0319  in ax,dx
2af4:031a  xlat [bx]
2af4:031b  fcomp st,st(0)
2af4:031d  adc dx,di
2af4:031f  xlat [bx]
2af4:0320  xlat [bx]
2af4:0321  xlat [bx]
2af4:0322  xlat [bx]
2af4:0323  xlat [bx]
2af4:0324  xlat [bx]
2af4:0325  xlat [bx]
2af4:0326  xlat [bx]
2af4:0327  xlat [bx]
2af4:0328  xlat [bx]
2af4:0329  xlat [bx]
2af4:032a  xlat [bx]
2af4:032b  xlat [bx]
2af4:032c  xlat [bx]
2af4:032d  xlat [bx]
2af4:032e  fcom st,st(7)
2af4:0330  xlat [bx]
2af4:0331  xlat [bx]
2af4:0332  xlat [bx]
2af4:0333  xlat [bx]
2af4:0334  xlat [bx]
2af4:0335  xlat [bx]
2af4:0336  xlat [bx]
2af4:0337  xlat [bx]
2af4:0338  xlat [bx]
2af4:0339  xlat [bx]
2af4:033a  xlat [bx]
2af4:033b  xlat [bx]
2af4:033c  xlat [bx]
2af4:033d  xlat [bx]
2af4:033e  xlat [bx]
2af4:033f  xlat [bx]
2af4:0340  fcom st,st(7)
2af4:0342  fcomp st,st(0)
2af4:0344  fcomp st,st(0)
2af4:0346  fcomp st,st(0)
2af4:0348  fcomp st,st(0)
2af4:034a  fadd st,dword ptr [0D8D8h]
2af4:034e  cli
2af4:034f  add bx,ax
2af4:0351  std
2af4:0352  fcomp st,st(0)
2af4:0354  fcomp st,st(0)
2af4:0356  fcomp st,st(0)
2af4:0358  fcomp st,st(0)
2af4:035a  fcomp st,st(0)
2af4:035c  cli
2af4:035d  fcom st,dword ptr [bx+si]
2af4:035f  fdivr st,st(5)
2af4:0361  xlat [bx]
2af4:0362  adc di,bp
2af4:0364  fcom st,dword ptr [bp+di]
2af4:0366  fcomp st,st(0)
2af4:0368  fcomp st,st(0)
2af4:036a  fcomp st,st(0)
2af4:036c  fcomp st,st(0)
2af4:036e  fdiv st,st(0)
2af4:0370  fcomp st,st(0)
2af4:0372  fsubr st,st(5)
2af4:0374  adc al,bl
2af4:0376  fcom st,dword ptr [bp+di]
2af4:0378  xlat [bx]
2af4:0379  xlat [bx]
2af4:037a  xlat [bx]
2af4:037b  xlat [bx]
2af4:037c  xlat [bx]
2af4:037d  xlat [bx]
2af4:037e  xlat [bx]
2af4:037f  xlat [bx]
2af4:0380  xlat [bx]
2af4:0381  xlat [bx]
2af4:0382  xlat [bx]
2af4:0383  xlat [bx]
2af4:0384  xlat [bx]
2af4:0385  xlat [bx]
2af4:0386  xlat [bx]
2af4:0387  xlat [bx]
2af4:0388  fcom st,st(7)
2af4:038a  fcomp st,st(0)
2af4:038c  fcomp st,st(0)
2af4:038e  fcomp st,st(0)
2af4:0390  fcomp st,st(0)
2af4:0392  fcomp st,st(0)
2af4:0394  fcomp st,st(0)
2af4:0396  fadd st,dword ptr [bp+di]
2af4:0398  fdivr st,st(5)
2af4:039a  fcomp st,st(0)
2af4:039c  fcomp st,st(0)
2af4:039e  fcomp st,st(0)
2af4:03a0  fcomp st,st(0)
2af4:03a2  fcomp st,st(0)
2af4:03a4  fcomp st,st(0)
2af4:03a6  fcomp st,st(0)
2af4:03a8  std
2af4:03a9  fcom st,dword ptr [bp+di]
2af4:03ab  std
2af4:03ac  fcom st,dword ptr [bp+di]
2af4:03ae  fcomp st,st(0)
2af4:03b0  fcomp st,st(0)
2af4:03b2  fcomp st,st(0)
2af4:03b4  fcomp st,st(0)
2af4:03b6  fcomp st,st(0)
2af4:03b8  fcomp st,st(0)
2af4:03ba  fsubr st,st(5)
2af4:03bc  fcomp st,st(0)
2af4:03be  fcom st,dword ptr [bp+di]
2af4:03c0  fcomp st,st(0)
2af4:03c2  fcomp st,st(0)
2af4:03c4  fcomp st,st(0)
2af4:03c6  fcomp st,st(0)
2af4:03c8  fcomp st,st(0)
2af4:03ca  fcomp st,st(0)
2af4:03cc  fcomp st,st(0)
2af4:03ce  fcomp st,st(0)
2af4:03d0  fcomp st,st(0)
2af4:03d2  fcomp st,st(0)
2af4:03d4  fcomp st,st(0)
2af4:03d6  fcomp st,st(0)
2af4:03d8  fcomp st,st(0)
2af4:03da  fcomp st,st(0)
2af4:03dc  fcomp st,st(0)
2af4:03de  fcomp st,st(0)
2af4:03e0  fcomp st,st(0)
2af4:03e2  fcomp st,st(0)
2af4:03e4  fcomp st,st(0)
2af4:03e6  fcomp st,st(0)
2af4:03e8  fcomp st,st(0)
2af4:03ea  fcomp st,st(0)
2af4:03ec  fcomp st,st(0)
2af4:03ee  fcomp st,st(0)
2af4:03f0  fcomp st,st(0)
2af4:03f2  fcomp st,st(0)
2af4:03f4  fcomp st,st(0)
2af4:03f6  push ss
2af4:03f7  add [1600h],dl
2af4:03fb  add [1600h],dl
2af4:03ff  add [1600h],dl
2af4:0403  add [1600h],dl
2af4:0407  add [1600h],dl
2af4:040b  add [1600h],dl
2af4:040f  add [1600h],dl
2af4:0413  add [0],dl
2af4:0417  push ss
2af4:0418  push ss
2af4:0419  add [bx+si],al
2af4:041b  push ss
2af4:041c  add [200h],dl
2af4:0420  add [1600h],dl
2af4:0424  add [1600h],dl
2af4:0428  add dl,[400h]
2af4:042c  add [1600h],dl
2af4:0430  add [16h],dl
2af4:0434  add [bp+di],al
2af4:0436  add [1603h],dl
2af4:043a  add [1600h],dl
2af4:043e  add [1602h],dl
2af4:0442  add [800h],dl
2af4:0446  add [1600h],dl
2af4:044a  add [200h],dl
2af4:044e  push ss
2af4:044f  add [bx+si],al
2af4:0451  push es
2af4:0452  add [1600h],dl
2af4:0456  push es
2af4:0457  push ss
2af4:0458  add [bp+di],al
2af4:045a  add [3],dl
2af4:045e  add [1600h],dl
2af4:0462  add [1600h],dl
2af4:0466  add [1600h],dl
2af4:046a  add [1600h],dl
2af4:046e  add [1600h],dl
2af4:0472  push es
2af4:0473  push ss
2af4:0474  or [1000h],cl
2af4:0478  add [1603h],dl
2af4:047c  push es
2af4:047d  adc [bx+si],al
2af4:047f  adc ax,[bx+si]
2af4:0481  push ss
2af4:0482  add [1600h],dl
2af4:0486  add [1600h],dl
2af4:048a  add [160Eh],dl
2af4:048e  add [1400h],dl
2af4:0492  add [1600h],dl
2af4:0496  add [1610h],dl
2af4:049a  push ss
2af4:049b  add [bx+si],al
2af4:049d  adc al,0
2af4:049f  push ss
2af4:04a0  adc dx,[1000h]
2af4:04a4  add [1600h],dl
2af4:04a8  add [bp+di],dl
2af4:04aa  add [1600h],dl
2af4:04ae  add [1600h],dl
2af4:04b2  adc al,16h
2af4:04b4  add [1600h],dl
2af4:04b8  add [1600h],dl
2af4:04bc  add [1612h],dl
2af4:04c0  adc al,16h
2af4:04c2  add [1613h],dl
2af4:04c6  push ss
2af4:04c7  add [bx+si],al
2af4:04c9  push ss
2af4:04ca  add [1300h],dl
2af4:04ce  push ss
2af4:04cf  add [1600h],dl
2af4:04d3  add [1600h],dl
2af4:04d7  add [1600h],dl
2af4:04db  add [1600h],dl
2af4:04df  add [1600h],dl
2af4:04e3  add [1600h],dl
2af4:04e7  add [1600h],dl
2af4:04eb  add [0],dl
2af4:04ef  push ss
2af4:04f0  push ss
2af4:04f1  add [1600h],dl
2af4:04f5  add [1600h],dl
2af4:04f9  add [1600h],dl
2af4:04fd  add [1600h],dl
2af4:0501  add [1600h],dl
2af4:0505  add [1600h],dl
2af4:0509  add [1600h],dl
2af4:050d  add [1600h],dl
2af4:0511  add [bx+si],al
2af4:0513  push ss
2af4:0514  push ss
2af4:0515  add [bx+si],al
2af4:0517  push ss
2af4:0518  add [1600h],dl
2af4:051c  add [1600h],dl
2af4:0520  add [1600h],dl
2af4:0524  add [1600h],dl
2af4:0528  add [1600h],al
2af4:052c  add [1606h],dl
2af4:0530  add [bp+di],al
2af4:0532  add [1603h],dl
2af4:0536  add [1600h],dl
2af4:053a  add [1600h],dl
2af4:053e  add [1600h],dl
2af4:0542  add [1600h],dl
2af4:0546  add [1600h],dl
2af4:054a  push es
2af4:054b  push ss
2af4:054c  add [1000h],dl
2af4:0550  add [1603h],dl
2af4:0554  pop es
2af4:0555  lldt [bp+di]
2af4:0558  add dx,[1600h]
2af4:055c  add [bp+di],dl
2af4:055e  add [1600h],dl
2af4:0562  add [1600h],dl
2af4:0566  add [1600h],dl
2af4:056a  add [1600h],dl
2af4:056e  add [1610h],dl
2af4:0572  add [1600h],dl
2af4:0576  add [1613h],dl
2af4:057a  add [bx+si],dl
2af4:057c  add [1600h],dl
2af4:0580  add [bp+di],dl
2af4:0582  push ss
2af4:0583  add [1600h],dl
2af4:0587  add [1600h],dl
2af4:058b  add [1600h],dl
2af4:058f  add [1600h],dl
2af4:0593  add [1600h],dl
2af4:0597  add [1600h],dl
2af4:059b  add [1600h],dl
2af4:059f  add [0],dl
2af4:05a3  push ss
2af4:05a4  push ss
2af4:05a5  add [bx+si],al
2af4:05a7  push ss
2af4:05a8  add [1600h],dl
2af4:05ac  add [1600h],dl
2af4:05b0  add [1600h],dl
2af4:05b4  add [1600h],dl
2af4:05b8  add [1600h],dl
2af4:05bc  add [1600h],dl
2af4:05c0  add [bp+di],al
2af4:05c2  add [1603h],dl
2af4:05c6  add [1600h],dl
2af4:05ca  add [1600h],dl
2af4:05ce  add [1600h],dl
2af4:05d2  add [1600h],dl
2af4:05d6  add [1600h],dl
2af4:05da  add [1600h],dl
2af4:05de  add [1600h],dl
2af4:05e2  add dx,[1600h]
2af4:05e6  add [bp+di],dl
2af4:05e8  add dx,[1600h]
2af4:05ec  add [bp+di],dl
2af4:05ee  add [1600h],dl
2af4:05f2  add [1600h],dl
2af4:05f6  add [1600h],dl
2af4:05fa  add [1600h],dl
2af4:05fe  add [1600h],dl
2af4:0602  add [1600h],dl
2af4:0606  add [1613h],dl
2af4:060a  add [1600h],dl
2af4:060e  add [1300h],dl
2af4:0612  add [1600h],dl
2af4:0616  add [1600h],dl
2af4:061a  add [1600h],dl
2af4:061e  add [1600h],dl
2af4:0622  add [1600h],dl
2af4:0626  add [1600h],dl
2af4:062a  add [1600h],dl
2af4:062e  add [1600h],dl
2af4:0632  add [1600h],dl
2af4:0636  add [1600h],dl
2af4:063a  add [1600h],dl
2af4:063e  add [1600h],dl
2af4:0642  add [1600h],dl
2af4:0646  add [1600h],dl
2af4:064a  add [1600h],dl
2af4:064e  add [1600h],dl
2af4:0652  add [1600h],dl
2af4:0656  add [1600h],dl
2af4:065a  add [1600h],dl
2af4:065e  add [1600h],dl
2af4:0662  add [1600h],dl
2af4:0666  add [1600h],dl
2af4:066a  add [1600h],dl
2af4:066e  add [1600h],dl
2af4:0672  add [1600h],dl
2af4:0676  add [1600h],dl
2af4:067a  add [1600h],dl
2af4:067e  push ds
2af4:067f  sbb [bx+si],dl
2af4:0681  add [bp+di],bh
2af4:0683  inc di
2af4:0684  push si
2af4:0685  js short 0686h
2af4:0687  (bad)
2af4:0689  (bad)
2af4:068b  (bad)
2af4:068d  (bad)
2af4:068f  add di,di
2af4:0691  (bad)
2af4:0693  or di,di
2af4:0695  or cx,[si]
2af4:0697  or ax,0FFFFh
2af4:069a  add ax,[bp+di]
2af4:069c  add al,[bp+si]
2af4:069e  add al,[bp+si]
2af4:06a0  add [bx+di],ax
2af4:06a2  add [bx+di],ax
2af4:06a4  add [bx+si],al
2af4:06a6  (bad)
2af4:06a8  and ax,3100h
2af4:06ab  add [bx+si],bh
2af4:06ad  add [bx+si],al
2af4:06af  add dh,bh
2af4:06b1  inc word ptr [bx+di]
2af4:06b3  add bh,bh
2af4:06b5  inc word ptr [bp+si]
2af4:06b7  add [bx+si],al
2af4:06b9  add [bx+di],al
2af4:06bb  add bh,bh
2af4:06bd  jmp far dword ptr [di-28FAh]
2af4:06c1  or dh,ch
2af4:06c3  push es
2af4:06c4  xlat [bx]
2af4:06c5  or [bx],ch
2af4:06c7  pop es
2af4:06c8  xlat [bx]
2af4:06c9  or [bx+si+7],dh
2af4:06cc  xlat [bx]
2af4:06cd  or [bp+si],al
2af4:06cf  add [bx+si],ax
2af4:06d1  add al,0FEh
2af4:06d3  add [bp+di],ax
2af4:06d5  add ax,[si]
2af4:06d7  inc byte ptr [bx+di]
2af4:06d9  add [bp+di],ax
2af4:06db  add al,0FEh
2af4:06dd  inc byte ptr [bx+di]
2af4:06df  add ax,[si]
2af4:06e1  cld
2af4:06e2  std
2af4:06e3  inc word ptr [bp+si]
2af4:06e5  add bh,ah
2af4:06e7  std
2af4:06e8  (bad)
2af4:06ea  add bh,ah
2af4:06ec  std
2af4:06ed  std
2af4:06ee  inc word ptr [bp+si]
2af4:06f0  cld
2af4:06f1  add al,0FEh
2af4:06f3  add [bp+di],ax
2af4:06f5  add ax,[si]
2af4:06f7  inc byte ptr [bx+di]
2af4:06f9  add [bp+di],ax
2af4:06fb  add al,0FEh
2af4:06fd  inc byte ptr [bx+di]
2af4:06ff  add ax,[si]
2af4:0701  add al,0FDh
2af4:0703  add [bp+si],ax
2af4:0705  add al,[si]
2af4:0707  std
2af4:0708  add [bx+di],ax
2af4:070a  add al,[si]
2af4:070c  std
2af4:070d  std
2af4:070e  add [bp+si],ax
2af4:0710  add al,0
2af4:0712  add [bp+si],ax
2af4:0714  add ax,[si]
2af4:0716  add al,[bx+si]
2af4:0718  add ax,[bx+di]
2af4:071a  add al,2
2af4:071c  add ax,[bx+si]
2af4:071e  add [si],ax
2af4:0720  add [bp+di],ax
2af4:0722  add [bp+si],al
2af4:0724  add al,14h
2af4:0726  or al,4
2af4:0728  add al,2
2af4:072a  add [bx+si],al
2af4:072c  add [bx+si],al
2af4:072e  add [bx+si],al
2af4:0730  add [bx+si],al
2af4:0732  add [si-6Ch],al
2af4:0735  push ss
2af4:0736  sub bp,[bp+di]
2af4:0738  fist word ptr [442Bh],st
2af4:073c  xchg sp,ax
2af4:073d  push ss
2af4:073e  sub bp,[bp+di]
2af4:0740  fist word ptr [442Bh],st
2af4:0744  xchg sp,ax
2af4:0745  push ss
2af4:0746  sub ax,[bx+si]
2af4:0748  add [bx+si],al
2af4:074a  add [si-6Ch],al
2af4:074d  push ss
2af4:074e  sub cx,[bp+si-21h]
2af4:0751  push ss
2af4:0752  sub ax,[si-6Ch]
2af4:0755  push ss
2af4:0756  sub cx,[bp+si-21h]
2af4:0759  push ss
2af4:075a  sub ax,[bx+si]
2af4:075c  add [bx+si],al
2af4:075e  add [bx+si],al
2af4:0760  add [bx+si],al
2af4:0762  add [si-6Ch],al
2af4:0765  push ss
2af4:0766  sub bp,[bp+di]
2af4:0768  fist word ptr [442Bh],st
2af4:076c  xchg sp,ax
2af4:076d  push ss
2af4:076e  sub bp,[bp+di]
2af4:0770  fist word ptr [442Bh],st
2af4:0774  xchg sp,ax
2af4:0775  push ss
2af4:0776  sub ax,[bx+si]
2af4:0778  add [bx+si],al
2af4:077a  add [si-6Ch],al
2af4:077d  push ss
2af4:077e  sub cx,[bp+si-21h]
2af4:0781  push ss
2af4:0782  sub ax,[si-6Ch]
2af4:0785  push ss
2af4:0786  sub cx,[bp+si-21h]
2af4:0789  push ss
2af4:078a  sub ax,[si-6Ch]
2af4:078d  push ss
2af4:078e  sub bp,[bp+di]
2af4:0790  fist word ptr [442Bh],st
2af4:0794  xchg sp,ax
2af4:0795  push ss
2af4:0796  sub ax,[bx+si]
2af4:0798  add [bx+si],al
2af4:079a  add [si-6Ch],al
2af4:079d  push ss
2af4:079e  sub cx,[bp+si-21h]
2af4:07a1  push ss
2af4:07a2  sub ax,[bx+si]
2af4:07a4  add [bx+si],al
2af4:07a6  add [bp+di],ch
2af4:07a8  fist word ptr [442Bh],st
2af4:07ac  xchg sp,ax
2af4:07ad  push ss
2af4:07ae  sub ax,[bx+si]
2af4:07b0  add [bx+si],al
2af4:07b2  add [bx+si],al
2af4:07b4  add [bx+si],al
2af4:07b6  add [bp+si-21h],cl
2af4:07b9  push ss
2af4:07ba  sub ax,[bx+di]
2af4:07bc  add [si],ax
2af4:07be  or al,[si]
2af4:07c0  or [si],al
2af4:07c2  add [si],ax
2af4:07c4  clc
2af4:07c5  add al,0F6h
2af4:07c7  add [bx+si],al
2af4:07c9  add cx,[bx+di]
2af4:07cb  add ax,[bx]
2af4:07cd  add ax,[bx+di]
2af4:07cf  add di,cx
2af4:07d1  add si,di
2af4:07d3  add al,[102h]
2af4:07d7  add bh,dl
2af4:07d9  add [di],ax
2af4:07db  add [bx+di],ax
2af4:07dd  add bx,di
2af4:07df  jo short 07E0h
2af4:07e1  mov al,[0D0FFh]
2af4:07e4  inc word ptr [bx+si]
2af4:07e6  add [bx+si],dh
2af4:07e8  add [bx+si],ah
2af4:07eb  nop
2af4:07ec  add [bx+si-1],ah
2af4:07ef  mov al,0FFh
2af4:07f1  add [bx+si],al
2af4:07f3  push ax
2af4:07f4  add [bx+si-8000h],ah
2af4:07f8  inc word ptr [bx+si]
2af4:07fa  add [bx+si],al
2af4:07fe  add [bx+si],al
2af4:0800  add [bx+si],al
2af4:0802  add [bp+di],bh
2af4:0804  inc di
2af4:0805  push si
2af4:0806  add [bx],bl
2af4:0808  sbb [bx],cl
2af4:080a  add [bx+si],al
2af4:080c  add [bx+si],al
2af4:080e  add ax,[bp+di]
2af4:0810  add ax,[bp+di]
2af4:0812  add cx,[bx+si]
2af4:0814  or [bx+si],cl
2af4:0816  or [bx+si],cl
2af4:0818  or ax,0D0Dh
2af4:081b  or ax,120Dh
2af4:081e  adc dl,[bp+si]
2af4:0820  adc dl,[bp+si]
2af4:0822  add [bx+si],al
2af4:0824  add [bx+si],al
2af4:0826  add [bx+si],al
2af4:0828  add [bx+si],al
2af4:082a  add [bx+si],al
2af4:082c  add [bx+si],al
2af4:082e  add [bx+si],al
2af4:0830  add [bx+si],al
2af4:0832  add [bx+si],al
2af4:0834  add [bx+si],al
2af4:0836  add [bx+si],al
2af4:0838  add [bx+si],al
2af4:083a  add [bx+si],al
2af4:083c  add [bx+si],al
2af4:083e  xor si,[si]
2af4:0840  add [bx+si],al
2af4:0842  add [bx+si],al
2af4:0844  add [bx+si],al
2af4:0846  add [bx+si],al
2af4:0848  add [bx+si],al
2af4:084a  add [bx+si],al
2af4:084c  add [bx+di],al
2af4:084e  add [bx+di],ax
2af4:0850  add [bx+di],ax
2af4:0852  add [bx+di],ax
2af4:0854  add [bx+di],ax
2af4:0856  add [bx+si],ax
2af4:0858  add [bx+si],al
2af4:085a  add [bx+si],al
2af4:085c  add [bx+si],al
2af4:085e  add [bx+si],al
2af4:0860  add [bx+si],al
2af4:0862  add [bx+si],al
2af4:0864  add [bx+si],al
2af4:0866  add [bx+si],al
2af4:0868  add [bx+si],al
2af4:086a  add [bx+si],al
2af4:086c  add [bx+si],al
2af4:086e  add [bx+si],al
2af4:0870  add [bx+si],al
2af4:0872  add [bx+si],al
2af4:0874  add [bx+si],cx
2af4:0876  or al,12h
2af4:0878  add [bx+si],al
2af4:087a  add al,[si]
2af4:087c  add [di],al
2af4:087e  or [si],cl
2af4:0880  add [di],al
2af4:0882  add ax,[bx+di]
2af4:0884  add ax,103h
2af4:0887  (bad)
2af4:0889  (bad)
2af4:088b  (bad)
2af4:088d  inc word ptr [bp+di]
2af4:088f  (bad)
2af4:0891  add ax,[bp+di]
2af4:0893  (bad)
2af4:0895  add ax,[bp+di]
2af4:0897  (bad)
2af4:0899  add ax,[bp+di]
2af4:089b  (bad)
2af4:089d  add di,di
2af4:089f  (bad)
2af4:08a1  (bad)
2af4:08a3  (bad)
2af4:08a5  (bad)
2af4:08a7  add al,[bp+si]
2af4:08a9  add al,[bp+si]
2af4:08ab  add al,[bp+si]
2af4:08ad  add al,[bp+si]
2af4:08af  add al,[bp+si]
2af4:08b1  add al,[bp+si]
2af4:08b3  (bad)
2af4:08b5  (bad)
2af4:08b7  inc word ptr [bx+di]
2af4:08b9  inc word ptr [bx+di]
2af4:08bb  add [bx+di],ax
2af4:08bd  add [bx+di],ax
2af4:08bf  add di,di
2af4:08c1  add di,di
2af4:08c3  (bad)
2af4:08c5  (bad)
2af4:08c7  add [bx+si],al
2af4:08c9  (bad)
2af4:08cb  (bad)
2af4:08cd  (bad)
2af4:08cf  add [bx+di],al
2af4:08d1  add al,[bp+di]
2af4:08d3  add al,2
2af4:08d5  add [bp+di],al
2af4:08d7  add [si],ax
2af4:08d9  add al,[bp+di]
2af4:08db  add [bx+di],al
2af4:08dd  add al,1
2af4:08df  add ax,[bx+si]
2af4:08e1  add al,[si]
2af4:08e3  add [bx+di],al
2af4:08e5  add [bx+di],al
2af4:08e7  add [bx+si],al
2af4:08e9  add [bx+di],ax
2af4:08eb  add [bx+si],ax
2af4:08ed  add [bx+si],ax
2af4:08ef  add [bx+di],ax
2af4:08f1  add [bx+si],al
2af4:08f3  sub [si],bl
2af4:08f5  adc cl,[di]
2af4:08f7  adc ax,0CC1Ah
2af4:08fa  push sp
2af4:08fc  call far dword ptr [si]
2af4:08fe  add [si],al
2af4:0901  insb [di],dx
2af4:0902  add [si-4400h],dl
2af4:0906  add [bx+si-701h],bh
2af4:090a  (bad)
2af4:090c  add [bx+si],bh
2af4:090f  mov ax,0C800h
2af4:0912  jmp far dword ptr [bx+si]
2af4:0914  add [bx+si],cl
2af4:0918  add [bx+si],al
2af4:091a  add [bx+si],al
2af4:091c  add [bp+si],al
2af4:091e  push es
2af4:091f  or [bx+di],ax
2af4:0921  add al,[bp+di]
2af4:0923  and [bx+si],bl
2af4:0925  adc [si],al
2af4:0927  add al,[bx+si]
2af4:0929  lodsw [si]
2af4:092a  push es
2af4:092b  xlat [bx]
2af4:092c  or dh,ch
2af4:092e  push es
2af4:092f  xlat [bx]
2af4:0930  or [bx+si],al
2af4:0932  push es

; Candidate 2af4:00a7, file offset 0x2e1e7
2af4:00a7  int 3Fh
2af4:00a9  fld st,qword ptr [bx+di]
2af4:00ab  add ch,cl
2af4:00ad  aas
2af4:00ae  jae short 00BDh
2af4:00b0  add [bx+si],al
2af4:00b2  add [bx+si],al
2af4:00b4  add [bx+si],al
2af4:00b6  add [bx+si],al
2af4:00b8  add [bx+si],al
2af4:00ba  add [bx+si],al
2af4:00bc  add [bx+si],al
2af4:00be  add [bx+si],al
2af4:00c0  int 3Fh
2af4:00c2  add [bx+si],al
2af4:00c4  mov al,0E8h
2af4:00c6  add [bx+si],al
2af4:00c8  mov al,1
2af4:00ca  add al,0
2af4:00cc  add [bx+si],ax
2af4:00ce  add [bx+si],al
2af4:00d0  add [bx+si],al
2af4:00d2  add [bx+si],al
2af4:00d4  add [bx+si],al
2af4:00d6  add [bx+si],al
2af4:00d8  add [bx+si],al
2af4:00da  add [bx+si],al
2af4:00dc  add [bx+si],al
2af4:00de  add [bx+si],al
2af4:00e0  int 3Fh
2af4:00e2  add [bx+si],al
2af4:00e4  add [bx+si],al
2af4:00e6  add [bx+si],al
2af4:00e8  add [bx+si],al
2af4:00ea  add [bx+si],al
2af4:00ec  add [bx+si],al
2af4:00ee  add [bx+si],al
2af4:00f0  int 3Fh
2af4:00f2  add [bx+si],al
2af4:00f4  jo short 00E0h
2af4:00f6  add [bx+si],al
2af4:00f8  push 8E10h
2af4:00fb  add [si],cl
2af4:00fd  add [bx+si],al
2af4:00ff  add [bx+si],al
2af4:0101  add [bx+si],al
2af4:0103  add [bx+si],al
2af4:0105  add [bx+si],al
2af4:0107  add [bx+si],al
2af4:0109  add [bx+si],al
2af4:010b  add [bx+si],al
2af4:010d  add [bx+si],al
2af4:010f  add ch,cl
2af4:0111  aas
2af4:0112  (bad)
2af4:0114  add ch,cl
2af4:0116  aas
2af4:0117  mov byte ptr [bx+si],0
2af4:011a  int 3Fh
2af4:011c  lds cx,[bp+di]
2af4:011e  add ch,cl
2af4:0120  aas
2af4:0121  xor ax,[bx+di]
2af4:0123  add ch,cl
2af4:0125  aas
2af4:0126  data32 push cs
2af4:0128  add ch,cl
2af4:012a  aas
2af4:012b  jg short 0130h
2af4:012d  add ch,cl
2af4:012f  aas
2af4:0130  mov ch,7
2af4:0132  add ch,cl
2af4:0134  aas
2af4:0135  xlat [bx]
2af4:0136  push es
2af4:0137  add ch,cl
2af4:0139  aas
2af4:013a  pop ss
2af4:013b  or al,0
2af4:013d  int 3Fh
2af4:013f  mov ah,0Eh
2af4:0141  add ch,cl
2af4:0143  aas
2af4:0144  add [bx+si],al
2af4:0146  add ch,cl
2af4:0148  aas
2af4:0149  jne short 0155h
2af4:014b  add [bx+si],al
2af4:014d  add [bx+si],al
2af4:014f  add ch,cl
2af4:0151  aas
2af4:0152  add [bx+si],al
2af4:0154  jo short 0151h
2af4:0156  add [bx+si],al
2af4:0158  sahf
2af4:0159  sbb ax,0E4h
2af4:015c  sldt [bx+si]
2af4:015f  add [bx+si],al
2af4:0161  add [bx+si],al
2af4:0163  add [bx+si],al
2af4:0165  add [bx+si],al
2af4:0167  add [bx+si],al
2af4:0169  add [bx+si],al
2af4:016b  add [bx+si],al
2af4:016d  add [bx+si],al
2af4:016f  add ch,cl
2af4:0171  aas
2af4:0172  mov dl,0Ch
2af4:0174  add ch,cl
2af4:0176  aas
2af4:0177  xchg [bp+di],ax
2af4:0179  add ch,cl
2af4:017b  aas
2af4:017c  arpl [0CD00h],cx
2af4:0180  aas
2af4:0181  (bad)
2af4:0184  int 3Fh
2af4:0186  movsw [di],[si]
2af4:0187  add [bx+si],al
2af4:0189  int 3Fh
2af4:018b  pusha
2af4:018c  add [bx+si],al
2af4:018e  int 3Fh
2af4:0190  aas
2af4:0191  add al,0
2af4:0193  int 3Fh
2af4:0195  fadd st,dword ptr [bx+si]
2af4:0197  add ch,cl
2af4:0199  aas
2af4:019a  loope 01A7h
2af4:019c  add ch,cl
2af4:019e  aas
2af4:019f  or [bx+di],al
2af4:01a1  add ch,cl
2af4:01a3  aas
2af4:01a4  push bp
2af4:01a5  add al,[bx+si]
2af4:01a7  int 3Fh
2af4:01a9  add [bx+si],al
2af4:01ab  add ch,cl
2af4:01ad  aas
2af4:01ae  dec bp
2af4:01af  push cs
2af4:01b0  add ch,cl
2af4:01b2  aas
2af4:01b3  pop es
2af4:01b4  add ax,0CD00h
2af4:01b7  aas
2af4:01b8  jle short 01C4h
2af4:01ba  add [bx+si],al
2af4:01bc  add [bx+si],al
2af4:01be  add [bx+si],al
2af4:01c0  int 3Fh
2af4:01c2  add [bx+si],al
2af4:01c4  adc [bp+si],bl
2af4:01c6  add [bx+si],ax
2af4:01c8  and byte ptr [bp+di],7Eh
2af4:01cb  add [bp+si],cx
2af4:01cd  add [bx+si],al
2af4:01cf  add [bx+si],al
2af4:01d1  add [bx+si],al
2af4:01d3  add [bx+si],al
2af4:01d5  add [bx+si],al
2af4:01d7  add [bx+si],al
2af4:01d9  add [bx+si],al
2af4:01db  add [bx+si],al
2af4:01dd  add [bx+si],al
2af4:01df  add ch,cl
2af4:01e1  aas
2af4:01e2  xlat [bx]
2af4:01e3  adc [bx+si],ax
2af4:01e5  int 3Fh
2af4:01e7  adc ax,es:[bx+si]
2af4:01ea  int 3Fh
2af4:01ec  mov ah,12h
2af4:01ee  add ch,cl
2af4:01f0  aas
2af4:01f1  (bad)
2af4:01f5  aas
2af4:01f6  add [bx+si],al
2af4:01f8  add ch,cl
2af4:01fa  aas
2af4:01fb  or cx,[bp+si]
2af4:01fd  add ch,cl
2af4:01ff  aas
2af4:0200  cbw
2af4:0201  or [bx+si],al
2af4:0203  int 3Fh
2af4:0205  adc al,gs:[bx+si]
2af4:0208  int 3Fh
2af4:020a  lodsb [si]
2af4:020b  or [bx+si],al
2af4:020d  int 3Fh
2af4:020f  push si
2af4:0210  adc al,[bx+si]
2af4:0212  add [bx+si],al
2af4:0214  add [bx+si],al
2af4:0216  add [bx+si],al
2af4:0218  add [bx+si],al
2af4:021a  add [bx+si],al
2af4:021c  add [bx+si],al
2af4:021e  add [bx+si],al
2af4:0220  add [bx+si],al
2af4:0222  add [bx+si],al
2af4:0224  inc dx
2af4:0225  outsw dx,[si]
2af4:0226  jb short 0294h
2af4:0228  popa
2af4:0229  outsb dx,[si]
2af4:022a  and fs:[bp+di+2Bh],al
2af4:022e  sub sp,[bx+si]
2af4:0230  sub ax,4320h
2af4:0233  outsw dx,[si]
2af4:0234  jo short 02AFh
2af4:0236  jb short 02A1h
2af4:0238  push 2074h
2af4:023c  xor [bx+di],di
2af4:023e  cmp [bx+di],si
2af4:0240  and [bp+si+6Fh],al
2af4:0243  jb short 02B1h
2af4:0245  popa
2af4:0246  outsb dx,[si]
2af4:0247  and fs:[bx+di+6Eh],cl
2af4:024b  je short 02B9h
2af4:024d  add cs:[si+69h],al
2af4:0251  jbe short 02BCh
2af4:0253  and gs:[di+72h],ah
2af4:0258  jb short 02C9h
2af4:025a  jb short 0269h
2af4:025c  or al,[bx+di+62h]
2af4:025f  outsb dx,[si]
2af4:0260  outsw dx,[si]
2af4:0261  jb short 02D0h
2af4:0263  popa
2af4:0264  insb [di],dx
2af4:0265  and [bx+si+72h],dh
2af4:0268  outsw dx,[si]
2af4:0269  jb short 02CDh
2af4:026c  insw [di],dx
2af4:026d  and [si+65h],dh
2af4:0270  jb short 02DFh
2af4:0272  imul bp,[bp+61h],6974h
2af4:0277  outsw dx,[si]
2af4:0278  outsb dx,[si]
2af4:0279  or ax,0Ah
2af4:027c  add [bx+si],al
2af4:027e  add [bx+si],al
2af4:0280  add [bx+si],al
2af4:0282  add [bx+si],al
2af4:0284  add [bx+si],al
2af4:0286  add [bx+si],al
2af4:0288  add [bx+si],al
2af4:028a  add [bx+si],al
2af4:028c  add [bx+si],al
2af4:028e  add [bx+si],al
2af4:0290  add [bx+si],al
2af4:0292  add [bx+si],al
2af4:0294  add [bx+si],al
2af4:0296  add [bx+si],al
2af4:0298  add [bx+si],al
2af4:029a  add [bx+si],al
2af4:029c  add [bx+si],al
2af4:029e  add [bx+si],al
2af4:02a0  add [bx+si],al
2af4:02a2  add [bx+si],al
2af4:02a4  add [bx+si],al
2af4:02a6  add [bx+si],al
2af4:02a8  add [bx+si],al
2af4:02aa  add [bx+si],al
2af4:02ac  add [bx+si],al
2af4:02ae  add [bx+si],al
2af4:02b0  add [bx+si],al
2af4:02b2  xlat [bx]
2af4:02b3  xlat [bx]
2af4:02b4  xlat [bx]
2af4:02b5  xlat [bx]
2af4:02b6  xlat [bx]
2af4:02b7  xlat [bx]
2af4:02b8  xlat [bx]
2af4:02b9  xlat [bx]
2af4:02ba  xlat [bx]
2af4:02bb  xlat [bx]
2af4:02bc  xlat [bx]
2af4:02bd  xlat [bx]
2af4:02be  xlat [bx]
2af4:02bf  xlat [bx]
2af4:02c0  xlat [bx]
2af4:02c1  xlat [bx]
2af4:02c2  fcom st,st(7)
2af4:02c4  fcomp st,st(0)
2af4:02c6  add bl,al
2af4:02c8  fcomp st,st(0)
2af4:02ca  fdivr st,st(6)
2af4:02cc  xlat [bx]
2af4:02cd  fcomp st,st(0)
2af4:02cf  fcom st,st(7)
2af4:02d1  add bx,ax
2af4:02d3  std
2af4:02d4  fcomp st,st(0)
2af4:02d6  fdivr st,st(6)
2af4:02d8  fmul st,dword ptr [bx+si]
2af4:02da  fcomp st,st(0)
2af4:02dc  fdivr st,st(6)
2af4:02de  xlat [bx]
2af4:02df  push es
2af4:02e0  fcomp st,st(0)
2af4:02e2  cli
2af4:02e3  add bx,ax
2af4:02e5  std
2af4:02e6  fcomp st,st(0)
2af4:02e8  fcomp st,st(0)
2af4:02ea  fcomp st,st(0)
2af4:02ec  fcomp st,st(0)
2af4:02ee  fcomp st,st(0)
2af4:02f0  cli
2af4:02f1  xlat [bx]
2af4:02f2  adc al,bl
2af4:02f4  std
2af4:02f5  xlat [bx]
2af4:02f6  adc bx,ax
2af4:02f8  fcomp st,st(0)
2af4:02fa  fcomp st,st(0)
2af4:02fc  fdiv st,st(2)
2af4:02fe  fcom st,dword ptr [si]
2af4:0300  fcomp st,st(0)
2af4:0302  fdiv st,st(0)
2af4:0304  xlat [bx]
2af4:0305  adc al,0D8h
2af4:0307  in ax,dx
2af4:0308  adc al,bl
2af4:030a  fcom st,dword ptr [bp+di]
2af4:030c  fcomp st,st(0)
2af4:030e  fcomp st,st(0)
2af4:0310  in al,dx
2af4:0311  fcomp st,st(0)
2af4:0313  fcomp st,st(0)
2af4:0315  fcom st,st(7)
2af4:0317  adc al,0D8h
2af4:0319  in ax,dx
2af4:031a  xlat [bx]
2af4:031b  fcomp st,st(0)
2af4:031d  adc dx,di
2af4:031f  xlat [bx]
2af4:0320  xlat [bx]
2af4:0321  xlat [bx]
2af4:0322  xlat [bx]
2af4:0323  xlat [bx]
2af4:0324  xlat [bx]
2af4:0325  xlat [bx]
2af4:0326  xlat [bx]
2af4:0327  xlat [bx]
2af4:0328  xlat [bx]
2af4:0329  xlat [bx]
2af4:032a  xlat [bx]
2af4:032b  xlat [bx]
2af4:032c  xlat [bx]
2af4:032d  xlat [bx]
2af4:032e  fcom st,st(7)
2af4:0330  xlat [bx]
2af4:0331  xlat [bx]
2af4:0332  xlat [bx]
2af4:0333  xlat [bx]
2af4:0334  xlat [bx]
2af4:0335  xlat [bx]
2af4:0336  xlat [bx]
2af4:0337  xlat [bx]
2af4:0338  xlat [bx]
2af4:0339  xlat [bx]
2af4:033a  xlat [bx]
2af4:033b  xlat [bx]
2af4:033c  xlat [bx]
2af4:033d  xlat [bx]
2af4:033e  xlat [bx]
2af4:033f  xlat [bx]
2af4:0340  fcom st,st(7)
2af4:0342  fcomp st,st(0)
2af4:0344  fcomp st,st(0)
2af4:0346  fcomp st,st(0)
2af4:0348  fcomp st,st(0)
2af4:034a  fadd st,dword ptr [0D8D8h]
2af4:034e  cli
2af4:034f  add bx,ax
2af4:0351  std
2af4:0352  fcomp st,st(0)
2af4:0354  fcomp st,st(0)
2af4:0356  fcomp st,st(0)
2af4:0358  fcomp st,st(0)
2af4:035a  fcomp st,st(0)
2af4:035c  cli
2af4:035d  fcom st,dword ptr [bx+si]
2af4:035f  fdivr st,st(5)
2af4:0361  xlat [bx]
2af4:0362  adc di,bp
2af4:0364  fcom st,dword ptr [bp+di]
2af4:0366  fcomp st,st(0)
2af4:0368  fcomp st,st(0)
2af4:036a  fcomp st,st(0)
2af4:036c  fcomp st,st(0)
2af4:036e  fdiv st,st(0)
2af4:0370  fcomp st,st(0)
2af4:0372  fsubr st,st(5)
2af4:0374  adc al,bl
2af4:0376  fcom st,dword ptr [bp+di]
2af4:0378  xlat [bx]
2af4:0379  xlat [bx]
2af4:037a  xlat [bx]
2af4:037b  xlat [bx]
2af4:037c  xlat [bx]
2af4:037d  xlat [bx]
2af4:037e  xlat [bx]
2af4:037f  xlat [bx]
2af4:0380  xlat [bx]
2af4:0381  xlat [bx]
2af4:0382  xlat [bx]
2af4:0383  xlat [bx]
2af4:0384  xlat [bx]
2af4:0385  xlat [bx]
2af4:0386  xlat [bx]
2af4:0387  xlat [bx]
2af4:0388  fcom st,st(7)
2af4:038a  fcomp st,st(0)
2af4:038c  fcomp st,st(0)
2af4:038e  fcomp st,st(0)
2af4:0390  fcomp st,st(0)
2af4:0392  fcomp st,st(0)
2af4:0394  fcomp st,st(0)
2af4:0396  fadd st,dword ptr [bp+di]
2af4:0398  fdivr st,st(5)
2af4:039a  fcomp st,st(0)
2af4:039c  fcomp st,st(0)
2af4:039e  fcomp st,st(0)
2af4:03a0  fcomp st,st(0)
2af4:03a2  fcomp st,st(0)
2af4:03a4  fcomp st,st(0)
2af4:03a6  fcomp st,st(0)
2af4:03a8  std
2af4:03a9  fcom st,dword ptr [bp+di]
2af4:03ab  std
2af4:03ac  fcom st,dword ptr [bp+di]
2af4:03ae  fcomp st,st(0)
2af4:03b0  fcomp st,st(0)
2af4:03b2  fcomp st,st(0)
2af4:03b4  fcomp st,st(0)
2af4:03b6  fcomp st,st(0)
2af4:03b8  fcomp st,st(0)
2af4:03ba  fsubr st,st(5)
2af4:03bc  fcomp st,st(0)
2af4:03be  fcom st,dword ptr [bp+di]
2af4:03c0  fcomp st,st(0)
2af4:03c2  fcomp st,st(0)
2af4:03c4  fcomp st,st(0)
2af4:03c6  fcomp st,st(0)
2af4:03c8  fcomp st,st(0)
2af4:03ca  fcomp st,st(0)
2af4:03cc  fcomp st,st(0)
2af4:03ce  fcomp st,st(0)
2af4:03d0  fcomp st,st(0)
2af4:03d2  fcomp st,st(0)
2af4:03d4  fcomp st,st(0)
2af4:03d6  fcomp st,st(0)
2af4:03d8  fcomp st,st(0)
2af4:03da  fcomp st,st(0)
2af4:03dc  fcomp st,st(0)
2af4:03de  fcomp st,st(0)
2af4:03e0  fcomp st,st(0)
2af4:03e2  fcomp st,st(0)
2af4:03e4  fcomp st,st(0)
2af4:03e6  fcomp st,st(0)
2af4:03e8  fcomp st,st(0)
2af4:03ea  fcomp st,st(0)
2af4:03ec  fcomp st,st(0)
2af4:03ee  fcomp st,st(0)
2af4:03f0  fcomp st,st(0)
2af4:03f2  fcomp st,st(0)
2af4:03f4  fcomp st,st(0)
2af4:03f6  push ss
2af4:03f7  add [1600h],dl
2af4:03fb  add [1600h],dl
2af4:03ff  add [1600h],dl
2af4:0403  add [1600h],dl
2af4:0407  add [1600h],dl
2af4:040b  add [1600h],dl
2af4:040f  add [1600h],dl
2af4:0413  add [0],dl
2af4:0417  push ss
2af4:0418  push ss
2af4:0419  add [bx+si],al
2af4:041b  push ss
2af4:041c  add [200h],dl
2af4:0420  add [1600h],dl
2af4:0424  add [1600h],dl
2af4:0428  add dl,[400h]
2af4:042c  add [1600h],dl
2af4:0430  add [16h],dl
2af4:0434  add [bp+di],al
2af4:0436  add [1603h],dl
2af4:043a  add [1600h],dl
2af4:043e  add [1602h],dl
2af4:0442  add [800h],dl
2af4:0446  add [1600h],dl
2af4:044a  add [200h],dl
2af4:044e  push ss
2af4:044f  add [bx+si],al
2af4:0451  push es
2af4:0452  add [1600h],dl
2af4:0456  push es
2af4:0457  push ss
2af4:0458  add [bp+di],al
2af4:045a  add [3],dl
2af4:045e  add [1600h],dl
2af4:0462  add [1600h],dl
2af4:0466  add [1600h],dl
2af4:046a  add [1600h],dl
2af4:046e  add [1600h],dl
2af4:0472  push es
2af4:0473  push ss
2af4:0474  or [1000h],cl
2af4:0478  add [1603h],dl
2af4:047c  push es
2af4:047d  adc [bx+si],al
2af4:047f  adc ax,[bx+si]
2af4:0481  push ss
2af4:0482  add [1600h],dl
2af4:0486  add [1600h],dl
2af4:048a  add [160Eh],dl
2af4:048e  add [1400h],dl
2af4:0492  add [1600h],dl
2af4:0496  add [1610h],dl
2af4:049a  push ss
2af4:049b  add [bx+si],al
2af4:049d  adc al,0
2af4:049f  push ss
2af4:04a0  adc dx,[1000h]
2af4:04a4  add [1600h],dl
2af4:04a8  add [bp+di],dl
2af4:04aa  add [1600h],dl
2af4:04ae  add [1600h],dl
2af4:04b2  adc al,16h
2af4:04b4  add [1600h],dl
2af4:04b8  add [1600h],dl
2af4:04bc  add [1612h],dl
2af4:04c0  adc al,16h
2af4:04c2  add [1613h],dl
2af4:04c6  push ss
2af4:04c7  add [bx+si],al
2af4:04c9  push ss
2af4:04ca  add [1300h],dl
2af4:04ce  push ss
2af4:04cf  add [1600h],dl
2af4:04d3  add [1600h],dl
2af4:04d7  add [1600h],dl
2af4:04db  add [1600h],dl
2af4:04df  add [1600h],dl
2af4:04e3  add [1600h],dl
2af4:04e7  add [1600h],dl
2af4:04eb  add [0],dl
2af4:04ef  push ss
2af4:04f0  push ss
2af4:04f1  add [1600h],dl
2af4:04f5  add [1600h],dl
2af4:04f9  add [1600h],dl
2af4:04fd  add [1600h],dl
2af4:0501  add [1600h],dl
2af4:0505  add [1600h],dl
2af4:0509  add [1600h],dl
2af4:050d  add [1600h],dl
2af4:0511  add [bx+si],al
2af4:0513  push ss
2af4:0514  push ss
2af4:0515  add [bx+si],al
2af4:0517  push ss
2af4:0518  add [1600h],dl
2af4:051c  add [1600h],dl
2af4:0520  add [1600h],dl
2af4:0524  add [1600h],dl
2af4:0528  add [1600h],al
2af4:052c  add [1606h],dl
2af4:0530  add [bp+di],al
2af4:0532  add [1603h],dl
2af4:0536  add [1600h],dl
2af4:053a  add [1600h],dl
2af4:053e  add [1600h],dl
2af4:0542  add [1600h],dl
2af4:0546  add [1600h],dl
2af4:054a  push es
2af4:054b  push ss
2af4:054c  add [1000h],dl
2af4:0550  add [1603h],dl
2af4:0554  pop es
2af4:0555  lldt [bp+di]
2af4:0558  add dx,[1600h]
2af4:055c  add [bp+di],dl
2af4:055e  add [1600h],dl
2af4:0562  add [1600h],dl
2af4:0566  add [1600h],dl
2af4:056a  add [1600h],dl
2af4:056e  add [1610h],dl
2af4:0572  add [1600h],dl
2af4:0576  add [1613h],dl
2af4:057a  add [bx+si],dl
2af4:057c  add [1600h],dl
2af4:0580  add [bp+di],dl
2af4:0582  push ss
2af4:0583  add [1600h],dl
2af4:0587  add [1600h],dl
2af4:058b  add [1600h],dl
2af4:058f  add [1600h],dl
2af4:0593  add [1600h],dl
2af4:0597  add [1600h],dl
2af4:059b  add [1600h],dl
2af4:059f  add [0],dl
2af4:05a3  push ss
2af4:05a4  push ss
2af4:05a5  add [bx+si],al
2af4:05a7  push ss
2af4:05a8  add [1600h],dl
2af4:05ac  add [1600h],dl
2af4:05b0  add [1600h],dl
2af4:05b4  add [1600h],dl
2af4:05b8  add [1600h],dl
2af4:05bc  add [1600h],dl
2af4:05c0  add [bp+di],al
2af4:05c2  add [1603h],dl
2af4:05c6  add [1600h],dl
2af4:05ca  add [1600h],dl
2af4:05ce  add [1600h],dl
2af4:05d2  add [1600h],dl
2af4:05d6  add [1600h],dl
2af4:05da  add [1600h],dl
2af4:05de  add [1600h],dl
2af4:05e2  add dx,[1600h]
2af4:05e6  add [bp+di],dl
2af4:05e8  add dx,[1600h]
2af4:05ec  add [bp+di],dl
2af4:05ee  add [1600h],dl
2af4:05f2  add [1600h],dl
2af4:05f6  add [1600h],dl
2af4:05fa  add [1600h],dl
2af4:05fe  add [1600h],dl
2af4:0602  add [1600h],dl
2af4:0606  add [1613h],dl
2af4:060a  add [1600h],dl
2af4:060e  add [1300h],dl
2af4:0612  add [1600h],dl
2af4:0616  add [1600h],dl
2af4:061a  add [1600h],dl
2af4:061e  add [1600h],dl
2af4:0622  add [1600h],dl
2af4:0626  add [1600h],dl
2af4:062a  add [1600h],dl
2af4:062e  add [1600h],dl
2af4:0632  add [1600h],dl
2af4:0636  add [1600h],dl
2af4:063a  add [1600h],dl
2af4:063e  add [1600h],dl
2af4:0642  add [1600h],dl
2af4:0646  add [1600h],dl
2af4:064a  add [1600h],dl
2af4:064e  add [1600h],dl
2af4:0652  add [1600h],dl
2af4:0656  add [1600h],dl
2af4:065a  add [1600h],dl
2af4:065e  add [1600h],dl
2af4:0662  add [1600h],dl
2af4:0666  add [1600h],dl
2af4:066a  add [1600h],dl
2af4:066e  add [1600h],dl
2af4:0672  add [1600h],dl
2af4:0676  add [1600h],dl
2af4:067a  add [1600h],dl
2af4:067e  push ds
2af4:067f  sbb [bx+si],dl
2af4:0681  add [bp+di],bh
2af4:0683  inc di
2af4:0684  push si
2af4:0685  js short 0686h
2af4:0687  (bad)
2af4:0689  (bad)
2af4:068b  (bad)
2af4:068d  (bad)
2af4:068f  add di,di
2af4:0691  (bad)
2af4:0693  or di,di
2af4:0695  or cx,[si]
2af4:0697  or ax,0FFFFh
2af4:069a  add ax,[bp+di]
2af4:069c  add al,[bp+si]
2af4:069e  add al,[bp+si]
2af4:06a0  add [bx+di],ax
2af4:06a2  add [bx+di],ax
2af4:06a4  add [bx+si],al
2af4:06a6  (bad)
2af4:06a8  and ax,3100h
2af4:06ab  add [bx+si],bh
2af4:06ad  add [bx+si],al
2af4:06af  add dh,bh
2af4:06b1  inc word ptr [bx+di]
2af4:06b3  add bh,bh
2af4:06b5  inc word ptr [bp+si]
2af4:06b7  add [bx+si],al
2af4:06b9  add [bx+di],al
2af4:06bb  add bh,bh
2af4:06bd  jmp far dword ptr [di-28FAh]
2af4:06c1  or dh,ch
2af4:06c3  push es
2af4:06c4  xlat [bx]
2af4:06c5  or [bx],ch
2af4:06c7  pop es
2af4:06c8  xlat [bx]
2af4:06c9  or [bx+si+7],dh
2af4:06cc  xlat [bx]
2af4:06cd  or [bp+si],al
2af4:06cf  add [bx+si],ax
2af4:06d1  add al,0FEh
2af4:06d3  add [bp+di],ax
2af4:06d5  add ax,[si]
2af4:06d7  inc byte ptr [bx+di]
2af4:06d9  add [bp+di],ax
2af4:06db  add al,0FEh
2af4:06dd  inc byte ptr [bx+di]
2af4:06df  add ax,[si]
2af4:06e1  cld
2af4:06e2  std
2af4:06e3  inc word ptr [bp+si]
2af4:06e5  add bh,ah
2af4:06e7  std
2af4:06e8  (bad)
2af4:06ea  add bh,ah
2af4:06ec  std
2af4:06ed  std
2af4:06ee  inc word ptr [bp+si]
2af4:06f0  cld
2af4:06f1  add al,0FEh
2af4:06f3  add [bp+di],ax
2af4:06f5  add ax,[si]
2af4:06f7  inc byte ptr [bx+di]
2af4:06f9  add [bp+di],ax
2af4:06fb  add al,0FEh
2af4:06fd  inc byte ptr [bx+di]
2af4:06ff  add ax,[si]
2af4:0701  add al,0FDh
2af4:0703  add [bp+si],ax
2af4:0705  add al,[si]
2af4:0707  std
2af4:0708  add [bx+di],ax
2af4:070a  add al,[si]
2af4:070c  std
2af4:070d  std
2af4:070e  add [bp+si],ax
2af4:0710  add al,0
2af4:0712  add [bp+si],ax
2af4:0714  add ax,[si]
2af4:0716  add al,[bx+si]
2af4:0718  add ax,[bx+di]
2af4:071a  add al,2
2af4:071c  add ax,[bx+si]
2af4:071e  add [si],ax
2af4:0720  add [bp+di],ax
2af4:0722  add [bp+si],al
2af4:0724  add al,14h
2af4:0726  or al,4
2af4:0728  add al,2
2af4:072a  add [bx+si],al
2af4:072c  add [bx+si],al
2af4:072e  add [bx+si],al
2af4:0730  add [bx+si],al
2af4:0732  add [si-6Ch],al
2af4:0735  push ss
2af4:0736  sub bp,[bp+di]
2af4:0738  fist word ptr [442Bh],st
2af4:073c  xchg sp,ax
2af4:073d  push ss
2af4:073e  sub bp,[bp+di]
2af4:0740  fist word ptr [442Bh],st
2af4:0744  xchg sp,ax
2af4:0745  push ss
2af4:0746  sub ax,[bx+si]
2af4:0748  add [bx+si],al
2af4:074a  add [si-6Ch],al
2af4:074d  push ss
2af4:074e  sub cx,[bp+si-21h]
2af4:0751  push ss
2af4:0752  sub ax,[si-6Ch]
2af4:0755  push ss
2af4:0756  sub cx,[bp+si-21h]
2af4:0759  push ss
2af4:075a  sub ax,[bx+si]
2af4:075c  add [bx+si],al
2af4:075e  add [bx+si],al
2af4:0760  add [bx+si],al
2af4:0762  add [si-6Ch],al
2af4:0765  push ss
2af4:0766  sub bp,[bp+di]
2af4:0768  fist word ptr [442Bh],st
2af4:076c  xchg sp,ax
2af4:076d  push ss
2af4:076e  sub bp,[bp+di]
2af4:0770  fist word ptr [442Bh],st
2af4:0774  xchg sp,ax
2af4:0775  push ss
2af4:0776  sub ax,[bx+si]
2af4:0778  add [bx+si],al
2af4:077a  add [si-6Ch],al
2af4:077d  push ss
2af4:077e  sub cx,[bp+si-21h]
2af4:0781  push ss
2af4:0782  sub ax,[si-6Ch]
2af4:0785  push ss
2af4:0786  sub cx,[bp+si-21h]
2af4:0789  push ss
2af4:078a  sub ax,[si-6Ch]
2af4:078d  push ss
2af4:078e  sub bp,[bp+di]
2af4:0790  fist word ptr [442Bh],st
2af4:0794  xchg sp,ax
2af4:0795  push ss
2af4:0796  sub ax,[bx+si]
2af4:0798  add [bx+si],al
2af4:079a  add [si-6Ch],al
2af4:079d  push ss
2af4:079e  sub cx,[bp+si-21h]
2af4:07a1  push ss
2af4:07a2  sub ax,[bx+si]
2af4:07a4  add [bx+si],al
2af4:07a6  add [bp+di],ch
2af4:07a8  fist word ptr [442Bh],st
2af4:07ac  xchg sp,ax
2af4:07ad  push ss
2af4:07ae  sub ax,[bx+si]
2af4:07b0  add [bx+si],al
2af4:07b2  add [bx+si],al
2af4:07b4  add [bx+si],al
2af4:07b6  add [bp+si-21h],cl
2af4:07b9  push ss
2af4:07ba  sub ax,[bx+di]
2af4:07bc  add [si],ax
2af4:07be  or al,[si]
2af4:07c0  or [si],al
2af4:07c2  add [si],ax
2af4:07c4  clc
2af4:07c5  add al,0F6h
2af4:07c7  add [bx+si],al
2af4:07c9  add cx,[bx+di]
2af4:07cb  add ax,[bx]
2af4:07cd  add ax,[bx+di]
2af4:07cf  add di,cx
2af4:07d1  add si,di
2af4:07d3  add al,[102h]
2af4:07d7  add bh,dl
2af4:07d9  add [di],ax
2af4:07db  add [bx+di],ax
2af4:07dd  add bx,di
2af4:07df  jo short 07E0h
2af4:07e1  mov al,[0D0FFh]
2af4:07e4  inc word ptr [bx+si]
2af4:07e6  add [bx+si],dh
2af4:07e8  add [bx+si],ah
2af4:07eb  nop
2af4:07ec  add [bx+si-1],ah
2af4:07ef  mov al,0FFh
2af4:07f1  add [bx+si],al
2af4:07f3  push ax
2af4:07f4  add [bx+si-8000h],ah
2af4:07f8  inc word ptr [bx+si]
2af4:07fa  add [bx+si],al
2af4:07fe  add [bx+si],al
2af4:0800  add [bx+si],al
2af4:0802  add [bp+di],bh
2af4:0804  inc di
2af4:0805  push si
2af4:0806  add [bx],bl
2af4:0808  sbb [bx],cl
2af4:080a  add [bx+si],al
2af4:080c  add [bx+si],al
2af4:080e  add ax,[bp+di]
2af4:0810  add ax,[bp+di]
2af4:0812  add cx,[bx+si]
2af4:0814  or [bx+si],cl
2af4:0816  or [bx+si],cl
2af4:0818  or ax,0D0Dh
2af4:081b  or ax,120Dh
2af4:081e  adc dl,[bp+si]
2af4:0820  adc dl,[bp+si]
2af4:0822  add [bx+si],al
2af4:0824  add [bx+si],al
2af4:0826  add [bx+si],al
2af4:0828  add [bx+si],al
2af4:082a  add [bx+si],al
2af4:082c  add [bx+si],al
2af4:082e  add [bx+si],al
2af4:0830  add [bx+si],al
2af4:0832  add [bx+si],al
2af4:0834  add [bx+si],al
2af4:0836  add [bx+si],al
2af4:0838  add [bx+si],al
2af4:083a  add [bx+si],al
2af4:083c  add [bx+si],al
2af4:083e  xor si,[si]
2af4:0840  add [bx+si],al
2af4:0842  add [bx+si],al
2af4:0844  add [bx+si],al
2af4:0846  add [bx+si],al
2af4:0848  add [bx+si],al
2af4:084a  add [bx+si],al
2af4:084c  add [bx+di],al
2af4:084e  add [bx+di],ax
2af4:0850  add [bx+di],ax
2af4:0852  add [bx+di],ax
2af4:0854  add [bx+di],ax
2af4:0856  add [bx+si],ax
2af4:0858  add [bx+si],al
2af4:085a  add [bx+si],al
2af4:085c  add [bx+si],al
2af4:085e  add [bx+si],al
2af4:0860  add [bx+si],al
2af4:0862  add [bx+si],al
2af4:0864  add [bx+si],al
2af4:0866  add [bx+si],al
2af4:0868  add [bx+si],al
2af4:086a  add [bx+si],al
2af4:086c  add [bx+si],al
2af4:086e  add [bx+si],al
2af4:0870  add [bx+si],al
2af4:0872  add [bx+si],al
2af4:0874  add [bx+si],cx
2af4:0876  or al,12h
2af4:0878  add [bx+si],al
2af4:087a  add al,[si]
2af4:087c  add [di],al
2af4:087e  or [si],cl
2af4:0880  add [di],al
2af4:0882  add ax,[bx+di]
2af4:0884  add ax,103h
2af4:0887  (bad)
2af4:0889  (bad)
2af4:088b  (bad)
2af4:088d  inc word ptr [bp+di]
2af4:088f  (bad)
2af4:0891  add ax,[bp+di]
2af4:0893  (bad)
2af4:0895  add ax,[bp+di]
2af4:0897  (bad)
2af4:0899  add ax,[bp+di]
2af4:089b  (bad)
2af4:089d  add di,di
2af4:089f  (bad)
2af4:08a1  (bad)
2af4:08a3  (bad)
2af4:08a5  (bad)
2af4:08a7  add al,[bp+si]
2af4:08a9  add al,[bp+si]
2af4:08ab  add al,[bp+si]
2af4:08ad  add al,[bp+si]
2af4:08af  add al,[bp+si]
2af4:08b1  add al,[bp+si]
2af4:08b3  (bad)
2af4:08b5  (bad)
2af4:08b7  inc word ptr [bx+di]
2af4:08b9  inc word ptr [bx+di]
2af4:08bb  add [bx+di],ax
2af4:08bd  add [bx+di],ax
2af4:08bf  add di,di
2af4:08c1  add di,di
2af4:08c3  (bad)
2af4:08c5  (bad)
2af4:08c7  add [bx+si],al
2af4:08c9  (bad)
2af4:08cb  (bad)
2af4:08cd  (bad)
2af4:08cf  add [bx+di],al
2af4:08d1  add al,[bp+di]
2af4:08d3  add al,2
2af4:08d5  add [bp+di],al
2af4:08d7  add [si],ax
2af4:08d9  add al,[bp+di]
2af4:08db  add [bx+di],al
2af4:08dd  add al,1
2af4:08df  add ax,[bx+si]
2af4:08e1  add al,[si]
2af4:08e3  add [bx+di],al
2af4:08e5  add [bx+di],al
2af4:08e7  add [bx+si],al
2af4:08e9  add [bx+di],ax
2af4:08eb  add [bx+si],ax
2af4:08ed  add [bx+si],ax
2af4:08ef  add [bx+di],ax
2af4:08f1  add [bx+si],al
2af4:08f3  sub [si],bl
2af4:08f5  adc cl,[di]
2af4:08f7  adc ax,0CC1Ah
2af4:08fa  push sp
2af4:08fc  call far dword ptr [si]
2af4:08fe  add [si],al
2af4:0901  insb [di],dx
2af4:0902  add [si-4400h],dl
2af4:0906  add [bx+si-701h],bh
2af4:090a  (bad)
2af4:090c  add [bx+si],bh
2af4:090f  mov ax,0C800h
2af4:0912  jmp far dword ptr [bx+si]
2af4:0914  add [bx+si],cl
2af4:0918  add [bx+si],al
2af4:091a  add [bx+si],al
2af4:091c  add [bp+si],al
2af4:091e  push es
2af4:091f  or [bx+di],ax
2af4:0921  add al,[bp+di]
2af4:0923  and [bx+si],bl
2af4:0925  adc [si],al
2af4:0927  add al,[bx+si]
2af4:0929  lodsw [si]
2af4:092a  push es
2af4:092b  xlat [bx]
2af4:092c  or dh,ch
2af4:092e  push es
2af4:092f  xlat [bx]
2af4:0930  or [bx+si],al
2af4:0932  push es
2af4:0933  add [di],ax
2af4:0935  add al,[si]
2af4:0937  add ax,[bx]
2af4:0939  or cx,[bx+si]
2af4:093b  or cl,[bx+di]

; Candidate 2af4:00ac, file offset 0x2e1ec
2af4:00ac  int 3Fh
2af4:00ae  jae short 00BDh
2af4:00b0  add [bx+si],al
2af4:00b2  add [bx+si],al
2af4:00b4  add [bx+si],al
2af4:00b6  add [bx+si],al
2af4:00b8  add [bx+si],al
2af4:00ba  add [bx+si],al
2af4:00bc  add [bx+si],al
2af4:00be  add [bx+si],al
2af4:00c0  int 3Fh
2af4:00c2  add [bx+si],al
2af4:00c4  mov al,0E8h
2af4:00c6  add [bx+si],al
2af4:00c8  mov al,1
2af4:00ca  add al,0
2af4:00cc  add [bx+si],ax
2af4:00ce  add [bx+si],al
2af4:00d0  add [bx+si],al
2af4:00d2  add [bx+si],al
2af4:00d4  add [bx+si],al
2af4:00d6  add [bx+si],al
2af4:00d8  add [bx+si],al
2af4:00da  add [bx+si],al
2af4:00dc  add [bx+si],al
2af4:00de  add [bx+si],al
2af4:00e0  int 3Fh
2af4:00e2  add [bx+si],al
2af4:00e4  add [bx+si],al
2af4:00e6  add [bx+si],al
2af4:00e8  add [bx+si],al
2af4:00ea  add [bx+si],al
2af4:00ec  add [bx+si],al
2af4:00ee  add [bx+si],al
2af4:00f0  int 3Fh
2af4:00f2  add [bx+si],al
2af4:00f4  jo short 00E0h
2af4:00f6  add [bx+si],al
2af4:00f8  push 8E10h
2af4:00fb  add [si],cl
2af4:00fd  add [bx+si],al
2af4:00ff  add [bx+si],al
2af4:0101  add [bx+si],al
2af4:0103  add [bx+si],al
2af4:0105  add [bx+si],al
2af4:0107  add [bx+si],al
2af4:0109  add [bx+si],al
2af4:010b  add [bx+si],al
2af4:010d  add [bx+si],al
2af4:010f  add ch,cl
2af4:0111  aas
2af4:0112  (bad)
2af4:0114  add ch,cl
2af4:0116  aas
2af4:0117  mov byte ptr [bx+si],0
2af4:011a  int 3Fh
2af4:011c  lds cx,[bp+di]
2af4:011e  add ch,cl
2af4:0120  aas
2af4:0121  xor ax,[bx+di]
2af4:0123  add ch,cl
2af4:0125  aas
2af4:0126  data32 push cs
2af4:0128  add ch,cl
2af4:012a  aas
2af4:012b  jg short 0130h
2af4:012d  add ch,cl
2af4:012f  aas
2af4:0130  mov ch,7
2af4:0132  add ch,cl
2af4:0134  aas
2af4:0135  xlat [bx]
2af4:0136  push es
2af4:0137  add ch,cl
2af4:0139  aas
2af4:013a  pop ss
2af4:013b  or al,0
2af4:013d  int 3Fh
2af4:013f  mov ah,0Eh
2af4:0141  add ch,cl
2af4:0143  aas
2af4:0144  add [bx+si],al
2af4:0146  add ch,cl
2af4:0148  aas
2af4:0149  jne short 0155h
2af4:014b  add [bx+si],al
2af4:014d  add [bx+si],al
2af4:014f  add ch,cl
2af4:0151  aas
2af4:0152  add [bx+si],al
2af4:0154  jo short 0151h
2af4:0156  add [bx+si],al
2af4:0158  sahf
2af4:0159  sbb ax,0E4h
2af4:015c  sldt [bx+si]
2af4:015f  add [bx+si],al
2af4:0161  add [bx+si],al
2af4:0163  add [bx+si],al
2af4:0165  add [bx+si],al
2af4:0167  add [bx+si],al
2af4:0169  add [bx+si],al
2af4:016b  add [bx+si],al
2af4:016d  add [bx+si],al
2af4:016f  add ch,cl
2af4:0171  aas
2af4:0172  mov dl,0Ch
2af4:0174  add ch,cl
2af4:0176  aas
2af4:0177  xchg [bp+di],ax
2af4:0179  add ch,cl
2af4:017b  aas
2af4:017c  arpl [0CD00h],cx
2af4:0180  aas
2af4:0181  (bad)
2af4:0184  int 3Fh
2af4:0186  movsw [di],[si]
2af4:0187  add [bx+si],al
2af4:0189  int 3Fh
2af4:018b  pusha
2af4:018c  add [bx+si],al
2af4:018e  int 3Fh
2af4:0190  aas
2af4:0191  add al,0
2af4:0193  int 3Fh
2af4:0195  fadd st,dword ptr [bx+si]
2af4:0197  add ch,cl
2af4:0199  aas
2af4:019a  loope 01A7h
2af4:019c  add ch,cl
2af4:019e  aas
2af4:019f  or [bx+di],al
2af4:01a1  add ch,cl
2af4:01a3  aas
2af4:01a4  push bp
2af4:01a5  add al,[bx+si]
2af4:01a7  int 3Fh
2af4:01a9  add [bx+si],al
2af4:01ab  add ch,cl
2af4:01ad  aas
2af4:01ae  dec bp
2af4:01af  push cs
2af4:01b0  add ch,cl
2af4:01b2  aas
2af4:01b3  pop es
2af4:01b4  add ax,0CD00h
2af4:01b7  aas
2af4:01b8  jle short 01C4h
2af4:01ba  add [bx+si],al
2af4:01bc  add [bx+si],al
2af4:01be  add [bx+si],al
2af4:01c0  int 3Fh
2af4:01c2  add [bx+si],al
2af4:01c4  adc [bp+si],bl
2af4:01c6  add [bx+si],ax
2af4:01c8  and byte ptr [bp+di],7Eh
2af4:01cb  add [bp+si],cx
2af4:01cd  add [bx+si],al
2af4:01cf  add [bx+si],al
2af4:01d1  add [bx+si],al
2af4:01d3  add [bx+si],al
2af4:01d5  add [bx+si],al
2af4:01d7  add [bx+si],al
2af4:01d9  add [bx+si],al
2af4:01db  add [bx+si],al
2af4:01dd  add [bx+si],al
2af4:01df  add ch,cl
2af4:01e1  aas
2af4:01e2  xlat [bx]
2af4:01e3  adc [bx+si],ax
2af4:01e5  int 3Fh
2af4:01e7  adc ax,es:[bx+si]
2af4:01ea  int 3Fh
2af4:01ec  mov ah,12h
2af4:01ee  add ch,cl
2af4:01f0  aas
2af4:01f1  (bad)
2af4:01f5  aas
2af4:01f6  add [bx+si],al
2af4:01f8  add ch,cl
2af4:01fa  aas
2af4:01fb  or cx,[bp+si]
2af4:01fd  add ch,cl
2af4:01ff  aas
2af4:0200  cbw
2af4:0201  or [bx+si],al
2af4:0203  int 3Fh
2af4:0205  adc al,gs:[bx+si]
2af4:0208  int 3Fh
2af4:020a  lodsb [si]
2af4:020b  or [bx+si],al
2af4:020d  int 3Fh
2af4:020f  push si
2af4:0210  adc al,[bx+si]
2af4:0212  add [bx+si],al
2af4:0214  add [bx+si],al
2af4:0216  add [bx+si],al
2af4:0218  add [bx+si],al
2af4:021a  add [bx+si],al
2af4:021c  add [bx+si],al
2af4:021e  add [bx+si],al
2af4:0220  add [bx+si],al
2af4:0222  add [bx+si],al
2af4:0224  inc dx
2af4:0225  outsw dx,[si]
2af4:0226  jb short 0294h
2af4:0228  popa
2af4:0229  outsb dx,[si]
2af4:022a  and fs:[bp+di+2Bh],al
2af4:022e  sub sp,[bx+si]
2af4:0230  sub ax,4320h
2af4:0233  outsw dx,[si]
2af4:0234  jo short 02AFh
2af4:0236  jb short 02A1h
2af4:0238  push 2074h
2af4:023c  xor [bx+di],di
2af4:023e  cmp [bx+di],si
2af4:0240  and [bp+si+6Fh],al
2af4:0243  jb short 02B1h
2af4:0245  popa
2af4:0246  outsb dx,[si]
2af4:0247  and fs:[bx+di+6Eh],cl
2af4:024b  je short 02B9h
2af4:024d  add cs:[si+69h],al
2af4:0251  jbe short 02BCh
2af4:0253  and gs:[di+72h],ah
2af4:0258  jb short 02C9h
2af4:025a  jb short 0269h
2af4:025c  or al,[bx+di+62h]
2af4:025f  outsb dx,[si]
2af4:0260  outsw dx,[si]
2af4:0261  jb short 02D0h
2af4:0263  popa
2af4:0264  insb [di],dx
2af4:0265  and [bx+si+72h],dh
2af4:0268  outsw dx,[si]
2af4:0269  jb short 02CDh
2af4:026c  insw [di],dx
2af4:026d  and [si+65h],dh
2af4:0270  jb short 02DFh
2af4:0272  imul bp,[bp+61h],6974h
2af4:0277  outsw dx,[si]
2af4:0278  outsb dx,[si]
2af4:0279  or ax,0Ah
2af4:027c  add [bx+si],al
2af4:027e  add [bx+si],al
2af4:0280  add [bx+si],al
2af4:0282  add [bx+si],al
2af4:0284  add [bx+si],al
2af4:0286  add [bx+si],al
2af4:0288  add [bx+si],al
2af4:028a  add [bx+si],al
2af4:028c  add [bx+si],al
2af4:028e  add [bx+si],al
2af4:0290  add [bx+si],al
2af4:0292  add [bx+si],al
2af4:0294  add [bx+si],al
2af4:0296  add [bx+si],al
2af4:0298  add [bx+si],al
2af4:029a  add [bx+si],al
2af4:029c  add [bx+si],al
2af4:029e  add [bx+si],al
2af4:02a0  add [bx+si],al
2af4:02a2  add [bx+si],al
2af4:02a4  add [bx+si],al
2af4:02a6  add [bx+si],al
2af4:02a8  add [bx+si],al
2af4:02aa  add [bx+si],al
2af4:02ac  add [bx+si],al
2af4:02ae  add [bx+si],al
2af4:02b0  add [bx+si],al
2af4:02b2  xlat [bx]
2af4:02b3  xlat [bx]
2af4:02b4  xlat [bx]
2af4:02b5  xlat [bx]
2af4:02b6  xlat [bx]
2af4:02b7  xlat [bx]
2af4:02b8  xlat [bx]
2af4:02b9  xlat [bx]
2af4:02ba  xlat [bx]
2af4:02bb  xlat [bx]
2af4:02bc  xlat [bx]
2af4:02bd  xlat [bx]
2af4:02be  xlat [bx]
2af4:02bf  xlat [bx]
2af4:02c0  xlat [bx]
2af4:02c1  xlat [bx]
2af4:02c2  fcom st,st(7)
2af4:02c4  fcomp st,st(0)
2af4:02c6  add bl,al
2af4:02c8  fcomp st,st(0)
2af4:02ca  fdivr st,st(6)
2af4:02cc  xlat [bx]
2af4:02cd  fcomp st,st(0)
2af4:02cf  fcom st,st(7)
2af4:02d1  add bx,ax
2af4:02d3  std
2af4:02d4  fcomp st,st(0)
2af4:02d6  fdivr st,st(6)
2af4:02d8  fmul st,dword ptr [bx+si]
2af4:02da  fcomp st,st(0)
2af4:02dc  fdivr st,st(6)
2af4:02de  xlat [bx]
2af4:02df  push es
2af4:02e0  fcomp st,st(0)
2af4:02e2  cli
2af4:02e3  add bx,ax
2af4:02e5  std
2af4:02e6  fcomp st,st(0)
2af4:02e8  fcomp st,st(0)
2af4:02ea  fcomp st,st(0)
2af4:02ec  fcomp st,st(0)
2af4:02ee  fcomp st,st(0)
2af4:02f0  cli
2af4:02f1  xlat [bx]
2af4:02f2  adc al,bl
2af4:02f4  std
2af4:02f5  xlat [bx]
2af4:02f6  adc bx,ax
2af4:02f8  fcomp st,st(0)
2af4:02fa  fcomp st,st(0)
2af4:02fc  fdiv st,st(2)
2af4:02fe  fcom st,dword ptr [si]
2af4:0300  fcomp st,st(0)
2af4:0302  fdiv st,st(0)
2af4:0304  xlat [bx]
2af4:0305  adc al,0D8h
2af4:0307  in ax,dx
2af4:0308  adc al,bl
2af4:030a  fcom st,dword ptr [bp+di]
2af4:030c  fcomp st,st(0)
2af4:030e  fcomp st,st(0)
2af4:0310  in al,dx
2af4:0311  fcomp st,st(0)
2af4:0313  fcomp st,st(0)
2af4:0315  fcom st,st(7)
2af4:0317  adc al,0D8h
2af4:0319  in ax,dx
2af4:031a  xlat [bx]
2af4:031b  fcomp st,st(0)
2af4:031d  adc dx,di
2af4:031f  xlat [bx]
2af4:0320  xlat [bx]
2af4:0321  xlat [bx]
2af4:0322  xlat [bx]
2af4:0323  xlat [bx]
2af4:0324  xlat [bx]
2af4:0325  xlat [bx]
2af4:0326  xlat [bx]
2af4:0327  xlat [bx]
2af4:0328  xlat [bx]
2af4:0329  xlat [bx]
2af4:032a  xlat [bx]
2af4:032b  xlat [bx]
2af4:032c  xlat [bx]
2af4:032d  xlat [bx]
2af4:032e  fcom st,st(7)
2af4:0330  xlat [bx]
2af4:0331  xlat [bx]
2af4:0332  xlat [bx]
2af4:0333  xlat [bx]
2af4:0334  xlat [bx]
2af4:0335  xlat [bx]
2af4:0336  xlat [bx]
2af4:0337  xlat [bx]
2af4:0338  xlat [bx]
2af4:0339  xlat [bx]
2af4:033a  xlat [bx]
2af4:033b  xlat [bx]
2af4:033c  xlat [bx]
2af4:033d  xlat [bx]
2af4:033e  xlat [bx]
2af4:033f  xlat [bx]
2af4:0340  fcom st,st(7)
2af4:0342  fcomp st,st(0)
2af4:0344  fcomp st,st(0)
2af4:0346  fcomp st,st(0)
2af4:0348  fcomp st,st(0)
2af4:034a  fadd st,dword ptr [0D8D8h]
2af4:034e  cli
2af4:034f  add bx,ax
2af4:0351  std
2af4:0352  fcomp st,st(0)
2af4:0354  fcomp st,st(0)
2af4:0356  fcomp st,st(0)
2af4:0358  fcomp st,st(0)
2af4:035a  fcomp st,st(0)
2af4:035c  cli
2af4:035d  fcom st,dword ptr [bx+si]
2af4:035f  fdivr st,st(5)
2af4:0361  xlat [bx]
2af4:0362  adc di,bp
2af4:0364  fcom st,dword ptr [bp+di]
2af4:0366  fcomp st,st(0)
2af4:0368  fcomp st,st(0)
2af4:036a  fcomp st,st(0)
2af4:036c  fcomp st,st(0)
2af4:036e  fdiv st,st(0)
2af4:0370  fcomp st,st(0)
2af4:0372  fsubr st,st(5)
2af4:0374  adc al,bl
2af4:0376  fcom st,dword ptr [bp+di]
2af4:0378  xlat [bx]
2af4:0379  xlat [bx]
2af4:037a  xlat [bx]
2af4:037b  xlat [bx]
2af4:037c  xlat [bx]
2af4:037d  xlat [bx]
2af4:037e  xlat [bx]
2af4:037f  xlat [bx]
2af4:0380  xlat [bx]
2af4:0381  xlat [bx]
2af4:0382  xlat [bx]
2af4:0383  xlat [bx]
2af4:0384  xlat [bx]
2af4:0385  xlat [bx]
2af4:0386  xlat [bx]
2af4:0387  xlat [bx]
2af4:0388  fcom st,st(7)
2af4:038a  fcomp st,st(0)
2af4:038c  fcomp st,st(0)
2af4:038e  fcomp st,st(0)
2af4:0390  fcomp st,st(0)
2af4:0392  fcomp st,st(0)
2af4:0394  fcomp st,st(0)
2af4:0396  fadd st,dword ptr [bp+di]
2af4:0398  fdivr st,st(5)
2af4:039a  fcomp st,st(0)
2af4:039c  fcomp st,st(0)
2af4:039e  fcomp st,st(0)
2af4:03a0  fcomp st,st(0)
2af4:03a2  fcomp st,st(0)
2af4:03a4  fcomp st,st(0)
2af4:03a6  fcomp st,st(0)
2af4:03a8  std
2af4:03a9  fcom st,dword ptr [bp+di]
2af4:03ab  std
2af4:03ac  fcom st,dword ptr [bp+di]
2af4:03ae  fcomp st,st(0)
2af4:03b0  fcomp st,st(0)
2af4:03b2  fcomp st,st(0)
2af4:03b4  fcomp st,st(0)
2af4:03b6  fcomp st,st(0)
2af4:03b8  fcomp st,st(0)
2af4:03ba  fsubr st,st(5)
2af4:03bc  fcomp st,st(0)
2af4:03be  fcom st,dword ptr [bp+di]
2af4:03c0  fcomp st,st(0)
2af4:03c2  fcomp st,st(0)
2af4:03c4  fcomp st,st(0)
2af4:03c6  fcomp st,st(0)
2af4:03c8  fcomp st,st(0)
2af4:03ca  fcomp st,st(0)
2af4:03cc  fcomp st,st(0)
2af4:03ce  fcomp st,st(0)
2af4:03d0  fcomp st,st(0)
2af4:03d2  fcomp st,st(0)
2af4:03d4  fcomp st,st(0)
2af4:03d6  fcomp st,st(0)
2af4:03d8  fcomp st,st(0)
2af4:03da  fcomp st,st(0)
2af4:03dc  fcomp st,st(0)
2af4:03de  fcomp st,st(0)
2af4:03e0  fcomp st,st(0)
2af4:03e2  fcomp st,st(0)
2af4:03e4  fcomp st,st(0)
2af4:03e6  fcomp st,st(0)
2af4:03e8  fcomp st,st(0)
2af4:03ea  fcomp st,st(0)
2af4:03ec  fcomp st,st(0)
2af4:03ee  fcomp st,st(0)
2af4:03f0  fcomp st,st(0)
2af4:03f2  fcomp st,st(0)
2af4:03f4  fcomp st,st(0)
2af4:03f6  push ss
2af4:03f7  add [1600h],dl
2af4:03fb  add [1600h],dl
2af4:03ff  add [1600h],dl
2af4:0403  add [1600h],dl
2af4:0407  add [1600h],dl
2af4:040b  add [1600h],dl
2af4:040f  add [1600h],dl
2af4:0413  add [0],dl
2af4:0417  push ss
2af4:0418  push ss
2af4:0419  add [bx+si],al
2af4:041b  push ss
2af4:041c  add [200h],dl
2af4:0420  add [1600h],dl
2af4:0424  add [1600h],dl
2af4:0428  add dl,[400h]
2af4:042c  add [1600h],dl
2af4:0430  add [16h],dl
2af4:0434  add [bp+di],al
2af4:0436  add [1603h],dl
2af4:043a  add [1600h],dl
2af4:043e  add [1602h],dl
2af4:0442  add [800h],dl
2af4:0446  add [1600h],dl
2af4:044a  add [200h],dl
2af4:044e  push ss
2af4:044f  add [bx+si],al
2af4:0451  push es
2af4:0452  add [1600h],dl
2af4:0456  push es
2af4:0457  push ss
2af4:0458  add [bp+di],al
2af4:045a  add [3],dl
2af4:045e  add [1600h],dl
2af4:0462  add [1600h],dl
2af4:0466  add [1600h],dl
2af4:046a  add [1600h],dl
2af4:046e  add [1600h],dl
2af4:0472  push es
2af4:0473  push ss
2af4:0474  or [1000h],cl
2af4:0478  add [1603h],dl
2af4:047c  push es
2af4:047d  adc [bx+si],al
2af4:047f  adc ax,[bx+si]
2af4:0481  push ss
2af4:0482  add [1600h],dl
2af4:0486  add [1600h],dl
2af4:048a  add [160Eh],dl
2af4:048e  add [1400h],dl
2af4:0492  add [1600h],dl
2af4:0496  add [1610h],dl
2af4:049a  push ss
2af4:049b  add [bx+si],al
2af4:049d  adc al,0
2af4:049f  push ss
2af4:04a0  adc dx,[1000h]
2af4:04a4  add [1600h],dl
2af4:04a8  add [bp+di],dl
2af4:04aa  add [1600h],dl
2af4:04ae  add [1600h],dl
2af4:04b2  adc al,16h
2af4:04b4  add [1600h],dl
2af4:04b8  add [1600h],dl
2af4:04bc  add [1612h],dl
2af4:04c0  adc al,16h
2af4:04c2  add [1613h],dl
2af4:04c6  push ss
2af4:04c7  add [bx+si],al
2af4:04c9  push ss
2af4:04ca  add [1300h],dl
2af4:04ce  push ss
2af4:04cf  add [1600h],dl
2af4:04d3  add [1600h],dl
2af4:04d7  add [1600h],dl
2af4:04db  add [1600h],dl
2af4:04df  add [1600h],dl
2af4:04e3  add [1600h],dl
2af4:04e7  add [1600h],dl
2af4:04eb  add [0],dl
2af4:04ef  push ss
2af4:04f0  push ss
2af4:04f1  add [1600h],dl
2af4:04f5  add [1600h],dl
2af4:04f9  add [1600h],dl
2af4:04fd  add [1600h],dl
2af4:0501  add [1600h],dl
2af4:0505  add [1600h],dl
2af4:0509  add [1600h],dl
2af4:050d  add [1600h],dl
2af4:0511  add [bx+si],al
2af4:0513  push ss
2af4:0514  push ss
2af4:0515  add [bx+si],al
2af4:0517  push ss
2af4:0518  add [1600h],dl
2af4:051c  add [1600h],dl
2af4:0520  add [1600h],dl
2af4:0524  add [1600h],dl
2af4:0528  add [1600h],al
2af4:052c  add [1606h],dl
2af4:0530  add [bp+di],al
2af4:0532  add [1603h],dl
2af4:0536  add [1600h],dl
2af4:053a  add [1600h],dl
2af4:053e  add [1600h],dl
2af4:0542  add [1600h],dl
2af4:0546  add [1600h],dl
2af4:054a  push es
2af4:054b  push ss
2af4:054c  add [1000h],dl
2af4:0550  add [1603h],dl
2af4:0554  pop es
2af4:0555  lldt [bp+di]
2af4:0558  add dx,[1600h]
2af4:055c  add [bp+di],dl
2af4:055e  add [1600h],dl
2af4:0562  add [1600h],dl
2af4:0566  add [1600h],dl
2af4:056a  add [1600h],dl
2af4:056e  add [1610h],dl
2af4:0572  add [1600h],dl
2af4:0576  add [1613h],dl
2af4:057a  add [bx+si],dl
2af4:057c  add [1600h],dl
2af4:0580  add [bp+di],dl
2af4:0582  push ss
2af4:0583  add [1600h],dl
2af4:0587  add [1600h],dl
2af4:058b  add [1600h],dl
2af4:058f  add [1600h],dl
2af4:0593  add [1600h],dl
2af4:0597  add [1600h],dl
2af4:059b  add [1600h],dl
2af4:059f  add [0],dl
2af4:05a3  push ss
2af4:05a4  push ss
2af4:05a5  add [bx+si],al
2af4:05a7  push ss
2af4:05a8  add [1600h],dl
2af4:05ac  add [1600h],dl
2af4:05b0  add [1600h],dl
2af4:05b4  add [1600h],dl
2af4:05b8  add [1600h],dl
2af4:05bc  add [1600h],dl
2af4:05c0  add [bp+di],al
2af4:05c2  add [1603h],dl
2af4:05c6  add [1600h],dl
2af4:05ca  add [1600h],dl
2af4:05ce  add [1600h],dl
2af4:05d2  add [1600h],dl
2af4:05d6  add [1600h],dl
2af4:05da  add [1600h],dl
2af4:05de  add [1600h],dl
2af4:05e2  add dx,[1600h]
2af4:05e6  add [bp+di],dl
2af4:05e8  add dx,[1600h]
2af4:05ec  add [bp+di],dl
2af4:05ee  add [1600h],dl
2af4:05f2  add [1600h],dl
2af4:05f6  add [1600h],dl
2af4:05fa  add [1600h],dl
2af4:05fe  add [1600h],dl
2af4:0602  add [1600h],dl
2af4:0606  add [1613h],dl
2af4:060a  add [1600h],dl
2af4:060e  add [1300h],dl
2af4:0612  add [1600h],dl
2af4:0616  add [1600h],dl
2af4:061a  add [1600h],dl
2af4:061e  add [1600h],dl
2af4:0622  add [1600h],dl
2af4:0626  add [1600h],dl
2af4:062a  add [1600h],dl
2af4:062e  add [1600h],dl
2af4:0632  add [1600h],dl
2af4:0636  add [1600h],dl
2af4:063a  add [1600h],dl
2af4:063e  add [1600h],dl
2af4:0642  add [1600h],dl
2af4:0646  add [1600h],dl
2af4:064a  add [1600h],dl
2af4:064e  add [1600h],dl
2af4:0652  add [1600h],dl
2af4:0656  add [1600h],dl
2af4:065a  add [1600h],dl
2af4:065e  add [1600h],dl
2af4:0662  add [1600h],dl
2af4:0666  add [1600h],dl
2af4:066a  add [1600h],dl
2af4:066e  add [1600h],dl
2af4:0672  add [1600h],dl
2af4:0676  add [1600h],dl
2af4:067a  add [1600h],dl
2af4:067e  push ds
2af4:067f  sbb [bx+si],dl
2af4:0681  add [bp+di],bh
2af4:0683  inc di
2af4:0684  push si
2af4:0685  js short 0686h
2af4:0687  (bad)
2af4:0689  (bad)
2af4:068b  (bad)
2af4:068d  (bad)
2af4:068f  add di,di
2af4:0691  (bad)
2af4:0693  or di,di
2af4:0695  or cx,[si]
2af4:0697  or ax,0FFFFh
2af4:069a  add ax,[bp+di]
2af4:069c  add al,[bp+si]
2af4:069e  add al,[bp+si]
2af4:06a0  add [bx+di],ax
2af4:06a2  add [bx+di],ax
2af4:06a4  add [bx+si],al
2af4:06a6  (bad)
2af4:06a8  and ax,3100h
2af4:06ab  add [bx+si],bh
2af4:06ad  add [bx+si],al
2af4:06af  add dh,bh
2af4:06b1  inc word ptr [bx+di]
2af4:06b3  add bh,bh
2af4:06b5  inc word ptr [bp+si]
2af4:06b7  add [bx+si],al
2af4:06b9  add [bx+di],al
2af4:06bb  add bh,bh
2af4:06bd  jmp far dword ptr [di-28FAh]
2af4:06c1  or dh,ch
2af4:06c3  push es
2af4:06c4  xlat [bx]
2af4:06c5  or [bx],ch
2af4:06c7  pop es
2af4:06c8  xlat [bx]
2af4:06c9  or [bx+si+7],dh
2af4:06cc  xlat [bx]
2af4:06cd  or [bp+si],al
2af4:06cf  add [bx+si],ax
2af4:06d1  add al,0FEh
2af4:06d3  add [bp+di],ax
2af4:06d5  add ax,[si]
2af4:06d7  inc byte ptr [bx+di]
2af4:06d9  add [bp+di],ax
2af4:06db  add al,0FEh
2af4:06dd  inc byte ptr [bx+di]
2af4:06df  add ax,[si]
2af4:06e1  cld
2af4:06e2  std
2af4:06e3  inc word ptr [bp+si]
2af4:06e5  add bh,ah
2af4:06e7  std
2af4:06e8  (bad)
2af4:06ea  add bh,ah
2af4:06ec  std
2af4:06ed  std
2af4:06ee  inc word ptr [bp+si]
2af4:06f0  cld
2af4:06f1  add al,0FEh
2af4:06f3  add [bp+di],ax
2af4:06f5  add ax,[si]
2af4:06f7  inc byte ptr [bx+di]
2af4:06f9  add [bp+di],ax
2af4:06fb  add al,0FEh
2af4:06fd  inc byte ptr [bx+di]
2af4:06ff  add ax,[si]
2af4:0701  add al,0FDh
2af4:0703  add [bp+si],ax
2af4:0705  add al,[si]
2af4:0707  std
2af4:0708  add [bx+di],ax
2af4:070a  add al,[si]
2af4:070c  std
2af4:070d  std
2af4:070e  add [bp+si],ax
2af4:0710  add al,0
2af4:0712  add [bp+si],ax
2af4:0714  add ax,[si]
2af4:0716  add al,[bx+si]
2af4:0718  add ax,[bx+di]
2af4:071a  add al,2
2af4:071c  add ax,[bx+si]
2af4:071e  add [si],ax
2af4:0720  add [bp+di],ax
2af4:0722  add [bp+si],al
2af4:0724  add al,14h
2af4:0726  or al,4
2af4:0728  add al,2
2af4:072a  add [bx+si],al
2af4:072c  add [bx+si],al
2af4:072e  add [bx+si],al
2af4:0730  add [bx+si],al
2af4:0732  add [si-6Ch],al
2af4:0735  push ss
2af4:0736  sub bp,[bp+di]
2af4:0738  fist word ptr [442Bh],st
2af4:073c  xchg sp,ax
2af4:073d  push ss
2af4:073e  sub bp,[bp+di]
2af4:0740  fist word ptr [442Bh],st
2af4:0744  xchg sp,ax
2af4:0745  push ss
2af4:0746  sub ax,[bx+si]
2af4:0748  add [bx+si],al
2af4:074a  add [si-6Ch],al
2af4:074d  push ss
2af4:074e  sub cx,[bp+si-21h]
2af4:0751  push ss
2af4:0752  sub ax,[si-6Ch]
2af4:0755  push ss
2af4:0756  sub cx,[bp+si-21h]
2af4:0759  push ss
2af4:075a  sub ax,[bx+si]
2af4:075c  add [bx+si],al
2af4:075e  add [bx+si],al
2af4:0760  add [bx+si],al
2af4:0762  add [si-6Ch],al
2af4:0765  push ss
2af4:0766  sub bp,[bp+di]
2af4:0768  fist word ptr [442Bh],st
2af4:076c  xchg sp,ax
2af4:076d  push ss
2af4:076e  sub bp,[bp+di]
2af4:0770  fist word ptr [442Bh],st
2af4:0774  xchg sp,ax
2af4:0775  push ss
2af4:0776  sub ax,[bx+si]
2af4:0778  add [bx+si],al
2af4:077a  add [si-6Ch],al
2af4:077d  push ss
2af4:077e  sub cx,[bp+si-21h]
2af4:0781  push ss
2af4:0782  sub ax,[si-6Ch]
2af4:0785  push ss
2af4:0786  sub cx,[bp+si-21h]
2af4:0789  push ss
2af4:078a  sub ax,[si-6Ch]
2af4:078d  push ss
2af4:078e  sub bp,[bp+di]
2af4:0790  fist word ptr [442Bh],st
2af4:0794  xchg sp,ax
2af4:0795  push ss
2af4:0796  sub ax,[bx+si]
2af4:0798  add [bx+si],al
2af4:079a  add [si-6Ch],al
2af4:079d  push ss
2af4:079e  sub cx,[bp+si-21h]
2af4:07a1  push ss
2af4:07a2  sub ax,[bx+si]
2af4:07a4  add [bx+si],al
2af4:07a6  add [bp+di],ch
2af4:07a8  fist word ptr [442Bh],st
2af4:07ac  xchg sp,ax
2af4:07ad  push ss
2af4:07ae  sub ax,[bx+si]
2af4:07b0  add [bx+si],al
2af4:07b2  add [bx+si],al
2af4:07b4  add [bx+si],al
2af4:07b6  add [bp+si-21h],cl
2af4:07b9  push ss
2af4:07ba  sub ax,[bx+di]
2af4:07bc  add [si],ax
2af4:07be  or al,[si]
2af4:07c0  or [si],al
2af4:07c2  add [si],ax
2af4:07c4  clc
2af4:07c5  add al,0F6h
2af4:07c7  add [bx+si],al
2af4:07c9  add cx,[bx+di]
2af4:07cb  add ax,[bx]
2af4:07cd  add ax,[bx+di]
2af4:07cf  add di,cx
2af4:07d1  add si,di
2af4:07d3  add al,[102h]
2af4:07d7  add bh,dl
2af4:07d9  add [di],ax
2af4:07db  add [bx+di],ax
2af4:07dd  add bx,di
2af4:07df  jo short 07E0h
2af4:07e1  mov al,[0D0FFh]
2af4:07e4  inc word ptr [bx+si]
2af4:07e6  add [bx+si],dh
2af4:07e8  add [bx+si],ah
2af4:07eb  nop
2af4:07ec  add [bx+si-1],ah
2af4:07ef  mov al,0FFh
2af4:07f1  add [bx+si],al
2af4:07f3  push ax
2af4:07f4  add [bx+si-8000h],ah
2af4:07f8  inc word ptr [bx+si]
2af4:07fa  add [bx+si],al
2af4:07fe  add [bx+si],al
2af4:0800  add [bx+si],al
2af4:0802  add [bp+di],bh
2af4:0804  inc di
2af4:0805  push si
2af4:0806  add [bx],bl
2af4:0808  sbb [bx],cl
2af4:080a  add [bx+si],al
2af4:080c  add [bx+si],al
2af4:080e  add ax,[bp+di]
2af4:0810  add ax,[bp+di]
2af4:0812  add cx,[bx+si]
2af4:0814  or [bx+si],cl
2af4:0816  or [bx+si],cl
2af4:0818  or ax,0D0Dh
2af4:081b  or ax,120Dh
2af4:081e  adc dl,[bp+si]
2af4:0820  adc dl,[bp+si]
2af4:0822  add [bx+si],al
2af4:0824  add [bx+si],al
2af4:0826  add [bx+si],al
2af4:0828  add [bx+si],al
2af4:082a  add [bx+si],al
2af4:082c  add [bx+si],al
2af4:082e  add [bx+si],al
2af4:0830  add [bx+si],al
2af4:0832  add [bx+si],al
2af4:0834  add [bx+si],al
2af4:0836  add [bx+si],al
2af4:0838  add [bx+si],al
2af4:083a  add [bx+si],al
2af4:083c  add [bx+si],al
2af4:083e  xor si,[si]
2af4:0840  add [bx+si],al
2af4:0842  add [bx+si],al
2af4:0844  add [bx+si],al
2af4:0846  add [bx+si],al
2af4:0848  add [bx+si],al
2af4:084a  add [bx+si],al
2af4:084c  add [bx+di],al
2af4:084e  add [bx+di],ax
2af4:0850  add [bx+di],ax
2af4:0852  add [bx+di],ax
2af4:0854  add [bx+di],ax
2af4:0856  add [bx+si],ax
2af4:0858  add [bx+si],al
2af4:085a  add [bx+si],al
2af4:085c  add [bx+si],al
2af4:085e  add [bx+si],al
2af4:0860  add [bx+si],al
2af4:0862  add [bx+si],al
2af4:0864  add [bx+si],al
2af4:0866  add [bx+si],al
2af4:0868  add [bx+si],al
2af4:086a  add [bx+si],al
2af4:086c  add [bx+si],al
2af4:086e  add [bx+si],al
2af4:0870  add [bx+si],al
2af4:0872  add [bx+si],al
2af4:0874  add [bx+si],cx
2af4:0876  or al,12h
2af4:0878  add [bx+si],al
2af4:087a  add al,[si]
2af4:087c  add [di],al
2af4:087e  or [si],cl
2af4:0880  add [di],al
2af4:0882  add ax,[bx+di]
2af4:0884  add ax,103h
2af4:0887  (bad)
2af4:0889  (bad)
2af4:088b  (bad)
2af4:088d  inc word ptr [bp+di]
2af4:088f  (bad)
2af4:0891  add ax,[bp+di]
2af4:0893  (bad)
2af4:0895  add ax,[bp+di]
2af4:0897  (bad)
2af4:0899  add ax,[bp+di]
2af4:089b  (bad)
2af4:089d  add di,di
2af4:089f  (bad)
2af4:08a1  (bad)
2af4:08a3  (bad)
2af4:08a5  (bad)
2af4:08a7  add al,[bp+si]
2af4:08a9  add al,[bp+si]
2af4:08ab  add al,[bp+si]
2af4:08ad  add al,[bp+si]
2af4:08af  add al,[bp+si]
2af4:08b1  add al,[bp+si]
2af4:08b3  (bad)
2af4:08b5  (bad)
2af4:08b7  inc word ptr [bx+di]
2af4:08b9  inc word ptr [bx+di]
2af4:08bb  add [bx+di],ax
2af4:08bd  add [bx+di],ax
2af4:08bf  add di,di
2af4:08c1  add di,di
2af4:08c3  (bad)
2af4:08c5  (bad)
2af4:08c7  add [bx+si],al
2af4:08c9  (bad)
2af4:08cb  (bad)
2af4:08cd  (bad)
2af4:08cf  add [bx+di],al
2af4:08d1  add al,[bp+di]
2af4:08d3  add al,2
2af4:08d5  add [bp+di],al
2af4:08d7  add [si],ax
2af4:08d9  add al,[bp+di]
2af4:08db  add [bx+di],al
2af4:08dd  add al,1
2af4:08df  add ax,[bx+si]
2af4:08e1  add al,[si]
2af4:08e3  add [bx+di],al
2af4:08e5  add [bx+di],al
2af4:08e7  add [bx+si],al
2af4:08e9  add [bx+di],ax
2af4:08eb  add [bx+si],ax
2af4:08ed  add [bx+si],ax
2af4:08ef  add [bx+di],ax
2af4:08f1  add [bx+si],al
2af4:08f3  sub [si],bl
2af4:08f5  adc cl,[di]
2af4:08f7  adc ax,0CC1Ah
2af4:08fa  push sp
2af4:08fc  call far dword ptr [si]
2af4:08fe  add [si],al
2af4:0901  insb [di],dx
2af4:0902  add [si-4400h],dl
2af4:0906  add [bx+si-701h],bh
2af4:090a  (bad)
2af4:090c  add [bx+si],bh
2af4:090f  mov ax,0C800h
2af4:0912  jmp far dword ptr [bx+si]
2af4:0914  add [bx+si],cl
2af4:0918  add [bx+si],al
2af4:091a  add [bx+si],al
2af4:091c  add [bp+si],al
2af4:091e  push es
2af4:091f  or [bx+di],ax
2af4:0921  add al,[bp+di]
2af4:0923  and [bx+si],bl
2af4:0925  adc [si],al
2af4:0927  add al,[bx+si]
2af4:0929  lodsw [si]
2af4:092a  push es
2af4:092b  xlat [bx]
2af4:092c  or dh,ch
2af4:092e  push es
2af4:092f  xlat [bx]
2af4:0930  or [bx+si],al
2af4:0932  push es
2af4:0933  add [di],ax
2af4:0935  add al,[si]
2af4:0937  add ax,[bx]
2af4:0939  or cx,[bx+si]
2af4:093b  or cl,[bx+di]
2af4:093d  or al,0Eh
2af4:093f  or ax,110Fh
2af4:0942  adc [bp+si],dh

; Candidate 2b10:0025, file offset 0x2e325
2b10:0025  int 3Fh
2b10:0027  adc ax,es:[bx+si]
2b10:002a  int 3Fh
2b10:002c  mov ah,12h
2b10:002e  add ch,cl
2b10:0030  aas
2b10:0031  (bad)
2b10:0035  aas
2b10:0036  add [bx+si],al
2b10:0038  add ch,cl
2b10:003a  aas
2b10:003b  or cx,[bp+si]
2b10:003d  add ch,cl
2b10:003f  aas
2b10:0040  cbw
2b10:0041  or [bx+si],al
2b10:0043  int 3Fh
2b10:0045  adc al,gs:[bx+si]
2b10:0048  int 3Fh
2b10:004a  lodsb [si]
2b10:004b  or [bx+si],al
2b10:004d  int 3Fh
2b10:004f  push si
2b10:0050  adc al,[bx+si]
2b10:0052  add [bx+si],al
2b10:0054  add [bx+si],al
2b10:0056  add [bx+si],al
2b10:0058  add [bx+si],al
2b10:005a  add [bx+si],al
2b10:005c  add [bx+si],al
2b10:005e  add [bx+si],al
2b10:0060  add [bx+si],al
2b10:0062  add [bx+si],al
2b10:0064  inc dx
2b10:0065  outsw dx,[si]
2b10:0066  jb short 00D4h
2b10:0068  popa
2b10:0069  outsb dx,[si]
2b10:006a  and fs:[bp+di+2Bh],al
2b10:006e  sub sp,[bx+si]
2b10:0070  sub ax,4320h
2b10:0073  outsw dx,[si]
2b10:0074  jo short 00EFh
2b10:0076  jb short 00E1h
2b10:0078  push 2074h
2b10:007c  xor [bx+di],di
2b10:007e  cmp [bx+di],si
2b10:0080  and [bp+si+6Fh],al
2b10:0083  jb short 00F1h
2b10:0085  popa
2b10:0086  outsb dx,[si]
2b10:0087  and fs:[bx+di+6Eh],cl
2b10:008b  je short 00F9h
2b10:008d  add cs:[si+69h],al
2b10:0091  jbe short 00FCh
2b10:0093  and gs:[di+72h],ah
2b10:0098  jb short 0109h
2b10:009a  jb short 00A9h
2b10:009c  or al,[bx+di+62h]
2b10:009f  outsb dx,[si]
2b10:00a0  outsw dx,[si]
2b10:00a1  jb short 0110h
2b10:00a3  popa
2b10:00a4  insb [di],dx
2b10:00a5  and [bx+si+72h],dh
2b10:00a8  outsw dx,[si]
2b10:00a9  jb short 010Dh
2b10:00ac  insw [di],dx
2b10:00ad  and [si+65h],dh
2b10:00b0  jb short 011Fh
2b10:00b2  imul bp,[bp+61h],6974h
2b10:00b7  outsw dx,[si]
2b10:00b8  outsb dx,[si]
2b10:00b9  or ax,0Ah
2b10:00bc  add [bx+si],al
2b10:00be  add [bx+si],al
2b10:00c0  add [bx+si],al
2b10:00c2  add [bx+si],al
2b10:00c4  add [bx+si],al
2b10:00c6  add [bx+si],al
2b10:00c8  add [bx+si],al
2b10:00ca  add [bx+si],al
2b10:00cc  add [bx+si],al
2b10:00ce  add [bx+si],al
2b10:00d0  add [bx+si],al
2b10:00d2  add [bx+si],al
2b10:00d4  add [bx+si],al
2b10:00d6  add [bx+si],al
2b10:00d8  add [bx+si],al
2b10:00da  add [bx+si],al
2b10:00dc  add [bx+si],al
2b10:00de  add [bx+si],al
2b10:00e0  add [bx+si],al
2b10:00e2  add [bx+si],al
2b10:00e4  add [bx+si],al
2b10:00e6  add [bx+si],al
2b10:00e8  add [bx+si],al
2b10:00ea  add [bx+si],al
2b10:00ec  add [bx+si],al
2b10:00ee  add [bx+si],al
2b10:00f0  add [bx+si],al
2b10:00f2  xlat [bx]
2b10:00f3  xlat [bx]
2b10:00f4  xlat [bx]
2b10:00f5  xlat [bx]
2b10:00f6  xlat [bx]
2b10:00f7  xlat [bx]
2b10:00f8  xlat [bx]
2b10:00f9  xlat [bx]
2b10:00fa  xlat [bx]
2b10:00fb  xlat [bx]
2b10:00fc  xlat [bx]
2b10:00fd  xlat [bx]
2b10:00fe  xlat [bx]
2b10:00ff  xlat [bx]
2b10:0100  xlat [bx]
2b10:0101  xlat [bx]
2b10:0102  fcom st,st(7)
2b10:0104  fcomp st,st(0)
2b10:0106  add bl,al
2b10:0108  fcomp st,st(0)
2b10:010a  fdivr st,st(6)
2b10:010c  xlat [bx]
2b10:010d  fcomp st,st(0)
2b10:010f  fcom st,st(7)
2b10:0111  add bx,ax
2b10:0113  std
2b10:0114  fcomp st,st(0)
2b10:0116  fdivr st,st(6)
2b10:0118  fmul st,dword ptr [bx+si]
2b10:011a  fcomp st,st(0)
2b10:011c  fdivr st,st(6)
2b10:011e  xlat [bx]
2b10:011f  push es
2b10:0120  fcomp st,st(0)
2b10:0122  cli
2b10:0123  add bx,ax
2b10:0125  std
2b10:0126  fcomp st,st(0)
2b10:0128  fcomp st,st(0)
2b10:012a  fcomp st,st(0)
2b10:012c  fcomp st,st(0)
2b10:012e  fcomp st,st(0)
2b10:0130  cli
2b10:0131  xlat [bx]
2b10:0132  adc al,bl
2b10:0134  std
2b10:0135  xlat [bx]
2b10:0136  adc bx,ax
2b10:0138  fcomp st,st(0)
2b10:013a  fcomp st,st(0)
2b10:013c  fdiv st,st(2)
2b10:013e  fcom st,dword ptr [si]
2b10:0140  fcomp st,st(0)
2b10:0142  fdiv st,st(0)
2b10:0144  xlat [bx]
2b10:0145  adc al,0D8h
2b10:0147  in ax,dx
2b10:0148  adc al,bl
2b10:014a  fcom st,dword ptr [bp+di]
2b10:014c  fcomp st,st(0)
2b10:014e  fcomp st,st(0)
2b10:0150  in al,dx
2b10:0151  fcomp st,st(0)
2b10:0153  fcomp st,st(0)
2b10:0155  fcom st,st(7)
2b10:0157  adc al,0D8h
2b10:0159  in ax,dx
2b10:015a  xlat [bx]
2b10:015b  fcomp st,st(0)
2b10:015d  adc dx,di
2b10:015f  xlat [bx]
2b10:0160  xlat [bx]
2b10:0161  xlat [bx]
2b10:0162  xlat [bx]
2b10:0163  xlat [bx]
2b10:0164  xlat [bx]
2b10:0165  xlat [bx]
2b10:0166  xlat [bx]
2b10:0167  xlat [bx]
2b10:0168  xlat [bx]
2b10:0169  xlat [bx]
2b10:016a  xlat [bx]
2b10:016b  xlat [bx]
2b10:016c  xlat [bx]
2b10:016d  xlat [bx]
2b10:016e  fcom st,st(7)
2b10:0170  xlat [bx]
2b10:0171  xlat [bx]
2b10:0172  xlat [bx]
2b10:0173  xlat [bx]
2b10:0174  xlat [bx]
2b10:0175  xlat [bx]
2b10:0176  xlat [bx]
2b10:0177  xlat [bx]
2b10:0178  xlat [bx]
2b10:0179  xlat [bx]
2b10:017a  xlat [bx]
2b10:017b  xlat [bx]
2b10:017c  xlat [bx]
2b10:017d  xlat [bx]
2b10:017e  xlat [bx]
2b10:017f  xlat [bx]
2b10:0180  fcom st,st(7)
2b10:0182  fcomp st,st(0)
2b10:0184  fcomp st,st(0)
2b10:0186  fcomp st,st(0)
2b10:0188  fcomp st,st(0)
2b10:018a  fadd st,dword ptr [0D8D8h]
2b10:018e  cli
2b10:018f  add bx,ax
2b10:0191  std
2b10:0192  fcomp st,st(0)
2b10:0194  fcomp st,st(0)
2b10:0196  fcomp st,st(0)
2b10:0198  fcomp st,st(0)
2b10:019a  fcomp st,st(0)
2b10:019c  cli
2b10:019d  fcom st,dword ptr [bx+si]
2b10:019f  fdivr st,st(5)
2b10:01a1  xlat [bx]
2b10:01a2  adc di,bp
2b10:01a4  fcom st,dword ptr [bp+di]
2b10:01a6  fcomp st,st(0)
2b10:01a8  fcomp st,st(0)
2b10:01aa  fcomp st,st(0)
2b10:01ac  fcomp st,st(0)
2b10:01ae  fdiv st,st(0)
2b10:01b0  fcomp st,st(0)
2b10:01b2  fsubr st,st(5)
2b10:01b4  adc al,bl
2b10:01b6  fcom st,dword ptr [bp+di]
2b10:01b8  xlat [bx]
2b10:01b9  xlat [bx]
2b10:01ba  xlat [bx]
2b10:01bb  xlat [bx]
2b10:01bc  xlat [bx]
2b10:01bd  xlat [bx]
2b10:01be  xlat [bx]
2b10:01bf  xlat [bx]
2b10:01c0  xlat [bx]
2b10:01c1  xlat [bx]
2b10:01c2  xlat [bx]
2b10:01c3  xlat [bx]
2b10:01c4  xlat [bx]
2b10:01c5  xlat [bx]
2b10:01c6  xlat [bx]
2b10:01c7  xlat [bx]
2b10:01c8  fcom st,st(7)
2b10:01ca  fcomp st,st(0)
2b10:01cc  fcomp st,st(0)
2b10:01ce  fcomp st,st(0)
2b10:01d0  fcomp st,st(0)
2b10:01d2  fcomp st,st(0)
2b10:01d4  fcomp st,st(0)
2b10:01d6  fadd st,dword ptr [bp+di]
2b10:01d8  fdivr st,st(5)
2b10:01da  fcomp st,st(0)
2b10:01dc  fcomp st,st(0)
2b10:01de  fcomp st,st(0)
2b10:01e0  fcomp st,st(0)
2b10:01e2  fcomp st,st(0)
2b10:01e4  fcomp st,st(0)
2b10:01e6  fcomp st,st(0)
2b10:01e8  std
2b10:01e9  fcom st,dword ptr [bp+di]
2b10:01eb  std
2b10:01ec  fcom st,dword ptr [bp+di]
2b10:01ee  fcomp st,st(0)
2b10:01f0  fcomp st,st(0)
2b10:01f2  fcomp st,st(0)
2b10:01f4  fcomp st,st(0)
2b10:01f6  fcomp st,st(0)
2b10:01f8  fcomp st,st(0)
2b10:01fa  fsubr st,st(5)
2b10:01fc  fcomp st,st(0)
2b10:01fe  fcom st,dword ptr [bp+di]
2b10:0200  fcomp st,st(0)
2b10:0202  fcomp st,st(0)
2b10:0204  fcomp st,st(0)
2b10:0206  fcomp st,st(0)
2b10:0208  fcomp st,st(0)
2b10:020a  fcomp st,st(0)
2b10:020c  fcomp st,st(0)
2b10:020e  fcomp st,st(0)
2b10:0210  fcomp st,st(0)
2b10:0212  fcomp st,st(0)
2b10:0214  fcomp st,st(0)
2b10:0216  fcomp st,st(0)
2b10:0218  fcomp st,st(0)
2b10:021a  fcomp st,st(0)
2b10:021c  fcomp st,st(0)
2b10:021e  fcomp st,st(0)
2b10:0220  fcomp st,st(0)
2b10:0222  fcomp st,st(0)
2b10:0224  fcomp st,st(0)
2b10:0226  fcomp st,st(0)
2b10:0228  fcomp st,st(0)
2b10:022a  fcomp st,st(0)
2b10:022c  fcomp st,st(0)
2b10:022e  fcomp st,st(0)
2b10:0230  fcomp st,st(0)
2b10:0232  fcomp st,st(0)
2b10:0234  fcomp st,st(0)
2b10:0236  push ss
2b10:0237  add [1600h],dl
2b10:023b  add [1600h],dl
2b10:023f  add [1600h],dl
2b10:0243  add [1600h],dl
2b10:0247  add [1600h],dl
2b10:024b  add [1600h],dl
2b10:024f  add [1600h],dl
2b10:0253  add [0],dl
2b10:0257  push ss
2b10:0258  push ss
2b10:0259  add [bx+si],al
2b10:025b  push ss
2b10:025c  add [200h],dl
2b10:0260  add [1600h],dl
2b10:0264  add [1600h],dl
2b10:0268  add dl,[400h]
2b10:026c  add [1600h],dl
2b10:0270  add [16h],dl
2b10:0274  add [bp+di],al
2b10:0276  add [1603h],dl
2b10:027a  add [1600h],dl
2b10:027e  add [1602h],dl
2b10:0282  add [800h],dl
2b10:0286  add [1600h],dl
2b10:028a  add [200h],dl
2b10:028e  push ss
2b10:028f  add [bx+si],al
2b10:0291  push es
2b10:0292  add [1600h],dl
2b10:0296  push es
2b10:0297  push ss
2b10:0298  add [bp+di],al
2b10:029a  add [3],dl
2b10:029e  add [1600h],dl
2b10:02a2  add [1600h],dl
2b10:02a6  add [1600h],dl
2b10:02aa  add [1600h],dl
2b10:02ae  add [1600h],dl
2b10:02b2  push es
2b10:02b3  push ss
2b10:02b4  or [1000h],cl
2b10:02b8  add [1603h],dl
2b10:02bc  push es
2b10:02bd  adc [bx+si],al
2b10:02bf  adc ax,[bx+si]
2b10:02c1  push ss
2b10:02c2  add [1600h],dl
2b10:02c6  add [1600h],dl
2b10:02ca  add [160Eh],dl
2b10:02ce  add [1400h],dl
2b10:02d2  add [1600h],dl
2b10:02d6  add [1610h],dl
2b10:02da  push ss
2b10:02db  add [bx+si],al
2b10:02dd  adc al,0
2b10:02df  push ss
2b10:02e0  adc dx,[1000h]
2b10:02e4  add [1600h],dl
2b10:02e8  add [bp+di],dl
2b10:02ea  add [1600h],dl
2b10:02ee  add [1600h],dl
2b10:02f2  adc al,16h
2b10:02f4  add [1600h],dl
2b10:02f8  add [1600h],dl
2b10:02fc  add [1612h],dl
2b10:0300  adc al,16h
2b10:0302  add [1613h],dl
2b10:0306  push ss
2b10:0307  add [bx+si],al
2b10:0309  push ss
2b10:030a  add [1300h],dl
2b10:030e  push ss
2b10:030f  add [1600h],dl
2b10:0313  add [1600h],dl
2b10:0317  add [1600h],dl
2b10:031b  add [1600h],dl
2b10:031f  add [1600h],dl
2b10:0323  add [1600h],dl
2b10:0327  add [1600h],dl
2b10:032b  add [0],dl
2b10:032f  push ss
2b10:0330  push ss
2b10:0331  add [1600h],dl
2b10:0335  add [1600h],dl
2b10:0339  add [1600h],dl
2b10:033d  add [1600h],dl
2b10:0341  add [1600h],dl
2b10:0345  add [1600h],dl
2b10:0349  add [1600h],dl
2b10:034d  add [1600h],dl
2b10:0351  add [bx+si],al
2b10:0353  push ss
2b10:0354  push ss
2b10:0355  add [bx+si],al
2b10:0357  push ss
2b10:0358  add [1600h],dl
2b10:035c  add [1600h],dl
2b10:0360  add [1600h],dl
2b10:0364  add [1600h],dl
2b10:0368  add [1600h],al
2b10:036c  add [1606h],dl
2b10:0370  add [bp+di],al
2b10:0372  add [1603h],dl
2b10:0376  add [1600h],dl
2b10:037a  add [1600h],dl
2b10:037e  add [1600h],dl
2b10:0382  add [1600h],dl
2b10:0386  add [1600h],dl
2b10:038a  push es
2b10:038b  push ss
2b10:038c  add [1000h],dl
2b10:0390  add [1603h],dl
2b10:0394  pop es
2b10:0395  lldt [bp+di]
2b10:0398  add dx,[1600h]
2b10:039c  add [bp+di],dl
2b10:039e  add [1600h],dl
2b10:03a2  add [1600h],dl
2b10:03a6  add [1600h],dl
2b10:03aa  add [1600h],dl
2b10:03ae  add [1610h],dl
2b10:03b2  add [1600h],dl
2b10:03b6  add [1613h],dl
2b10:03ba  add [bx+si],dl
2b10:03bc  add [1600h],dl
2b10:03c0  add [bp+di],dl
2b10:03c2  push ss
2b10:03c3  add [1600h],dl
2b10:03c7  add [1600h],dl
2b10:03cb  add [1600h],dl
2b10:03cf  add [1600h],dl
2b10:03d3  add [1600h],dl
2b10:03d7  add [1600h],dl
2b10:03db  add [1600h],dl
2b10:03df  add [0],dl
2b10:03e3  push ss
2b10:03e4  push ss
2b10:03e5  add [bx+si],al
2b10:03e7  push ss
2b10:03e8  add [1600h],dl
2b10:03ec  add [1600h],dl
2b10:03f0  add [1600h],dl
2b10:03f4  add [1600h],dl
2b10:03f8  add [1600h],dl
2b10:03fc  add [1600h],dl
2b10:0400  add [bp+di],al
2b10:0402  add [1603h],dl
2b10:0406  add [1600h],dl
2b10:040a  add [1600h],dl
2b10:040e  add [1600h],dl
2b10:0412  add [1600h],dl
2b10:0416  add [1600h],dl
2b10:041a  add [1600h],dl
2b10:041e  add [1600h],dl
2b10:0422  add dx,[1600h]
2b10:0426  add [bp+di],dl
2b10:0428  add dx,[1600h]
2b10:042c  add [bp+di],dl
2b10:042e  add [1600h],dl
2b10:0432  add [1600h],dl
2b10:0436  add [1600h],dl
2b10:043a  add [1600h],dl
2b10:043e  add [1600h],dl
2b10:0442  add [1600h],dl
2b10:0446  add [1613h],dl
2b10:044a  add [1600h],dl
2b10:044e  add [1300h],dl
2b10:0452  add [1600h],dl
2b10:0456  add [1600h],dl
2b10:045a  add [1600h],dl
2b10:045e  add [1600h],dl
2b10:0462  add [1600h],dl
2b10:0466  add [1600h],dl
2b10:046a  add [1600h],dl
2b10:046e  add [1600h],dl
2b10:0472  add [1600h],dl
2b10:0476  add [1600h],dl
2b10:047a  add [1600h],dl
2b10:047e  add [1600h],dl
2b10:0482  add [1600h],dl
2b10:0486  add [1600h],dl
2b10:048a  add [1600h],dl
2b10:048e  add [1600h],dl
2b10:0492  add [1600h],dl
2b10:0496  add [1600h],dl
2b10:049a  add [1600h],dl
2b10:049e  add [1600h],dl
2b10:04a2  add [1600h],dl
2b10:04a6  add [1600h],dl
2b10:04aa  add [1600h],dl
2b10:04ae  add [1600h],dl
2b10:04b2  add [1600h],dl
2b10:04b6  add [1600h],dl
2b10:04ba  add [1600h],dl
2b10:04be  push ds
2b10:04bf  sbb [bx+si],dl
2b10:04c1  add [bp+di],bh
2b10:04c3  inc di
2b10:04c4  push si
2b10:04c5  js short 04C6h
2b10:04c7  (bad)
2b10:04c9  (bad)
2b10:04cb  (bad)
2b10:04cd  (bad)
2b10:04cf  add di,di
2b10:04d1  (bad)
2b10:04d3  or di,di
2b10:04d5  or cx,[si]
2b10:04d7  or ax,0FFFFh
2b10:04da  add ax,[bp+di]
2b10:04dc  add al,[bp+si]
2b10:04de  add al,[bp+si]
2b10:04e0  add [bx+di],ax
2b10:04e2  add [bx+di],ax
2b10:04e4  add [bx+si],al
2b10:04e6  (bad)
2b10:04e8  and ax,3100h
2b10:04eb  add [bx+si],bh
2b10:04ed  add [bx+si],al
2b10:04ef  add dh,bh
2b10:04f1  inc word ptr [bx+di]
2b10:04f3  add bh,bh
2b10:04f5  inc word ptr [bp+si]
2b10:04f7  add [bx+si],al
2b10:04f9  add [bx+di],al
2b10:04fb  add bh,bh
2b10:04fd  jmp far dword ptr [di-28FAh]
2b10:0501  or dh,ch
2b10:0503  push es
2b10:0504  xlat [bx]
2b10:0505  or [bx],ch
2b10:0507  pop es
2b10:0508  xlat [bx]
2b10:0509  or [bx+si+7],dh
2b10:050c  xlat [bx]
2b10:050d  or [bp+si],al
2b10:050f  add [bx+si],ax
2b10:0511  add al,0FEh
2b10:0513  add [bp+di],ax
2b10:0515  add ax,[si]
2b10:0517  inc byte ptr [bx+di]
2b10:0519  add [bp+di],ax
2b10:051b  add al,0FEh
2b10:051d  inc byte ptr [bx+di]
2b10:051f  add ax,[si]
2b10:0521  cld
2b10:0522  std
2b10:0523  inc word ptr [bp+si]
2b10:0525  add bh,ah
2b10:0527  std
2b10:0528  (bad)
2b10:052a  add bh,ah
2b10:052c  std
2b10:052d  std
2b10:052e  inc word ptr [bp+si]
2b10:0530  cld
2b10:0531  add al,0FEh
2b10:0533  add [bp+di],ax
2b10:0535  add ax,[si]
2b10:0537  inc byte ptr [bx+di]
2b10:0539  add [bp+di],ax
2b10:053b  add al,0FEh
2b10:053d  inc byte ptr [bx+di]
2b10:053f  add ax,[si]
2b10:0541  add al,0FDh
2b10:0543  add [bp+si],ax
2b10:0545  add al,[si]
2b10:0547  std
2b10:0548  add [bx+di],ax
2b10:054a  add al,[si]
2b10:054c  std
2b10:054d  std
2b10:054e  add [bp+si],ax
2b10:0550  add al,0
2b10:0552  add [bp+si],ax
2b10:0554  add ax,[si]
2b10:0556  add al,[bx+si]
2b10:0558  add ax,[bx+di]
2b10:055a  add al,2
2b10:055c  add ax,[bx+si]
2b10:055e  add [si],ax
2b10:0560  add [bp+di],ax
2b10:0562  add [bp+si],al
2b10:0564  add al,14h
2b10:0566  or al,4
2b10:0568  add al,2
2b10:056a  add [bx+si],al
2b10:056c  add [bx+si],al
2b10:056e  add [bx+si],al
2b10:0570  add [bx+si],al
2b10:0572  add [si-6Ch],al
2b10:0575  push ss
2b10:0576  sub bp,[bp+di]
2b10:0578  fist word ptr [442Bh],st
2b10:057c  xchg sp,ax
2b10:057d  push ss
2b10:057e  sub bp,[bp+di]
2b10:0580  fist word ptr [442Bh],st
2b10:0584  xchg sp,ax
2b10:0585  push ss
2b10:0586  sub ax,[bx+si]
2b10:0588  add [bx+si],al
2b10:058a  add [si-6Ch],al
2b10:058d  push ss
2b10:058e  sub cx,[bp+si-21h]
2b10:0591  push ss
2b10:0592  sub ax,[si-6Ch]
2b10:0595  push ss
2b10:0596  sub cx,[bp+si-21h]
2b10:0599  push ss
2b10:059a  sub ax,[bx+si]
2b10:059c  add [bx+si],al
2b10:059e  add [bx+si],al
2b10:05a0  add [bx+si],al
2b10:05a2  add [si-6Ch],al
2b10:05a5  push ss
2b10:05a6  sub bp,[bp+di]
2b10:05a8  fist word ptr [442Bh],st
2b10:05ac  xchg sp,ax
2b10:05ad  push ss
2b10:05ae  sub bp,[bp+di]
2b10:05b0  fist word ptr [442Bh],st
2b10:05b4  xchg sp,ax
2b10:05b5  push ss
2b10:05b6  sub ax,[bx+si]
2b10:05b8  add [bx+si],al
2b10:05ba  add [si-6Ch],al
2b10:05bd  push ss
2b10:05be  sub cx,[bp+si-21h]
2b10:05c1  push ss
2b10:05c2  sub ax,[si-6Ch]
2b10:05c5  push ss
2b10:05c6  sub cx,[bp+si-21h]
2b10:05c9  push ss
2b10:05ca  sub ax,[si-6Ch]
2b10:05cd  push ss
2b10:05ce  sub bp,[bp+di]
2b10:05d0  fist word ptr [442Bh],st
2b10:05d4  xchg sp,ax
2b10:05d5  push ss
2b10:05d6  sub ax,[bx+si]
2b10:05d8  add [bx+si],al
2b10:05da  add [si-6Ch],al
2b10:05dd  push ss
2b10:05de  sub cx,[bp+si-21h]
2b10:05e1  push ss
2b10:05e2  sub ax,[bx+si]
2b10:05e4  add [bx+si],al
2b10:05e6  add [bp+di],ch
2b10:05e8  fist word ptr [442Bh],st
2b10:05ec  xchg sp,ax
2b10:05ed  push ss
2b10:05ee  sub ax,[bx+si]
2b10:05f0  add [bx+si],al
2b10:05f2  add [bx+si],al
2b10:05f4  add [bx+si],al
2b10:05f6  add [bp+si-21h],cl
2b10:05f9  push ss
2b10:05fa  sub ax,[bx+di]
2b10:05fc  add [si],ax
2b10:05fe  or al,[si]
2b10:0600  or [si],al
2b10:0602  add [si],ax
2b10:0604  clc
2b10:0605  add al,0F6h
2b10:0607  add [bx+si],al
2b10:0609  add cx,[bx+di]
2b10:060b  add ax,[bx]
2b10:060d  add ax,[bx+di]
2b10:060f  add di,cx
2b10:0611  add si,di
2b10:0613  add al,[102h]
2b10:0617  add bh,dl
2b10:0619  add [di],ax
2b10:061b  add [bx+di],ax
2b10:061d  add bx,di
2b10:061f  jo short 0620h
2b10:0621  mov al,[0D0FFh]
2b10:0624  inc word ptr [bx+si]
2b10:0626  add [bx+si],dh
2b10:0628  add [bx+si],ah
2b10:062b  nop
2b10:062c  add [bx+si-1],ah
2b10:062f  mov al,0FFh
2b10:0631  add [bx+si],al
2b10:0633  push ax
2b10:0634  add [bx+si-8000h],ah
2b10:0638  inc word ptr [bx+si]
2b10:063a  add [bx+si],al
2b10:063e  add [bx+si],al
2b10:0640  add [bx+si],al
2b10:0642  add [bp+di],bh
2b10:0644  inc di
2b10:0645  push si
2b10:0646  add [bx],bl
2b10:0648  sbb [bx],cl
2b10:064a  add [bx+si],al
2b10:064c  add [bx+si],al
2b10:064e  add ax,[bp+di]
2b10:0650  add ax,[bp+di]
2b10:0652  add cx,[bx+si]
2b10:0654  or [bx+si],cl
2b10:0656  or [bx+si],cl
2b10:0658  or ax,0D0Dh
2b10:065b  or ax,120Dh
2b10:065e  adc dl,[bp+si]
2b10:0660  adc dl,[bp+si]
2b10:0662  add [bx+si],al
2b10:0664  add [bx+si],al
2b10:0666  add [bx+si],al
2b10:0668  add [bx+si],al
2b10:066a  add [bx+si],al
2b10:066c  add [bx+si],al
2b10:066e  add [bx+si],al
2b10:0670  add [bx+si],al
2b10:0672  add [bx+si],al
2b10:0674  add [bx+si],al
2b10:0676  add [bx+si],al
2b10:0678  add [bx+si],al
2b10:067a  add [bx+si],al
2b10:067c  add [bx+si],al
2b10:067e  xor si,[si]
2b10:0680  add [bx+si],al
2b10:0682  add [bx+si],al
2b10:0684  add [bx+si],al
2b10:0686  add [bx+si],al
2b10:0688  add [bx+si],al
2b10:068a  add [bx+si],al
2b10:068c  add [bx+di],al
2b10:068e  add [bx+di],ax
2b10:0690  add [bx+di],ax
2b10:0692  add [bx+di],ax
2b10:0694  add [bx+di],ax
2b10:0696  add [bx+si],ax
2b10:0698  add [bx+si],al
2b10:069a  add [bx+si],al
2b10:069c  add [bx+si],al
2b10:069e  add [bx+si],al
2b10:06a0  add [bx+si],al
2b10:06a2  add [bx+si],al
2b10:06a4  add [bx+si],al
2b10:06a6  add [bx+si],al
2b10:06a8  add [bx+si],al
2b10:06aa  add [bx+si],al
2b10:06ac  add [bx+si],al
2b10:06ae  add [bx+si],al
2b10:06b0  add [bx+si],al
2b10:06b2  add [bx+si],al
2b10:06b4  add [bx+si],cx
2b10:06b6  or al,12h
2b10:06b8  add [bx+si],al
2b10:06ba  add al,[si]
2b10:06bc  add [di],al
2b10:06be  or [si],cl
2b10:06c0  add [di],al
2b10:06c2  add ax,[bx+di]
2b10:06c4  add ax,103h
2b10:06c7  (bad)
2b10:06c9  (bad)
2b10:06cb  (bad)
2b10:06cd  inc word ptr [bp+di]
2b10:06cf  (bad)
2b10:06d1  add ax,[bp+di]
2b10:06d3  (bad)
2b10:06d5  add ax,[bp+di]
2b10:06d7  (bad)
2b10:06d9  add ax,[bp+di]
2b10:06db  (bad)
2b10:06dd  add di,di
2b10:06df  (bad)
2b10:06e1  (bad)
2b10:06e3  (bad)
2b10:06e5  (bad)
2b10:06e7  add al,[bp+si]
2b10:06e9  add al,[bp+si]
2b10:06eb  add al,[bp+si]
2b10:06ed  add al,[bp+si]
2b10:06ef  add al,[bp+si]
2b10:06f1  add al,[bp+si]
2b10:06f3  (bad)
2b10:06f5  (bad)
2b10:06f7  inc word ptr [bx+di]
2b10:06f9  inc word ptr [bx+di]
2b10:06fb  add [bx+di],ax
2b10:06fd  add [bx+di],ax
2b10:06ff  add di,di
2b10:0701  add di,di
2b10:0703  (bad)
2b10:0705  (bad)
2b10:0707  add [bx+si],al
2b10:0709  (bad)
2b10:070b  (bad)
2b10:070d  (bad)
2b10:070f  add [bx+di],al
2b10:0711  add al,[bp+di]
2b10:0713  add al,2
2b10:0715  add [bp+di],al
2b10:0717  add [si],ax
2b10:0719  add al,[bp+di]
2b10:071b  add [bx+di],al
2b10:071d  add al,1
2b10:071f  add ax,[bx+si]
2b10:0721  add al,[si]
2b10:0723  add [bx+di],al
2b10:0725  add [bx+di],al
2b10:0727  add [bx+si],al
2b10:0729  add [bx+di],ax
2b10:072b  add [bx+si],ax
2b10:072d  add [bx+si],ax
2b10:072f  add [bx+di],ax
2b10:0731  add [bx+si],al
2b10:0733  sub [si],bl
2b10:0735  adc cl,[di]
2b10:0737  adc ax,0CC1Ah
2b10:073a  push sp
2b10:073c  call far dword ptr [si]
2b10:073e  add [si],al
2b10:0741  insb [di],dx
2b10:0742  add [si-4400h],dl
2b10:0746  add [bx+si-701h],bh
2b10:074a  (bad)
2b10:074c  add [bx+si],bh
2b10:074f  mov ax,0C800h
2b10:0752  jmp far dword ptr [bx+si]
2b10:0754  add [bx+si],cl
2b10:0758  add [bx+si],al
2b10:075a  add [bx+si],al
2b10:075c  add [bp+si],al
2b10:075e  push es
2b10:075f  or [bx+di],ax
2b10:0761  add al,[bp+di]
2b10:0763  and [bx+si],bl
2b10:0765  adc [si],al
2b10:0767  add al,[bx+si]
2b10:0769  lodsw [si]
2b10:076a  push es
2b10:076b  xlat [bx]
2b10:076c  or dh,ch
2b10:076e  push es
2b10:076f  xlat [bx]
2b10:0770  or [bx+si],al
2b10:0772  push es
2b10:0773  add [di],ax
2b10:0775  add al,[si]
2b10:0777  add ax,[bx]
2b10:0779  or cx,[bx+si]
2b10:077b  or cl,[bx+di]
2b10:077d  or al,0Eh
2b10:077f  or ax,110Fh
2b10:0782  adc [bp+si],dh
2b10:0785  dec di
2b10:0786  add [bx-7D00h],dl
2b10:078a  add [bp-6200h],bl
2b10:078e  add bh,bh
2b10:0790  inc word ptr [bx+si]
2b10:0792  add al,[bx+si]
2b10:0794  inc dx
2b10:0795  add [bp+si],al
2b10:0797  add [bp+si],al
2b10:079a  imul ax,[bx+si],6Bh
2b10:079d  add [bp+di-5500h],ch
2b10:07a1  add [bx+si],dl
2b10:07a3  add [bx+si],dl
2b10:07a6  adc [bx+si],al
2b10:07a8  push ax
2b10:07a9  add [bx],bh
2b10:07ab  add [bx],bh
2b10:07ad  add [bx],bh
2b10:07b0  jg short 07B2h
2b10:07b2  add [bx+si],al
2b10:07b4  add [bx+si],al
2b10:07b6  add [bx+si],al
2b10:07b8  add [bx+si],al
2b10:07ba  add [bx+si],al
2b10:07bc  add [bx+si],al
2b10:07be  add [bx+si],al
2b10:07c0  add [bx+si],al
2b10:07c2  add [bx+si],al
2b10:07c4  add [bx+si],al
2b10:07c6  add [bx+si],al
2b10:07c8  add [bx+si],al
2b10:07ca  add [bx+si],al
2b10:07cc  add [bx+si],al
2b10:07ce  add [bx+si],al
2b10:07d0  add [bx+si],al
2b10:07d2  add [bx+si],al
2b10:07d4  add [bx+si],al
2b10:07d6  add [bx+si],al
2b10:07d8  add [bx+si],al
2b10:07da  add [bx+si],al
2b10:07dc  add [bx+si],al
2b10:07de  add [bx+si],al
2b10:07e0  add [bx+si],al
2b10:07e2  add [bx+si],al
2b10:07e4  add [bx+si],al
2b10:07e6  add [bx+si],al
2b10:07e8  add [bx+si],al
2b10:07ea  add [bx+si],al
2b10:07ec  add [bx+si],al
2b10:07ee  add [bx+si],al
2b10:07f0  add [bx+si],al
2b10:07f2  add [bx+si],al
2b10:07f4  add [bx+si],al
2b10:07f6  add [bx+si],al
2b10:07f8  add [bx+si],al
2b10:07fa  (bad)
2b10:07fc  (bad)
2b10:07fe  push es
2b10:07ff  add [bx+si],al
2b10:0801  add [bx+si],al
2b10:0803  add [bx+si],al
2b10:0805  add [bx+si],al
2b10:0807  add [bx+si],al
2b10:0809  add [bx+si],al
2b10:080b  add [bx+si],al
2b10:080d  add [bx+si],al
2b10:080f  add [bx+si],al
2b10:0811  add [bx+si],ax
2b10:0813  (bad)
2b10:0815  add [bx+si],al
2b10:0817  add [bx+si],al
2b10:0819  add [bx+si],al
2b10:081b  add [bx+si],al
2b10:081d  add [bx+si],al
2b10:081f  add [bx+si],al
2b10:0821  add [bx+si],al
2b10:0823  add [bx+si],al
2b10:0825  add [bx+si],al
2b10:0827  add [bx+si],al
2b10:0829  add [bx+si],al
2b10:082b  add [bx+si],ax
2b10:082d  (bad)
2b10:082f  add [bx+si],al
2b10:0831  add [bx+si],ax
2b10:0833  (bad)
2b10:0835  add [bx+si],al
2b10:0837  add [bx+si],al
2b10:0839  add [bx+si],al
2b10:083b  (bad)
2b10:083d  add [bx+si],al
2b10:083f  add [bx+si],al
2b10:0841  add [bx+si],ax
2b10:0843  add [bx+si],al
2b10:0845  add [bx+si],al
2b10:0847  pop es
2b10:0848  add [bx+si],al
2b10:084a  add [0],ax
2b10:084e  add [0],ax
2b10:0852  add [bx],ax
2b10:0854  add [bx+si],al
2b10:0856  add [bx],ax
2b10:0858  add [bx+si],al
2b10:085a  add [bx],ax
2b10:085c  add [bx+si],al
2b10:085e  add [6],ax
2b10:0862  add al,[6]
2b10:0866  add al,[5]
2b10:086a  add al,[di]
2b10:086c  add ax,306h
2b10:086f  push es
2b10:0870  add ax,200h
2b10:0873  push es
2b10:0874  push es
2b10:0875  add [bp+si],al
2b10:0877  add ax,505h
2b10:087a  add ax,[di]
2b10:087c  push es
2b10:087d  add [bp+si],al
2b10:087f  push es
2b10:0880  add ax,200h
2b10:0883  add ax,[bx+si]
2b10:0885  add ax,[bx+si]
2b10:0887  add ax,[bx+si]
2b10:0889  add ax,[bx+si]
2b10:088b  add ax,[bx+si]
2b10:088d  add ax,[bx+si]
2b10:088f  add ax,[bx+si]
2b10:0891  or [bx+si],al
2b10:0893  add ax,[bx+si]
2b10:0895  pop es
2b10:0896  add [800h],al
2b10:089a  add [bp+di],al
2b10:089c  add [si],al
2b10:089e  add [bp+di],al
2b10:08a0  add [600h],al
2b10:08a4  add [bp+di],al
2b10:08a6  add [bx+si],cl
2b10:08a8  add [bp+di],al
2b10:08aa  add [bp+di],al
2b10:08ac  add [bp+di],al
2b10:08ae  add [si],cl
2b10:08b0  add [bp+si],al
2b10:08b2  add [700h],al
2b10:08b6  add [bp+si],al
2b10:08b8  add [bp+di],al
2b10:08ba  add [bx+si],cl
2b10:08bc  add [bp+di],al
2b10:08be  add [bx],al
2b10:08c0  add [300h],al
2b10:08c4  add [bx+si],cl
2b10:08c6  add [bp+si],cl
2b10:08c8  add [1200h],al
2b10:08cc  adc al,fs:[bx+si]
2b10:08cf  adc al,[bx+si]
2b10:08d1  adc al,[bx+si]
2b10:08d3  adc al,[bx+si]
2b10:08d5  adc al,[bx+si]
2b10:08d7  adc ah,[si+12h]
2b10:08da  add [bp+si],dl
2b10:08dc  add [bp+di],dl
2b10:08de  add [bx+di],dl
2b10:08e0  add [bp+si],dl
2b10:08e2  add [bp+si],dl
2b10:08e4  adc al,fs:[bx+si]
2b10:08e7  adc al,[bx+si]
2b10:08e9  adc al,[bx+si]
2b10:08eb  adc al,[bx+si]
2b10:08ed  adc al,[bx+si]
2b10:08ef  adc ah,[si+12h]

; Candidate 2b10:0034, file offset 0x2e334
2b10:0034  int 3Fh
2b10:0036  add [bx+si],al
2b10:0038  add ch,cl
2b10:003a  aas
2b10:003b  or cx,[bp+si]
2b10:003d  add ch,cl
2b10:003f  aas
2b10:0040  cbw
2b10:0041  or [bx+si],al
2b10:0043  int 3Fh
2b10:0045  adc al,gs:[bx+si]
2b10:0048  int 3Fh
2b10:004a  lodsb [si]
2b10:004b  or [bx+si],al
2b10:004d  int 3Fh
2b10:004f  push si
2b10:0050  adc al,[bx+si]
2b10:0052  add [bx+si],al
2b10:0054  add [bx+si],al
2b10:0056  add [bx+si],al
2b10:0058  add [bx+si],al
2b10:005a  add [bx+si],al
2b10:005c  add [bx+si],al
2b10:005e  add [bx+si],al
2b10:0060  add [bx+si],al
2b10:0062  add [bx+si],al
2b10:0064  inc dx
2b10:0065  outsw dx,[si]
2b10:0066  jb short 00D4h
2b10:0068  popa
2b10:0069  outsb dx,[si]
2b10:006a  and fs:[bp+di+2Bh],al
2b10:006e  sub sp,[bx+si]
2b10:0070  sub ax,4320h
2b10:0073  outsw dx,[si]
2b10:0074  jo short 00EFh
2b10:0076  jb short 00E1h
2b10:0078  push 2074h
2b10:007c  xor [bx+di],di
2b10:007e  cmp [bx+di],si
2b10:0080  and [bp+si+6Fh],al
2b10:0083  jb short 00F1h
2b10:0085  popa
2b10:0086  outsb dx,[si]
2b10:0087  and fs:[bx+di+6Eh],cl
2b10:008b  je short 00F9h
2b10:008d  add cs:[si+69h],al
2b10:0091  jbe short 00FCh
2b10:0093  and gs:[di+72h],ah
2b10:0098  jb short 0109h
2b10:009a  jb short 00A9h
2b10:009c  or al,[bx+di+62h]
2b10:009f  outsb dx,[si]
2b10:00a0  outsw dx,[si]
2b10:00a1  jb short 0110h
2b10:00a3  popa
2b10:00a4  insb [di],dx
2b10:00a5  and [bx+si+72h],dh
2b10:00a8  outsw dx,[si]
2b10:00a9  jb short 010Dh
2b10:00ac  insw [di],dx
2b10:00ad  and [si+65h],dh
2b10:00b0  jb short 011Fh
2b10:00b2  imul bp,[bp+61h],6974h
2b10:00b7  outsw dx,[si]
2b10:00b8  outsb dx,[si]
2b10:00b9  or ax,0Ah
2b10:00bc  add [bx+si],al
2b10:00be  add [bx+si],al
2b10:00c0  add [bx+si],al
2b10:00c2  add [bx+si],al
2b10:00c4  add [bx+si],al
2b10:00c6  add [bx+si],al
2b10:00c8  add [bx+si],al
2b10:00ca  add [bx+si],al
2b10:00cc  add [bx+si],al
2b10:00ce  add [bx+si],al
2b10:00d0  add [bx+si],al
2b10:00d2  add [bx+si],al
2b10:00d4  add [bx+si],al
2b10:00d6  add [bx+si],al
2b10:00d8  add [bx+si],al
2b10:00da  add [bx+si],al
2b10:00dc  add [bx+si],al
2b10:00de  add [bx+si],al
2b10:00e0  add [bx+si],al
2b10:00e2  add [bx+si],al
2b10:00e4  add [bx+si],al
2b10:00e6  add [bx+si],al
2b10:00e8  add [bx+si],al
2b10:00ea  add [bx+si],al
2b10:00ec  add [bx+si],al
2b10:00ee  add [bx+si],al
2b10:00f0  add [bx+si],al
2b10:00f2  xlat [bx]
2b10:00f3  xlat [bx]
2b10:00f4  xlat [bx]
2b10:00f5  xlat [bx]
2b10:00f6  xlat [bx]
2b10:00f7  xlat [bx]
2b10:00f8  xlat [bx]
2b10:00f9  xlat [bx]
2b10:00fa  xlat [bx]
2b10:00fb  xlat [bx]
2b10:00fc  xlat [bx]
2b10:00fd  xlat [bx]
2b10:00fe  xlat [bx]
2b10:00ff  xlat [bx]
2b10:0100  xlat [bx]
2b10:0101  xlat [bx]
2b10:0102  fcom st,st(7)
2b10:0104  fcomp st,st(0)
2b10:0106  add bl,al
2b10:0108  fcomp st,st(0)
2b10:010a  fdivr st,st(6)
2b10:010c  xlat [bx]
2b10:010d  fcomp st,st(0)
2b10:010f  fcom st,st(7)
2b10:0111  add bx,ax
2b10:0113  std
2b10:0114  fcomp st,st(0)
2b10:0116  fdivr st,st(6)
2b10:0118  fmul st,dword ptr [bx+si]
2b10:011a  fcomp st,st(0)
2b10:011c  fdivr st,st(6)
2b10:011e  xlat [bx]
2b10:011f  push es
2b10:0120  fcomp st,st(0)
2b10:0122  cli
2b10:0123  add bx,ax
2b10:0125  std
2b10:0126  fcomp st,st(0)
2b10:0128  fcomp st,st(0)
2b10:012a  fcomp st,st(0)
2b10:012c  fcomp st,st(0)
2b10:012e  fcomp st,st(0)
2b10:0130  cli
2b10:0131  xlat [bx]
2b10:0132  adc al,bl
2b10:0134  std
2b10:0135  xlat [bx]
2b10:0136  adc bx,ax
2b10:0138  fcomp st,st(0)
2b10:013a  fcomp st,st(0)
2b10:013c  fdiv st,st(2)
2b10:013e  fcom st,dword ptr [si]
2b10:0140  fcomp st,st(0)
2b10:0142  fdiv st,st(0)
2b10:0144  xlat [bx]
2b10:0145  adc al,0D8h
2b10:0147  in ax,dx
2b10:0148  adc al,bl
2b10:014a  fcom st,dword ptr [bp+di]
2b10:014c  fcomp st,st(0)
2b10:014e  fcomp st,st(0)
2b10:0150  in al,dx
2b10:0151  fcomp st,st(0)
2b10:0153  fcomp st,st(0)
2b10:0155  fcom st,st(7)
2b10:0157  adc al,0D8h
2b10:0159  in ax,dx
2b10:015a  xlat [bx]
2b10:015b  fcomp st,st(0)
2b10:015d  adc dx,di
2b10:015f  xlat [bx]
2b10:0160  xlat [bx]
2b10:0161  xlat [bx]
2b10:0162  xlat [bx]
2b10:0163  xlat [bx]
2b10:0164  xlat [bx]
2b10:0165  xlat [bx]
2b10:0166  xlat [bx]
2b10:0167  xlat [bx]
2b10:0168  xlat [bx]
2b10:0169  xlat [bx]
2b10:016a  xlat [bx]
2b10:016b  xlat [bx]
2b10:016c  xlat [bx]
2b10:016d  xlat [bx]
2b10:016e  fcom st,st(7)
2b10:0170  xlat [bx]
2b10:0171  xlat [bx]
2b10:0172  xlat [bx]
2b10:0173  xlat [bx]
2b10:0174  xlat [bx]
2b10:0175  xlat [bx]
2b10:0176  xlat [bx]
2b10:0177  xlat [bx]
2b10:0178  xlat [bx]
2b10:0179  xlat [bx]
2b10:017a  xlat [bx]
2b10:017b  xlat [bx]
2b10:017c  xlat [bx]
2b10:017d  xlat [bx]
2b10:017e  xlat [bx]
2b10:017f  xlat [bx]
2b10:0180  fcom st,st(7)
2b10:0182  fcomp st,st(0)
2b10:0184  fcomp st,st(0)
2b10:0186  fcomp st,st(0)
2b10:0188  fcomp st,st(0)
2b10:018a  fadd st,dword ptr [0D8D8h]
2b10:018e  cli
2b10:018f  add bx,ax
2b10:0191  std
2b10:0192  fcomp st,st(0)
2b10:0194  fcomp st,st(0)
2b10:0196  fcomp st,st(0)
2b10:0198  fcomp st,st(0)
2b10:019a  fcomp st,st(0)
2b10:019c  cli
2b10:019d  fcom st,dword ptr [bx+si]
2b10:019f  fdivr st,st(5)
2b10:01a1  xlat [bx]
2b10:01a2  adc di,bp
2b10:01a4  fcom st,dword ptr [bp+di]
2b10:01a6  fcomp st,st(0)
2b10:01a8  fcomp st,st(0)
2b10:01aa  fcomp st,st(0)
2b10:01ac  fcomp st,st(0)
2b10:01ae  fdiv st,st(0)
2b10:01b0  fcomp st,st(0)
2b10:01b2  fsubr st,st(5)
2b10:01b4  adc al,bl
2b10:01b6  fcom st,dword ptr [bp+di]
2b10:01b8  xlat [bx]
2b10:01b9  xlat [bx]
2b10:01ba  xlat [bx]
2b10:01bb  xlat [bx]
2b10:01bc  xlat [bx]
2b10:01bd  xlat [bx]
2b10:01be  xlat [bx]
2b10:01bf  xlat [bx]
2b10:01c0  xlat [bx]
2b10:01c1  xlat [bx]
2b10:01c2  xlat [bx]
2b10:01c3  xlat [bx]
2b10:01c4  xlat [bx]
2b10:01c5  xlat [bx]
2b10:01c6  xlat [bx]
2b10:01c7  xlat [bx]
2b10:01c8  fcom st,st(7)
2b10:01ca  fcomp st,st(0)
2b10:01cc  fcomp st,st(0)
2b10:01ce  fcomp st,st(0)
2b10:01d0  fcomp st,st(0)
2b10:01d2  fcomp st,st(0)
2b10:01d4  fcomp st,st(0)
2b10:01d6  fadd st,dword ptr [bp+di]
2b10:01d8  fdivr st,st(5)
2b10:01da  fcomp st,st(0)
2b10:01dc  fcomp st,st(0)
2b10:01de  fcomp st,st(0)
2b10:01e0  fcomp st,st(0)
2b10:01e2  fcomp st,st(0)
2b10:01e4  fcomp st,st(0)
2b10:01e6  fcomp st,st(0)
2b10:01e8  std
2b10:01e9  fcom st,dword ptr [bp+di]
2b10:01eb  std
2b10:01ec  fcom st,dword ptr [bp+di]
2b10:01ee  fcomp st,st(0)
2b10:01f0  fcomp st,st(0)
2b10:01f2  fcomp st,st(0)
2b10:01f4  fcomp st,st(0)
2b10:01f6  fcomp st,st(0)
2b10:01f8  fcomp st,st(0)
2b10:01fa  fsubr st,st(5)
2b10:01fc  fcomp st,st(0)
2b10:01fe  fcom st,dword ptr [bp+di]
2b10:0200  fcomp st,st(0)
2b10:0202  fcomp st,st(0)
2b10:0204  fcomp st,st(0)
2b10:0206  fcomp st,st(0)
2b10:0208  fcomp st,st(0)
2b10:020a  fcomp st,st(0)
2b10:020c  fcomp st,st(0)
2b10:020e  fcomp st,st(0)
2b10:0210  fcomp st,st(0)
2b10:0212  fcomp st,st(0)
2b10:0214  fcomp st,st(0)
2b10:0216  fcomp st,st(0)
2b10:0218  fcomp st,st(0)
2b10:021a  fcomp st,st(0)
2b10:021c  fcomp st,st(0)
2b10:021e  fcomp st,st(0)
2b10:0220  fcomp st,st(0)
2b10:0222  fcomp st,st(0)
2b10:0224  fcomp st,st(0)
2b10:0226  fcomp st,st(0)
2b10:0228  fcomp st,st(0)
2b10:022a  fcomp st,st(0)
2b10:022c  fcomp st,st(0)
2b10:022e  fcomp st,st(0)
2b10:0230  fcomp st,st(0)
2b10:0232  fcomp st,st(0)
2b10:0234  fcomp st,st(0)
2b10:0236  push ss
2b10:0237  add [1600h],dl
2b10:023b  add [1600h],dl
2b10:023f  add [1600h],dl
2b10:0243  add [1600h],dl
2b10:0247  add [1600h],dl
2b10:024b  add [1600h],dl
2b10:024f  add [1600h],dl
2b10:0253  add [0],dl
2b10:0257  push ss
2b10:0258  push ss
2b10:0259  add [bx+si],al
2b10:025b  push ss
2b10:025c  add [200h],dl
2b10:0260  add [1600h],dl
2b10:0264  add [1600h],dl
2b10:0268  add dl,[400h]
2b10:026c  add [1600h],dl
2b10:0270  add [16h],dl
2b10:0274  add [bp+di],al
2b10:0276  add [1603h],dl
2b10:027a  add [1600h],dl
2b10:027e  add [1602h],dl
2b10:0282  add [800h],dl
2b10:0286  add [1600h],dl
2b10:028a  add [200h],dl
2b10:028e  push ss
2b10:028f  add [bx+si],al
2b10:0291  push es
2b10:0292  add [1600h],dl
2b10:0296  push es
2b10:0297  push ss
2b10:0298  add [bp+di],al
2b10:029a  add [3],dl
2b10:029e  add [1600h],dl
2b10:02a2  add [1600h],dl
2b10:02a6  add [1600h],dl
2b10:02aa  add [1600h],dl
2b10:02ae  add [1600h],dl
2b10:02b2  push es
2b10:02b3  push ss
2b10:02b4  or [1000h],cl
2b10:02b8  add [1603h],dl
2b10:02bc  push es
2b10:02bd  adc [bx+si],al
2b10:02bf  adc ax,[bx+si]
2b10:02c1  push ss
2b10:02c2  add [1600h],dl
2b10:02c6  add [1600h],dl
2b10:02ca  add [160Eh],dl
2b10:02ce  add [1400h],dl
2b10:02d2  add [1600h],dl
2b10:02d6  add [1610h],dl
2b10:02da  push ss
2b10:02db  add [bx+si],al
2b10:02dd  adc al,0
2b10:02df  push ss
2b10:02e0  adc dx,[1000h]
2b10:02e4  add [1600h],dl
2b10:02e8  add [bp+di],dl
2b10:02ea  add [1600h],dl
2b10:02ee  add [1600h],dl
2b10:02f2  adc al,16h
2b10:02f4  add [1600h],dl
2b10:02f8  add [1600h],dl
2b10:02fc  add [1612h],dl
2b10:0300  adc al,16h
2b10:0302  add [1613h],dl
2b10:0306  push ss
2b10:0307  add [bx+si],al
2b10:0309  push ss
2b10:030a  add [1300h],dl
2b10:030e  push ss
2b10:030f  add [1600h],dl
2b10:0313  add [1600h],dl
2b10:0317  add [1600h],dl
2b10:031b  add [1600h],dl
2b10:031f  add [1600h],dl
2b10:0323  add [1600h],dl
2b10:0327  add [1600h],dl
2b10:032b  add [0],dl
2b10:032f  push ss
2b10:0330  push ss
2b10:0331  add [1600h],dl
2b10:0335  add [1600h],dl
2b10:0339  add [1600h],dl
2b10:033d  add [1600h],dl
2b10:0341  add [1600h],dl
2b10:0345  add [1600h],dl
2b10:0349  add [1600h],dl
2b10:034d  add [1600h],dl
2b10:0351  add [bx+si],al
2b10:0353  push ss
2b10:0354  push ss
2b10:0355  add [bx+si],al
2b10:0357  push ss
2b10:0358  add [1600h],dl
2b10:035c  add [1600h],dl
2b10:0360  add [1600h],dl
2b10:0364  add [1600h],dl
2b10:0368  add [1600h],al
2b10:036c  add [1606h],dl
2b10:0370  add [bp+di],al
2b10:0372  add [1603h],dl
2b10:0376  add [1600h],dl
2b10:037a  add [1600h],dl
2b10:037e  add [1600h],dl
2b10:0382  add [1600h],dl
2b10:0386  add [1600h],dl
2b10:038a  push es
2b10:038b  push ss
2b10:038c  add [1000h],dl
2b10:0390  add [1603h],dl
2b10:0394  pop es
2b10:0395  lldt [bp+di]
2b10:0398  add dx,[1600h]
2b10:039c  add [bp+di],dl
2b10:039e  add [1600h],dl
2b10:03a2  add [1600h],dl
2b10:03a6  add [1600h],dl
2b10:03aa  add [1600h],dl
2b10:03ae  add [1610h],dl
2b10:03b2  add [1600h],dl
2b10:03b6  add [1613h],dl
2b10:03ba  add [bx+si],dl
2b10:03bc  add [1600h],dl
2b10:03c0  add [bp+di],dl
2b10:03c2  push ss
2b10:03c3  add [1600h],dl
2b10:03c7  add [1600h],dl
2b10:03cb  add [1600h],dl
2b10:03cf  add [1600h],dl
2b10:03d3  add [1600h],dl
2b10:03d7  add [1600h],dl
2b10:03db  add [1600h],dl
2b10:03df  add [0],dl
2b10:03e3  push ss
2b10:03e4  push ss
2b10:03e5  add [bx+si],al
2b10:03e7  push ss
2b10:03e8  add [1600h],dl
2b10:03ec  add [1600h],dl
2b10:03f0  add [1600h],dl
2b10:03f4  add [1600h],dl
2b10:03f8  add [1600h],dl
2b10:03fc  add [1600h],dl
2b10:0400  add [bp+di],al
2b10:0402  add [1603h],dl
2b10:0406  add [1600h],dl
2b10:040a  add [1600h],dl
2b10:040e  add [1600h],dl
2b10:0412  add [1600h],dl
2b10:0416  add [1600h],dl
2b10:041a  add [1600h],dl
2b10:041e  add [1600h],dl
2b10:0422  add dx,[1600h]
2b10:0426  add [bp+di],dl
2b10:0428  add dx,[1600h]
2b10:042c  add [bp+di],dl
2b10:042e  add [1600h],dl
2b10:0432  add [1600h],dl
2b10:0436  add [1600h],dl
2b10:043a  add [1600h],dl
2b10:043e  add [1600h],dl
2b10:0442  add [1600h],dl
2b10:0446  add [1613h],dl
2b10:044a  add [1600h],dl
2b10:044e  add [1300h],dl
2b10:0452  add [1600h],dl
2b10:0456  add [1600h],dl
2b10:045a  add [1600h],dl
2b10:045e  add [1600h],dl
2b10:0462  add [1600h],dl
2b10:0466  add [1600h],dl
2b10:046a  add [1600h],dl
2b10:046e  add [1600h],dl
2b10:0472  add [1600h],dl
2b10:0476  add [1600h],dl
2b10:047a  add [1600h],dl
2b10:047e  add [1600h],dl
2b10:0482  add [1600h],dl
2b10:0486  add [1600h],dl
2b10:048a  add [1600h],dl
2b10:048e  add [1600h],dl
2b10:0492  add [1600h],dl
2b10:0496  add [1600h],dl
2b10:049a  add [1600h],dl
2b10:049e  add [1600h],dl
2b10:04a2  add [1600h],dl
2b10:04a6  add [1600h],dl
2b10:04aa  add [1600h],dl
2b10:04ae  add [1600h],dl
2b10:04b2  add [1600h],dl
2b10:04b6  add [1600h],dl
2b10:04ba  add [1600h],dl
2b10:04be  push ds
2b10:04bf  sbb [bx+si],dl
2b10:04c1  add [bp+di],bh
2b10:04c3  inc di
2b10:04c4  push si
2b10:04c5  js short 04C6h
2b10:04c7  (bad)
2b10:04c9  (bad)
2b10:04cb  (bad)
2b10:04cd  (bad)
2b10:04cf  add di,di
2b10:04d1  (bad)
2b10:04d3  or di,di
2b10:04d5  or cx,[si]
2b10:04d7  or ax,0FFFFh
2b10:04da  add ax,[bp+di]
2b10:04dc  add al,[bp+si]
2b10:04de  add al,[bp+si]
2b10:04e0  add [bx+di],ax
2b10:04e2  add [bx+di],ax
2b10:04e4  add [bx+si],al
2b10:04e6  (bad)
2b10:04e8  and ax,3100h
2b10:04eb  add [bx+si],bh
2b10:04ed  add [bx+si],al
2b10:04ef  add dh,bh
2b10:04f1  inc word ptr [bx+di]
2b10:04f3  add bh,bh
2b10:04f5  inc word ptr [bp+si]
2b10:04f7  add [bx+si],al
2b10:04f9  add [bx+di],al
2b10:04fb  add bh,bh
2b10:04fd  jmp far dword ptr [di-28FAh]
2b10:0501  or dh,ch
2b10:0503  push es
2b10:0504  xlat [bx]
2b10:0505  or [bx],ch
2b10:0507  pop es
2b10:0508  xlat [bx]
2b10:0509  or [bx+si+7],dh
2b10:050c  xlat [bx]
2b10:050d  or [bp+si],al
2b10:050f  add [bx+si],ax
2b10:0511  add al,0FEh
2b10:0513  add [bp+di],ax
2b10:0515  add ax,[si]
2b10:0517  inc byte ptr [bx+di]
2b10:0519  add [bp+di],ax
2b10:051b  add al,0FEh
2b10:051d  inc byte ptr [bx+di]
2b10:051f  add ax,[si]
2b10:0521  cld
2b10:0522  std
2b10:0523  inc word ptr [bp+si]
2b10:0525  add bh,ah
2b10:0527  std
2b10:0528  (bad)
2b10:052a  add bh,ah
2b10:052c  std
2b10:052d  std
2b10:052e  inc word ptr [bp+si]
2b10:0530  cld
2b10:0531  add al,0FEh
2b10:0533  add [bp+di],ax
2b10:0535  add ax,[si]
2b10:0537  inc byte ptr [bx+di]
2b10:0539  add [bp+di],ax
2b10:053b  add al,0FEh
2b10:053d  inc byte ptr [bx+di]
2b10:053f  add ax,[si]
2b10:0541  add al,0FDh
2b10:0543  add [bp+si],ax
2b10:0545  add al,[si]
2b10:0547  std
2b10:0548  add [bx+di],ax
2b10:054a  add al,[si]
2b10:054c  std
2b10:054d  std
2b10:054e  add [bp+si],ax
2b10:0550  add al,0
2b10:0552  add [bp+si],ax
2b10:0554  add ax,[si]
2b10:0556  add al,[bx+si]
2b10:0558  add ax,[bx+di]
2b10:055a  add al,2
2b10:055c  add ax,[bx+si]
2b10:055e  add [si],ax
2b10:0560  add [bp+di],ax
2b10:0562  add [bp+si],al
2b10:0564  add al,14h
2b10:0566  or al,4
2b10:0568  add al,2
2b10:056a  add [bx+si],al
2b10:056c  add [bx+si],al
2b10:056e  add [bx+si],al
2b10:0570  add [bx+si],al
2b10:0572  add [si-6Ch],al
2b10:0575  push ss
2b10:0576  sub bp,[bp+di]
2b10:0578  fist word ptr [442Bh],st
2b10:057c  xchg sp,ax
2b10:057d  push ss
2b10:057e  sub bp,[bp+di]
2b10:0580  fist word ptr [442Bh],st
2b10:0584  xchg sp,ax
2b10:0585  push ss
2b10:0586  sub ax,[bx+si]
2b10:0588  add [bx+si],al
2b10:058a  add [si-6Ch],al
2b10:058d  push ss
2b10:058e  sub cx,[bp+si-21h]
2b10:0591  push ss
2b10:0592  sub ax,[si-6Ch]
2b10:0595  push ss
2b10:0596  sub cx,[bp+si-21h]
2b10:0599  push ss
2b10:059a  sub ax,[bx+si]
2b10:059c  add [bx+si],al
2b10:059e  add [bx+si],al
2b10:05a0  add [bx+si],al
2b10:05a2  add [si-6Ch],al
2b10:05a5  push ss
2b10:05a6  sub bp,[bp+di]
2b10:05a8  fist word ptr [442Bh],st
2b10:05ac  xchg sp,ax
2b10:05ad  push ss
2b10:05ae  sub bp,[bp+di]
2b10:05b0  fist word ptr [442Bh],st
2b10:05b4  xchg sp,ax
2b10:05b5  push ss
2b10:05b6  sub ax,[bx+si]
2b10:05b8  add [bx+si],al
2b10:05ba  add [si-6Ch],al
2b10:05bd  push ss
2b10:05be  sub cx,[bp+si-21h]
2b10:05c1  push ss
2b10:05c2  sub ax,[si-6Ch]
2b10:05c5  push ss
2b10:05c6  sub cx,[bp+si-21h]
2b10:05c9  push ss
2b10:05ca  sub ax,[si-6Ch]
2b10:05cd  push ss
2b10:05ce  sub bp,[bp+di]
2b10:05d0  fist word ptr [442Bh],st
2b10:05d4  xchg sp,ax
2b10:05d5  push ss
2b10:05d6  sub ax,[bx+si]
2b10:05d8  add [bx+si],al
2b10:05da  add [si-6Ch],al
2b10:05dd  push ss
2b10:05de  sub cx,[bp+si-21h]
2b10:05e1  push ss
2b10:05e2  sub ax,[bx+si]
2b10:05e4  add [bx+si],al
2b10:05e6  add [bp+di],ch
2b10:05e8  fist word ptr [442Bh],st
2b10:05ec  xchg sp,ax
2b10:05ed  push ss
2b10:05ee  sub ax,[bx+si]
2b10:05f0  add [bx+si],al
2b10:05f2  add [bx+si],al
2b10:05f4  add [bx+si],al
2b10:05f6  add [bp+si-21h],cl
2b10:05f9  push ss
2b10:05fa  sub ax,[bx+di]
2b10:05fc  add [si],ax
2b10:05fe  or al,[si]
2b10:0600  or [si],al
2b10:0602  add [si],ax
2b10:0604  clc
2b10:0605  add al,0F6h
2b10:0607  add [bx+si],al
2b10:0609  add cx,[bx+di]
2b10:060b  add ax,[bx]
2b10:060d  add ax,[bx+di]
2b10:060f  add di,cx
2b10:0611  add si,di
2b10:0613  add al,[102h]
2b10:0617  add bh,dl
2b10:0619  add [di],ax
2b10:061b  add [bx+di],ax
2b10:061d  add bx,di
2b10:061f  jo short 0620h
2b10:0621  mov al,[0D0FFh]
2b10:0624  inc word ptr [bx+si]
2b10:0626  add [bx+si],dh
2b10:0628  add [bx+si],ah
2b10:062b  nop
2b10:062c  add [bx+si-1],ah
2b10:062f  mov al,0FFh
2b10:0631  add [bx+si],al
2b10:0633  push ax
2b10:0634  add [bx+si-8000h],ah
2b10:0638  inc word ptr [bx+si]
2b10:063a  add [bx+si],al
2b10:063e  add [bx+si],al
2b10:0640  add [bx+si],al
2b10:0642  add [bp+di],bh
2b10:0644  inc di
2b10:0645  push si
2b10:0646  add [bx],bl
2b10:0648  sbb [bx],cl
2b10:064a  add [bx+si],al
2b10:064c  add [bx+si],al
2b10:064e  add ax,[bp+di]
2b10:0650  add ax,[bp+di]
2b10:0652  add cx,[bx+si]
2b10:0654  or [bx+si],cl
2b10:0656  or [bx+si],cl
2b10:0658  or ax,0D0Dh
2b10:065b  or ax,120Dh
2b10:065e  adc dl,[bp+si]
2b10:0660  adc dl,[bp+si]
2b10:0662  add [bx+si],al
2b10:0664  add [bx+si],al
2b10:0666  add [bx+si],al
2b10:0668  add [bx+si],al
2b10:066a  add [bx+si],al
2b10:066c  add [bx+si],al
2b10:066e  add [bx+si],al
2b10:0670  add [bx+si],al
2b10:0672  add [bx+si],al
2b10:0674  add [bx+si],al
2b10:0676  add [bx+si],al
2b10:0678  add [bx+si],al
2b10:067a  add [bx+si],al
2b10:067c  add [bx+si],al
2b10:067e  xor si,[si]
2b10:0680  add [bx+si],al
2b10:0682  add [bx+si],al
2b10:0684  add [bx+si],al
2b10:0686  add [bx+si],al
2b10:0688  add [bx+si],al
2b10:068a  add [bx+si],al
2b10:068c  add [bx+di],al
2b10:068e  add [bx+di],ax
2b10:0690  add [bx+di],ax
2b10:0692  add [bx+di],ax
2b10:0694  add [bx+di],ax
2b10:0696  add [bx+si],ax
2b10:0698  add [bx+si],al
2b10:069a  add [bx+si],al
2b10:069c  add [bx+si],al
2b10:069e  add [bx+si],al
2b10:06a0  add [bx+si],al
2b10:06a2  add [bx+si],al
2b10:06a4  add [bx+si],al
2b10:06a6  add [bx+si],al
2b10:06a8  add [bx+si],al
2b10:06aa  add [bx+si],al
2b10:06ac  add [bx+si],al
2b10:06ae  add [bx+si],al
2b10:06b0  add [bx+si],al
2b10:06b2  add [bx+si],al
2b10:06b4  add [bx+si],cx
2b10:06b6  or al,12h
2b10:06b8  add [bx+si],al
2b10:06ba  add al,[si]
2b10:06bc  add [di],al
2b10:06be  or [si],cl
2b10:06c0  add [di],al
2b10:06c2  add ax,[bx+di]
2b10:06c4  add ax,103h
2b10:06c7  (bad)
2b10:06c9  (bad)
2b10:06cb  (bad)
2b10:06cd  inc word ptr [bp+di]
2b10:06cf  (bad)
2b10:06d1  add ax,[bp+di]
2b10:06d3  (bad)
2b10:06d5  add ax,[bp+di]
2b10:06d7  (bad)
2b10:06d9  add ax,[bp+di]
2b10:06db  (bad)
2b10:06dd  add di,di
2b10:06df  (bad)
2b10:06e1  (bad)
2b10:06e3  (bad)
2b10:06e5  (bad)
2b10:06e7  add al,[bp+si]
2b10:06e9  add al,[bp+si]
2b10:06eb  add al,[bp+si]
2b10:06ed  add al,[bp+si]
2b10:06ef  add al,[bp+si]
2b10:06f1  add al,[bp+si]
2b10:06f3  (bad)
2b10:06f5  (bad)
2b10:06f7  inc word ptr [bx+di]
2b10:06f9  inc word ptr [bx+di]
2b10:06fb  add [bx+di],ax
2b10:06fd  add [bx+di],ax
2b10:06ff  add di,di
2b10:0701  add di,di
2b10:0703  (bad)
2b10:0705  (bad)
2b10:0707  add [bx+si],al
2b10:0709  (bad)
2b10:070b  (bad)
2b10:070d  (bad)
2b10:070f  add [bx+di],al
2b10:0711  add al,[bp+di]
2b10:0713  add al,2
2b10:0715  add [bp+di],al
2b10:0717  add [si],ax
2b10:0719  add al,[bp+di]
2b10:071b  add [bx+di],al
2b10:071d  add al,1
2b10:071f  add ax,[bx+si]
2b10:0721  add al,[si]
2b10:0723  add [bx+di],al
2b10:0725  add [bx+di],al
2b10:0727  add [bx+si],al
2b10:0729  add [bx+di],ax
2b10:072b  add [bx+si],ax
2b10:072d  add [bx+si],ax
2b10:072f  add [bx+di],ax
2b10:0731  add [bx+si],al
2b10:0733  sub [si],bl
2b10:0735  adc cl,[di]
2b10:0737  adc ax,0CC1Ah
2b10:073a  push sp
2b10:073c  call far dword ptr [si]
2b10:073e  add [si],al
2b10:0741  insb [di],dx
2b10:0742  add [si-4400h],dl
2b10:0746  add [bx+si-701h],bh
2b10:074a  (bad)
2b10:074c  add [bx+si],bh
2b10:074f  mov ax,0C800h
2b10:0752  jmp far dword ptr [bx+si]
2b10:0754  add [bx+si],cl
2b10:0758  add [bx+si],al
2b10:075a  add [bx+si],al
2b10:075c  add [bp+si],al
2b10:075e  push es
2b10:075f  or [bx+di],ax
2b10:0761  add al,[bp+di]
2b10:0763  and [bx+si],bl
2b10:0765  adc [si],al
2b10:0767  add al,[bx+si]
2b10:0769  lodsw [si]
2b10:076a  push es
2b10:076b  xlat [bx]
2b10:076c  or dh,ch
2b10:076e  push es
2b10:076f  xlat [bx]
2b10:0770  or [bx+si],al
2b10:0772  push es
2b10:0773  add [di],ax
2b10:0775  add al,[si]
2b10:0777  add ax,[bx]
2b10:0779  or cx,[bx+si]
2b10:077b  or cl,[bx+di]
2b10:077d  or al,0Eh
2b10:077f  or ax,110Fh
2b10:0782  adc [bp+si],dh
2b10:0785  dec di
2b10:0786  add [bx-7D00h],dl
2b10:078a  add [bp-6200h],bl
2b10:078e  add bh,bh
2b10:0790  inc word ptr [bx+si]
2b10:0792  add al,[bx+si]
2b10:0794  inc dx
2b10:0795  add [bp+si],al
2b10:0797  add [bp+si],al
2b10:079a  imul ax,[bx+si],6Bh
2b10:079d  add [bp+di-5500h],ch
2b10:07a1  add [bx+si],dl
2b10:07a3  add [bx+si],dl
2b10:07a6  adc [bx+si],al
2b10:07a8  push ax
2b10:07a9  add [bx],bh
2b10:07ab  add [bx],bh
2b10:07ad  add [bx],bh
2b10:07b0  jg short 07B2h
2b10:07b2  add [bx+si],al
2b10:07b4  add [bx+si],al
2b10:07b6  add [bx+si],al
2b10:07b8  add [bx+si],al
2b10:07ba  add [bx+si],al
2b10:07bc  add [bx+si],al
2b10:07be  add [bx+si],al
2b10:07c0  add [bx+si],al
2b10:07c2  add [bx+si],al
2b10:07c4  add [bx+si],al
2b10:07c6  add [bx+si],al
2b10:07c8  add [bx+si],al
2b10:07ca  add [bx+si],al
2b10:07cc  add [bx+si],al
2b10:07ce  add [bx+si],al
2b10:07d0  add [bx+si],al
2b10:07d2  add [bx+si],al
2b10:07d4  add [bx+si],al
2b10:07d6  add [bx+si],al
2b10:07d8  add [bx+si],al
2b10:07da  add [bx+si],al
2b10:07dc  add [bx+si],al
2b10:07de  add [bx+si],al
2b10:07e0  add [bx+si],al
2b10:07e2  add [bx+si],al
2b10:07e4  add [bx+si],al
2b10:07e6  add [bx+si],al
2b10:07e8  add [bx+si],al
2b10:07ea  add [bx+si],al
2b10:07ec  add [bx+si],al
2b10:07ee  add [bx+si],al
2b10:07f0  add [bx+si],al
2b10:07f2  add [bx+si],al
2b10:07f4  add [bx+si],al
2b10:07f6  add [bx+si],al
2b10:07f8  add [bx+si],al
2b10:07fa  (bad)
2b10:07fc  (bad)
2b10:07fe  push es
2b10:07ff  add [bx+si],al
2b10:0801  add [bx+si],al
2b10:0803  add [bx+si],al
2b10:0805  add [bx+si],al
2b10:0807  add [bx+si],al
2b10:0809  add [bx+si],al
2b10:080b  add [bx+si],al
2b10:080d  add [bx+si],al
2b10:080f  add [bx+si],al
2b10:0811  add [bx+si],ax
2b10:0813  (bad)
2b10:0815  add [bx+si],al
2b10:0817  add [bx+si],al
2b10:0819  add [bx+si],al
2b10:081b  add [bx+si],al
2b10:081d  add [bx+si],al
2b10:081f  add [bx+si],al
2b10:0821  add [bx+si],al
2b10:0823  add [bx+si],al
2b10:0825  add [bx+si],al
2b10:0827  add [bx+si],al
2b10:0829  add [bx+si],al
2b10:082b  add [bx+si],ax
2b10:082d  (bad)
2b10:082f  add [bx+si],al
2b10:0831  add [bx+si],ax
2b10:0833  (bad)
2b10:0835  add [bx+si],al
2b10:0837  add [bx+si],al
2b10:0839  add [bx+si],al
2b10:083b  (bad)
2b10:083d  add [bx+si],al
2b10:083f  add [bx+si],al
2b10:0841  add [bx+si],ax
2b10:0843  add [bx+si],al
2b10:0845  add [bx+si],al
2b10:0847  pop es
2b10:0848  add [bx+si],al
2b10:084a  add [0],ax
2b10:084e  add [0],ax
2b10:0852  add [bx],ax
2b10:0854  add [bx+si],al
2b10:0856  add [bx],ax
2b10:0858  add [bx+si],al
2b10:085a  add [bx],ax
2b10:085c  add [bx+si],al
2b10:085e  add [6],ax
2b10:0862  add al,[6]
2b10:0866  add al,[5]
2b10:086a  add al,[di]
2b10:086c  add ax,306h
2b10:086f  push es
2b10:0870  add ax,200h
2b10:0873  push es
2b10:0874  push es
2b10:0875  add [bp+si],al
2b10:0877  add ax,505h
2b10:087a  add ax,[di]
2b10:087c  push es
2b10:087d  add [bp+si],al
2b10:087f  push es
2b10:0880  add ax,200h
2b10:0883  add ax,[bx+si]
2b10:0885  add ax,[bx+si]
2b10:0887  add ax,[bx+si]
2b10:0889  add ax,[bx+si]
2b10:088b  add ax,[bx+si]
2b10:088d  add ax,[bx+si]
2b10:088f  add ax,[bx+si]
2b10:0891  or [bx+si],al
2b10:0893  add ax,[bx+si]
2b10:0895  pop es
2b10:0896  add [800h],al
2b10:089a  add [bp+di],al
2b10:089c  add [si],al
2b10:089e  add [bp+di],al
2b10:08a0  add [600h],al
2b10:08a4  add [bp+di],al
2b10:08a6  add [bx+si],cl
2b10:08a8  add [bp+di],al
2b10:08aa  add [bp+di],al
2b10:08ac  add [bp+di],al
2b10:08ae  add [si],cl
2b10:08b0  add [bp+si],al
2b10:08b2  add [700h],al
2b10:08b6  add [bp+si],al
2b10:08b8  add [bp+di],al
2b10:08ba  add [bx+si],cl
2b10:08bc  add [bp+di],al
2b10:08be  add [bx],al
2b10:08c0  add [300h],al
2b10:08c4  add [bx+si],cl
2b10:08c6  add [bp+si],cl
2b10:08c8  add [1200h],al
2b10:08cc  adc al,fs:[bx+si]
2b10:08cf  adc al,[bx+si]
2b10:08d1  adc al,[bx+si]
2b10:08d3  adc al,[bx+si]
2b10:08d5  adc al,[bx+si]
2b10:08d7  adc ah,[si+12h]
2b10:08da  add [bp+si],dl
2b10:08dc  add [bp+di],dl
2b10:08de  add [bx+di],dl
2b10:08e0  add [bp+si],dl
2b10:08e2  add [bp+si],dl
2b10:08e4  adc al,fs:[bx+si]
2b10:08e7  adc al,[bx+si]
2b10:08e9  adc al,[bx+si]
2b10:08eb  adc al,[bx+si]
2b10:08ed  adc al,[bx+si]
2b10:08ef  adc ah,[si+12h]
2b10:08f2  add [bp+si],dl
2b10:08f4  add [bx+di],dl
2b10:08f6  add [bp+di],dl
2b10:08f8  add [bx+si],dl
2b10:08fa  add [bp+si],dl
2b10:08fc  adc ax,fs:[bx+si]
2b10:08ff  adc [bx+si],ax
