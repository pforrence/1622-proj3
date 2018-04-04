import java_cup.runtime.Symbol;
import java.io.*;
import java.util.*;
import visitor.*;
import syntaxtree.*;

public class Compiler {
	public static void main(String[] args) {
		if(args.length != 1) {
			System.err.println("ERROR: Invalid number of command line arguments.");
			System.err.println("Usage: java Interpreter file.asm");
			System.exit(1);
		}
		Symbol parse_tree = null;
		try {
			/*Parsing Phase*/

            Reader reader = new java.io.InputStreamReader(new java.io.FileInputStream(args[0]));
            ExprParser parser = new ExprParser(new ExprLex(reader));
            parse_tree = parser.parse();
            
            Program program = ((Program) parse_tree.value);
            program.accept(new PrettyPrintVisitor());

		} catch (IOException e) {
			System.err.println("ERROR: Unable to open file: " + args[0]);
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}
}
