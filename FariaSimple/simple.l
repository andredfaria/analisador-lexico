%{

#include <stdio.h>
#include "sint.h"

extern int yylex(void);
int linha=1;


%}

%%
"="   { return EQ; }
"!="  { return NE; }
"<"   { return LT; }
"<="  { return LE; }
">"   { return GT; }
">="  { return GE; }
"+"   { return PLUS; }
"-"   { return MINUS; }
"*"   { return MULT; }
"/"   { return DIVIDE; }
")"   { return RPAREN; }
"("   { return LPAREN; }
":="  { return ASSIGN; }
";"   { return SEMICOLON; }
":"   { return DOISPONTOS; }
"PRINT"  { return PRINT; }
"IF"     { return IF; }
"THEN"   { return THEN; }
"ELSE"   { return ELSE; }
"FI"     { return FI; }
"WHILE"  { return WHILE; }
"DO"     { return DO; }
"OD"     { return OD; }
"REPEAT" { return REPEAT; }
"UNTIL"  { return UNTIL; }
"DECL"   { return DECL; }
"CODE"   { return CODE; }
"END"    { return END; }
"INT"	 { return INT; }
"REAL"	 { return REAL; }
[0-9]+   { yylval = atoi(yytext); return NUMINT; }
[0-9]+"."[0-9]+  { yylval = atof(yytext); return NUMREAL; }
[a-zA-Z]([a-zA-Z]|"_"|[0-9]){0,9} { return NAME; }
\n       {linha++; }               // { nextline(); }
[ ]      { }
\t       { ; }
"//".*\n { }               // { nextline(); }
.        { printf("Token invalido! %d\n", linha);exit(1); }

%%
#ifndef yywrap
yywrap() { return 1; }
#endif

yyerror(char *s){
printf("Erro \n");
}
