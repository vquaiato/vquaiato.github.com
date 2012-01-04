--- 
layout: post
title: Gravatar web helper no ASP.NET MVC 3
wordpress_id: 2228
wordpress_url: http://viniciusquaiato.com/blog/?p=2228
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: ASP.NET MVC 3
  slug: asp-net-mvc-3
  autoslug: asp.net-mvc-3
- title: Helpers
  slug: helpers
  autoslug: helpers
- title: Gravatar
  slug: gravatar
  autoslug: gravatar
- title: Microsoft.Web.Helpers
  slug: microsoft-web-helpers
  autoslug: microsoft.web.helpers
- title: Gravatar helper
  slug: gravatar-helper
  autoslug: gravatar-helper
---
Fala galera, esta é uma feature bem legal disponível através de um web helper no [ASP.NET MVC 3](http://viniciusquaiato.com/blog/asp-net-mvc-3): Exibir a imagem do [Gravatar](http://pt.gravatar.com/).Primeiro você precisa baixar o pacote Microsoft.Web.Helpers com o [NuGet](http://viniciusquaiato.com/blog/tag/nuget/):
{% highlight csharp %}
Install-Package Microsoft-Web-Helpers
{% endhighlight %}
Feito isso adicione o seguinte código na sua view onde você deseja exibir o Gravatar:
{% highlight csharp %}
@using Microsoft.Web.Helpers;
    @Gravatar.GetHtml("seuemail@provedor.com");
    
{% endhighlight %}
Pronto, esse é o código necessário para exibir a imagem do Gravatar usando o helper. Precisamos incluir uma referência para o namespace como visto na **_linha 1_**. E depois fazemos a chamada para o helper Gravatar na **_linha 3_**, informando o e-mail associado a uma imagem.O resultado pode ser visto na imagem abaixo:[caption id="attachment_2267" align="aligncenter" width="300" caption="Gravatar no ASP.NET MVC 3"][![Gravatar no ASP.NET MVC 3](http://viniciusquaiato.com/images_posts/Gravatar-300x133.png "Gravatar no ASP.NET MVC 3")](http://viniciusquaiato.com/images_posts/Gravatar.png)[/caption]É isso galera. Esta é uma forma bastante simples de consumir o serviço do Gravatar.

Abraços,
Vinicius Quaiato.
