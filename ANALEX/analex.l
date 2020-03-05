%{
#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"
int linha=1,coluna=1;
%}
L [a-zA-Z]
D [0-9]
%%
"char" { coluna+=yyleng; return CHAR; }
"double" { coluna+=yyleng; return DOUBLE; }
"se"  { coluna+=yyleng; return SE;}
"int"  { coluna+=yyleng; return INT;}
"while"  { coluna+=yyleng; return WHILE; }
"do"  { coluna+=yyleng; return DO; }
"else"  { coluna+=yyleng; return ELSE; }
"("  { coluna+=yyleng; return '('; }
")"  { coluna+=yyleng; return ')'; }
"{"  { coluna+=yyleng; return '{'; }
","  { coluna+=yyleng; return ','; }
"}"  { coluna+=yyleng; return '}'; }
"="  { coluna+=yyleng; return '='; }
"+"   { coluna+=yyleng; return '+'; }
";"   { coluna+=yyleng; return ';'; }
">="   { coluna+=yyleng; return GE_OP; }
{D}+("."{D}+)? {coluna+=yyleng; return NUM;}
{L}({L}|{D})* { coluna+=yyleng; return ID; }
[\t] {coluna += 8;}
[ ]  {coluna++; }
\n    { coluna =1; linha++;}
.  { printf("Erro Lexico na linha: %d,%d\n",linha,coluna); exit(1);}
%%

int yywrap(){
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
}





