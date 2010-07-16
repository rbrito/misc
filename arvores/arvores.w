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

@*Estruturas de Dados Recursivas. Em determinados casos, é mais
simples fornecer uma definição recursiva de uma estrutura de dados do
que dar uma definição não-recursiva. Por exemplo, uma elegante e simples
definição de listas é dada abaixo:

\proclaim Definição (Listas). As listas sobre um conjunto $V$ são as
estruturas definidas pelas seguintes regras (e apenas pelas seguintes
regras):
\item\bull A seqüência vazia $\varepsilon$ de elementos de $V$ é uma lista
sobre $V$;
\item\bull Se $L$ é uma lista e $v \in V$ é um elemento de $V$, então
$L'=(v, L)$ é uma lista sobre $V$.

Por exemplo, a lista $L$ composta pelos inteiros $3$, $1$, $4$, $1$ e
$5$ é, nesta ordem, de acordo com a definição acima, $L = (3, (1, (4,
(1, (5, \varepsilon)))))$.

Observe-se que a definição acima é bastante próxima de como é feita a
implementação mais comum de listas ligadas com alocação dinâmica de
memória, em que uma lista vazia é representada por um apontador para
|NULL| e em que a inserção de um elemento $u$ na lista $L$ é feita
definindo-se $u$ como primeiro elemento da lista (após a inserção) e o
primeiro elemento da lista original $L$ (vazia ou não) é definido como
elemento seguinte a $u$.

Recursividade é uma maneira particularmente poderosa e elegante de
definir concisamente uma coleção infinita de objetos e diversas
estruturas de dados são normalmente definidas de maneira recursiva, como
é o caso de árvores, que é o assunto principal deste capítulo.

@*1 Árvores. Árvores são estruturas utilizadas implícita ou
explicitamente em muitas ocasiões, assim como listas. Além disso, da
mesma maneira como ocorre com listas, árvores são estruturas que possuem
uma definição recursiva bastante simples:

\proclaim Definição (Árvore). Uma árvore (enraizada) sobre um conjunto
$V$ é qualquer estrutura construída de acordo com as seguintes regras (e
apenas de acordo com as seguintes regras):
\item\bull A seqüência vazia $\varepsilon$ sobre $V$ é uma árvore sobre $V$;
\item\bull Se $v \in V$ e se $T_1, \ldots, T_k$ são árvores sobre $V$,
então $T = (v, T_1, \ldots, T_k)$ é uma árvore sobre $V$.

O conjunto $V$ da definição acima é chamado \define{conjunto base} das
árvores e os elementos de $V$ que aparecem em uma árvore $T$ são
chamados \define{nós} da árvore $T$. Se $T = (v, T_1, \ldots, T_k)$ é
uma árvore sobre $V$, então o nó $v$ é dito a \define{raiz da árvore}
$T$. Cada uma das árvores $T_1, \ldots, T_k$ é chamada uma
\define{subárvore} de $T$. Dizemos também que subárvores de subárvores
de $T$ são subárvores de $T$ (i.e., ser subárvore é uma relação
transitiva).

Seja $I \subseteq \{T_1, \ldots, T_k\}$ o conjunto das subárvores
não-vazias dentre $T_1, \ldots, T_k$. Se $v_i$ é a raiz de $T_i$, para
$i \in I$, então dizemos que $v_i$ é um \define{filho} de $v$ e que $v$
é o \define{pai} de $v_i$. Se um nó $u$ é raiz de alguma subárvore de
$T$ e $u$ não possui filhos, então $u$ é dito ser uma \define{folha} de
$T$. Dizemos que um nó que não é uma folha é um \define{nó interno} da
árvore. Por questão de simetria, chamamos as folhas de $T$ de
\define{nós externos} de $T$.

Se existir um inteiro $k \geq 1$ de maneira que todo nó de $T$ possua no
máximo $k$ filhos, então dizemos que $T$ é uma \define{árvore
$k$-ária}. Um dos casos de maior importância ocorre quando $k = 2$,
quando dizemos que $T$ é uma \define{árvore binária}. Estudaremos
propriedades de alguns tipos de árvores binárias em seções posteriores
deste capítulo.

Fica claro a partir da definição de árvore que árvores são
generalizações do conceito de listas (i.e., listas são árvores em que
$T_2, \ldots, T_k$ são sempre vazias ou, listas são árvores unárias).

Nas árvores definidas acima, a ordem em que as subárvores $T_1, \ldots,
T_k$ aparecem é importante: por exemplo, fazemos distinção entre as
árvores binárias $(v, T_1, T_2)$ e $(v, T_2, T_1)$. Por esse motivo,
tais árvores são ditas \define{árvores ordenadas}. No estudo de árvores,
todavia, pode haver casos em que a ordem das subárvores não seja
importante e as árvores obtidas sem levar em consideração a ordem de
suas subárvores são ditas \define{árvores não-ordenadas}. Formalmente,
árvores não-ordenadas podem ser definidas da mesma forma que árvores
ordenadas, se substituirmos seqüências por multiconjuntos (i.e.,
conjuntos em que pode haver repetições de elementos).

Uma árvore $T$ é geralmente representada como um diagrama em que cada nó
de $T$ é representado por um ponto e em que dois nós $u$ e $v$ de $T$
são ligados por um traço neste diagrama se $u$ é pai de $v$ ou se $v$ é
pai de $u$. A ligação entre $u$ e $v$ é chamada uma \define{aresta} de
$T$ e o diagrama que representa $T$ é dito ser um \define{grafo}.

Por exemplo, para a árvore $T = (A, (B, \varepsilon, \varepsilon), (C,
(D, \varepsilon, (E, \varepsilon, \varepsilon)), \varepsilon))$, uma
representação gráfica possível é a ilustrada na figura a seguir. Na
figura, os pontos foram representados como pequenos círculos, para
facilitar a identificação dos nós.  Conforme é de praxe, em nosso
desenho, o diagrama da árvore é disposto de forma que uma árvore $T =
(v, T_1, \ldots, T_k)$ tenha sua raiz $v$ desenhada acima das raízes de
cada uma das subárvores $T_i$ e de forma que a mesma propriedade valha
para cada uma das subárvores que a árvore tiver.
\[
        \epsfbox{01-arvore.eps}
\]

\proclaim Nota. Estritamente falando, $T$ é um grafo e o diagrama é uma
representação do grafo. Entretanto, dada a freqüente identificação feita
entre o grafo e seu diagrama, é comum tratar ambos como sendo o mesmo
objeto.

@ Deixamos para introduzir mais definições e conceitos sobre árvores
assim que eles forem adequados à nossa discussão. Por ora, tratamos de
ilustrar brevemente algumas situações em que árvores podem ser
empregadas.

Árvores enraizadas são importantes porque elas são a forma mais natural
de modelar situações em que haja alguma noção de precedência ou
hierarquia. Um exemplo de uma situação que pode ser modelada de maneira
natural por uma árvore é a estrutura administrativa de uma empresa, com
quais são as responsabilidades de cada cargo: o presidente da
empresa está hierarquicamente acima dos diretores, cada um dos diretores
é responsável por uma certa quantidade de gerentes e cada gerente
coordena um certo conjunto de funcionários.

Uma representação em forma de árvore das relações de subordinação na
empresa teria o presidente representado pela raiz da árvore e os
diretores ocupando os nós filhos da raiz. Um gerente seria representado
por um nó filho de um diretor desde que o diretor seja responsável pelo
gerente. O nó que representa um gerente seria pai de um nó que
representa cada um dos funcionários coordenados por tal gerente.

Há inúmeras outras situações que podem ser modeladas por árvores, das
quas as mais imediatas talvez sejam as relações de ascendência e de
descendência de membros de uma família (que é, naturalmente, a origem de
termos como pais e filhos e de vários outros termos usados para estudar
árvores), a estrutura de um livro (em capítulos, seções, subseções,
parágrafos etc) e a lista de afazeres de uma pessoa (em que cada tarefa
pode, em princípio, ser decomposta em várias outras subtarefas).

Naturalmente, há importantes aplicações de árvores em que seu uso é
menos óbvio (como o armazenamento de metadados em um sistema de arquivos
de um sistema operacional), em que árvores de tipos especiais são
utilizadas no lugar de listas por causa de eficiência de operações.

Dentre as situações que normalmente empregam árvores, uma merece
destaque, que é o uso de árvores durante o processo de compilação de
programas. Nesse processo, os programas são, geralmente, traduzidos da
linguagem em que foram escritos (e.g., \CEE/ ou Pascal) para uma
representação intermediária, em forma de árvore. É nessa representação
intermediária que algumas análises são feitas (e essas análises podem
incluir o processo de otimização dos programas), antes que o código de
máquina (i.e., o código objeto) seja gerado. Em particular, expressões
aritméticas são também transformadas para representações em forma de
árvores. Por exemplo, a expressão aritmética $a+b*c-d$ pode ser
representada pela árvore da ilustração a seguir, em que as folhas
representam operandos e em que os nós internos representam os operadores
da expressão.
\[
  \epsfbox{02-expressao.eps}
\]

É importante observar que, como os operadores presentes na expressão são
operadores binários, eles necessitam de dois operandos cada e, na
representação em forma de árvore, isso corresponde a cada (nó que contém
um) operador possuir dois filhos, que representam as subexpressões
usadas para calcular o resultado da operação determinada pelo
operador. É fácil de perceber que, de uma maneira geral, as subárvores
que estão ``mais distantes'' da raiz são aquelas que representam partes
da expressão que precisam ser computadas antes de outras que estejam
``mais próximas'' da raiz, uma vez que as ``mais próximas'' à raiz podem
depender das ``mais distantes''---o que está por trás disso é a
precedência dos operadores e ela é o motivo por que representamos o nó
com `*' como filho do nó com `+', uma vez que, segundo as regras
convencionais da aritmética, a multiplicação possui precedência em
relação à adição.

@*2 Árvores com Número Arbitrário de Filhos. A forma mais simples de
representar um nó de uma árvore em um computador talvez seja definindo
um registro contendo informações que se deseje associar ao nó (e.g., um
operador ou um operando, no caso de expressões aritméticas) e ponteiros
para os nós filhos do nó em questão. Se soubermos que há algum limite
superior (fixo, naturalmente), digamos $k$, no número de filhos que cada
nó da árvore possa ter, então podemos reservar $k$ ponteiros no registro
que representa um nó e o problema está resolvido.

Mas o que acontece se não conhecermos (ou não haja) um limite para o
número de filhos que um nó possa ter? Essa situação é um tanto mais
delicada do que a anterior. Uma maneira padrão de resolvê-la é, em vez
de incluir um ponteiro para cada filho de um nó no registro que
representa o pai desses nós, incluir uma lista ligada dos filhos do nó
(ou, na realidade, um ponteiro para o primeiro elemento da lista).

Por questão de comodidade e de eficiência de tempo, é conveniente ainda
incluir, em cada nó, um ponteiro |p| para seu pai. No caso da raiz, esse
ponteiro terá valor |NULL| (para indicar que a raiz não possui pai).  O
ponteiro para o pai de um nó \emph{não} é estritamente necessário (i.e.,
é possível evitar de usá-lo), mas ele torna alguns algoritmos um pouco
mais simples (e, em alguns casos, também mais rápidos), a despeito de um
maior uso de memória.

A título de curiosidade, apresentamos um possível trecho de código em
Linguagem \CEE/ que define uma estrutura de dados como a que acabamos de
descrever. Para nossas discussões, supomos que as informações a serem
armazenadas em um nó sejam inteiros (um campo que identifica unicamente
um registro é normalmente chamado \define{chave} e é esta a denominação
que adotamos para o campo). No código, o campo |p| é um ponteiro para o
pai do nó considerado, |irmao| é um ponteiro para o próximo irmão do nó
atual e |filho| é um ponteiro para o primeiro dos filhos de um
nó. Naturalmente, qualquer um desses campos pode assumir o valor |NULL|,
dependendo da ocasião (|p == NULL| significa que o nó é a raiz, |filho
== NULL| significa que o nó é uma folha e |irmao == NULL| significa que
o nó não possui irmãos, isto é, se o nó em questão não é a raiz, que ele
é o último dos filhos do nó apontado por |p|).

\FIXME{Colocar discussão sobre chaves antes e colocar a discussão sobre
a forma de implementar a lista junto.}

@s no_s int
@<Estrutura para nós com múltiplos filhos@>=
typedef struct no_s no_t;
struct no_s {
        int chave;
        no_t *p;
        no_t *irmao;
        no_t *filho;
};

@*2 Visitas em árvores. Uma vez que tenhamos uma árvore dada, podemos
estar interessados em ``listar seu conteúdo''. É evidente que o problema
de ``listar o conteúdo'' de uma árvore, nesses termos, é bastante
impreciso e diversas são as perguntas que surgem ao tentarmos restringir
o escopo do problema: a listagem poderia ser iniciada pelos nós mais à
direita da árvore? em que ordem os nós de uma subárvore devem ser
impressos (ou processados)?

Há três estratégias básicas para o processamento de uma árvore, chamados
\define{visita em pré-ordem}, \define{visita em in-ordem} e
\define{visita em pós-ordem}, que tratamos de descrever a partir de
agora. Por causa da forma como árvores são definidas, a maneira mais
natural de descrever as visitas em uma árvore é por meio de uma
descrição recursiva.

@ Não vamos apresentar mais detalhes sobre árvores com um número
arbitrário de filhos.

\FIXME{Falar sobre visitas por aqui.}

@*2 Árvores Binárias. Vamos, em vez disso, observar com atenção o caso
de árvores binárias e, em particular, árvores binárias de um tipo
especial chamadas \define{árvores binárias de busca}, que, conforme
veremos, possuem relação com o algoritmo de busca binária usado para
encontrar elementos em vetores ordenados.

Relembrando, uma árvore binária é uma árvore em que cada nó possui no
máximo $2$ filhos. Por exemplo, a árvore representante da expressão
$a+b*c-d$ é uma árvore binária.

Certos tipos de árvores binárias são muito importantes para o estudo de
algoritmos, as árvores binárias de busca.

Também já sabemos que operações de inserção de um elemento em uma lista
armazenada em um vetor podem ser feitas em tempo $O(1)$: basta que o
elemento seja sempre inserido no fim do vetor. Infelizmente, com essa
estratégia de inserção, a operação de busca por um elemento no vetor
pode ficar bastante demorada, uma vez que, dependendo da ordem em que os
elementos foram inseridos, um elemento particular pode ocupar qualquer
posição no vetor e para descobrirmos se o elemento pertence ou não ao
vetor, podemos gastar tempo $O(n)$ para um vetor com $n$ elementos, já
que cada posição do vetor é uma possível candidata a hospedar o elemento
procurado.

Por outro lado, sabemos que em um vetor ordenado, a busca por um
elemento qualquer pode ser realizada em tempo $O(\lg n)$ para um vetor
com $n$ elementos, porque a estrutura ordenada de um vetor é suficiente
para que não precisemos inspecionar todos elementos do vetor ao
descobrirmos que um elemento procurado é maior ou menor do que um
elemento qualquer do vetor. Apesar de a busca por um elemento em um
vetor ordenado ser bastante rápida, manter sua estrutura ordenada é
bastante custoso: para inserir um elemento qualquer em sua posição
correta, todos os elementos do vetor (ou quase todos) podem precisar de
ser relocados, o que significa que uma inserção de um elemento em um
vetor ordenado pode levar tempo $O(n)$.

Da mesma maneira, o processo de remoção de um elemento de um vetor
(aqui, independentemente se ele seja ordenado ou não), pode levar tempo
$O(n)$.

Situações como essas ocorrem, por exemplo, quando, em um vetor ordenado,
o segundo menor elemento do vetor deve ser excluído ou quando um
elemento menor do que o menor elemento já existente no vetor deve ser
inserido.

%@@*Índice.
