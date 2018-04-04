import java_cup.runtime.Symbol;
import java_cup.runtime.*;

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


/* keywords */

%% 

{BlockComment} {/*Do Nothing*/}
{Comment} {/*Do Nothing*/}

/*keywords */
"class" {return new Symbol(CLASS, yyline+1, yycolumn+1);}
"extends" {return new Symbol(EXTENDS, yyline+1, yycolumn+1);}
"public" {return new Symbol(PUBLIC, yyline+1, yycolumn+1);}
"static" {return new Symbol(STATIC, yyline+1, yycolumn+1);}
"void" {return new Symbol(VOID, yyline+1, yycolumn+1);}
"String" {return new Symbol(STRING, yyline+1, yycolumn+1);}
"new" {return new Symbol(NEW, yyline+1, yycolumn+1);}
"return" {return new Symbol(RETURN, yyline+1, yycolumn+1);}
"main" {return new Symbol(MAIN, yyline+1, yycolumn+1);}

/*Types*/
"int" {return new Symbol(INT_TYPE, yyline+1, yycolumn+1);}
"boolean" {return new Symbol(BOOLEAN_TYPE, yyline+1, yycolumn+1);}
 
/*Statement*/
"if" {return new Symbol(IF, yyline+1, yycolumn+1);}
"else" {return new Symbol(ELSE, yyline+1, yycolumn+1);}
"while" {return new Symbol(WHILE, yyline+1, yycolumn+1);}

/*operators*/
"=" {return new Symbol(EQ, yyline+1, yycolumn+1);}
"&&" {return new Symbol(AND, yyline+1, yycolumn+1);}
"<" {return new Symbol(LESSTHAN, yyline+1, yycolumn+1);}
"+" {return new Symbol(PLUS, yyline+1, yycolumn+1);}
"-" {return new Symbol(MINUS, yyline+1, yycolumn+1);}
//"–" {return new Symbol(MINUS);}
"*" {return new Symbol(MULT, yyline+1, yycolumn+1);}
"length" {return new Symbol(LENGTH, yyline+1, yycolumn+1);}
"," {return new Symbol(COMMA, yyline+1, yycolumn+1);}
"!" {return new Symbol(NOT, yyline+1, yycolumn+1);}

/*more*/
"true" {return new Symbol(TRUE, yyline+1, yycolumn+1);}
"false" {return new Symbol(FALSE, yyline+1, yycolumn+1);}
"this" {return new Symbol(THIS, yyline+1, yycolumn+1);}


{Identifier} {return new Symbol(ID, yyline+1, yycolumn+1, yytext());}
"{" {return new Symbol(LBRACE, yyline+1, yycolumn+1);}
"}" {return new Symbol(RBRACE, yyline+1, yycolumn+1);}
{Int} {return new  Symbol(INT, yyline+1, yycolumn+1, new Integer(Integer.decode(yytext())) );}
"(" {return new Symbol(LPAREN, yyline+1, yycolumn+1);}
")" {return new Symbol(RPAREN, yyline+1, yycolumn+1);}
"System.out.println" {return new Symbol(PRINT, yyline+1, yycolumn+1);}
"." {return new Symbol(DOT, yyline+1, yycolumn+1);}

"[" {return new Symbol(LBRACKET, yyline+1, yycolumn+1);}
"]" {return new Symbol(RBRACKET, yyline+1, yycolumn+1);}
";" {return new Symbol(SEMICOLON, yyline+1, yycolumn+1);}


{WhiteSpace} { /*Do Nothing*/ }
/* error fallback */
.|\n	{ error("Illegal character <"+ yytext()+">"); }
