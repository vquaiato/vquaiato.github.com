--- 
layout: post
title: "ASP.NET MVC 3: dynamic view models e diretiva model"
wordpress_id: 1886
wordpress_url: http://viniciusquaiato.com/blog/?p=1886
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: Razor
  slug: razor
  autoslug: razor
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: ASP.NET MVC 3
  slug: asp-net-mvc-3
  autoslug: asp.net-mvc-3
- title: Model
  slug: model
  autoslug: model
- title: dynamic model
  slug: dynamic-model
  autoslug: dynamic-model
- title: diretiva @model
  slug: diretiva-model
  autoslug: diretiva-@model
---
[![](http://viniciusquaiato.com/images_posts/vortex-150x150.jpg "vortex")](http://viniciusquaiato.com/images_posts/vortex.jpg)Passar um model dynamic para a view não é uma novidade do [ASP.NET MVC 3](http://viniciusquaiato.com/blog/asp-net-mvc-3/). Já na versão 2 podíamos fazer isso, afinal [dynamic](http://viniciusquaiato.com/blog/tag/dynamic/) é uma funcionalidade do [.NET 4](http://msdn.microsoft.com/en-us/library/w0x726c2.aspx).

## Especificando models no MVC2
No ASP.NET MVC 2 para especificar o model de uma view nós utilizamos algo parecido com:
{% highlight csharp %}
<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<minhaclasse>" %></minhaclasse>
{% endhighlight %}
Já quando queremos um model dinâmico, ou seja um dynamic model utilizamos:
{% highlight csharp %}
<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %></dynamic>
{% endhighlight %}
Não é nada complexo, mas é bem feio. Cheio de sujeira, ruído e tudo o mais. E nós não gostamos do nosso código sujo não é?!

## A diretiva @model
No ASP.NET MVC 2 no entando não tínhamos a facilidade da diretiva **@model** que temos no [ASP.NET MVC 3](http://www.asp.net/mvc/mvc3).A diretiva **@model** é uma forma simplificada (realmente mais simples) de informar a view sobre qual o tipo do model que ela deverá utilizar.Para especificar o model de uma view no MVC 3 precisamos codificar toda a listagem abaixo:
{% highlight csharp %}
@model MinhaClasse
{% endhighlight %}
\o/ É isso mesmo! Apenas isso! Não existe mistérioo e não existem segredos!E o dynamic model? Ah sim, mais a complexidade abaixo:
{% highlight csharp %}
@model dynamic
{% endhighlight %}
\o/

## Html helpers e dynamic models
Importante dizer que na utilização de dynamic models não conseguimos utilizamos Html helpers como:Html.LabelFor(model => model.Propriedade)Para isso precisaríamos de um ViewModel(ou o model mesmo).É isso galera, com isso estamos vendo novamente simplicidade do Razor. Espero que aproveitem.

Abraços,
Vinicius Quaiato.
