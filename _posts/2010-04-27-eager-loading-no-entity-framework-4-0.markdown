--- 
layout: post
title: "Eager Loading no Entity Framework 4.0 "
wordpress_id: 865
wordpress_url: http://viniciusquaiato.com/blog/?p=865
categories: 
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: Entity Framework
  slug: entity-framework
  autoslug: entity-framework
tags: 
- title: ORM
  slug: orm
  autoslug: orm
- title: Entity Framework
  slug: entity-framework
  autoslug: entity-framework
- title: ef 4.0
  slug: ef-4-0
  autoslug: ef-4.0
- title: early loading
  slug: early-loading
  autoslug: early-loading
- title: eager loading
  slug: eager-loading
  autoslug: eager-loading
---
Tem se falado bastante sobre uma das novas funcionalidades do Entity Framework 4.0, o [Lazy Loading](http://viniciusquaiato.com/blog/lazy-loading-no-entity-framework-4-0/).Com o Lazy Loading habilitado conseguimos com que as propriedades de navegação para outras entidades nos nossos objetos sejam carregadas apenas no momento em que forem chamadas.Dado o seguinte modelo de entidades:[caption id="attachment_867" align="aligncenter" width="300" caption="Modelo Entidades Entity Framework eager loading"][![Modelo Entidades Entity Framework eager loading](http://viniciusquaiato.com/blog/wp-content/uploads/2010/04/modelo-300x211.jpg "Modelo Entidades Entity Framework eager loading")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/04/modelo.jpg)[/caption]Com a opção de Lazy Loading habilitada no EF4 quando eu trouxer um objeto Lista do meu contexto(banco de dados) a propriedade Itens estará vazia, e só será preenchida no momento em que eu acessar a mesma.Por exemplo:
{% highlight csharp %}
var ctx = new EF4Contexto();var lista = ctx.Listas.First();//neste momento a propriedade Itens ainda está vazia, nem foi carregadavar nome = lista.Nome;//neste exato momento é executada uma query//no banco de dados para preenhcer os Itensvar itens = lista.Itens;
{% endhighlight %}
Este é o comportamento padrão do EF4. O que acontece se desligarmos o Lazy Loading e quisermos trabalhar com Eager Loading? Resposta: Nada!Exatamente isso, nada acontece. Se você achou que a propriedade _Itens _seria carregada juntamente com o objeto Lista está enganado.Pois bem, não vou entrar no mérito da discussão deste comportamento### Eager Loading
Eager Loading, ou "carga prematura", diz respeito a carregar todas as relações de uma entidade no mesmo momento em que esta entidade é carregada. É o contrário do [Lazy Loading](http://viniciusquaiato.com/blog/lazy-loading-no-entity-framework-4-0/).Para trazer as propriedades de navegação(associação com outras entidades) que quisermos ao carregar a raiz, precisamos utilizar o método _[Include](http://msdn.microsoft.com/en-us/library/bb738708.aspx)_.Veja o exemplo:
{% highlight csharp %}
var ctx = new EF4Contexto();ctx.ContextOptions.LazyLoadingEnabled = false;var lista = ctx.Listas.First();//Não é carregada esta propriedadevar itens = lista.Itens;
{% endhighlight %}
 Agora utilizando Include:
{% highlight csharp %}
var ctx = new EF4Contexto();ctx.ContextOptions.LazyLoadingEnabled = false;var lista = ctx.Listas.Include("Itens").First();//Aqui a propriedade Itens já está preenchidavar itens = lista.Itens;
{% endhighlight %}
 Na _**linha 4**_ dizemos para o EF que estamos incluindo nesta query a propriedade _Itens_ dos objetos _Lista_, desta forma estas propriedades devem ser carregadas juntamente com estes objetos.Você pode comprovar tudo isso executando o [Sql Profiler](http://msdn.microsoft.com/pt-br/library/cc580638.aspx) enquanto faz esta brincadeira.Um outro ponto bastante falho ao meu ver é que o _Include _não é tipado, ou seja, eu posso errar o nome da propriedade. Deveria haver uma forma de fazer isso utilizando [Lambda Expressions](http://msdn.microsoft.com/en-us/library/bb397687.aspx).Em um próximo post vou colocar aqui um código que faz isso, um extension method que disponibiliza um _Include_ tipado usando lambda expressions.Att,Vinicius Quaiato.
