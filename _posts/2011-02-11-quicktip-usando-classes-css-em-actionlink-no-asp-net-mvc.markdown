--- 
layout: post
title: "QuickTip: Usando classes css em ActionLink no ASP. NET MVC"
wordpress_id: 3099
wordpress_url: http://viniciusquaiato.com/blog/?p=3099
categories: 
- title: ASP. NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: ASP. NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: quick tip
  slug: quick-tip
  autoslug: quick-tip
- title: Html helper
  slug: html-helper
  autoslug: html-helper
- title: css class
  slug: css-class
  autoslug: css-class
---
Quando utilizamos o Html helper no ASP. NET MVC temos a opção de passar um dicionário com valores para os atributos HTML, por exemplo id, alt, title, etc. Porém quando queremos passar uma class temos problemas:[caption id="attachment_3100" align="aligncenter" width="300" caption="Compilation Error html helper css class"][![Compilation Error html helper css class](http://viniciusquaiato.com/images_posts/Compilation-Error-html-helper-css-class-300x142.png "Compilation Error html helper css class")](http://viniciusquaiato.com/images_posts/Compilation-Error-html-helper-css-class.png)[/caption]Para utilizarmos o atributo class preciso usar um "@" como mostra o código abaixo:
{% highlight csharp %}
@Html.ActionLink("Outra Action", "Outra", null, new { @class = "customizada" }
)
{% endhighlight %}
E teremos o resultado:[caption id="attachment_3101" align="aligncenter" width="300" caption="html helper css class"][![html helper css class](http://viniciusquaiato.com/images_posts/html-helper-css-class-300x162.png "html helper css class")](http://viniciusquaiato.com/images_posts/html-helper-css-class.png)[/caption]É issaê.

Abraços,
Vinicius Quaiato.
