--- 
layout: post
title: "ASP.NET MVC 3: criando functions com Razor"
wordpress_id: 2013
wordpress_url: http://viniciusquaiato.com/blog/?p=2013
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
- title: functions Razor
  slug: functions-razor
  autoslug: functions-razor
---
E o [Razor](http://viniciusquaiato.com/blog/tag/razor/) não pára! Vários posts sobre [ASP.NET MVC 3](http://viniciusquaiato.com/blog/tag/asp-net-mvc-3/), e olhe que ainda estamos no beta!Desta vez vou mostrar como criar functions no Razor. As functions são um pouco diferentes dos helpers pois elas possuem tipo de retorno, e não possuem saída HTML.

## Criando functions com Razor no ASP.NET MVC 3
Uma function é exatamente isso: uma função. Sem muito mistério. Para criar uma function seguimos a seguinte sintaxe:
{% highlight csharp %}
@functions{    tipo_retorno nome_da_function(parametros){        processamentos e operações        return algum retorno se houver    }
}

{% endhighlight %}
Para exemplificar, vamos criar uma function que faz uma conta de soma, sei lá:
{% highlight csharp %}
@functions {
nt SomaDoisNumeros(int n1, int n2){
eturn n1 + n2;
    }
}

{% endhighlight %}
Nenhum mistério né?Em um primeiro momento eu até pensei que este código seria renderizado na página, talvez como um JavaScript, mas não, este código ficará no servidor!E para utilizarmos:
{% highlight csharp %}
<body>    <div>@functions {
nt SomaDoisNumeros(int n1, int n2){
eturn n1 + n2;
    }
}
A soma de 2 + 2 é @SomaDoisNumeros(2,2)    </div></body>
{% endhighlight %}
Interessante não? Podemos definir alguma função a ser utilizada mais de uma vez em alguma view como uma function da view, e então utilizá-la como for necessário, é bastante interessante mesmo. Eu estou muito espantado com o Razor.[caption id="attachment_2018" align="aligncenter" width="300" caption="Resultado utilizacao de functions com Razor"][![Resultado utilizacao de functions com Razor](http://viniciusquaiato.com/images_posts/Resultado-utilizacao-de-functions-com-Razor-300x142.png "Resultado utilizacao de functions com Razor")](http://viniciusquaiato.com/images_posts/Resultado-utilizacao-de-functions-com-Razor.png)[/caption]É isso aê pessoal. É importante lembrar que NÃO devemos misturar em nossas views regras de negócios, apenas regras de apresentação.Algumas vezes vamos confundir um pouco as coisas, mas devemos ao máximo tentar manter apenas as regras de exibição mesmo.

Abraços,
Vinicius Quaiato.
