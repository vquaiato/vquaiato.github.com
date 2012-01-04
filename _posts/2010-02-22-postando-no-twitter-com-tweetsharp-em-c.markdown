--- 
layout: post
title: Postando no Twitter com TweetSharp em C#
wordpress_id: 559
wordpress_url: http://viniciusquaiato.com/blog/?p=559
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
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/02/twitter_512x512-150x150.png "twitter c#")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/02/twitter_512x512.png)Continuando a falar da API TweetSharp, neste post mostrarei como enviar tweets e retweetar mensagens.Novamente estamos utilizando as interfaces fluentes do TweetSharp, o que torna o trabalho bem simples e fácil, pois com a ajuda do intellisense podemos realizar todo trabalho simplesmente navegando através dos métodos, que possuem nomes bem definidos e claros.Bom vamos lá, continuaremos utilizando o código apresentado neste post [aqui](http://viniciusquaiato.com/blog/tweetsharp-acessando-o-twitter-com-c/).Abaixo estou criando o método que envia uma nova mensagem para o Twitter:
{% highlight c# %}

public 
static void PostarMensagemTwitter(string mensagem){
var request = FluentTwitter                   .CreateRequest()                   .AuthenticateAs("seuLogin", "suaSenha")                   .Statuses()                   .Update(mensagem);
var result = request.Request();
    }

{% endhighlight %}
Este método é bem simples e a única novidade é a **_linha 7_**, onde chamamos o método Update, passando uma string, que é a mensagem que será enviada para o Twitter. Para entender mais sobre os outros métodos, veja a explicação [aqui](http://viniciusquaiato.com/blog/tweetsharp-acessando-o-twitter-com-c/).Agora vou alterar o método Main para enviar uma nova mensagem e depois fazer a consulta das últimas 10 mensagens para verificar se realmente conseguimos enviar o tweet:
{% highlight c# %}

static void Main(string[] args){    PostarMensagemTwitter("Enviando tweet através do post do blog!!!");
var tweets = Obter10ultimosTweets();
    foreach (var tweet in tweets)    {        Console.WriteLine("@{
}
 {
}
\n\n", tweet.User.ScreenName, tweet.Text);
    }
        Console.ReadKey();
    }

{% endhighlight %}
O resultado pode ser visto na imagem abaixo:[caption id="attachment_565" align="aligncenter" width="677" caption="Postando mensagem Twitter com C# e Tweetsharp"]![Postando mensagem Twitter com C# e Tweetsharp](http://viniciusquaiato.com/blog/wp-content/uploads/2010/02/Postando-mensagem-twitter.jpg "Postando mensagem Twitter com C# e Tweetsharp")[/caption]Para fazer um retweet, ou seja, repassar uma mensagem que alguém enviou, utilizaremos o método abaixo:
{% highlight c# %}

public 
static void Retweetar(TwitterStatus tweet){
var request = FluentTwitter       .CreateRequest()       .AuthenticateAs("seuLogin", "suaSenha")       .Statuses()       .Retweet(tweet, RetweetMode.Prefix);
var result = request.Request();
    }

{% endhighlight %}
Na **_linha 1_** podemos notar que recebemos como parâmetro um TwitterStatus, que é a mensagem que queremos retweetar. Veremos depois como obter este objeto. Na **_linha 7_** estamos chamando o método Retweet e passando como primeiro parâmetro o tweet que queremos retweetar, e passamos também um valor do enum RetweetMode, neste caso o valor Prefix, indiicando que o prefixo 'RT' deve ser adicionado ao nosso retweet.Alterei o método Main para selecionar um tweet específico, retweetar, e então listar os últimos 10 para vermos o nosso retweet:
{% highlight c# %}

static void Main(string[] args){
var tweets = Obter10ultimosTweets();
var paraRetweetar = tweets.Where(t => t.User.ScreenName == "vquaiato").First();
    Retweetar(paraRetweetar);
    tweets = Obter10ultimosTweets();
    foreach (var tweet in tweets)    {        Console.WriteLine("@{
}
 {
}
\n\n", tweet.User.ScreenName, tweet.Text);
    }
    Console.ReadKey();
    }

{% endhighlight %}
A única novidade aqui é que estou selecionando um tweet específico na **_linha 4_**, no caso um tweet que tenha sido enviado por mim.O resultado pode ser conferido na imagem abaixo (e se você me segue no twitter, deve ter visto estas mensagens também @vquaiato):[caption id="attachment_574" align="aligncenter" width="677" caption="Retweet com TweetSharp em C#"][![Retweet com TweetSharp em C#](http://viniciusquaiato.com/blog/wp-content/uploads/2010/02/Retweetando-com-TweetSharp.jpg "Retweet com TweetSharp em C#")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/02/Retweetando-com-TweetSharp.jpg)[/caption]É isso aê! Deste jeito teremos um cliente para twitter pronto de forma bem simples e objetiva.Recebi algumas dicas de outras bibliotecas para acessar o Twitter também, e em breve postarei algo aqui.O [@juloliveira](http://twitter.com/juloliveira) indicou o [Linq2Twitter](http://www.codeplex.com/LinqToTwitter).O [@brunokenj](http://twitter.com/brunokenj) indicou o [Twitterizer](http://code.google.com/p/twitterizer/).Logo mais falo sobre estas bibliotecas aqui.

Abraços,
 e lembrando que os comentários e dúvidas, críticas, etc, são sempre bem vindos.Vinicius Quaiato.
