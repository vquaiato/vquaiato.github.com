---
layout: post
title: "ASP.NET MVC AjaxOptions: InsertionMode"
wordpress_id: 3211
wordpress_url: http://viniciusquaiato.com/blog/?p=3211
categories:
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags:
- title: JQuery
  slug: jquery
  autoslug: jquery
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
---
Para acompanhar os outros posts sobre [AjaxOptions](http://viniciusquaiato.com/blog/tag/ajaxoptions/):- [UpdateTargetId](http://viniciusquaiato.com/blog/asp-net-mvc-ajaxoptions-updatetargetid/)
- [Confirm message](http://viniciusquaiato.com/blog/asp-net-mvc-ajaxoptions-confirm-message/)
- [LoadingElementId](http://viniciusquaiato.com/blog/asp-net-mvc-ajaxoptions-loadingelementid/)
- [OnBegin e OnComplete](http://viniciusquaiato.com/blog/asp-net-mvc-ajaxoptions-onbegin-e-oncomplete/)
[InsertionMode](http://msdn.microsoft.com/en-us/library/system.web.mvc.ajax.ajaxoptions.insertionmode.aspx#Y100) é uma propriedade bem interessante. Ela define como o conteúdo será carregado no elemento especificado.Isto quer dizer que podemos definir o conteúdo para ser inserido antes do conteúdo já existente no elemento, após o conteúdo existente ou ainda substituir completamente o conteúdo. Fazemos isso utilizando um dos valores da enumeração InsertionMode: - InsertionMode.InsertAfter
- InsertionMode.InsertBefore
- InsertionMode.Replace
Vamos utilizar o exemplo cru do primeiro artigo, e vamos apenas trabalhar alterando o valor da propriedade InsertionMode do objeto AjaxOptions.Vou utilizar também uma div com um conteúdo já existente, para demonstrar as diferenças:
{% highlight csharp %}

Já existe conteúdo
</div>
{% endhighlight %}
O código para nosso form irá varias como mostra abaixo com InsertBefore:
{% highlight csharp %}
@using (Ajax.BeginForm(    "AjaxAction",    new AjaxOptions { UpdateTargetId = "div_nome", InsertionMode = InsertionMode.InsertBefore}
)){    @Html.TextBox("nome")<br />    @Html.TextBox("sobrenome")    <input type="submit" value="ajax" />}

{% endhighlight %}
Com InsertAfter:
{% highlight csharp %}
@using (Ajax.BeginForm(    "AjaxAction",    new AjaxOptions { UpdateTargetId = "div_nome", InsertionMode = InsertionMode.InsertAfter}
)){    @Html.TextBox("nome")<br />    @Html.TextBox("sobrenome")    <input type="submit" value="ajax" />}

{% endhighlight %}
E com Replace:
{% highlight csharp %}
@using (Ajax.BeginForm(    "AjaxAction",    new AjaxOptions { UpdateTargetId = "div_nome", InsertionMode = InsertionMode.Replace}
)){    @Html.TextBox("nome")<br />    @Html.TextBox("sobrenome")    <input type="submit" value="ajax" />}



{% endhighlight %}
Os resultados podem ser vistos, na mesma ordem, abaixo:[![ASP.NET MVC AjaxHelper InsertionMode.InsertBefore](http://viniciusquaiato.com/images_posts/Ajax-Helper-InsertionMode.InsertBefore-300x239.png "ASP.NET MVC AjaxHelper InsertionMode.InsertBefore")](http://viniciusquaiato.com/images_posts/Ajax-Helper-InsertionMode.InsertBefore.png)



Insertion.InsertAfter:[![ASP.NET MVC AjaxHelper InsertionMode.InsertAfter](http://viniciusquaiato.com/images_posts/Ajax-Helper-InsertionMode.InsertAfter-300x239.png "ASP.NET MVC AjaxHelper InsertionMode.InsertAfter")](http://viniciusquaiato.com/images_posts/Ajax-Helper-InsertionMode.InsertAfter.png)



Replace:[![ASP.NET MVC AjaxHelper InsertionMode.Replace](http://viniciusquaiato.com/images_posts/Ajax-Helper-InsertionMode.Replace-300x239.png "ASP.NET MVC AjaxHelper InsertionMode.Replace")](http://viniciusquaiato.com/images_posts/Ajax-Helper-InsertionMode.Replace.png)

É isso aê galera, simples não? Definimos o comportamento de como e onde as coisas serão carregadas na página. Vale ressaltar que o comportamento padrão, caso nenhuma seja informado, é Replace.

### Código fonte
O fonte deste e outros exemplos estão no Github: [https://github.com/vquaiato/ajaxhelpersamples](https://github.com/vquaiato/ajaxhelpersamples)Abraços,Vinicius Quaiato.
