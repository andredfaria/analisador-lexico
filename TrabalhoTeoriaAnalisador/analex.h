#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

#define NUM 256

int tokenval;
int linha=1;

int analex()
{
char ch;

   tokenval = 0;

   ch = getchar();

   if (ch == ' ' || ch == '\n' || ch == '\t') 
     do {
       if (ch == '\n') linha++;
       ch = getchar();
     } while(ch == ' ' || ch == '\n' || ch == '\t');

   if (ch == '+')
     return '+';

   if (ch == '-')
     return '-';

   if (ch == '*')
     return '*';

   if (ch == '/')
     return '/';

   if (ch == '(')
     return '(';

   if (ch == ')')
     return ')';

   if (ch == ';')
     return ';';

   if (ch == '=')
     return '=';
     
   if ( isdigit(ch) ) {
     tokenval =  ch - '0';
     ch = getchar();
     while (isdigit(ch))
     {
       tokenval = tokenval*10 + ch - '0';
       ch = getchar();
     }
     ungetc(ch, stdin);
     return NUM;
   }

   printf("ERRO LEXICO na linha %d!!!\n\n", linha);
   exit(1);

}

