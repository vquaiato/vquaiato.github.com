--- 
layout: post
title: "Windows Phone NavigationService com par\xC3\xA2metros"
wordpress_id: 3929
wordpress_url: http://viniciusquaiato.com/blog/?p=3929
categories: 
- title: Uncategorized
  slug: uncategorized
  autoslug: uncategorized
- title: Windows Phone 7
  slug: windows-phone-7
  autoslug: windows-phone-7
tags: 
- title: Windows Phone 7
  slug: windows-phone-7
  autoslug: windows-phone-7
- title: NagivationService
  slug: nagivationservice
  autoslug: nagivationservice
- title: "par\xC3\xA2metros entre p\xC3\xA1ginas"
  slug: parametros-entre-paginas
  autoslug: "par\xC3\xA2metros-entre-p\xC3\xA1ginas"
---
Fala galera, depois de vermos como realizar navegação entre páginas no Windows Phone usando NavigationService vamos ver agora como passar parâmetros para as páginas.

## Passando parâmetros com NavigationService
Como estamos trabalhando com URIs podemos passar os parâmetros em formato de querystring normalmente, e a classe NavigationContext nos dará o acesso a estes parâmetros.Vamos criar uma página na nossa aplicação Windows Phone e colocar uma caixa de texto e um botão, mais ou menos como abaixo:[caption id="attachment_3931" align="aligncenter" width="165" caption="Windows Phone NavigationService com parametros"][![Windows Phone NavigationService com parametros](http://viniciusquaiato.com/blog/wp-content/uploads/2011/08/Windows-Phone-NavigationService-com-parametros-exemplo-165x300.png "Windows Phone NavigationService com parametros")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/08/Windows-Phone-NavigationService-com-parametros-exemplo.png)[/caption]O evento click do botão desta página executa o código abaixo:
{% highlight csharp %}

private void Button_Click(object sender, RoutedEventArgs e){    NavigationService.Navigate(new Uri(string.Format("/BarPage.xaml?valor={
}
", valor.Text), UriKind.Relative));
    }

{% endhighlight %}
Tudo o que precisamos fazer é colocar o o parâmetro na querystring na nossa URI do método Navigate.Para recuperar isso na BarPage.xaml é bastante simples também:
{% highlight csharp %}
void BarPage_Loaded(object sender, RoutedEventArgs e){
var valor = "<nenhum valor>";
    if (!string.IsNullOrWhiteSpace(NavigationContext.QueryString["valor"]))        valor = NavigationContext.QueryString["valor"].ToString();
    this.valorRecebido.Text = valor;
    }
</nenhum>
{% endhighlight %}
Feito isso teremos nossa página sendo chamada e o parâmetro sendo recuperado:<object width="400" height="750"><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="http://vimeo.com/moogaloop.swf?clip_id=27168277&amp;
    server=vimeo.com&amp;
    show_title=0&amp;
    show_byline=0&amp;
    show_portrait=0&amp;
    color=00adef&amp;
    fullscreen=1&amp;
    autoplay=0&amp;
    loop=0" /><embed src="http://vimeo.com/moogaloop.swf?clip_id=27168277&amp;
    server=vimeo.com&amp;
    show_title=0&amp;
    show_byline=0&amp;
    show_portrait=0&amp;
    color=00adef&amp;
    fullscreen=1&amp;
    autoplay=0&amp;
    loop=0" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="400" height="600"></embed></object>
[Windows Phone NavigationService com parâmetros](http://vimeo.com/27168277) from [vinicius quaiato](http://vimeo.com/user2557055) on [Vimeo](http://vimeo.com).

Demonstração de navegação com parâmetros no Windows Phone 7.
É isso aew galera. Passar parâmetros de uma página para outra em aplicações no Windows Phone 7 é algo bastante simples e trivial. É algo que estamos bem acostumados a fazer na web.Nos próximos posts veremos como trabalharmos com outros métodos da classe NavigationService.

Abraços,
Vinicius Quaiato.
