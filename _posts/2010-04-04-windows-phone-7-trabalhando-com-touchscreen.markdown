--- 
layout: post
title: "Windows Phone 7: trabalhando com touchscreen"
wordpress_id: 813
wordpress_url: http://viniciusquaiato.com/blog/?p=813
categories: 
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: Silverlight
  slug: silverlight
  autoslug: silverlight
- title: Windows Phone 7
  slug: windows-phone-7
  autoslug: windows-phone-7
tags: 
- title: Novidades
  slug: novidades
  autoslug: novidades
- title: Windows Phone 7
  slug: windows-phone-7
  autoslug: windows-phone-7
- title: WP7
  slug: wp7
  autoslug: wp7
- title: Touch Screen
  slug: touch-screen
  autoslug: touch-screen
---
Continuando a falar sobre o Windows Phone 7, vou demonstrar de forma simples como trabalhar com recursos de touchscreen.Criarei uma aplicação muito simples, quando um texto é pressionado e arrastado (com os dedos na tela) ele mudará de cor de forma aleatória, como pode ser visto no vídeo abaixo:<object width="400" height="300"><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=10672357&amp;
    server=vimeo.com&amp;
    show_title=1&amp;
    show_byline=1&amp;
    show_portrait=0&amp;
    color=&amp;
    fullscreen=1" /><embed src="http://vimeo.com/moogaloop.swf?clip_id=10672357&amp;
    server=vimeo.com&amp;
    show_title=1&amp;
    show_byline=1&amp;
    show_portrait=0&amp;
    color=&amp;
    fullscreen=1" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="400" height="300"></embed></object>
[TouchScreen no Windows Phone 7 Series](http://vimeo.com/10672357) from [vinicius quaiato](http://vimeo.com/user2557055) on [Vimeo](http://vimeo.com).
Tudo que precisaremos para que isto funcione é adicionar o seguinte avento ManipulationDelta ao TextBlock:
{% highlight csharp %}
<textblock manipulationdelta="textBlockListTitle_ManipulationDelta" text="Click e arraste!" fontsize="100" />
{% endhighlight %}
E no Code behinde:
{% highlight csharp %}

private void textBlockListTitle_ManipulationDelta(object sender, ManipulationDeltaEventArgs e){    Random random = new Random(DateTime.Now.Millisecond);
var texto = sender as TextBlock;
var cor = Color.FromArgb(255,                                (byte)random.Next(256),                                (byte)random.Next(256),                                (byte)random.Next(256));
    texto.Foreground = new SolidColorBrush(cor);
    }

{% endhighlight %}
O código é realmente simples. Este evento é acionado sempre que a manipulação do componente muda, ou seja, quando ele é pressionado e então movido. Imagine-se tocando este texto com os dedos, e então deslizando-o para os lados. Na verdade se você possuir um monitor touchscreen poderá fazer exatamente isso, sem a necessidade do mouse.A solução pode ser baixada [aqui](http://viniciusquaiato.com/files/codesamples/windowsphone7/TouchScreenWindowsPhone7.zip).Lembrando que para rodá-la é necessário estar com o ambiente instalado, isso pode ser visto [aqui](http://viniciusquaiato.com/blog/windows-phone-7-preparando-ambiente-para-desenvolver/).

Att,
Vinicius Quaiato.
