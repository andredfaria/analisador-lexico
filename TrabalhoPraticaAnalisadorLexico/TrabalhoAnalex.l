%{
#include <stdio.h>
#include <stdlib.h>
#include "tokens.h"
int linha=1,coluna=1;
%}
L [a-zA-Z]
D [0-9]
%%

"IF"|"if"                     { coluna+=yyleng; return IF;}
"int"|"INT"|"inteiro"         { coluna+=yyleng; return INT;}
"else"|"ELSE"                 { coluna+=yyleng; return ELSE; }
"while"                       { coluna+=yyleng; return WHILE; }
"WHILE"                       { coluna+=yyleng; return WHILE; }
"do"|"DO"                     { coluna+=yyleng; return DO; }
"vazio"|"void"                { coluna+=yyleng; return VOID;}
"DOUBLE"                      { coluna+=yyleng; return DOUBLE;}
"CHAR"                         { coluna+=yyleng; return CHAR;}
"STRUCT"                     { coluna+=yyleng; return STRUCT;}
"AUTO"                  { coluna+=yyleng; return AUTO;}
"BREAK"                 { coluna+=yyleng; return BREAK;}
"CASE"                   { coluna+=yyleng; return CASE;}
"CONST"                 { coluna+=yyleng; return CONST;}
"CONTINUE"               { coluna+=yyleng; return CONTINUE;}
"DEFAULT"               { coluna+=yyleng; return DEFAULT;}
"ENUM"                  { coluna+=yyleng; return ENUM;}
"EXTERN"                 { coluna+=yyleng; return EXTERN;}
"FLOAT"                    { coluna+=yyleng; return FLOAT;}
"GOTO"                    { coluna+=yyleng; return GOTO;}
"LONG"                { coluna+=yyleng; return LONG;}
"REGISTER"            { coluna+=yyleng; return REGISTER;}
"RETURN"                { coluna+=yyleng; return RETURN;}
"SHORT"              { coluna+=yyleng; return SHORT;}
"SIGNED"               { coluna+=yyleng; return SIGNED;}
"SIZEOF"              { coluna+=yyleng; return SIZEOF;}
"STATIC"              { coluna+=yyleng; return STATIC;}
"SWITCH"               { coluna+=yyleng; return SWITCH;}
"TYPEDEF"             { coluna+=yyleng; return TYPEDEF;}
"UNION"              { coluna+=yyleng; return UNION;}
"UNSIGNED"           { coluna+=yyleng; return UNSIGNED;}
"VOID"               { coluna+=yyleng; return VOID;}
"VOLATILE"           { coluna+=yyleng; return VOLATILE;}

"("|"abreparenteses"          { coluna+=yyleng; return '('; }
")"|"fechaparenteses"         { coluna+=yyleng; return '('; }
"{"|"abrechave"               { coluna+=yyleng; return '{'; }
","|"virgular"                { coluna+=yyleng; return ','; }
"}"|"fechachave"              { coluna+=yyleng; return '}'; }
"="|"igual"                   { coluna+=yyleng; return '='; }
"+"|"maior"                   { coluna+=yyleng; return '+'; }
";"|"pontoevirgula"           { coluna+=yyleng; return ';'; }
">="|"maiorigual"             { coluna+=yyleng; return GE_OP; }

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
}
