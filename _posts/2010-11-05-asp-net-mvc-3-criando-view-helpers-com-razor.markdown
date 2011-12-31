--- 
layout: post
title: "ASP.NET MVC 3: Criando view helpers com Razor"
wordpress_id: 2005
wordpress_url: http://viniciusquaiato.com/blog/?p=2005
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
- title: Helpers
  slug: helpers
  autoslug: helpers
- title: Razor helpers
  slug: razor-helpers
  autoslug: razor-helpers
---
Fala galera, pois é, não canso de falar do [ASP.NET MVC 3](http://viniciusquaiato.com/blog/asp-net-mvc-3/), temos muitas novidades interessantes.Hoje quero mostrar mais uma delas, bastante interessante e simples: A criação de Helpers no [Razor](http://viniciusquaiato.com/blog/?s=razor&x=0&y=0).Agora é possível criar Helpers de forma mais simples utilizando Razor. Isso quer dizer que temos uma amneira fácil de criar helpers mesclando HTML e C#, afinal o Razor nos permite isso.Não precisamos mais criar uma classe puramente C# e ficar trabalhando com Response.Write. Já que a transição do código C# para o código HTML é simples, vamos utilizar isso.

## Criando um helper com Razor
Primeiramente precisamos criar a pasta "App_Code". Os helpers do Razor precisam estar neste folder:[caption id="attachment_2006" align="aligncenter" width="298" caption="Criar pasta App_Code para usar Razor helpers"][![Criar pasta App_Code para usar Razor helpers](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Razor-helpers-298x300.png "Criar pasta App_Code para usar Razor helpers")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Razor-helpers.png)[/caption]Agora basta criarmos um arquivo Razor nesta pasta. Vou criar um arquivo chamado "MeuHelper.cshtml" e colocar o código abaixo:**Este código NÃO funciona mais!**
{% highlight csharp %}
@helper PrintBlogAddress(){Visite: http://viniciusquaiato.com}
{% endhighlight %}
Na versão RC (e posterior do ASP.NET MVC 3) este código não está mais funcionando. Para que o mesmo funcione você precisa colocar esse conteúdo dentro de alguma marcação HTML:
{% highlight csharp %}
@helper PrintBlogAddress(){
Visite: http://viniciusquaiato.com
}
{% endhighlight %}
É isso! Este é o processo de criação de um Helper no Razor: muito simples!Primeiro utilizamos a marcação @helper. Com isso informação que estamos criando um helper. Informamos o nome do método e seus parâmetros caso existam.Como estamos trabalhando com [Razor](http://viniciusquaiato.com/blog/asp-net-mvc-3-razor-view-engine/), podemos facilmente mesclar o código HTML com o código C#. No meu caso apenas utilizei código HTML, e escrevi um texto. Ou seja, este meu helper apenas coloca esta frase na tela. Não há necessidade de StringBuilders, trabalhar com response, etc. É tudo Razor!E para utilizar faço a seguinte chamada na minha view:
{% highlight csharp %}

{% endhighlight %}
Mais simples que isso, não sei! Utilizamos o símbolo de @ do Razor para mostrar que queremos "printar" esta informação no response. Depois colocamos o nome do arquivo seguido pelo nome do método. Bastante simples.E como resultado:[caption id="attachment_2007" align="aligncenter" width="300" caption="Resultado Razor helper"][![Resultado Razor helper](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Resultado-Razor-helper-300x188.png "Resultado Razor helper")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Resultado-Razor-helper.png)[/caption]É isso aê galera. Temos uma maneira bastante simples de criar helpers para trabalhar com HTML.Eu particularmente gosto desta abordagem pois no geral os helpers que criamos existem para lidar com HTML, e o Razor é perfeito para isso. Eu quase acredito que estou trabalhando apenas com HTML (HTML6 talvez? :P).Abraços,Vinicius Quaiato.
