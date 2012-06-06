---
layout: post
title: Html.LabelFor e Html.LabelForModel no ASP.NET MVC 3
wordpress_id: 2161
wordpress_url: http://viniciusquaiato.com/blog/?p=2161
categories:
- ASP.NET MVC
- ASP.NET MVC 3
- MVC 3
- LabelFor
- LabelForModel
tags:
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
---
Fala galera, só um "quick update" básico sobre [ASP.NET MVC 3](http://viniciusquaiato.com/blog/asp-net-mvc-3). Antes nossa única opção para trabalhar com Html.LabelFor era:
{% highlight csharp %}
@Html.LabelFor(m => m.Propriedade)
{% endhighlight %}

O mesmo é válido para Html.LabelForModel, útil para exibir uma informação sobre o model, indicar o que a página faz, algo assim.
{% highlight csharp %}
@Html.LabelForModel()
{% endhighlight %}

Isso funcionava bem se suas propriedades tivessem exatamente o nome que você precisavam exibir. Para exibir <del datetime="2010-11-19T10:34:57+00:00">um nome</del> um texto no label diferente do nome da propriedade você precisava utilizar o atributo [DisplayName](http://msdn.microsoft.com/pt-br/library/system.componentmodel.displaynameattribute.aspx) e informar o texto de exibição do label <del datetime="2010-11-19T10:34:57+00:00">nome de exibição</del>.
Para o LabelForModel <del datetime="2010-11-19T10:34:57+00:00">model</del> a mesma coisa.

Agora no [ASP.NET MVC 3](http://asp.net/mvc/mvc3) temos overloads para permitir informar o texto do label a ser criado. Então é possível fazer:
{% highlight csharp %}
@Html.LabelFor(m => m.Propriedade, "texto do label")
{% endhighlight %}

E para o model:
{% highlight csharp %}
@Html.LabelForModel("Nome do Model")
{% endhighlight %}

Ficou mais simples e interessante. Ainda é possível fazer da maneira antiga, entenda qual é a melhor para você. Sem dúvidas o ASP.NET MVC 3 está muito bom.

Abraços,

Vinicius Quaiato.
