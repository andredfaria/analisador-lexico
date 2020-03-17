%{
#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"
#include "tabsim.h"
int linha=1,coluna=1;
%}
L [a-zA-Z_]
D [0-9]
%%
"if"  { coluna+=yyleng; return IF;}
"int"  { coluna+=yyleng; return INT;}
"float"  { coluna+=yyleng; return FLOAT; }
"char"  { coluna+=yyleng; return CHAR; }
"unsigned"  { coluna+=yyleng; return UNSIGNED; }
"struct"  { coluna+=yyleng; return STRUCT; }
"double"  { coluna+=yyleng; return DOUBLE; }
"boolean"  { coluna+=yyleng; return BOOLEAN; }
"long"  { coluna+=yyleng; return LONG; }
"short"  { coluna+=yyleng; return SHORT; }
"else"  { coluna+=yyleng; return ELSE; }
"while"  { coluna+=yyleng; return WHILE; }
"do"  { coluna+=yyleng; return DO; }
"for"  { coluna+=yyleng; return FOR; }
"switch"  { coluna+=yyleng; return SWITCH; }
"case"  { coluna+=yyleng; return CASE; }
"static"  { coluna+=yyleng; return STATIC; }
"sizeof"  { coluna+=yyleng; return SIZEOF; }
"const"  { coluna+=yyleng; return CONST; }
"break"  { coluna+=yyleng; return BREAK; }
"continue"  { coluna+=yyleng; return CONTINUE; }
"enum"  { coluna+=yyleng; return ENUM; }
"extern"  { coluna+=yyleng; return EXTERN; }
"goto"  { coluna+=yyleng; return GOTO; }
"register"  { coluna+=yyleng; return REGISTER; }
"return"  { coluna+=yyleng; return RETURN; }
"signed"  { coluna+=yyleng; return SIGNED; }
"typedef"  { coluna+=yyleng; return TYPEDEF; }
"union"  { coluna+=yyleng; return UNION; }
"void"  { coluna+=yyleng; return VOID; }
"volatile"  { coluna+=yyleng; return VOLATILE; }
"auto"  { coluna+=yyleng; return AUTO;}
"default"  { coluna+=yyleng; return DEFAULT;}
"define"  { coluna+=yyleng; return DEFINE;}
"include"  { coluna+=yyleng; return INCLUDE;}

"("  { coluna+=yyleng; return '('; }
")"  { coluna+=yyleng; return ')'; }
"{"  { coluna+=yyleng; return '{'; }
","  { coluna+=yyleng; return ','; }
"}"  { coluna+=yyleng; return '}'; }
"="  { coluna+=yyleng; return '='; }
"+"   { coluna+=yyleng; return '+'; }
";"   { coluna+=yyleng; return ';'; }
":"   { coluna+=yyleng; return ':'; }
"%"   { coluna+=yyleng; return '%'; }
"&"   { coluna+=yyleng; return '&'; }
"-"   { coluna+=yyleng; return '-'; }
"/"   { coluna+=yyleng; return '/'; }
"*"   { coluna+=yyleng; return '*'; }
">"   { coluna+=yyleng; return '>'; }
"<"   { coluna+=yyleng; return '<'; }
"."   { coluna+=yyleng; return '.'; }
"!"   { coluna+=yyleng; return '!'; }
"^"   { coluna+=yyleng; return '^'; }
"~"   { coluna+=yyleng; return '~'; }
"#"   { coluna+=yyleng; return '#'; }
">="   { coluna+=yyleng; return GE_OP; }
"<="   { coluna+=yyleng; return MENORIGUAL; }
"||"   { coluna+=yyleng; return OR; }
"=="   { coluna+=yyleng; return EQ; }
"!="   { coluna+=yyleng; return NOT_EQ; }
"&&"   { coluna+=yyleng; return AND; }
"++"   { coluna+=yyleng; return INCREMENTO; }
"--"   { coluna+=yyleng; return DECREMENTO; }
"<<"   { coluna+=yyleng; return DESL_ESQUERDA; }
">>"   { coluna+=yyleng; return DESL_DIREITA; }
"+="   { coluna+=yyleng; return INCREMENTO; }
"-="   { coluna+=yyleng; return DECREMENTO; }

{D}+("."{D}+)? {coluna+=yyleng; return NUM;}
{L}({L}|{D})* { coluna+=yyleng; return ID; }
[\t] {coluna += 8;}
[ ]  {coluna++; }
\n    { coluna =1; linha++;}
.  { printf("Erro Lexico na linha: %d,%d\n",linha,coluna); exit(1);}
%%

int yywrap() {
  return 1;
}

main(int argc, char ** argv)
{
int token, i=1;
  yyin = fopen(argv[1],"r");
  token = yylex();
  while(token) {
    printf("%d: %d -> %s\n", i++, token, yytext);
    token = yylex();
  }
	imprime();
}
