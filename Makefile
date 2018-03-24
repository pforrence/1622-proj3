compiler: ExprParser.cup ExprLex.flex java-cup-11a.jar
	jflex ExprLex.flex
	java -jar java-cup-11a.jar -interface -parser ExprParser ExprParser.cup

interpreter: Interpreter.java Instruction.java ExprParser.java ExprLex.java 
	javac Interpreter.java

clean: 
	$(RM) *.class
	$(RM) ExprLex.java*
	$(RM) ExprParser.java*
	$(RM) sym.java*