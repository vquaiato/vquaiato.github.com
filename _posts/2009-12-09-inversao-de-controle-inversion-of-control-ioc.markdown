--- 
layout: post
title: "Invers\xC3\xA3o de Controle (Inversion of Control / IoC)"
wordpress_id: 260
wordpress_url: http://viniciusquaiato.com/blog/?p=260
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: Patterns
  slug: patterns
  autoslug: patterns
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: SOLID
  slug: solid
  autoslug: solid
- title: Arquitetura
  slug: arquitetura
  autoslug: arquitetura
- title: IoC
  slug: ioc
  autoslug: ioc
- title: Patterns
  slug: patterns
  autoslug: patterns
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
- title: "Invers\xC3\xA3o de Controle"
  slug: inversao-de-controle
  autoslug: "invers\xC3\xA3o-de-controle"
---
Fala galera, beleza? Escolhi falar de[ Inversão de Controle](http://pt.wikipedia.org/wiki/Invers%C3%A3o_de_controle) pois recentemente precisei utilizar este conceito em uma nova implementação no trabalho. E também percebi o quão necessário é que os desenvolvedores conheçam este conceito/padrão/técnica.Bom vamos lá. Inversão de Controle, como o próprio nome diz significa que o controle de execução do programa/código muda. Eu gosto de pensar também que o controle de conhecimento do código muda. Como isso? De uma forma bem simplista podemos dizer por exemplo que o controle que uma classe/método possui acaba sendo mudado, invertido, para algum outro ponto do código. Vamos ver um exemplo de código:
{% highlight csharp %}

public class Pedido{    

private EnviadorDeEmails enviador = null;
    
public void Gravar()    {        //Vai ao banco de dados        this. enviador = new EnviadorDeEmails("smtp","conta@empresa.com","senha");
    this.enviador.EnviarEmail("Novo Pedido Criado!");
    }
}

{% endhighlight %}
Esta classe possui não somente o controle do fluxo de execução do programa, mas ela possui o controle sobre o código, e isso significa alto acoplamento e responsabilidades demais. Ela sabe exatamente como criar um EnviadorDeEmails, e controla também os parâmetros de configuração do smtp. Ainda que ela recuperasse estes valores do arquivo .config ou do banco de dados, ela teria esse controle. Como poderíamos, de forma simples, inverter este controle? Uma maneira simples e eficaz seria utilizando um [Factory Method](http://www.dofactory.com/patterns/patternfactory.aspx) estático, na própria classe EnviadorDeEmails, vejamos como ficaria:
{% highlight csharp %}

public 
static EnviadorDeEmails ObterEnviadorDeEmails(){    //valores podem vir do .config    //podem vir do banco    //quem consome esta classe não sabe    //ela não tem controle sobre isso
return new EnviadorDeEmails("smtp", "email@empresa.com", "senha");
    }

{% endhighlight %}
E então nossa classe Pedido ficaria assim:
{% highlight csharp %}

public class Pedido{    

private EnviadorDeEmails enviador = null;
    
public void Gravar()    {        //Vai ao banco de dados        this. enviador = EnviadorDeEmails.ObterEnviadorDeEmails();
    this.enviador.EnviarEmail("Novo Pedido Criado!");
    }
}

{% endhighlight %}
É isso pessoal. Esta é uma das muitas maneiras de realizar Inversão de Controle. Como [Martin Fowler](http://martinfowler.com/) explica, uma outra forma de IoC seria utilizando [Template Methods](http://en.wikipedia.org/wiki/Template_method_pattern). A classe abstrata define o fluxo de controle, mas o que será executado é o código cliente quem define, e assim o controle é novamente invertido. Poderíamos fazer isso utilizando Injeção de Dependências, e Contêiners de IoC/DI.Nos próximos posts falaremos mais sobre Injeção de Dependências e Contêiners de IoC. Martin Fowler tem um texto clássico sobre este assunto: [http://martinfowler.com/bliki/InversionOfControl.html ](http://martinfowler.com/bliki/InversionOfControl.html)Abraços.Vinicius Quaiato.
