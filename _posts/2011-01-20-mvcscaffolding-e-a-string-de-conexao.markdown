--- 
layout: post
title: "MVCScaffolding e a string de conex\xC3\xA3o"
wordpress_id: 2902
wordpress_url: http://viniciusquaiato.com/blog/?p=2902
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: MVCScaffolding
  slug: mvcscaffolding
  autoslug: mvcscaffolding
- title: Scaffolding
  slug: scaffolding
  autoslug: scaffolding
- title: Scaffold
  slug: scaffold
  autoslug: scaffold
- title: MVCScaffolding connection string
  slug: mvcscaffolding-connection-string
  autoslug: mvcscaffolding-connection-string
---
Postei sobre o [MVCScaffolding](http://viniciusquaiato.com/blog/mvc-scaffolding/) e fiquei com a dúvida de como configurar a connection string que o contexto gerado pela MVCScaffolding utiliza. Cheguei a submeter para o Steven no blog dele a pergunta. Conversando com o "[stupied4ever](http://olhonobit.wordpress.com/2011/01/18/mvc-mvc-scaffolding/)" que deu uma fuçada no assunto aqui está a solução "mágica". Para configurar a connection string basta incluir no web.config uma connection string com o nome do contexto gerado:
{% highlight csharp %}

{% endhighlight %}
É isso, bem simples não?Só falta uma documentação bacana para o projeto. Abraços,Vinicius Quaiato.
