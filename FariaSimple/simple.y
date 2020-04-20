%{
#include "analex.c"
#include <stdio.h>
%}

%token UAU
%token EQ
%token NE
%token LT
%token LE
%token GT
%token GE
%token PLUS
%token MINUS
%token MULT
%token DIVIDE
%token RPAREN
%token LPAREN
%token ASSIGN
%token SEMICOLON
%token DOISPONTOS
%token PRINT
%token IF
%token THEN
%token ELSE
%token FI
%token WHILE
%token DO
%token OD
%token NAME
%token NUMREAL
%token NUMINT
%token REAL
%token INT
%token DECL
%token CODE
%token END
%token REPEAT
%token UNTIL

%%

program:
  DECL varseq CODE stmtseq END
  ;

varseq:
     varseq variavel { }
   | variavel { }
   ;

variavel:
     NAME DOISPONTOS tipovar SEMICOLON
     ;

tipovar:
     INT
   | REAL
   ;

statement:
     designator ASSIGN expression   { printf("Atribuicao\n"); }
   | PRINT expression               { printf("Impressao\n");  }
   | IF expression THEN stmtseq ELSE stmtseq FI { printf("Comando IF-THEN-ELSE\n"); }
   | IF expression THEN stmtseq FI  { printf("Comando IF-THEN\n");      }
   | WHILE expression DO stmtseq OD { printf("Comando WHILE\n");      }
   | REPEAT stmtseq UNTIL expression { printf("Comando REPEAT\n");      }
   ;

stmtseq:
     stmtseq SEMICOLON statement { }
   | statement { }
   ;

expression:
     expr2 { } 
   | expr2 EQ expr2 { }
   | expr2 NE expr2 { }
   | expr2 LT expr2 { }
   | expr2 LE expr2 { }
   | expr2 GT expr2 { }
   | expr2 GE expr2 { }
   ;

expr2:
     expr3 { }
   | expr2 PLUS expr3 { }
   | expr2 MINUS expr3 { }
   ;

expr3:
     expr4 { }
   | expr3 MULT expr4 {}
   | expr3 DIVIDE expr4 { }
   ;
expr4:
     PLUS expr4 { }
   | MINUS expr4 { }
   | LPAREN expression RPAREN { }
   | NUMINT { }
   | NUMREAL { }
   | designator { }
   ;

designator:
     NAME { }
   ;

%%


extern FILE *yyin;

main ()
{
  do { yyparse(); }
  while (!feof(yyin));
}

