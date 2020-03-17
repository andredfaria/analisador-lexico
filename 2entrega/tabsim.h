#define MAX 1000

typedef struct symbol {
	char nome[30];
	int tamanho,tipo;
	
}symbol;

typedef struct node{
	symbol conteudo;
	struct node *prox;
}node;

typedef struct list{
	struct node *inicio;
	struct node *fim;
}list;

void criaLista();
int insere(char *nome);
int procura(char * nome);
void imprime();
char * obtemNome(int pos);
int tamanho = 0;
int posicao = 0;

list lista;

void criaLista(){
	lista.inicio = NULL;
	lista.fim = NULL;
}

int insere(char *nome){	
	node *aux;
	int posicaoVez = 0;

	posicaoVez = procura(nome);
	
	if(posicaoVez == -1){
	
		aux = (node*) malloc(sizeof(node));
		if(aux = NULL)
			return 0;

		if(lista.inicio = NULL){
			lista.inicio = aux;
		}else{
			lista.fim->prox = aux;
		}

		strcpy(aux->conteudo.nome,(const char*) nome);
		aux->prox = NULL;
		lista.fim = aux;

		posicaoVez = posicao++;
	}
	return posicaoVez;
}

int procura(char *nome){

	node *aux;
	int posicaoVez=0; 

	aux = lista.inicio;

	if(aux == NULL)
		return -1;
	while(aux != NULL){
		if(strcmp(aux->conteudo.nome,nome)==0){
			return posicaoVez;
		}
		aux = aux->prox;
		posicaoVez++;
	}
	return -1;
}

void imprime(){
	node *aux;
	int posicaoVez = 0;
	
	if(lista.inicio == NULL)
		printf("\nLista vazia ...\n\n");
	else{
		printf("\n\nTabela de Símbolos:\n");
		aux = lista.inicio;
		while(aux != NULL){
			printf("Posicao %d: %s\n", posicaoVez, aux->conteudo.nome);
			aux = aux->prox;
			posicaoVez++;
		}
	}
}

char *obtemNome(int pos){
	node *aux;
	aux = lista.inicio;
	
	if(pos > posicao){
		char *invalido = "Não temos essa posição na tabela de símbolos";
		return invalido;
	}

	for(int cont = 0; cont < pos; cont++){
		aux = aux->prox;
	}
	return aux->conteudo.nome;
}
	
