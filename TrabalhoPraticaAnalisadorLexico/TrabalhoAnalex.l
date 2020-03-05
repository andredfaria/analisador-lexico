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
"("|"abreparenteses"          { coluna+=yyleng; return '('; }
")"|"fechaparenteses"         { coluna+=yyleng; return '('; }
"{"|"abrechave"               { coluna+=yyleng; return '{'; }
","|"virgular"                { coluna+=yyleng; return ','; }
"}"|"fechachave"              { coluna+=yyleng; return '}'; }
"="|"igual"                   { coluna+=yyleng; return '='; }
"+"|"maior"                   { coluna+=yyleng; return '+'; }
";"|"pontoevirgula"           { coluna+=yyleng; return ';'; }
">="|"maiorigual"             { coluna+=yyleng; return GE_OP; }

"vazio"|"void"        { coluna+=yyleng; return VOID;}


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
