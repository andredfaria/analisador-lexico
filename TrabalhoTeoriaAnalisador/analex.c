#include "analex.h"

main() {
    token = analex();
    E();

    if(tokeno != ';')
      erro();

}

void erro(){
  print('\n\nERRO SINTATICO\n');
}

void E(){
  T();
  Elinha();
}

void Elinha(){
  T();
  Elinha();


}

void T(){
  F();
  Tlinha();

}

void Tlinha(){
  F();
  Tlinha();

}

void F(){
  switch (token){
    case "*":
    
      break;
    case "/":

      break;
    case "-" :

      break;
    case "+" :

      break;
    case ")" :

      break;
    case "(" :

      break;
    default:
      erro();
  }


}