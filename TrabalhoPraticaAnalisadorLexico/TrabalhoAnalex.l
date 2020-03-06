%{
#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"
int linha=1,coluna=1;
%}
L [a-zA-Z]
D [0-9]
%%

"IF"|"if"|"se"|"SE"           { coluna+=yyleng; return IF;}
"int"|"INT"|"inteiro"         { coluna+=yyleng; return INT;}
"else"|"ELSE"|"SENAO"|"senao" { coluna+=yyleng; return ELSE; }
"while"|"WHILE"|"enquanto"    { coluna+=yyleng; return WHILE; }
"do"|"DO"|"faca"              { coluna+=yyleng; return DO; }
"for"|"FOR"                   { coluna+=yyleng; return FOR; }
"float"|"DOUBLE"|"FLOAT"      { coluna+=yyleng; return DOUBLE; }
"caracter"|"CHAR"|"CHAR"      { coluna+=yyleng; return CHAR; }
"STRUCT"|"struct"|"obj"       { coluna+=yyleng; return STRUCT; }
"BREAK"|"break"|"para"        { coluna+=yyleng; return BREAK; }
"CASE"|"case"|"caso"          { coluna+=yyleng; return CASE; }
"CONTINUE"|"continue"         { coluna+=yyleng; return CONTINUE; }
"SWITCH"|"switch"             { coluna+=yyleng; return SWITCH; }
"CONST"|"const"|"constante"   { coluna+=yyleng; return CONST; }
"DEFAULT"|"default"           { coluna+=yyleng; return DEFAULT; }
"("|"abreparenteses"          { coluna+=yyleng; return '('; }
")"|"fechaparenteses"         { coluna+=yyleng; return '('; }
"{"|"abrechave"               { coluna+=yyleng; return '{'; }
","|"virgular"                { coluna+=yyleng; return ','; }
"}"|"fechachave"              { coluna+=yyleng; return '}'; }
"="|"igual"                   { coluna+=yyleng; return '='; }
"+"|"maior"                   { coluna+=yyleng; return '+'; }
";"|"pontoevirgula"           { coluna+=yyleng; return ';'; }
">="|"maiorigual"             { coluna+=yyleng; return GE_OP; }
"vazio"|"void"|"VOID"         { coluna+=yyleng; return VOID;}
"statico"|"STATIC"|"static"   { coluna+=yyleng; return STATIC;}
"typedef"|"TYPEDEF"           { coluna+=yyleng; return TYPEDEF;}
"union"|"UNION"         { coluna+=yyleng; return UNION;}
"unsigned"|"UNSIGNED"          { coluna+=yyleng; return UNSIGNED;}
"sizeof"|"SIZEOF"             { coluna+=yyleng; return SIZEOF;}

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

void main(int argc, char ** argv){
int token, i=1;
  yyin = fopen(argv[1],"r");
  token = yylex();
  while(token) {
    printf("%d: %d -> %s\n", i++, token, yytext);
    token = yylex();
  }
}
