// Export Ghidra's recovered C as analysis material, not a compilable original.
// @category EYE2
import ghidra.app.script.GhidraScript;
import ghidra.app.decompiler.*;
import ghidra.program.model.listing.*;
import java.io.*;
import java.nio.charset.StandardCharsets;

public class DecompileAll extends GhidraScript {
    public void run() throws Exception {
        String[] args=getScriptArgs();
        File out=new File(args.length>0?args[0]:"analysis/decompiled");out.mkdirs();
        DecompInterface decomp=new DecompInterface();
        decomp.openProgram(currentProgram);
        int ok=0,failed=0;
        try(PrintWriter c=new PrintWriter(new File(out,"start.c"),StandardCharsets.UTF_8);
            PrintWriter index=new PrintWriter(new File(out,"functions.tsv"),StandardCharsets.UTF_8)) {
            c.println("/* Automatically recovered from the supplied DOS START.EXE by Ghidra 11.3.2.\n * Inferred types, function boundaries, and far pointers require manual validation.\n * Not original source, and not directly compilable. */\n");
            index.println("entry\tname\tbytes\tstatus");
            FunctionIterator functions=currentProgram.getFunctionManager().getFunctions(true);
            while(functions.hasNext()&&!monitor.isCancelled()) {
                Function f=functions.next();
                DecompileResults r=decomp.decompileFunction(f,20,monitor);
                c.println("\n/* "+f.getEntryPoint()+" "+f.getName()+" */");
                if(r.decompileCompleted()&&r.getDecompiledFunction()!=null){c.println(r.getDecompiledFunction().getC());ok++;}
                else {c.println("/* DECOMPILATION FAILED: "+r.getErrorMessage().replace("*/","* /")+" */");failed++;}
                index.println(f.getEntryPoint()+"\t"+f.getName()+"\t"+f.getBody().getNumAddresses()+"\t"+(r.decompileCompleted()?"ok":"failed"));
                if((ok+failed)%100==0)println("EYE2 exported "+ok+" functions, "+failed+" failed");
            }
        } finally {decomp.dispose();}
        println("EYE2 DECOMPILE COMPLETE: "+ok+" functions, "+failed+" failed. Language "+currentProgram.getLanguageID());
    }
}
