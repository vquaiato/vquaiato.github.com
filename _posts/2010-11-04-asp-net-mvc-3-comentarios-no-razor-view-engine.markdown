--- 
layout: post
title: "ASP.NET MVC 3: coment\xC3\xA1rios no Razor View Engine"
wordpress_id: 1998
wordpress_url: http://viniciusquaiato.com/blog/?p=1998
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
- title: ASP.NET MVC 3 Beta
  slug: asp-net-mvc-3-beta
  autoslug: asp.net-mvc-3-beta
---
Fala galera, essa é apenas uma dica simples e rápida.

## Comentando código no Razor
Eu definitivamente não gosto de comentários no código, nem no HTML, mas se isso for útil para vocês:
{% highlight c# %}
<body>    <div>@*Isso não deve aparecer                        Nem isso                        Tampouco isso!*@Isso deve aparecer@{
/isto não aparecerá!                        //é um comentário C# mesmo}
    </div></body>
{% endhighlight %}
Resultado:[caption id="attachment_1999" align="aligncenter" width="300" caption="Resultado de view com Razor e comentarios"][![Resultado de view com Razor e comentarios](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Resultado-de-view-com-Razor-e-comentarios-300x173.png "Resultado de view com Razor e comentarios")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Resultado-de-view-com-Razor-e-comentarios.png)[/caption]Tá aí, uma dica simples.

Abraços,
Vinicius Quaiato.
