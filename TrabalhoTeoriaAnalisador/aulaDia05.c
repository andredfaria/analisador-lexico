#include <stdio.h>
#include "analex.h"
#include "pilha.h"
int token;

void reconhece(int t);
void E();
void E_linha();
void T();
void T_linha();
void F();
void erro();


void main(){
	token = analex();
	E();
	if(token==';')
	{
		printf("\n %d\n",pop());
		printf("\n SINTATICAMENTE CORRETA\n");
	}
	else erro();
}

void reconhece(int t){
	if(t==token){
		token=analex();
	}
	else erro();
}

void F(){
	if(token==NUM){
		printf("%d ", tokenval);
		push(tokenval);
		reconhece(NUM);
	}
	else if(token=='('){
		reconhece('(');
		E();
		reconhece(')');
	}
}

void E(){
	T();
	E_linha();
}

void E_linha(){
	switch(token){
		case '+':
			reconhece('+');
			T();
			E_linha();
			printf("+ \n");

			aux1 = pop();
			aux2 = pop();

			push(aux2+aux1);
			break;
		case '-':
			reconhece('-');
			T();
			E_linha();
			printf("- \n");

			aux1 = pop();
			aux2 = pop();

			push(aux2+aux1);

			aux1 = pop();
			aux2 = pop();

			push(aux2-aux1);
			break;
	}
}
void T_linha(){
	switch(token){
		case '*':
			reconhece('*');
			F();
			T_linha();
			printf("* \n");
			aux1 = pop();
			aux2 = pop();
			push(aux2*aux1);
			break;
		case '/':
			reconhece('/');
			F();
			T_linha();
			printf("/ \n");
			aux1 = pop();
			aux2 = pop();
			push(aux2/aux1);
			break;
	}
}
void T(){
	F();
	T_linha();
}

void erro(){
	printf("\nEncontrou um erro\n\n");
}