#include <string.h>
#include <stdio.h>
#include <stdlib.h>

struct symbol {
   char nome[30];
   int tamanho;
   int tipo;
};

int insere(char *nome);
int procura(char * nome);
char * obtemNome(int pos);
void imprimeTabela();

void imprimeTabela(){
    // printf("%d %d", symbol.tamanho, symbol.tipo);
    printf("BOA");
}

int insere(char *nome){
    printf("%s", nome);
}
