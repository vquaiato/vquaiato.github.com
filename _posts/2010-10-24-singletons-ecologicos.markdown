--- 
layout: post
title: "Singletons ecol\xC3\xB3gicos"
wordpress_id: 1902
wordpress_url: http://viniciusquaiato.com/blog/?p=1902
categories: 
- title: Patterns
  slug: patterns
  autoslug: patterns
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: Singleton
  slug: singleton
  autoslug: singleton
- title: Singletons
  slug: singletons
  autoslug: singletons
- title: "Singleton ecol\xC3\xB3gico"
  slug: singleton-ecologico
  autoslug: "singleton-ecol\xC3\xB3gico"
---


[![](http://viniciusquaiato.com/images_posts/single-tree-150x150.jpg "single tree")](http://viniciusquaiato.com/images_posts/single-tree.jpg)

Continuando a falar sobre o problema dos Singletons ([que eu demonstrei aqui](http://viniciusquaiato.com/blog/singletons-sao-um-problema-veja/)) neste artigo demonstrarei como criarmos e utilizarmos Singletons de uma maneira mais sustentável, o que eu carinhosamente chamei de _**"Singletons ecológicos"**_.

## O padrão Singleton x ciclo de vida Singleton
O design pattern Singleton possui uma estrutura básica. De forma resumida uma classe que deve ser singleton precisa implementar um mecanismo interno que garanta um único ponto de acesso a uma única instância de si.Desta forma o [Design Pattern Singleton](http://pt.wikipedia.org/wiki/Singleton) garante que para esta class existe uma única interface conhecida para obter uma instância, um objeto desta classe.Um dos problemas acarretados por isso eu [mostrei aqui](http://viniciusquaiato.com/blog/singletons-sao-um-problema-veja/).O _"ciclo de vida Singleton"_ é um pouco diferente do padrão singleton. Na verdade quando falamos do ciclo de vida Singleton estamos falando que um objeto será singleton, sua existência será singleton, mas ele não implementa o padrão singleton. Ou seja, a forma de atingir este objetivo pode ser diferente. O objeto não precisa conhecer a infraestrutura do padrão.

## Como criar Singletons ecológicos


##

## Utilização do pattern Factory*
Uma outra alternativa para isso é trabalhar com uma fábrica, utilizar o Design Pattern Factory*, seja um Factory Method seja uma Abstract Factory. Desta forma quem deve garantir o ciclo de vida Singleton, ou seja, garantir uma única instância para objetos de um determinado tipo é a fábrica e não o próprio tipo. 

##

## Conteiner de IoC/DI
Uma das formas de trabalhar com Singletons ecológicos, ou seja, os singletons que não vão causar os problemas mencionados neste post aqui: violação de SRP, alto acoplamento, acoplamento oculto, dificuldade em testar, etc, é utilizando um conteiner de inversão de controle/injeção e dependências. Aqui quem garante o ciclo de vida singleton é o conteiner e não o objeto.(Veja mais sobre inversão de controle e injeção de dependências [aqui](http://viniciusquaiato.com/blog/injecao-de-dependencia/) e [aqui](http://viniciusquaiato.com/blog/injecao-de-dependencia-com-ms-unity/))

## Utilizando Ninject para criar singletons ecológicos
[Ninject](http://ninject.org/) é um framework open source para injeção de dependências. Como a maioria destas ferramentas, existe uma espécia de conteiner responsável por resolver as dependências, ou seja, injetar as dependências corretas nos objetos a serem criados.No geral estes conteiners possuem mecanismos para que digamos qual será o ciclo de vida dos objetos por eles criados, sendo assim podemos utilizá-los para gerenciar nossos objetos que devem ser singletons.
{% highlight csharp %}

public class Module : NinjectModule{    

public override void Load()    {        Bind<ishouldbesingleton>()            .To<shouldbesingleton>()            .InSingletonScope();
    }
}
</shouldbesingleton></ishouldbesingleton>
{% endhighlight %}
Este não é um post sobre Ninject([veja mais sobre ele aqui no Wiki](http://github.com/ninject/ninject/wiki/_pages)), estou apenas mostrando como este framework pode nos ajudar a manter nossas classes independentes do acoplamento oculto dos Singletons.Nesta primeira classe fazemos uma espécie de configuração do Ninject. Dizemos que para o tipo IShouldBeSingleton deve ser criado um objeto da classe ShoulBeSingleton. Simples.Mas reparem que na **_linha 7_** estamos utilizando uma instrução para dizer que estes objetos devem ser criados de uma maneira que sejam singleton. Ou seja, estamos delegando ao conteiner de IoC/DI do Ninject a tarefa de gerenciar quando um objeto é singleton ou não. Não é mais responsabilidade de um objeto de domínio.Este é um importante passo para a sustentabilidade na utilização de singletons. \o/Abaixo vemos as outras classes necessárias para nosso pequeno exemplo:
{% highlight csharp %}

public interface IShouldBeSingleton{    DateTime CreatedAt();
    }


public class ShouldBeSingleton : IShouldBeSingleton{    

private DateTime createdAt;
    
public ShouldBeSingleton()    {        this.createdAt = DateTime.Now;
    }
    
public DateTime CreatedAt()    {
return this.createdAt;
    }
}


public class SomeClassThatNeedsASingleton{    

private IShouldBeSingleton _singleton;
    
public SomeClassThatNeedsASingleton(IShouldBeSingleton singleton)    {        _singleton = singleton;
    }
    
public override string ToString()    {        return string.Format("My singletons was created at: {
}
", this._singleton.CreatedAt());
    }
}

{% endhighlight %}
Notem que na **_linha 18_** temos a classe SomeClassThatNeedsASingleton. Na verdade essa classe tem uma dependência para um tipo (uma interface). Para ela na verdade NÃO interessa se esse tipo será trazido como singleton ou não, ela só quer saber que o objeto que ela receber seja do tipo que ela espera, e pronto. Removermos desta classe a obrigatoriedade de saber onde buscar suas dependências, e ainda removemos dela a idéia de conhecer o conceito singleton.Agora criei uma pequena consolle app apenas para demonstrar como isso funcionaria na prática:
{% highlight csharp %}

static void Main(string[] args){    IKernel k = new StandardKernel(new Module());
var someclass = k.Get<someclassthatneedsasingleton>();
    Console.WriteLine(someclass.ToString());
    Thread.Sleep(2000);
    someclass = k.Get<someclassthatneedsasingleton>();
    Console.WriteLine(someclass.ToString());
    Thread.Sleep(2000);
    someclass = k.Get<someclassthatneedsasingleton>();
    Console.WriteLine(someclass.ToString());
    Console.ReadLine();
    }
</someclassthatneedsasingleton></someclassthatneedsasingleton></someclassthatneedsasingleton>
{% endhighlight %}
O código fala por si só não é? Estamos pedindo ao conteiner(o Kernel) do Ninject para criar um objeto da classe SomeClassThatNeedsASingleton, que por sua vez depende de uma classe que o Ninject resolverá.Desta forma eliminamos completamente das nossas classes de domínio quaisquer informações sobre singletons ou o pattern singleton.Temos essa informação somente em uma classe mais de infraestrutura e configuração, que é o Kernel do Ninject. Neste nível acabo entendendo que esta informação não é tão ruim, pois de fato eu não vou testar o Ninject, confio que o framework esteja funcionando e espero que eles tenham testado o mesmo.

## Resumindo...
Acabamos de ver uma forma simples de trabalhar com Singletons sem [todos os problemas que ele taz](http://viniciusquaiato.com/blog/singletons-sao-um-problema-veja/).Compreendemos a diferença entre o pattern singleton e o ciclo de vida singleton, e agora podemos tomar melhores decisões e entender quando precisamos de um e quando precisamos de outro.É evidente que em alguns casos precisaremos de um singleton, e quando estes casos surgirem precisamos compreender como vamos criá-lo: usando o pattern ou um "singleton ecológico"?Espero que tenha conseguido ajudar um pouco, deixem suas críticas e comentários, ajudarão a evoluir a idéia.

Abraços,
Vinicius Quaiato.
