
# Objetivo;
O objetivo deste script em **Batch** é **automatizar a criação de diretórios** organizados por **ano, mês e dia**, baseando-se em um calendário. Ele recebe como parâmetros o ano e o mês, determinando automaticamente a quantidade correta de dias, inclusive considerando anos bissextos. Essa automação torna o processo mais rápido, resolvendo o problema da criação manual de pastas, sendo útil para a organização de arquivos e registros no dia-a-dia.

## Processo detalhado e explicação.

**1-** Primeiramente, começamos com o comando **@Echo off**, para *desativar a exibição dos comandos na tela*. Se não tivéssemos colocado ele, o terminal mostraria **todos** os comandos antes de rodá-los.


**2-** Após isso, os *parâmetros* **%1** e **%2** foram adicionados ao script, junto com o comando **Echo**, que faz com que esses valores sejam exibidos na tela.


(Os parâmetros são **valores** que passamos ao executar um script *Batch no Prompt de Comando. Eles permitem que o usuário escolha *nomes* de pastas sem precisar editar o código, tornando o script mais *prático.*)



**3**- Depois, criamos as **pastas principais**, para garantir que os arquivos do calendário fiquem organizados dentro da estrutura correta. Para isso, criei uma pasta com o nome do *ano* e dentro dela uma pasta com o nome do *mês.*
foto

```markdown
mkdir %1 → Cria uma pasta com o nome do ano (exemplo: 2025).
cd %1 → Entra na pasta do ano.
mkdir %2 → Cria uma subpasta com o nome do mês (ex: 2).
cd %2 → Entra na pasta do mês.
```



**4-** Então, para saber qual mês estamos processando, para poder criar a quantidade correta de pastas, colocamos o **set**, que é usado para *atribuir um valor a uma variável* nesse caso, colocamos o primeiro valor passado (ano) à variável *year*

set year=%1

E também o segundo valor passado (mês) à variável month. Nesse caso, o mês 2 representa fevereiro.

set month=%2 


```markdown
Obs: esses valores também podem ser chamados de parâmetros.
```

5- Após isso, deveriamos verificar se o ano é bissexto, pois se sim, o mês de fevereiro teria 29 dias.
Para fazer isso, é possível utilizar três regras matemáticas. 
Se o ano for divisível por 4, ele pode ser bissexto.
Se o ano for divisível por 100, ele não é bissexto, exceto se for também divisível por 400.

Então, para essas regras, criamos três variáveis para verificar se o ano era divisível por 4, 100 e 400, respectivamente. Então, o código segue as regras para determinar se o ano é bissexto ou não, e define a variável anoBissexto como 1 ou 0.

divisivelPor4: armazena o resto da divisão do ano por 4 (year %% 4).
divisivelPor100: armazena o resto da divisão do ano por 100 (year %% 100).
divisivelPor400: armazena o resto da divisão do ano por 400 (year %% 400).

E então, coloquei outra parte do código para a verificação.

Verificar se o ano é divisível por 4
Nessa parte, O código começa verificando se o ano é divisível por 4. Se sim, ele entra no bloco de comandos seguinte. Caso contrário, o ano não é bissexto e o código vai para o bloco else no final.
if %divisivelPor4%==0 (
Verificar se o ano é divisível por 100

   if %divisivelPor100%==0 (

Agora, o código verifica se o ano também é divisível por 100. Se for, o código continua para o próximo if (que verifica a divisibilidade por 400). Se não for divisível por 100, o ano é considerado bissexto e o código pula para o próximo bloco.
Verificar se o ano é divisível por 400

       if %divisivelPor400%==0 (

Se o ano for divisível por 100, o código entra nesse outro segundo if e verifica se ele também é divisível por 400.
Se o ano for divisível por 400, ele é bissexto. Então, defini a variável anoBissexto como 1, que indica que o ano é bissexto.
    set anoBissexto=1
Se o ano não for divisível por 400, mas for divisível por 100, então não é bissexto. Então, para indicar isso, defini a variável anoBissexto como 0.
Então, se o ano não for divisível por 100, mas for divisível por 4, então o ano é bissexto. Para esse caso, repetimos o processo da variável.
 ) else ( set anoBissexto=1 ) (else é usado para definir o que fazer quando a condição em um if não é verdadeira)
Se o ano não for divisível por 4, então não é bissexto e anoBissexto é definido como 0. 
set anoBissexto=0
Então, uma vez que eu soubesse se o ano era bissexto, eu poderia definir o número de dias em fevereiro. Se o ano fosse bissexto (anoBissexto=1), então fevereiro teria 29 dias. Caso contrário, teria 28 dias. 
if %anoBissexto%==1 
( echo %year% e um ano bissexto.
 set days=29
 ) else ( 
echo %year% nao e um ano bissexto. 
set days=28
Nessa parte, eu também coloquei o comando “echo” para exibir as frases na tela de acordo com o caso.
Depois de resolver o “problema” de fevereiro, eu defini a quantidade de dias para os outros meses usando If e a variável month. Sendo que, alguns meses tem 31 dias e outros tem 30.
if %month%==1 set days=31 
if %month%==3 set days=31
 if %month%==4 set days=30
 if %month%==5 set days=31
 if %month%==6 set days=30 
if %month%==7 set days=31 
if %month%==8 set days=31 if
 %month%==9 set days=30 
if %month%==10 set days=31 
if %month%==11 set days=30 
if %month%==12 set days=31
Agora,com o código já sabendo quantos dias cada mês tem, para criar a estrutura de pastas, eu usei um for /L que vai de 1 até o número de dias do mês. Esse comando cria uma pasta para cada dia, então se o mês tem 31 dias, o código cria 31 pastas numeradas de 1 a 31.
for /L %%D in (1,1,%days%) do ( mkdir %%D

