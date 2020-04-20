%{
#include "sint.h"
extern int yyllex(void);
int line=1, coluna=1;
%}

%%
"="   { return EQ; coluna++;}
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
":"   { return COLON;}
"IF"     { return IF; }
"THEN"   { return THEN; }
"ELSE"   { return ELSE; }
"FI"     { return FI; }
"WHILE"  { return WHILE; }
"DO"     { return DO; }
"OD"     { return OD; }
"PRINT"  { return PRINT; }
"CODE"  { return CODE; }
"DECL"  { return DECL; }
"END"  { return END; }
"REAL"  { return REAL; }
"INT"  { return INT; }
"REPEAT"  { return REPEAT; }
"UNTIL"  { return UNTIL; }
[0-9]+   { yylval = atoi(yytext); return NUMINT; }
[0-9]+"."[0-9]+  { yylval = atof(yytext); return NUMREAL; }
[a-zA-Z][a-zA-Z_0-9]{0,9} { yylval = yytext[0] - 'a'; return NAME; }
\        { ; }
\n       { line++; coluna=1;}               
\t       { ; }
"//".*\n { }               
.        { printf("token ilegal: %s na linha %d\n",yytext, line); }
%%
yyerror(char *s) {
   printf("Erro linha %d, \n%s",line, s);
}
#ifndef yywrap
yywrap() { return 1; }
#endif
