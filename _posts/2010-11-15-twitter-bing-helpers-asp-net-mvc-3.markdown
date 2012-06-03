---
layout: post
title: Twitter e Bing helpers ASP.NET MVC 3
wordpress_id: 2136
wordpress_url: http://viniciusquaiato.com/blog/?p=2136
categories:
- ASP.NET MVC
- Twitter Helper
- Helper Twitter
- Helper Bing
- Helpers MVC 3
- WebHelpers
- Helpers
- MVC 3
- Bing Helper
tags:
- title: ASP.NET MVC 3
  slug: asp-net-mvc-3
  autoslug: asp.net-mvc-3
---
Fala galera, é apenas uma dica rápida. Temos no [ASP.NET MVC 3](http://viniciusquaiato.com/blog/asp-net-mvc-3) a possibilidade de utilizar helpers para exibição de dados do twitter e realização de pesquisas no Bing.<del datetime="2010-11-16T11:12:06+00:00">Confesso que não verifiquei se são helpers oficiais.</del>Estes helpers são desenvolvidos e mantidos pelo time do [ASP.NET MVC](http://asp.net/mvc), [veja aqui](http://forums.asp.net/t/1623534.aspx?Is+Microsoft.Web.Helpers+an+official+library%3f).

## Adicionando as referências


Vou adicionar uma referência para Microsoft.Web.Helpers com o NuGet:[![Adicionando WebHelpers com NuGet ASP.NET MVC 3](http://viniciusquaiato.com/images_posts/Add-Library-Package-Reference_2010-11-15_13-42-18-300x200.png "Adicionando WebHelpers com NuGet ASP.NET MVC 3")](http://viniciusquaiato.com/images_posts/Add-Library-Package-Reference_2010-11-15_13-42-18.png)

Ou com o Console do NuGet, digite:
{% highlight csharp %}
Install-Package Microsoft-Web-Helpers
{% endhighlight %}
(o código acima é para a versão RC do MVC 3, com o Beta use [Add-Package](http://viniciusquaiato.com/blog/aprenda-os-comandos-para-adicionar-pacotes-com-nupack/)).

## Utilizando o WebHelper do Twitter no ASP.NET MVC 3
Após adicionarmos o pacote com o NuGet, basta realizarmos a chamada para o helper.Na sua View Index coloque o seguinte código para realizar uma pesquisa no Twitter:
{% highlight csharp %}
@{ Layout = "~/Views/Shared/_Layout.cshtml";
    }


## WebHelpers ASP.NET MVC 3

Isto é uma pesquisa no twitter


@Twitter.Search("@vquaiato")
{% endhighlight %}
E o resultado:[![Twitter Search com WebHelpers no ASP.NET MVC 3](http://viniciusquaiato.com/images_posts/twitter-search-273x300.png "Twitter Search com WebHelpers no ASP.NET MVC 3")](http://viniciusquaiato.com/images_posts/twitter-search.png)

O resultado disso é uma chamada JavaScript para uma library a ser incluída pelo helper na página.É interessante notar que todos estes valores são parâmetros configuráveis na chamada do helper. Isto é possível com a utilização do recurso de parâmetros opcionais no .NET 4.

## Utilizando o WebHelper do Bing no ASP.NET MVC 3
Também podemos disponibilizar em nossa página uma chamada para uma pesquisa utilizando o Bing de forma bastante simples, vejamos:
{% highlight csharp %}
@{ Layout = "~/Views/Shared/_Layout.cshtml";
    }


## WebHelpers ASP.NET MVC 3

Isto é uma pesquisa no Bing


@Bing.AdvancedSearchBox()
{% endhighlight %}
Repare que utilizei o método "AdvancedSearchBox" o outro método "SearchBox" está retornando erro.Como resultado deste helper temos a seguinte página:[![Bing helper no ASP.NET MVC 3](http://viniciusquaiato.com/images_posts/Bing-helper-292x300.png "Bing helper no ASP.NET MVC 3")](http://viniciusquaiato.com/images_posts/Bing-helper.png)

Novamente o html gerado inclui chamadas JavaScript para o Bing.

## Resumo
Existem ainda vários outros helpers nesta dll: LinkShare, Gravatr, Analytics, Facebook, ReCaptcha, etc. De fato a utilização de helpers desta maneira nos ajuda bastante a evitar uma série de retrabalhos. É preciso, no entanto, compreender o que estes helpers estão renderizando e como eles estão atuando.Ainda não verifiquei se estes helpers são de fato disponibilizados pela Microsoft, e não pesquisei para encontrar seu código fonte.Fica aí a dica, e quem tiver mais informações, é só compartilhar.

Abraços,
Vinicius Quaiato.
