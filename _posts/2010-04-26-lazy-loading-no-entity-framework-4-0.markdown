--- 
layout: post
title: Lazy Loading no Entity Framework 4.0
wordpress_id: 874
wordpress_url: http://viniciusquaiato.com/blog/?p=874
categories: 
- title: Patterns
  slug: patterns
  autoslug: patterns
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: Entity Framework
  slug: entity-framework
  autoslug: entity-framework
tags: 
- title: Entity Framework
  slug: entity-framework
  autoslug: entity-framework
- title: ef 4.0
  slug: ef-4-0
  autoslug: ef-4.0
- title: Lazy Loading
  slug: lazy-loading
  autoslug: lazy-loading
---


Uma das novas features no Entity Framework 4.0 é o Lazy Loading ou como era chamado Deferred Loading.[Lazy Loading](http://en.wikipedia.org/wiki/Lazy_loading) é a capacidade de carregar as propriedades de associação de nossas entidades no momento em que forem chamadas, e se forem chamadas.Confuso? Na verdade é muito simples, vejamos o modelo abaixo:[![Modelo Lazy Loading](http://viniciusquaiato.com/images_posts/modelo2-300x263.jpg "Modelo Lazy Loading")](http://viniciusquaiato.com/images_posts/modelo2.jpg)

Lazy Loading quer dizer que quando eu carregar uma entidade do tipo _Author_ as suas propriedades _Posts _e _Profile _não serão carregadas em um primeiro momento. Suas cargas só se darão quando um acesso a estas propriedades for feito.O benefício do Lazy Loading é evitar trazer dados que não serão utilizados em um primeiro momento, pois talvez estes dados realmente não sejam utilizados.No entanto com Lazy Loading habilitado haverão mais idas ao banco de dados. Dependendo do seu cenário, considere esta informação.Pode padrão os contextos do Entity Framework 4 já vêm com Lazy Loading habilitado, mas caso você queira habilitar é necessário apenas uma linha de código:
{% highlight csharp %}
var contexto = new Contexto();
    contexto.ContextOptions.LazyLoadingEnabled = true;
    
{% endhighlight %}
e para desabilitar:
{% highlight csharp %}
var contexto = new Contexto();
    contexto.ContextOptions.LazyLoadingEnabled = false;
    
{% endhighlight %}
Isso é tudo que é necessário para trabalhar com Lazy Loading no EF4.Qualquer dúvida ou sugestão é só deixar comentários ou enviar emails.

Att,
Vinicius Quaiato.
