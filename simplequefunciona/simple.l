%{
#include <stdio.h>
#include "sint.h"
extern int yylex(void);
int line = 1;
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
"IF"    { return IF; }
"THEN"  { return THEN; }
"ELSE"  { return ELSE; }
"FI"    { return FI; }
"WHILE" { return WHILE; }
"DO"    { return DO; }
"OD"    { return OD; }
"PRINT" { return PRINT; }
"CODE" 	{ return CODE; }
"DECL" 	{ return DECL; }
"END" 	{ return END; }
"INT" 	{ return INT; }
"REAL" 	{ return REAL; }
"REPEAT" 	{ return REPEAT; }
"UNTIL" 	{ return UNTIL; }
[0-9]+  { yylval = atoi(yytext); return INT; }
[0-9]+("."[0-9]+)?  { yylval = atof(yytext); return REAL; }
[a-zA-Z]([a-zA-Z]|"_"|[0-9]){0,9} { return NAME; }
[ ]		 { }
\n       { line++; }               // { nextline(); }
\t       { ; }
"//".*\n { }               // { nextline(); }
.        { printf("Token invalido! %d\n", line); }
%%
yyerror(char *s){
	printf("Erro na linha %d\n", line);
}
#ifndef yywrap
yywrap() { return 1; }
#endif

