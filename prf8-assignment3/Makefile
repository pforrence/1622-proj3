lexer_parser: ExprParser.cup ExprLex.flex java-cup-11a.jar
	jflex ExprLex.flex
	java -jar java-cup-11a.jar -interface -parser ExprParser ExprParser.cup
	javac syntaxtree/*.java
	javac visitor/*.java

compiler: Compiler.java ExprParser.java ExprLex.java 
	javac Compiler.java 

clean: 
	$(RM) *.class
	$(RM) ExprLex.java*
	$(RM) ExprParser.java*
	$(RM) sym.java*
