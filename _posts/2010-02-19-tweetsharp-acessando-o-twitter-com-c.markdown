--- 
layout: post
title: "TweetSharp: Acessando o Twitter com C#"
wordpress_id: 510
wordpress_url: http://viniciusquaiato.com/blog/?p=510
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: Twitter
  slug: twitter
  autoslug: twitter
tags: 
- title: Twitter
  slug: twitter
  autoslug: twitter
- title: TweetSharp
  slug: tweetsharp
  autoslug: tweetsharp
- title: "M\xC3\xADdias Sociais"
  slug: midias-sociais
  autoslug: "m\xC3\xADdias-sociais"
---
![twitter_bird](http://viniciusquaiato.com/images_posts/twitter_bird.jpg "twitter_bird")Fala galera, vou demonstrar como é simples acessar o Twitter utilizando a biblioteca TweetSharp e suas interfaces fluentes. Primeiramente baixe as dlls do Tweetsharp <del datetime="2010-07-03T17:56:57+00:00">[aqui](http://code.google.com/p/tweetsharp/)</del> [**aqui no Codeplex**](http://tweetsharp.codeplex.com/).O [TweetSharp](http://tweetsharp.com/) é uma api que fornece acesso de forma simplificada à API do Twitter. Vamos então criar um projeto utilizando o Visual Studio 2010 beta 2 porém estou utilizando a versão 3. 5 para o projeto, pois existem alguns conflitos com o framework 4. Estou criando uma Console Application, para que possamos ver uma saída gráfica do nosso código. Vamos adicionar a referência para o TweetSharp em nosso projeto, como mostra a figura abaixo:[caption id="attachment_514" align="aligncenter" width="651" caption="Adicionando Referencias TweetSharp"]![Adicionando Referencias TweetSharp](http://viniciusquaiato.com/images_posts/Referencias-TweetSharp.jpg "Adicionando Referencias TweetSharp")[/caption]Feito isso vou criar 2 métodos. Um para para buscar os 10 últimos tweets da minha lista e o outro para exibir a lista de amigos. Primeiramente inclua estes 3 statements using:
{% highlight csharp %}
using Dimebrain.TweetSharp.Model;
    using Dimebrain.TweetSharp.Fluent;
    using Dimebrain.TweetSharp.Extensions;
    
{% endhighlight %}
No código acima estamos adicionando as referências para usarmos os métodos de extensão e as interfaces fluentes do TweetSharp e também as classes do mesmo. Abaixo temos o método que busca os 10 últimos tweets:
{% highlight csharp %}

private 
static IEnumerable<twitterstatus> Obter10UltimosTweets(){
var search = FluentTwitter                    .CreateRequest()                    .AuthenticateAs("seuLogin", "suaSenha")                    .Statuses()                    .OnHomeTimeline()                    .Take(10)                    .AsJson();
var result = search.Request();
return result.AsStatuses();
    }
</twitterstatus>
{% endhighlight %}
Por utilizar [interfaces fluentes](http://en.wikipedia.org/wiki/Fluent_interface) O código fica bem simples e legível. Na **_linha 4_** criamos um request utilizando a api do TweetSharp. Na **_linha 5_** dizemos quais credenciais devem ser utilizadas. Na **_linha 6_** informamos que queremos trabalhar com os "statuses" ou seja, os tweets. Na **_linha 7_** dizemos que queremos os tweets que aparecem na nossa home, ou seja, de quem seguimos e os nossos também. Já na **_linha 8_** pegamos apenas 10 destes tweets e os formatamos em Json na **_linha 9_**.O código em si é realmente bastante legível. E o nosso método main fica assim:
{% highlight csharp %}

static void Main(string[] args){
var tweets = Obter10ultimosTweets();
foreach(var tweet in tweets)    {        Console.WriteLine("@{
}
 {
}
\n\n", tweet.User.ScreenName, tweet.Text);
    }
    Console.ReadKey();
    }

{% endhighlight %}
Este método é bem simples, apenas itera os elementos retornados pelo método anterior. As propriedades do objeto TwitterStatus podem ser conferidas com ajuda do intellisense ou então pressionado F12 sobre a classe. O resultado pode ser visto na imagem abaixo:[caption id="attachment_536" align="aligncenter" width="677" caption="10 Últimos Tweets com TweetSharp"]![10 Últimos Tweets com TweetSharp](http://viniciusquaiato.com/images_posts/10UltimosTweets.jpg "10 Últimos Tweets com TweetSharp")[/caption]Para exibir a lista de amigos vou utilizar o método abaixo:
{% highlight csharp %}

public 
static IEnumerable<twitteruser> ObterListaDeAmigos(){
var search = FluentTwitter                    .CreateRequest()                    .AuthenticateAs("seuLogin", "suaSenha")                    .Users()                    .GetFriends()                    .AsJson();
var result = search.Request();
return result.AsUsers();
    }
</twitteruser>
{% endhighlight %}
A diferença neste código para o anterior está na **_linha 6_** onde informamos que queremos trabalhar com os usuários, e na **_linha 7_** onde dizemos que queremos obter os friends, ou seja, as pessoas que estamos seguindo. E alteramos o código do método main de forma que fique assim;
    
{% highlight csharp %}

static void Main(string[] args){
var tweets = Obter10ultimosTweets();
foreach(var tweet in tweets)    {        Console.WriteLine("@{
}
 {
}
\n\n", tweet.User.ScreenName, tweet.Text);
    }
    Console.WriteLine("\n\nLISTA DE AMIGOS\n\n");
var amigos = ObterListaDeAmigos();
foreach(var amigo in amigos)    {        Console.WriteLine("@{
}
", amigo.ScreenName);
    }
    Console.ReadKey();
    }

{% endhighlight %}
O resultado pode ser conferido na imagem abaixo:[caption id="attachment_535" align="aligncenter" width="677" caption="Lista de amigos com TweetSharp"]![Lista de amigos com TweetSharp](http://viniciusquaiato.com/images_posts/lista-de-amigos.jpg "Lista de amigos com TweetSharp")[/caption]Bom pessoal, é basicamente isso. A biblioteca TweetSharp oferece ainda diversos outros recursos, tudo que é necessário para se fazer um bom trabalho com o twitter.Dúvidas, sugestões, reclamações: os comentários estão aí pra isso.

Att,
Vinicius Quaiato.
