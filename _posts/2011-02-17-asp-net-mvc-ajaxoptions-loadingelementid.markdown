---
layout: post
title: "ASP.NET MVC AjaxOptions: LoadingElementId"
wordpress_id: 3191
wordpress_url: http://viniciusquaiato.com/blog/?p=3191
categories:
- title: Uncategorized
  slug: uncategorized
  autoslug: uncategorized
tags:
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
---
Continuando a [falar sobre os AjaxOptions](http://viniciusquaiato.com/blog/tag/ajaxoptions/) no [ASP.NET MVC](http://viniciusquaiato.com/blog/category/dotnet/asp-net-dotnet/asp-net-mvc/) desta vez vou abordar o [LoadingElementId](http://msdn.microsoft.com/en-us/library/system.web.mvc.ajax.ajaxoptions.loadingelementid.aspx).Já falamos sobre:- [UpdateTargetId](http://viniciusquaiato.com/blog/asp-net-mvc-ajaxoptions-updatetargetid/)
- [Confirm message](http://viniciusquaiato.com/blog/asp-net-mvc-ajaxoptions-confirm-message/)
A propriedade LoadingElementId configura um id de elemento DOM para ser exibido enquanto a requisição ajax está sendo executada. Ou seja, vamos mostrar uma imagem de progresso enquanto a requisição ajax não é finalizada.Vamos continuar usando o mesmo exemplo dos posts anteriores mas com pequenas mudanças. Nosso formulário ficará da seguinte maneira:
{% highlight csharp %}
@using (Ajax.BeginForm("AjaxAction",    new AjaxOptions { UpdateTargetId = "div_nome", LoadingElementId = "div_loading" }
)){    @Html.TextBox("nome")<br />    @Html.TextBox("sobrenome")    <input type="submit" value="ajax" />}

{% endhighlight %}
Vejam que na linha 2 passo o nome de uma div "div_loading" como valor desta propriedade do objeto AjaxOptions. Esta div possui uma imagem e está com estilo para não ser exibida:
{% highlight csharp %}
<div id="div_loading" style="display:none;


    ">    <img src="@Url.Content("~/Content/loading.gif")" /></div>
{% endhighlight %}
Coloquei também um Thread.Sleep(3000) na action no HomeController, mas não preciso mostrar esse código né?!Quando executarmos nosso formulário teremos o seguinte comportamento:[![ASP.NET MVC AjaxHelper LoadingElementId](http://viniciusquaiato.com/images_posts/Ajax-Helper-LoadingElementId-300x242.png "ASP.NET MVC AjaxHelper LoadingElementId")](http://viniciusquaiato.com/images_posts/Ajax-Helper-LoadingElementId.png)



Podemos ver que a imagem de progresso é exibida durante a requisição ajax.Ao término da mesma, o elemento "div_loading" é ocultado novamente:[![ASP.NET MVC AjaxHelper LoadingElementId loading completo](http://viniciusquaiato.com/images_posts/Ajax-Helper-LoadingElementId-loading-completo-300x242.png "ASP.NET MVC AjaxHelper LoadingElementId loading completo")](http://viniciusquaiato.com/images_posts/Ajax-Helper-LoadingElementId-loading-completo.png)

Simples hein?!Lembrando novamente que este código faz uso do JQuery e do JQuery Unobtrusive, [conforme mostrei no primeiro artigo aqui](http://viniciusquaiato.com/blog/asp-net-mvc-ajaxoptions-updatetargetid/).

### Código fonte
O fonte deste e outros exemplos estão no Github: [https://github.com/vquaiato/ajaxhelpersamples](https://github.com/vquaiato/ajaxhelpersamples)Abraços,Vinicius Quaiato.
