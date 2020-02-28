%option noyywrap
%{

int chars = 1;//contador de char
int token = 0;//contador de token
int lines = 1;//contador de linha
int lines2 = 0;
int chars2 = 1;
int pula_linha = 0;
int i=0;
char *string;


%}

%%

"vazio"             {printf("VOID");chars+=strlen(yytext);token++;}
"interiro"          {printf("INT");chars+=strlen(yytext);token++;}
"caracter"          {printf("CHAR");chars+=strlen(yytext);token++;}
"retorno"           {printf("RETURN");chars+=strlen(yytext);token++;}
"pausa"             {printf("BREAK");chars+=strlen(yytext);token++;}
"opcoes"            {printf("SWITCH");chars+=strlen(yytext);token++;}
"caso"              {printf("CASE");chars+=strlen(yytext);token++;}
"default"           {printf("DEFAULT");chars+=strlen(yytext);token++;}
"do"                {printf("DO");chars+=strlen(yytext);token++;}
"enquanto"          {printf("WHILE");chars+=strlen(yytext);token++;}
"para"              {printf("FOR");chars+=strlen(yytext);token++;}
"se"                {printf("IF");chars+=strlen(yytext);token++;}
"senao"             {printf("ELSE");chars+=strlen(yytext);token++;}
"definicao"         {printf("TYPEDEF");chars+=strlen(yytext);token++;}
"objeto"            {printf("STRUCT");chars+=strlen(yytext);token++;}
"mais"              {printf("+");chars+=strlen(yytext);token++;}
"menos"             {printf("-");chars+=strlen(yytext);token++;}
"vezes"             {printf("*");chars+=strlen(yytext);token++;}
"dividir"           {printf("/");chars+=strlen(yytext);token++;}
"maismais"          {printf("++");chars+=strlen(yytext);token++;}
"menosmenos"        {printf("--");chars+=strlen(yytext);token++;}
"e"                 {printf("&");chars+=strlen(yytext);token++;}
"pipe"              {printf("|");chars+=strlen(yytext);token++;}
"tio"               {printf("~");chars+=strlen(yytext);token++;}
"circunflexo"       {printf("^");chars+=strlen(yytext);token++;}
"nao"               {printf("!");chars+=strlen(yytext);token++;}
"EE"                {printf("&&");chars+=strlen(yytext);token++;}
"OU"                {printf("||");chars+=strlen(yytext);token++;}
"igual"             {printf("==");chars+=strlen(yytext);token++;}
"diferente"         {printf("!=");chars+=strlen(yytext);token++;}
"maior"  	        {printf("<");chars+=strlen(yytext);token++;}
"menor"	            {printf(">");chars+=strlen(yytext);token++;}
"menorigual"        {printf("<=");chars+=strlen(yytext);token++;}
"maiorigual"        {printf(">=");chars+=strlen(yytext);token++;}
"recebe"            {printf("=");chars+=strlen(yytext);token++;}
"maisigual"         {printf("+=");chars+=strlen(yytext);token++;}
"menosigual"        {printf("-=");chars+=strlen(yytext);token++;}
"pontoevirgula"      {printf(";");chars+=strlen(yytext);token++;}
"virgula"           {printf(",");chars+=strlen(yytext);token++;}
"doisponto"         {printf(":");chars+=strlen(yytext);token++;}
"abreparenteses"    {printf("(");chars+=strlen(yytext);token++;}
"fechaparenteses"   {printf(")");chars+=strlen(yytext);token++;}
"abrechaves"        {printf("{");chars+=strlen(yytext);token++;}
"fechachaves"       {printf("}");chars+=strlen(yytext);token++;}
"abrecolchetes"     {printf("[");chars+=strlen(yytext);token++;}
"fechacolchetes"    {printf("]");chars+=strlen(yytext);token++;}
"interrogacao"      {printf("?");chars+=strlen(yytext);token++;}
"hashtag"           {printf("#");chars+=strlen(yytext);token++;}
"aponta"            {printf("->");chars+=strlen(yytext);token++;}

"escreve"           {printf("PRINTF");chars+=strlen(yytext);token++;}
"le"                {printf("SCANF");chars+=strlen(yytext);token++;}
"define"            {printf("DEFINE");chars+=strlen(yytext);token++;}
"sair"              {printf("EXIT");chars+=strlen(yytext);token++;}

%%

int token;

int main(int arc, char **argv){
   yylex();
   return 0;
}

