--- 
layout: post
title: Regras que sempre mudam? IronRuby nelas!
wordpress_id: 1445
wordpress_url: http://viniciusquaiato.com/blog/?p=1445
categories: 
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
tags: 
- title: dynamic
  slug: dynamic
  autoslug: dynamic
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
- title: "regras din\xC3\xA2micas"
  slug: regras-dinamicas
  autoslug: "regras-din\xC3\xA2micas"
---


[![](http://viniciusquaiato.com/images_posts/changeman2lli2-300x224.jpg "Changeman")](http://viniciusquaiato.com/images_posts/changeman2lli2.jpg)

Algumas vezes, em alguns sistemas, temos regras que acabam mudando com frequência. Sabemos que o sistema está sempre mudando, mas em alguns cenários isso ocorre com maior incidência do que em outros.Em um sistema de vendas por exemplo as políticas de descontos podem mudar com muita frequência. Baseadas no tipo do cliente, no tipo da compra, no endereço de entrega, etc.Criar regras que sejam facilmente editáveis em um cenário destes é muito complicado, principalmente se tratando de uma linguagem compilada como o C#. Criar uma forma de configurar isso tudo via aplicação é realmente MUITO complicado. E configurar isso via código requer fazer o deploy a cada alteração: inviável.Uma forma de fazermos isso com simplicidade e facilidade de manutenção é utilizando os [recursos dinâmicos do .NET 4](http://viniciusquaiato.com/blog/apresentacao-dynamic-types-no-net-4/) e utilizando uma das linguagens dinâmicas já suportadas pelo [DLR](http://dlr.codeplex.com/), como o [IronRuby](http://ironruby.codeplex.com/).(Aqui tem um [exemplo de uma calculadora em C# que faz as contas no Ruby](http://viniciusquaiato.com/blog/programacao-dinamica-com-c-e-ironruby/))

### O cenário
Apenas para exemplificar nosso cenário é bem simples. Temos que realizar o cálculo de desconto para um Pedido. Este cálculo varia de acordo com a forma de pagamento escolhida. No momento a regra é que se o pagamento for à vista, desconto de 10%. Caso o pagamento seja parcelado há acréscimo de 5%.Para a utilização de código IronRuby vou utilizar o [RubyEngineCreator](http://viniciusquaiato.com/blog/programacao-dinamica-com-c-e-ironruby/) que postei [neste artigo aqui](http://viniciusquaiato.com/blog/programacao-dinamica-com-c-e-ironruby/).No meu código C# tenho esta chamada:
{% highlight csharp %}

public 
static class CalculadorDeDesconto{    

public 
static decimal ParaPedido(Pedido pedido)    {
var ruby = RubyEngineCreator            .GetRubyObject(rubyFileName: "calculador", rubyClassName: "CalculadorDeDescontos");
var desconto = ruby.calcular(pedido);
return desconto;
    }
}



{% endhighlight %}
O que este código faz é criar um objeto Ruby que está no arquivo calculador.rb. A classe deste objeto é ClaculadorDeDescontos.Nossa regra está nesta classe Ruby:
{% highlight csharp %}
class CalculadorDeDescontos@fator_descontodef initialize@fator_desconto = 0.10enddef calcular(pedido)@fator_desconto = 0.05 unless pedido.Pagamento.to_s == "AVista"pedido.Total * @fator_descontoendend
{% endhighlight %}
Uma classe Ruby bem simples. Com uma variável fator_desconto, inicializada no construtor com o valor 0.10, como pode ser visto na _**linha 5**_.Nas **_linhas 8 a 12_** temos o método calcular, que recebe um pedido (notem que este pedido está definido e foi criado no nosso código C#). Na _**linha 9**_ alteramos o valor do fator de desconto para 0.05 caso não seja um pedido pago à vista. Fiz desta forma para mostrar mais uma "novidade" do Ruby que é o modifier unless. Ou seja, a primeira parte do código será executada somente se a segunda parte for falsa. Bem interessante.E na **_linha 11_** realizamos a conta multiplicando o total do pedido pelo fato de desconto. Lembrando que a última instrução do método será o retorno, isto é retornado como resultado deste método. Aqui podemos ver uma saída do nosso programa:[![Resultado C# regras em IronRuby](http://viniciusquaiato.com/images_posts/resultado-300x121.jpg "Resultado C# regras em IronRuby")](http://viniciusquaiato.com/images_posts/resultado.jpg)



Agora veja o que acontece quando alteramos o nosso script Ruby durante a execução do programa:[![Alterando as regras Ruby](http://viniciusquaiato.com/images_posts/resultado-2-300x137.jpg "Alterando as regras Ruby")](http://viniciusquaiato.com/images_posts/resultado-2.jpg)

Como podemos ver, durante a execução do programa alteramos as regras de cálculo do desconto sem precisar parar ou recompilar o projeto.

### Considerações e Comentários
Este é um exemplo bastante simples, e o próprio EngineCreator é bem simples. Podemos fazer coisas incríveis com o IronRuby, compartilhar instâncias de objetos, passar código Ruby para o C# e passar código C# para o Ruby, mesmo que as classes tenham sido criadas no arquivo Ruby.Existe um grande poder de flexibilidade na utilização de Ruby para pontos dinâmicos em nossos sistemas, e inevitavelmente temos pontos dinâmicos em nossos sistemas. Desta forma conhecer técnicas, ferramentas e linguagens para sabermos tratá-los é apenas benéfico, tanto para nós quanto para o código e a vida útil do projeto.

### Download
[Baixe o projeto aqui](http://viniciusquaiato.com/files/codesamples/dynamic/ConsoleRegrasComIronRuby.zip).

Abraços,
Vinicius Quaiato.
