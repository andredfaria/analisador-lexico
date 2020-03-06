int aux1,aux2,topo=0;

int pilha[10000];
int mem[26];

void push(int valor){
    pilha[topo++] = valor;
}   

int pop(){
    return pilha[--topo];
}   