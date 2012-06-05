---
layout: post
title: "ASP.NET MVC 3 - Razor templates"
keywords:
- ASP.NET MVC
- Razor
- Templates
tags:
- title: ASP.NET MVC 3
  slug: asp-net-mvc-3
  autoslug: asp.net-mvc-3
---
Continuando a [falar sobre o Razor](http://viniciusquaiato.com/blog/asp-net-mvc-3-razor-view-engine/), a nova View Engine para o ASP.NET MVC, vou mostrar um pouco como podemos trabalhar com templates para nossas views.
Desde o ASP.NET 2.0 podemos fazer isso com a utilização de Master Pages, e é aí que entram as Layout Pages do Razor, atuando como MasterPages.

### Criando uma Layout Page para o Razor

Podemos criar uma Layout Page utilizando o menu de contexto. Clique sobre a pasta Shared por exemplo: Add New Item (ou Ctrl + shift + A):

[![Criando uma Master Page no Razor](http://viniciusquaiato.com/images_posts/Criando-uma-Master-Page-no-Razor-300x190.png "Criando uma Master Page no Razor")](http://viniciusquaiato.com/images_posts/Criando-uma-Master-Page-no-Razor.png)

Feito isso teremos um arquivo adicionado com o seguinte contéudo:
{% highlight html %}
<html>
  <head>
    <title>@View.Title</title>
  </head>
  <body>
    <div>@RenderBody()</div>
  </body>
</html>
{% endhighlight %}

Esta é nossa MasterPage ou Layout Page no Razor. Tudo que fizermos aí será geral para todas as páginas que utilizam esta MasterPage/Layout Page.

O conteúdo das páginas será exibido no lugar do método *RenderBody()*. Ou seja, nossas páginas serão renderizadas aí dentro deste template.

Vou modificar esta página adicionando o seguinte código após o body:
{% highlight html %}
<h1>Este é o conteúdo fixo em todas as Views que usam esse Layout</h1>
{% endhighlight %}

### Criando uma view com Razor que utiliza a MasterPage

Vamos criar uma view normalmente e marcar que ela utiliza a nossa MasterPage:

[![Utilizando uma Master Page no Razor](http://viniciusquaiato.com/images_posts/Utilizando-uma-Master-Page-no-Razor-300x118.png "Utilizando uma Master Page no Razor")](http://viniciusquaiato.com/images_posts/Utilizando-uma-Master-Page-no-Razor.png)

Com isso nossa view criada terá o código abaixo:
{% highlight html linenos %}
@model dynamic
@{
  View.Title = "Index";
  Layout = "~/Views/Shared/_LayoutPage1.cshtml";
}

<h2>Index</h2>
{% endhighlight %}

Reparem que na **_linha 4_** está sendo setada a informação sobre qual LayoutPage/MasterPage utilizar.

Vou alterar nossa view adicionando o código semelhante ao do [post do artigo anterior sobre Razor](http://viniciusquaiato.com/blog/asp-net-mvc-3-razor-view-engine/):
{% highlight html linenos %}
@model dynamic
@{
    View.Title = "Index";
    Layout = "~/Views/Shared/_LayoutPage1.cshtml";
}

<h2>Olá @Model.Nome</h2>
<div>
Você foi cadastrado em: @Model.DataQualquer.ToString("dd/MMM/yyyy")

Sua sequência fibonacci é:
@foreach(var num in Model.ListaInteiros){<span>@num,</span>}
</div>
{% endhighlight %}

Desta forma quando executarmos nossa aplicação, nossa view será renderizada assim:

[![Aplicacao em execucao com MasterPages e Razor](http://viniciusquaiato.com/images_posts/Aplicacao-em-execucao-com-MasterPages-e-Razor-300x259.png "Aplicacao em execucao com MasterPages e Razor")](http://viniciusquaiato.com/images_posts/Aplicacao-em-execucao-com-MasterPages-e-Razor.png)

E se eu criar uma view que apenas exibe "Olá" utilizando a MasterPage teremos o mesmo resultado:

[![Outra view em execucao com MasterPages e Razor](http://viniciusquaiato.com/images_posts/Outra-view-em-execucao-com-MasterPages-e-Razor-300x237.png "Outra view em execucao com MasterPages e Razor")](http://viniciusquaiato.com/images_posts/Outra-view-em-execucao-com-MasterPages-e-Razor.png)

### Conclusão
A criação de MasterPages no Razor é bastante simples e seu poder é bastante grande. Novamente ficamos com um código mais limpo, simples de manter e flexível.

Além do *RenderBody* podemos criar nossas próprias sessões, e veremos isso em um próximo post. Desta forma podemos ter MasterPages com sessões diferentes. Além disso veremos futuramente como setar master pages para todas as views de um diretório ou estrutura de diretórios, mais uma novidade do MVC 3.

É isso galera, fiquem ligados e até a próxima.

Vinicius Quaiato.
