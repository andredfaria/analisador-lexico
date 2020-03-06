#include "analex.h"
#include "pilha.h"

int token;

void erro();
void E();
void Elinha();
void T();
void Tlinha();
void reconhece(int t);
void F();

void main() {
    token = analex();
    E();

    if(token == ';'){
      printf("\n %d \n ", pop());
    }else{
      erro();
    }

}

void erro(){
  printf("\n\nERRO SINTATICO\n");
}

void E(){
  T();
  Elinha();
}

void Elinha(){
  switch (token){
    case '-':
      printf("-");
      reconhece('-');

      T();

      aux1 = pop();
      aux2 = pop();
      push(aux1+aux2);
      break;
    case '+':
      printf("+");
      reconhece('+');
      aux1 = pop();
      aux2 = pop();
      push(aux1+aux2);
      break;
    }
  }
  
  printf("%d", token);
  T();
  Elinha();

}

void T(){
  F();
  Tlinha();

}

void Tlinha(){
  switch (token){
    case '*':
      printf("*");
      reconhece('*');
      aux1 = pop();
      aux2 = pop();
      push(aux1+aux2);
      break;
    case '/':
      printf("/");
      reconhece('/');
      aux1 = pop();
      aux2 = pop();
      push(aux1+aux2);
      break;
  }
}

void reconhece(int t){
  if(t==token){
    token = analex();
  }else{
    erro();
  }
}

void F(){
  switch (token){
    case NUM:
      printf(NUM);
      push(tokenval)
    case ')':
      printf(")");
      reconhece(')');
      break;
    case '(':
      printf("(");
      reconhece('(');
      break;

  }
}