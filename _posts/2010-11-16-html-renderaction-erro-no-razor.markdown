--- 
layout: post
title: Html.RenderAction erro no Razor
wordpress_id: 2156
wordpress_url: http://viniciusquaiato.com/blog/?p=2156
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: Razor
  slug: razor
  autoslug: razor
- title: ASP.NET MVC 3
  slug: asp-net-mvc-3
  autoslug: asp.net-mvc-3
- title: Html.RenderAction
  slug: html-renderaction
  autoslug: html.renderaction
- title: Html.Action
  slug: html-action
  autoslug: html.action
---
Fala galera, um amigo me chamou aqui no gtalk para tentar entender por que não estava conseguindo usar o seguinte código:
{% highlight c# %}
@Html.RenderAction("MinhaActionQueRetornaPartial")
{% endhighlight %}
Este código resulta no seguinte erro:<blockquote>Compiler Error Message: CS1502: The best overloaded method match for 'System.Web.WebPages.WebPageExecutingBase.Write(System.Web.WebPages.HelperResult)' has some invalid arguments</blockquote>[caption id="attachment_2157" align="aligncenter" width="300" caption="Compilation Error - Html.RenderAction"][![Compilation Error - Html.RenderAction](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/Compilation-Error-Html.RenderAction-300x252.png "Compilation Error - Html.RenderAction")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/Compilation-Error-Html.RenderAction.png)[/caption]Isso acontece por que se observarmos o método RenderAction é void, e no Razor quando utilizamos o @ estamos pedindo para que o conteúdo seja escrito no response. Mas não é possível escrever um conteúdo void.A saída para isso é utilizar:
{% highlight c# %}
@Html.Action("MinhaActionQueRetornaPartial")
{% endhighlight %}
ou ainda (evite isso, é feio!)
{% highlight c# %}
@{
tml.RenderAction("MinhaActionQueRetornaPartial");
    }

{% endhighlight %}
Isso tudo acaba gerando uma grande confusão. Até faz sentido o RenderAction ser void e internamente renderizar o conteúdo, mas isso fica feio, principalmente agora trabalhando com Razor. Seria melhor se, assim como o método Action ele também retornasse algo parecido com o MvcHtmlString, e então utilizaríamos o @ para renderizar.Bom, fica aí a dica.

Att,
Vinicius Quaiato.
