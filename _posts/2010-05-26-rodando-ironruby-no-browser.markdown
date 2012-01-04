--- 
layout: post
title: Rodando IronRuby no browser
wordpress_id: 981
wordpress_url: http://viniciusquaiato.com/blog/?p=981
categories: 
- title: Silverlight
  slug: silverlight
  autoslug: silverlight
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
tags: 
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
- title: Silverlight
  slug: silverlight
  autoslug: silverlight
- title: IronRuby Browser
  slug: ironruby-browser
  autoslug: ironruby-browser
---
Pois é, é possível utilizar o [Ruby ](http://ruby-lang.org)diretamente no browser, graças ao [IronRuby ](http://ironruby.net)com [Silverlight ](http://silverlight.net)podemos escrever scripts diretamente com Ruby. Neste post mostrarei apenas como "configurar" tudo para ser executado. É algo bem simples, e não requer grande esforço.Vamos precisar apenas de um servidor web, e eu estou utilizando o IIS. Crie um arquivo HTML com o código abaixo:
{% highlight csharp %}
        document.divMessage.onclick do |s,e|            document.divMessage.innerHTML = s. Id             document.divMessage.innerHTML += " | " + s. ToString             document.divMessage.innerHTML += " | " + e. to_s        end    </script></body></html>
{% endhighlight %}
Wow! Mas que código é este?! Isto é IronRuby, ou seja, código Ruby + código .NET.Neste código é importante notar a _**linha 3**_, onde incluímos um arquivo javascript, e este é o responsável por permitir que o IronRuby seja executado diretamente no browser. Este código javascript inicializa o Silverlight, de modo que o IronRuby possa ser executado. Na linha 6 apenas criamos uma div com um texto indicando que o IronRuby está sendo inicializado. Nada demais, texto puro. Da **_linha 7_** até a _**linha 13**_ criamos um script do tipo text/ruby, sim! Dentro deste script é que escrevemos nosso código Ruby/IronRuby. Perceba que na linha 8 estamos definindo o que acontecerá quando a div for clicada. Na _**linha 9**_ estou obtendo o id do sender deste evento e atribuindo diretamente ao innerHTML da nossa div. Na _**linha 10**_ estou chamando o método ToString do .NET (isso!) no sender do evento. E na _**linha 11**_ estou chamando o método to_s, que é o ToString do Ruby, ou seja, estamos realmente usando Ruby e .Net! Poderíamos trocar por este código aqui:
{% highlight csharp %}
document.divMessage.onclick do |s,e|    window. alert "Alert direto do IronRuby"end
{% endhighlight %}
Bem interessante não?! Para que tudo isso funcione, salve este arquivo como .html mesmo, mas faça isso dentro de um diretório mapeado pelo IIS (ou pelo seu servidor web, Apache por exemplo). No meu caso coloquei dentro de uma pasta chamada ironruby e acesse assim: http://localhost/ironruby/teste.htmlPágina sendo executada:[caption id="attachment_982" align="aligncenter" width="300" caption="IronRuby rodando direto no browser"][![IronRuby rodando direto no browser](http://viniciusquaiato.com/images_posts/ironruby-300x141.png "IronRuby rodando direto no browser")](http://viniciusquaiato.com/images_posts/ironruby.png)[/caption]Resultado após o click:[caption id="attachment_983" align="aligncenter" width="300" caption="IronRuby após click rodando direto no browser"][![IronRuby após click rodando direto no browser](http://viniciusquaiato.com/images_posts/ironruby2-300x141.png "IronRuby após click rodando direto no browser")](http://viniciusquaiato.com/images_posts/ironruby2.png)[/caption]Resultado após click com alert:[caption id="attachment_986" align="aligncenter" width="300" caption="IronRuby rodando direto no browser com alert"][![IronRuby rodando direto no browser com alert](http://viniciusquaiato.com/images_posts/ironruby3-300x144.png "IronRuby rodando direto no browser com alert")](http://viniciusquaiato.com/images_posts/ironruby3.png)[/caption]É isso galera, simples e prático. Nos próximos posts demonstro como trabalhar com XAML + IronRuby direto no browser.

Att,
Vinicius Quaiato.
