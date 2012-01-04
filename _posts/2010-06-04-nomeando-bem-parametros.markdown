--- 
layout: post
title: "Nomeando bem os par\xC3\xA2metros"
wordpress_id: 1033
wordpress_url: http://viniciusquaiato.com/blog/?p=1033
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
- title: "par\xC3\xA2metros"
  slug: parametros
  autoslug: "par\xC3\xA2metros"
- title: nomes
  slug: nomes
  autoslug: nomes
- title: nomenclatura
  slug: nomenclatura
  autoslug: nomenclatura
---
Quando olhamos código antigo, ou escrito por outras pessoas, etc, passamos a reparar em coisas que nos desagradam. Se você não consegue reparar nestas coisas, há algo bastante errado com você! Eu sempre acreditei em um código auto explicativo. O código deve falar por si só. Deve explicar sozinho o que está fazendo. Se precisamos perder algum tempo explicando o código, algo está errado. Reparem que explicar o código é diferente de explicar o domínio. Há casos isolados, onde complexas regras precisam ser bem documentadas e até comentadas no código. Mas eu acredito que sejam caso realmente isolados. Vou escrever uma série de posts comentando algumas coisas que, na minha humilde opinião, tornam um código feio, ilegível e dificultam sua manutenção/evolução e entendimento. Neste primeiro post falarei sobre parâmetros.<blockquote>Se podemos dar nomes claros para os parâmetros, por que não fazê-lo?</blockquote>Hoje mesmo me deparei com o seguinte método:
{% highlight csharp %}

public 
static ObjetoQualquer[] Pesquisar(List<int> list, string p){
if(list == null || list. Count <= 0)        throw new Exception("mensagem qualquer");
if(string.IsNullOrEmpty(p))        //faz algumas coisas sem p    else       //faz algumas coisas com p}
</int>
{% endhighlight %}
Wow! O que quer dizer "list"? E o melhor, o que quer dizer "p"? Como é que eu utilizo este método? O que eu passo em "p"? Que informação é esta? Depois de perder algum tempo olhando o método, a classe, a stored procedure que este método chama, entendi que:
{% highlight csharp %}

public 
static ObjetoQualquer[] Pesquisar(List<int> idsEmpresasAPesquisar, string nomeEmpresaFiltrar){
if(idsEmpresasAPesquisar== null || idsEmpresasAPesquisar. Count <= 0)        throw new Exception("mensagem qualquer");
if(string.IsNullOrEmpty(nomeEmpresaFiltrar))        //faz algumas coisas sem nomeEmpresaFiltrar    else       //faz algumas coisas com nomeEmpresaFiltrar}
</int>
{% endhighlight %}
Simples não? Nem preciso mais explicar o que o método faz, ou o que cada parâmetro significa. <b>Utilize nos parâmetros de seus métodos, sejam eles públicos ou privados, nomes significativos ao contexto. Nomes explicativos e de fácil entendimento.</b>Uma outra coisa que para mim não faz muito sentido é utilizar abreviações ou designações nos parâmetros, por exemplo:
{% highlight csharp %}

public void FazAlgumaCoisa(int cod, string desc){    //faz alguma coisa}

{% endhighlight %}
Poxa. Será que esse "cod" é um código? Se sim, código de que? E "desc"? Qual é a dificuldade de escrever o método assim:
{% highlight csharp %}

public void FazAlgumaCoisa(int codigoProduto, string descricaoProduto){    //faz alguma coisa}

{% endhighlight %}
Ah! Agora sim! Apenas alguns caracteres mais, mas agora tudo faz sentido!É muito mais claro e simples de ler. Você consegue olhar e entender, é fácil! E para finalizar, nada de coloca "p" nos parâmetros:
{% highlight csharp %}

public void FazAlgumaCoisa(int pCod, string pDesc){    //faz alguma coisa}

{% endhighlight %}
Alguns dizem que fazem isso para saber que isso é um parâmetro. Oras, se seu método não cabe em uma tela, e você não consegue saber o que veio como parâmetro e o que é interno do método, há algo muito errado com este método. Será preciso refatorá-lo, mas isso é assunto para outros posts. A Microsoft possui um guia de convenção de nomenclatura para o .NET. Faz algum tempo que eu não o leio, mas é importante conhecermos: Guia geral para nomenclatura: [http://msdn.microsoft.com/en-us/library/ms229002(v=VS.100).aspx](http://msdn.microsoft.com/en-us/library/ms229002(v=VS.100).aspx)Guia para nomeação de parâmetros: [http://msdn.microsoft.com/en-us/library/ms229004.aspx](http://msdn.microsoft.com/en-us/library/ms229004.aspx)É isso galera, nos vemos na próxima. Comentem sobre seus padrões de nomeação de parâmetros, e também sobre as "aberrações" que encontram nos sistemas que trabalham!

Att,
Vinicius Quaiato.
