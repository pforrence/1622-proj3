/*User Code */
import java_cup.runtime.Symbol;

%%

%class ExprLex
%cup
%implements sym
%line
%column
%ignorecase
%eofclose
%{
  private void error(String message) {
    System.err.println("Error at line "+(yyline+1)+", column "+(yycolumn+1)+" : "+message);
  }
%}


Identifier = [a-zA-Z_][a-zA-Z0-9_]*
Int =  0 | [1-9][0-9]* | 0[xX][0-9a-fA-F]+ | 0[0-7]+
LineBreak = \r|\n|\r\n|\z
Comment = \/\/[^\r\n]*{LineBreak}?
BlockComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
WhiteSpace = {LineBreak} | [ \t\f]



%% 
/*keywords */

{BlockComment} {/*Do Nothing*/}
{Comment} {/*Do Nothing*/}
"class" {return symbol(CLASS);}
"extends" {return symbol(EXTENDS);}
"public" {return symbol(PUBLIC);}
"static" {return symbol(STATIC);}
"void" {return symbol(VOID);}
"String" {return symbol(STRING);}
"new" {return symbol(NEW);}
"return" {return symbol(RETURN);}

/*Types*/
"int" {return symbol(INT_TYPE);}
"boolean" {return symbol(BOOLEAN_TYPE);}

 
/*Statement*/
"if" {return symbol(IF);}
"else" {return symbol(ELSE);}
"while" {return symbol(WHILE);}

/*operators*/
"=" {return symbol(EQ, yyline+1, yycolumn+1);}
"&&" {return symbol(AND, yyline+1, yycolumn+1);}
"|" {return symbol(OR, yyline+1, yycolumn+1);}
"<" {return symbol(LESSTHAN, yyline+1, yycolumn+1);}
"+" {return symbol(PLUS, yyline+1, yycolumn+1);}
"-" {return symbol(MINUS, yyline+1, yycolumn+1);}
//"–" {return symbol(MINUS);}
"*" {return symbol(MULT, yyline+1, yycolumn+1);}
"length" {return symbol(LENGTH, yyline+1, yycolumn+1);}
"," {return symbol(COMMA, yyline+1, yycolumn+1);}
"!" {return symbol(NOT, yyline+1, yycolumn+1);}

/*more*/
"true" {return symbol(TRUE, yyline+1, yycolumn+1);}
"false" {return symbol(FALSE, yyline+1, yycolumn+1);}
"this" {return symbol(THIS, yyline+1, yycolumn+1);}


{Identifier} {return symbol(ID, yyline+1, yycolumn+1, yytext());}
"{" {return symbol(LBRACE, yyline+1, yycolumn+1);}
"}" {return symbol(RBRACE, yyline+1, yycolumn+1);}
{Int} {return new Symbol(INT, yyline+1, yycolumn+1, new Integer (Integer.decode(yytext())));}
"(" {return symbol(LPAREN, yyline+1, yycolumn+1);}
")" {return symbol(RPAREN, yyline+1, yycolumn+1);}
"System.out.println" {return symbol(PRINT, yyline+1, yycolumn+1);}
"." {return symbol(DOT, yyline+1, yycolumn+1);}

"[" {return symbol(LBRACKET, yyline+1, yycolumn+1);}
"]" {return symbol(RBRACKET, yyline+1, yycolumn+1);}
";" {return symbol(SEMICOLON, yyline+1, yycolumn+1);}


{WhiteSpace} { /*Do Nothing*/ }
/* error fallback */
.|\n	{ error("Illegal character <"+ yytext()+">"); }
