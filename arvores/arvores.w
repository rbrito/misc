% -*- tex -*-
\input acentos
\input epsf
\input cwebmac-br

% Minhas macros para plain TeX
\def\bull{$\bullet$}
\def\emph#1{{\it #1}}
\def\textbf#1{{\bf #1}}
\def\define#1{\emph{#1}}
\def\small#1{{\ninerm #1}}
\def\[{$$}
\def\]{$$}
\def\FIXME#1{\medskip\noindent{\bf FIXME.}\enspace{\sl #1}\medskip}

\def\title{ESTRUTURAS DE DADOS}
\datethis

% Fim do limbo.
%----------------------------------------------------------------------

@*Estruturas de Dados Recursivas. Em determinados casos, � mais
simples fornecer uma defini��o recursiva de uma estrutura de dados do
que dar uma defini��o n�o-recursiva. Por exemplo, uma elegante e simples
defini��o de listas � dada abaixo:

\proclaim Defini��o (Listas). As listas sobre um conjunto $V$ s�o as
estruturas definidas pelas seguintes regras (e apenas pelas seguintes
regras):
\item\bull A seq��ncia vazia $\varepsilon$ de elementos de $V$ � uma lista
sobre $V$;
\item\bull Se $L$ � uma lista e $v \in V$ � um elemento de $V$, ent�o
$L'=(v, L)$ � uma lista sobre $V$.

Por exemplo, a lista $L$ composta pelos inteiros $3$, $1$, $4$, $1$ e
$5$ �, nesta ordem, de acordo com a defini��o acima, $L = (3, (1, (4,
(1, (5, \varepsilon)))))$.

Observe-se que a defini��o acima � bastante pr�xima de como � feita a
implementa��o mais comum de listas ligadas com aloca��o din�mica de
mem�ria, em que uma lista vazia � representada por um apontador para
|NULL| e em que a inser��o de um elemento $u$ na lista $L$ � feita
definindo-se $u$ como primeiro elemento da lista (ap�s a inser��o) e o
primeiro elemento da lista original $L$ (vazia ou n�o) � definido como
elemento seguinte a $u$.

Recursividade � uma maneira particularmente poderosa e elegante de
definir concisamente uma cole��o infinita de objetos e diversas
estruturas de dados s�o normalmente definidas de maneira recursiva, como
� o caso de �rvores, que � o assunto principal deste cap�tulo.

@*1 �rvores. �rvores s�o estruturas utilizadas impl�cita ou
explicitamente em muitas ocasi�es, assim como listas. Al�m disso, da
mesma maneira como ocorre com listas, �rvores s�o estruturas que possuem
uma defini��o recursiva bastante simples:

\proclaim Defini��o (�rvore). Uma �rvore (enraizada) sobre um conjunto
$V$ � qualquer estrutura constru�da de acordo com as seguintes regras (e
apenas de acordo com as seguintes regras):
\item\bull A seq��ncia vazia $\varepsilon$ sobre $V$ � uma �rvore sobre $V$;
\item\bull Se $v \in V$ e se $T_1, \ldots, T_k$ s�o �rvores sobre $V$,
ent�o $T = (v, T_1, \ldots, T_k)$ � uma �rvore sobre $V$.

O conjunto $V$ da defini��o acima � chamado \define{conjunto base} das
�rvores e os elementos de $V$ que aparecem em uma �rvore $T$ s�o
chamados \define{n�s} da �rvore $T$. Se $T = (v, T_1, \ldots, T_k)$ �
uma �rvore sobre $V$, ent�o o n� $v$ � dito a \define{raiz da �rvore}
$T$. Cada uma das �rvores $T_1, \ldots, T_k$ � chamada uma
\define{sub�rvore} de $T$. Dizemos tamb�m que sub�rvores de sub�rvores
de $T$ s�o sub�rvores de $T$ (i.e., ser sub�rvore � uma rela��o
transitiva).

Seja $I \subseteq \{T_1, \ldots, T_k\}$ o conjunto das sub�rvores
n�o-vazias dentre $T_1, \ldots, T_k$. Se $v_i$ � a raiz de $T_i$, para
$i \in I$, ent�o dizemos que $v_i$ � um \define{filho} de $v$ e que $v$
� o \define{pai} de $v_i$. Se um n� $u$ � raiz de alguma sub�rvore de
$T$ e $u$ n�o possui filhos, ent�o $u$ � dito ser uma \define{folha} de
$T$. Dizemos que um n� que n�o � uma folha � um \define{n� interno} da
�rvore. Por quest�o de simetria, chamamos as folhas de $T$ de
\define{n�s externos} de $T$.

Se existir um inteiro $k \geq 1$ de maneira que todo n� de $T$ possua no
m�ximo $k$ filhos, ent�o dizemos que $T$ � uma \define{�rvore
$k$-�ria}. Um dos casos de maior import�ncia ocorre quando $k = 2$,
quando dizemos que $T$ � uma \define{�rvore bin�ria}. Estudaremos
propriedades de alguns tipos de �rvores bin�rias em se��es posteriores
deste cap�tulo.

Fica claro a partir da defini��o de �rvore que �rvores s�o
generaliza��es do conceito de listas (i.e., listas s�o �rvores em que
$T_2, \ldots, T_k$ s�o sempre vazias ou, listas s�o �rvores un�rias).

Nas �rvores definidas acima, a ordem em que as sub�rvores $T_1, \ldots,
T_k$ aparecem � importante: por exemplo, fazemos distin��o entre as
�rvores bin�rias $(v, T_1, T_2)$ e $(v, T_2, T_1)$. Por esse motivo,
tais �rvores s�o ditas \define{�rvores ordenadas}. No estudo de �rvores,
todavia, pode haver casos em que a ordem das sub�rvores n�o seja
importante e as �rvores obtidas sem levar em considera��o a ordem de
suas sub�rvores s�o ditas \define{�rvores n�o-ordenadas}. Formalmente,
�rvores n�o-ordenadas podem ser definidas da mesma forma que �rvores
ordenadas, se substituirmos seq��ncias por multiconjuntos (i.e.,
conjuntos em que pode haver repeti��es de elementos).

Uma �rvore $T$ � geralmente representada como um diagrama em que cada n�
de $T$ � representado por um ponto e em que dois n�s $u$ e $v$ de $T$
s�o ligados por um tra�o neste diagrama se $u$ � pai de $v$ ou se $v$ �
pai de $u$. A liga��o entre $u$ e $v$ � chamada uma \define{aresta} de
$T$ e o diagrama que representa $T$ � dito ser um \define{grafo}.

Por exemplo, para a �rvore $T = (A, (B, \varepsilon, \varepsilon), (C,
(D, \varepsilon, (E, \varepsilon, \varepsilon)), \varepsilon))$, uma
representa��o gr�fica poss�vel � a ilustrada na figura a seguir. Na
figura, os pontos foram representados como pequenos c�rculos, para
facilitar a identifica��o dos n�s.  Conforme � de praxe, em nosso
desenho, o diagrama da �rvore � disposto de forma que uma �rvore $T =
(v, T_1, \ldots, T_k)$ tenha sua raiz $v$ desenhada acima das ra�zes de
cada uma das sub�rvores $T_i$ e de forma que a mesma propriedade valha
para cada uma das sub�rvores que a �rvore tiver.
\[
        \epsfbox{01-arvore.eps}
\]

\proclaim Nota. Estritamente falando, $T$ � um grafo e o diagrama � uma
representa��o do grafo. Entretanto, dada a freq�ente identifica��o feita
entre o grafo e seu diagrama, � comum tratar ambos como sendo o mesmo
objeto.

@ Deixamos para introduzir mais defini��es e conceitos sobre �rvores
assim que eles forem adequados � nossa discuss�o. Por ora, tratamos de
ilustrar brevemente algumas situa��es em que �rvores podem ser
empregadas.

�rvores enraizadas s�o importantes porque elas s�o a forma mais natural
de modelar situa��es em que haja alguma no��o de preced�ncia ou
hierarquia. Um exemplo de uma situa��o que pode ser modelada de maneira
natural por uma �rvore � a estrutura administrativa de uma empresa, com
quais s�o as responsabilidades de cada cargo: o presidente da
empresa est� hierarquicamente acima dos diretores, cada um dos diretores
� respons�vel por uma certa quantidade de gerentes e cada gerente
coordena um certo conjunto de funcion�rios.

Uma representa��o em forma de �rvore das rela��es de subordina��o na
empresa teria o presidente representado pela raiz da �rvore e os
diretores ocupando os n�s filhos da raiz. Um gerente seria representado
por um n� filho de um diretor desde que o diretor seja respons�vel pelo
gerente. O n� que representa um gerente seria pai de um n� que
representa cada um dos funcion�rios coordenados por tal gerente.

H� in�meras outras situa��es que podem ser modeladas por �rvores, das
quas as mais imediatas talvez sejam as rela��es de ascend�ncia e de
descend�ncia de membros de uma fam�lia (que �, naturalmente, a origem de
termos como pais e filhos e de v�rios outros termos usados para estudar
�rvores), a estrutura de um livro (em cap�tulos, se��es, subse��es,
par�grafos etc) e a lista de afazeres de uma pessoa (em que cada tarefa
pode, em princ�pio, ser decomposta em v�rias outras subtarefas).

Naturalmente, h� importantes aplica��es de �rvores em que seu uso �
menos �bvio (como o armazenamento de metadados em um sistema de arquivos
de um sistema operacional), em que �rvores de tipos especiais s�o
utilizadas no lugar de listas por causa de efici�ncia de opera��es.

Dentre as situa��es que normalmente empregam �rvores, uma merece
destaque, que � o uso de �rvores durante o processo de compila��o de
programas. Nesse processo, os programas s�o, geralmente, traduzidos da
linguagem em que foram escritos (e.g., \CEE/ ou Pascal) para uma
representa��o intermedi�ria, em forma de �rvore. � nessa representa��o
intermedi�ria que algumas an�lises s�o feitas (e essas an�lises podem
incluir o processo de otimiza��o dos programas), antes que o c�digo de
m�quina (i.e., o c�digo objeto) seja gerado. Em particular, express�es
aritm�ticas s�o tamb�m transformadas para representa��es em forma de
�rvores. Por exemplo, a express�o aritm�tica $a+b*c-d$ pode ser
representada pela �rvore da ilustra��o a seguir, em que as folhas
representam operandos e em que os n�s internos representam os operadores
da express�o.
\[
  \epsfbox{02-expressao.eps}
\]

� importante observar que, como os operadores presentes na express�o s�o
operadores bin�rios, eles necessitam de dois operandos cada e, na
representa��o em forma de �rvore, isso corresponde a cada (n� que cont�m
um) operador possuir dois filhos, que representam as subexpress�es
usadas para calcular o resultado da opera��o determinada pelo
operador. � f�cil de perceber que, de uma maneira geral, as sub�rvores
que est�o ``mais distantes'' da raiz s�o aquelas que representam partes
da express�o que precisam ser computadas antes de outras que estejam
``mais pr�ximas'' da raiz, uma vez que as ``mais pr�ximas'' � raiz podem
depender das ``mais distantes''---o que est� por tr�s disso � a
preced�ncia dos operadores e ela � o motivo por que representamos o n�
com `*' como filho do n� com `+', uma vez que, segundo as regras
convencionais da aritm�tica, a multiplica��o possui preced�ncia em
rela��o � adi��o.

@*2 �rvores com N�mero Arbitr�rio de Filhos. A forma mais simples de
representar um n� de uma �rvore em um computador talvez seja definindo
um registro contendo informa��es que se deseje associar ao n� (e.g., um
operador ou um operando, no caso de express�es aritm�ticas) e ponteiros
para os n�s filhos do n� em quest�o. Se soubermos que h� algum limite
superior (fixo, naturalmente), digamos $k$, no n�mero de filhos que cada
n� da �rvore possa ter, ent�o podemos reservar $k$ ponteiros no registro
que representa um n� e o problema est� resolvido.

Mas o que acontece se n�o conhecermos (ou n�o haja) um limite para o
n�mero de filhos que um n� possa ter? Essa situa��o � um tanto mais
delicada do que a anterior. Uma maneira padr�o de resolv�-la �, em vez
de incluir um ponteiro para cada filho de um n� no registro que
representa o pai desses n�s, incluir uma lista ligada dos filhos do n�
(ou, na realidade, um ponteiro para o primeiro elemento da lista).

Por quest�o de comodidade e de efici�ncia de tempo, � conveniente ainda
incluir, em cada n�, um ponteiro |p| para seu pai. No caso da raiz, esse
ponteiro ter� valor |NULL| (para indicar que a raiz n�o possui pai).  O
ponteiro para o pai de um n� \emph{n�o} � estritamente necess�rio (i.e.,
� poss�vel evitar de us�-lo), mas ele torna alguns algoritmos um pouco
mais simples (e, em alguns casos, tamb�m mais r�pidos), a despeito de um
maior uso de mem�ria.

A t�tulo de curiosidade, apresentamos um poss�vel trecho de c�digo em
Linguagem \CEE/ que define uma estrutura de dados como a que acabamos de
descrever. Para nossas discuss�es, supomos que as informa��es a serem
armazenadas em um n� sejam inteiros (um campo que identifica unicamente
um registro � normalmente chamado \define{chave} e � esta a denomina��o
que adotamos para o campo). No c�digo, o campo |p| � um ponteiro para o
pai do n� considerado, |irmao| � um ponteiro para o pr�ximo irm�o do n�
atual e |filho| � um ponteiro para o primeiro dos filhos de um
n�. Naturalmente, qualquer um desses campos pode assumir o valor |NULL|,
dependendo da ocasi�o (|p == NULL| significa que o n� � a raiz, |filho
== NULL| significa que o n� � uma folha e |irmao == NULL| significa que
o n� n�o possui irm�os, isto �, se o n� em quest�o n�o � a raiz, que ele
� o �ltimo dos filhos do n� apontado por |p|).

\FIXME{Colocar discuss�o sobre chaves antes e colocar a discuss�o sobre
a forma de implementar a lista junto.}

@s no_s int
@<Estrutura para n�s com m�ltiplos filhos@>=
typedef struct no_s no_t;
struct no_s {
        int chave;
        no_t *p;
        no_t *irmao;
        no_t *filho;
};

@*2 Visitas em �rvores. Uma vez que tenhamos uma �rvore dada, podemos
estar interessados em ``listar seu conte�do''. � evidente que o problema
de ``listar o conte�do'' de uma �rvore, nesses termos, � bastante
impreciso e diversas s�o as perguntas que surgem ao tentarmos restringir
o escopo do problema: a listagem poderia ser iniciada pelos n�s mais �
direita da �rvore? em que ordem os n�s de uma sub�rvore devem ser
impressos (ou processados)?

H� tr�s estrat�gias b�sicas para o processamento de uma �rvore, chamados
\define{visita em pr�-ordem}, \define{visita em in-ordem} e
\define{visita em p�s-ordem}, que tratamos de descrever a partir de
agora. Por causa da forma como �rvores s�o definidas, a maneira mais
natural de descrever as visitas em uma �rvore � por meio de uma
descri��o recursiva.

@ N�o vamos apresentar mais detalhes sobre �rvores com um n�mero
arbitr�rio de filhos.

\FIXME{Falar sobre visitas por aqui.}

@*2 �rvores Bin�rias. Vamos, em vez disso, observar com aten��o o caso
de �rvores bin�rias e, em particular, �rvores bin�rias de um tipo
especial chamadas \define{�rvores bin�rias de busca}, que, conforme
veremos, possuem rela��o com o algoritmo de busca bin�ria usado para
encontrar elementos em vetores ordenados.

Relembrando, uma �rvore bin�ria � uma �rvore em que cada n� possui no
m�ximo $2$ filhos. Por exemplo, a �rvore representante da express�o
$a+b*c-d$ � uma �rvore bin�ria.

Certos tipos de �rvores bin�rias s�o muito importantes para o estudo de
algoritmos, as �rvores bin�rias de busca.

Tamb�m j� sabemos que opera��es de inser��o de um elemento em uma lista
armazenada em um vetor podem ser feitas em tempo $O(1)$: basta que o
elemento seja sempre inserido no fim do vetor. Infelizmente, com essa
estrat�gia de inser��o, a opera��o de busca por um elemento no vetor
pode ficar bastante demorada, uma vez que, dependendo da ordem em que os
elementos foram inseridos, um elemento particular pode ocupar qualquer
posi��o no vetor e para descobrirmos se o elemento pertence ou n�o ao
vetor, podemos gastar tempo $O(n)$ para um vetor com $n$ elementos, j�
que cada posi��o do vetor � uma poss�vel candidata a hospedar o elemento
procurado.

Por outro lado, sabemos que em um vetor ordenado, a busca por um
elemento qualquer pode ser realizada em tempo $O(\lg n)$ para um vetor
com $n$ elementos, porque a estrutura ordenada de um vetor � suficiente
para que n�o precisemos inspecionar todos elementos do vetor ao
descobrirmos que um elemento procurado � maior ou menor do que um
elemento qualquer do vetor. Apesar de a busca por um elemento em um
vetor ordenado ser bastante r�pida, manter sua estrutura ordenada �
bastante custoso: para inserir um elemento qualquer em sua posi��o
correta, todos os elementos do vetor (ou quase todos) podem precisar de
ser relocados, o que significa que uma inser��o de um elemento em um
vetor ordenado pode levar tempo $O(n)$.

Da mesma maneira, o processo de remo��o de um elemento de um vetor
(aqui, independentemente se ele seja ordenado ou n�o), pode levar tempo
$O(n)$.

Situa��es como essas ocorrem, por exemplo, quando, em um vetor ordenado,
o segundo menor elemento do vetor deve ser exclu�do ou quando um
elemento menor do que o menor elemento j� existente no vetor deve ser
inserido.

%@@*�ndice.
