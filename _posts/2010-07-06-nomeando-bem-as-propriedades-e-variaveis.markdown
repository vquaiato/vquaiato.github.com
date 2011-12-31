--- 
layout: post
title: "Nomeando bem as propriedades e vari\xC3\xA1veis"
wordpress_id: 1052
wordpress_url: http://viniciusquaiato.com/blog/?p=1052
categories: 
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: nomes
  slug: nomes
  autoslug: nomes
- title: nomenclatura
  slug: nomenclatura
  autoslug: nomenclatura
- title: Clean Code
  slug: clean-code
  autoslug: clean-code
- title: "vari\xC3\xA1veis"
  slug: variaveis
  autoslug: "vari\xC3\xA1veis"
- title: propriedades
  slug: propriedades
  autoslug: propriedades
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/060babyL_468x523-268x300.jpg "Você vai me chamar de que?!")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/060babyL_468x523.jpg)Engraçado, comecei a escrever esta série antes mesmo de comprar o livro [Clean Code](http://viniciusquaiato.com/blog/dica-de-leitura-clean-code/). E algumas das minhas certezas sobre o que é um bom código, agora estão um pouco mais embasadas na opinião e experiência de diversos profissionais.Uma das primeiras coisas que "aprendemos" quando começamos a programar é o "quão legal é brincar com o nome das variáveis".Eu fiz um curso técnico há 4 anos, e achava o máximo chamar minhas variáveis em C++ com os nomes mais bizarros. Tinha um amigo que fazia coisas como:
{% highlight csharp %}
int bozo;char vovo_mafalda;float chapeuzinho_vermelho;
{% endhighlight %}
E o mais engraçado é que hoje em dia eu vejo ainda coisas parecidas com isso. Claro que são nomes 'engraçados', mas também são extremamente perigosos.As variáveis, ao meu ver, são pequenas peças no quebra-cabeça de um sistema. Quando juntamos e encaixamos várias peças começamos a visualizar o sistema. Agora quando estes nomes não nos dizem nada é como montar o quebra-cabeças olhando o verso das peças.Eu tenho utilizado para minhas propriedades e variáveis internas o mesmo padrão, desta forma as "dicas" aqui contidas valem para ambas.### Dê preferência para nomes completos
Vejamos abaixo. O código é simples, mas poderia ser melhor. Quando estas variáveis estiverem dentro de métodos, o entendimento vai começar a ficar complicado. Será necessário maior esforço em sua tradução, afinal sabemos que nomeEmpr é na verdade nomeEmpresa e razSoc é na verdade razaoSocial, mas quando isso se mistura com várias outras linhas de código, a compreensão começa a ficar comprometida, a visualização já não é tão clara e simples.
{% highlight csharp %}
class Empresa{    int codEmp;    string nomeEmpr;    string razSoc;}
{% endhighlight %}
Desta forma, vamos tornar as coisas simples, claras e mais diretas sempre que pudermos:
{% highlight csharp %}
class Empresa{    int codigoEmpresa;    string nomeEmpresa;    string razaoSocial;}
{% endhighlight %}
### Nomes genéricos
Existem alguns conceitos genéricos que sempre estão presentes nos sistemas. Por exemplo, quando queremos saber se uma determinada condição foi atingida e posteriormente utilizarmos este conhecimento, criamos uma "flag":
{% highlight csharp %}

{% endhighlight %}
O conceito da flag é importante e bastante utilizado, no entando não precisamos chamar a variável de flag. O que esta flag significa? Qual informação ela contém? É bastante complicado entender isso. Neste caso seria muito simples para quem lê o código se a flag se chamasse "NemTodosProdutosEmEstoque".### Evite nomes de uma letra
O único caso em que acho válido utilizar variáveis de uma letra é em laços for, e ainda assim tenho evitado usar em algumas situações. Fora destes casos acho completamente inválido, perigoso e nociso.Há alguns meses peguei um código como o abaixo:
{% highlight csharp %}
int a,b;int c,d;
{% endhighlight %}
Meu Deus! Eu nem sei explicar o que esse código fazia, era um método chamado em um trecho super importante do código. E ainda tinha alguns comentários que não diziam nada. Ou seja, evitem este tipo de código!### Evite "reuso"
Como assim?! Evitar reuso?! Explico.Às vezes, não sei bem por que, acabamos reaproveitando algumas variáveis em um mesmo contexto para coisas distintas, ou às vezes não tão distintas, por exemplo:
{% highlight csharp %}
void SalvarArquivo(HttpPostedFile arquivo, string nomeArquivo){    string nome = arquivo.FileName;    nome = nome.Split(new string[]{"\\"},StringSplitOptions.RemoveEmptyEntries).Last();    nome = "Server path" + nome;}
{% endhighlight %}
Não estou dizendo que o código acima está correto, etc. Apenas quero atentar ao fato de uma mesma variável estar sendo usada em vários lugares. Na verdade não vejo problemas nisso, vejo problemas no fato de que ela significa coisas diferentes em cada lugar.Primeiro ela é o nome completo do arquivo postado. Depois ela é apenas a última parte do nome do arquivo. E depois é o novo nome do arquivo.Não é difícil ver isso acontecer em vários métodos.Eu transformaria o código desta forma:
{% highlight csharp %}
void SalvarArquivo(HttpPostedFile arquivo, string nomeArquivo){    string nomeCompletoArquivoPostado = arquivo.FileName;    string nomeArquivoPostado = nomeCompletoArquivoPostado                                .Split(new string[] { "\\" }, StringSplitOptions.RemoveEmptyEntries)                                .Last();    string nomeArquivoParaSalvar = "Server path" + nome;}
{% endhighlight %}
Algumas destas mudanças são simples de serem feitas. A própria ferramenta de mudanças de nome do Visual Studio 2008 (e posterior) funciona bem até (apesar de recompilar o projeto antes, etc). Ter suas variáveis e propriedades com nomes bem escritos vai resolver muitos problemas. Para para analisar um código onde os nomes são claros e coesos e um código cheio de "int a, int x" para ver a diferença.Atente-se também ao fato de que o nome da variável não deve apenas fazer sentido para você que criou, mas sim para todos que poderão (e irão) ler o código, e principalmente, deve fazer sentido para o próprio código.Então, cuidado e carinho ao nomear suas variáveis e propriedades.[caption id="attachment_1205" align="aligncenter" width="424" caption="Nomeie com carinho"][![Nomeie com carinho](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/BabyNames_NameTag.jpg "Nomeie com carinho")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/BabyNames_NameTag.jpg)[/caption]Espero que tenha ajudado de alguma forma. Fico no aguardo de feedbacks.Abraços,Vinicius Quaiato.
