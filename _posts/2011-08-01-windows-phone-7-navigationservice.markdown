--- 
layout: post
title: Windows Phone 7 NavigationService
wordpress_id: 3907
wordpress_url: http://viniciusquaiato.com/blog/?p=3907
categories: 
- title: Windows Phone 7
  slug: windows-phone-7
  autoslug: windows-phone-7
tags: 
- title: Windows Phone 7
  slug: windows-phone-7
  autoslug: windows-phone-7
---
Fala galera, beleza? Voltando a falar um pouquinho sobre [Windows Phone](http://viniciusquaiato.com/blog/category/windows-phone-7/) vamos ver como funciona o sistema de navigação entre páginas nas nossas aplicações.

## Conhecendo o NavigationService
Para navigarmos entre páginas em nossas aplicações no Windows Phone fazemos uso da classe [NavigationService](http://msdn.microsoft.com/en-us/library/system.windows.navigation.navigationservice(v=vs.92).aspx). Esta classe contém uma série de métodos, eventos e propriedades que fornecem um sistema de navigação parecido com o dos browsers. Isto quer dizer que temos a capacidade de avançar e voltar entre as páginas navegadas por exemplo.O NavigationService encapsula todo o processo de chamar e exibir o novo conteúdo. Como estamos falando de uma aplicação sendo executada no Phone isso quer dizer que navegaremos entre os arquivos .xaml da nossa aplicação.

## Navegando entre páginas no Windows Phone


Chega de blá blá blá... Vamos criar uma aplicação para Windows Phone e criar uma interface parecida com esta:[![Windows Phone NavigationService exemplo](http://viniciusquaiato.com/images_posts/Windows-Phone-NavigationService-exemplo-165x300.png "Windows Phone NavigationService exemplo")](http://viniciusquaiato.com/images_posts/Windows-Phone-NavigationService-exemplo.png)

Esta página contém simplesmente um TextBlock com o evento Tap configurado da seguinte forma:
{% highlight csharp %}

private void TextBlock_Tap(object sender, GestureEventArgs e){    NavigationService.Navigate(new Uri("/PageFoo.xaml", UriKind.Relative));
    }



{% endhighlight %}
 Tudo que precisamos para navegar para uma outra página é chamar o método Nagivate da classe NavigationService passando a uri da página.É importante observar que o tipo de URI neste caso precisa ser UriKind.Relative quando estivermos trabalhando com Windows Phone.PageFoo.xaml nada mais é do que uma página com um texto:[![Windows Phone NavigationService](http://viniciusquaiato.com/images_posts/Windows-Phone-NavigationService-exemplo-2-165x300.png "Windows Phone NavigationService")](http://viniciusquaiato.com/images_posts/Windows-Phone-NavigationService-exemplo-2.png)

Faça o **download **dos exemplos aqui: [https://github.com/vquaiato/windowsphone-navigation-samples](https://github.com/vquaiato/windowsphone-navigation-samples)

## Resumindo
NavigationService é uma classe bem importante e simples de usar no Windows Phone. Faremos uso dela em diversos e diferentes cenários e nos próximos posts veremos como passar parâmetros entre páginas.<object width="400" height="750"><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=27163411&amp;
    server=vimeo.com&amp;
    show_title=0&amp;
    show_byline=0&amp;
    show_portrait=0&amp;
    color=00adef&amp;
    fullscreen=1&amp;
    autoplay=0&amp;
    loop=0" /><embed src="http://vimeo.com/moogaloop.swf?clip_id=27163411&amp;
    server=vimeo.com&amp;
    show_title=0&amp;
    show_byline=0&amp;
    show_portrait=0&amp;
    color=00adef&amp;
    fullscreen=1&amp;
    autoplay=0&amp;
    loop=0" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="400" height="600"></embed></object>
[Windows Phone 7 NavigationService](http://vimeo.com/27163411) from [vinicius quaiato](http://vimeo.com/user2557055) on [Vimeo](http://vimeo.com).

Demonstrando a navigação entre páginas no Windows Phone 7 utilizando NavigationService explicado neste post:
Abraços,Vinicius Quaiato.
