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
			ExprParser parser_obj = new ExprParser(new ExprLex(new FileInputStream(args[0])));
			parse_tree = parser_obj.parse();

			Random rand = new Random();

		} catch (IOException e) {
			System.err.println("ERROR: Unable to open file: " + args[0]);
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}
}
