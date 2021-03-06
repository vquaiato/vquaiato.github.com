--- 
layout: post
title: "Nem s\xC3\xB3 de Constructor Injection vive o IoC"
wordpress_id: 2274
wordpress_url: http://viniciusquaiato.com/blog/?p=2274
categories: 
- title: Patterns
  slug: patterns
  autoslug: patterns
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: Patterns
  slug: patterns
  autoslug: patterns
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
- title: "Inje\xC3\xA7\xC3\xA3o de Depend\xC3\xAAncia"
  slug: injecao-de-dependencia
  autoslug: "inje\xC3\xA7\xC3\xA3o-de-depend\xC3\xAAncia"
---


[![Inversion of Control](http://viniciusquaiato.com/images_posts/Tony-Hawk_Looping-150x150.jpg "Inversion of Control")](http://viniciusquaiato.com/images_posts/Tony-Hawk_Looping.jpg)

Esta semana começou uma [thread no .NET Architects](http://groups.google.com/group/dotnetarchitects/browse_thread/thread/22cbe4cf05c2ad46#) a respeito de MEF. Não sei bem como mas a discussão caiu em "Service Locator é ruim!" beirando a algo como "Service Locator é a razão de toda a fome mundial!".Sempre ouvimos falar sobre "ter cuidado pois cada caso é um caso" ou "não há verdade absoluta".As pessoas falam também em "the best tool for the job". Mas quantos experimentam mais do que um martelo para usar com parafuso? Quantos experimentam e se perguntam os "porquês" por detrás de algumas afirmações e opiniões?Foi dito por lá:<blockquote>Service Locator fere a IoC e fere SoC.</blockquote>Talvez esse post o ofenda de alguma maneira. Fira seus princípios e suas crenças. Então se quiser pare por aqui.

## Service Locator não fere IoC!
Não há como o [Service Locator](http://en.wikipedia.org/wiki/Service_locator_pattern) ferir [IoC](http://en.wikipedia.org/wiki/Inversion_of_control), pois Service Locator é uma das formas de obter [Inversão de Controle](http://viniciusquaiato.com/blog/inversao-de-controle-inversion-of-control-ioc/)(IoC). E mesmo que você diga que o [Martin Fowler disse que não](http://martinfowler.com/articles/injection.html#UsingAServiceLocator), eu acredito que sim!Como disse o [Pedro Reys](http://twitter.com/pedroreys): <blockquote>Apelo à autoridade não fica muito bonito não.</blockquote>Inversion of Control não é apenas [Injeção de Dependências](http://viniciusquaiato.com/blog/injecao-de-dependencia/)!Aqui é que começa o erro da maioria dos desenvolvedores: achar que inversão de controle é feita apenas com injeção de dependências, e pior ainda, achar que injeção de dependências é feita somente através do construtor.

## O que é a Inversão de Controle
[Inversão de Controle](http://pt.wikipedia.org/wiki/Invers%C3%A3o_de_controle) é o nome dado a técnica de remover de um objeto o controle sobre a criação/lookup de suas dependências. Ponto.

## A Injeção de Dependências
Injeção de Dependência é o nome da técnica utilizada para enviar(injetar) em um objeto suas dependências. Injeção de Dependências é uma forma de Inversão de Controle.

### As formas de Injeção de Dependências
[Existem 3 formas de realizar injeção de dependências](http://en.wikipedia.org/wiki/Dependency_injection#Types): via construtor, via propriedade e via interface.A forma mais utilizada é via construtor. Isso quer dizer que no construtor do seu objeto você recebe TODAS as dependências externas dele. Isso quer dizer então que você só pode criar este objeto se prover TODAS as suas dependências.O fato de essa ser a técnica mais utilizada não quer dizer que as outras são piores e na minha opinião é a falta de informação que faz com que só se use constructor injection.E por que só conhecer injeção via construtor é sinal de "pouco conhecimento"? É bem simples: nem todas as dependências de um objeto são mandatórias para sua existência. Ou seja, existem dependências que são opcionais. E se você colocar tudo no construtor então tudo vira obrigatório mesmo que para o objeto não seja!Você está sacrificando seu design em nome da sua falta de conhecimento.

## Formas de resolver as dependências
Quando trabalhamos com IoC no geral utilizamos algo chamado "container". Este [container](http://www.hanselman.com/blog/ListOfNETDependencyInjectionContainersIOC.aspx) é uma ferramenta que automatiza a IoC e DI.O que poucas pessoas percebem é que a maioria destas ferramentas atuam também como Service Locators. [Detalhes, apenas detalhes](http://viniciusquaiato.com/blog/videos-pelestra-sobre-nuget-do-dnad-2010/), é neles que a diferença reside.

## O que é um Service Locator?
Service Locator é um padrão. Que basicamente encapsula o processo de obtenção de serviços(objetos). O Service Locator cria uma camada de abstração neste processo.Por debaixo dos panos o Service Locator pode muito bem utilizar um container de IoC para atuar como um [Registry](http://martinfowler.com/eaaCatalog/registry.html) para os serviços solicitados.Um dos pontos interessante é que o próprio container de IoC atua como um Service Locator.O motivo pelo qual muitos crucificam o Service Locator é pelo fato de ele acabar tornando-se também uma dependência em nossos objetos. Ok, isso é um fato, ele vai estar lá.Lembre-se porém que dependências SEMPRE existirão, não podemos fugir delas, temos que fugir das [dependências instáveis](http://www.aniche.com.br/2010/10/tdd-diminui-o-acoplamento-mas-so-isso-nao-resolve/), e o SL parece ser algo mais estável.Mas vamos entender um pouco mais como ele pode ser um cara menos ruim.

## Service Locator para Setter Injection
Se tirarmos dos construtores as dependências não obrigatórias isso significa que vamos injetá-las via setter, e somente no momento em que elas realmente forem utilizadas(se forem!).Com isso o Service Locator cumpre bem o papel de resolver estas dependências. E ainda que você diga: "Ah mas eu uso um container de IoC", meu amigo, você está usando um Service Locator no final das contas, veja:
{% highlight csharp %}
//container de IoC 1objeto.DependenciaOpcional = meuContainer.Resolve<tipo>();
    //container de IoC 2objeto.DependenciaOpcional = meuContainer2.Get<tipo>();
    //service locatorobjeto.DependenciaOpcional = serviceLocator.DependenciaOpcional();
    </tipo></tipo>
{% endhighlight %}
Oras, as três linhas de código são praticamente iguais, e não são maléficas! Se a dependência é opcional não faz sentido passá-la no construtor do objeto! 

### Os argumentos fracos
Muitos vão dizer: <blockquote>Ah, mas assim a dependência não está explícita!</blockquote>Meu Deus! Como não está? Não é só dependência no construtor que é explícita. O que diz que uma dependência **não** é explícita é o fato de que quem está externo ao objeto não saber que ele faz uso de um terceiro. O setter deixa isso bastante claro: _"Olha, em algum momento eu faço uso dessa dependência, se você quiser você pode me passar, senão ok!"_.E isso é **exatamente a mesma coisa que acontece com o construtor**, pois não sabemos quando e nem onde a dependência será utilizada (e nem se será!).Oras por que então não colocamos no construtor dos objetos TODAS as suas propriedades? Por que muitas delas são opcionais, e o objeto pode conviver sem elas!

## Em resumo...
Service Locator tem seu papel na resolução de dependências.. Não confunda IoC com DI e não confunda DI com constructor injection.É importante separar as ferramentas dos conceitos e dos padrões. É importante aprofundar um pouco nestes conceitos e tentar enxergar as coisas de diferentes maneiras. Tentar compreender os cenários, ver se eles existem e como as coisas funcionam em cada cenário.Se você é daqueles que gosta de citar o Martin Fowler para tudo, aí vai:<blockquote>I've often heard the complaint that these kinds of **service locators** are a bad thing because they aren't testable because you can't substitute implementations for them. **Certainly you can design them badly to get into this kind of trouble, but you don't have to**. In this case the service locator instance is just a simple data holder. I can easily create the locator with test implementations of my services.</blockquote>O negrito é por minha conta.

Abraços,
Vinicius Quaiato.
