import java_cup.runtime.Symbol;
import java.util.*;
import java.io.*;

public class Compiler {
	public static void main(String[] args) {
		if(args.length != 1) {
			System.err.println("ERROR: Invalid number of command line arguments.");
			System.err.println("Usage: java Compiler file.java");
			System.exit(1);
		}
		Symbol parse_tree = null;
		try {
			ExprParser parser_obj = new ExprParser(new ExprLex(new FileInputStream(args[0])));
			parse_tree = parser_obj.parse();
			// ArrayList a = ((ArrayList)parse_tree.value);
			// for(Iterator iter=a.iterator(); iter.hasNext(); )
			// {
			// 	Node root = (Node)iter.next();
			// 	int result = root.visit();
			// 	System.out.println(" = " + result);
			// }
		}
		catch (IOException e) {
			System.err.println("ERROR: Unable to open file: " + args[0]);
		} catch (Exception e) {
			e.printStackTrace(System.err);
		}
	}
}