# Aula 1.0

Temos o seguinte arquivo, _idade.txt_, ele possui o conteúdo
abaixo:

```
A idade do grupo de baralho:
  - Maria tem 40 anos;
  - Jorge tem 49 anos;
  - Carla tem 68 anos;
  - Sílvio tem 12 anos;
  - Gomes tem 34 anos;
  - Pablo tem 22 anos.
```

Nosso objetivo é extrair deste arquivo os números inteiros
presentes. Para tanto, vamos utilizar algumas ferramentas do
_shell_ e na sequência o código em _lex_ que é nosso alvo de
aprendizado.

## Usando o comando grep

O comando _grep_ é sem sombra de duvida um dos comandos mais
simples na extração de dados de arquivos textos. Sendo assim,
basta determinar a expressão regular que case com os inteiros
presentes no arquivo e aplicar.

```
                   vvvvvvvvv - o nome do arquivo
$ grep -E '[0-9]+' idade.txt
        ^  ^^^^^^
        |  | - a expressão regular propriamente dita, no formato
        |      de lista
        |
        | - ativa o uso de expressão regular
```

comando e saída:

```
$ grep -E '[0-9]+' idade.txt
  - Maria tem 40 anos;
  - Jorge tem 49 anos;
  - Carla tem 68 anos;
  - Sílvio tem 12 anos;
  - Gomes tem 34 anos;
  - Pablo tem 22 anos.

```

## Usando o comando sed

O comando _sed_ é tão simples quanto o _grep_, e mais poderoso
tanto na criação de expressões regulares quanto na substituição
de termos.

```
$ sed -n 's/.* \([0-9]\+\) .*/A idade é: \1/p' idade.txt
A idade é: 40
A idade é: 49
A idade é: 68
A idade é: 12
A idade é: 34
A idade é: 22
```

## Usando o lex

Como visto anteriormente, definimos uma expressão regular e
extraimos os números inteiros do arquivo, agora faremos o mesmo
mas neste caso utilizando nosso analizador sintático _lex_.

Escrevemos um arqui que se subdivide em três sessoes, separadas
por **%%**, onde a primeira possui os cabeçalhos de um programa
em C, como inclusão de headers, locais ou não, definiçoes de
protótipos de funçoes e declarações de variáveis globais ou
tipos, entenda também estruturas e tipos.

arquivo: exemplo-01.l

```
%{
#include <stdio.h>
#include <stdlib.h>
%}

%%
[0-9]+
{
    printf ("A idade é: %s\n", yytext);
}

.  ;
\n ;

%%

int main (void)
{
    yylex();
    return EXIT_SUCCESS;
}
```

compilando:

```
$ make
lex exemplo-01.lex
cc lex.yy.c -o exemplo -ll
```

usando:

```
$ cat idade.txt  | ./exemplo
A idade é: 40
A idade é: 49
A idade é: 68
A idade é: 12
A idade é: 34
A idade é: 22
```
