--- 
layout: post
title: SRP - Single Responsibility Principle
wordpress_id: 1126
wordpress_url: http://viniciusquaiato.com/blog/?p=1126
categories: 
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
- title: SRP
  slug: srp
  autoslug: srp
- title: Single Responsibility
  slug: single-responsibility
  autoslug: single-responsibility
- title: "Responsabilidade \xC3\x9Anica"
  slug: responsabilidade-unica
  autoslug: "responsabilidade-\xC3\x9Anica"
- title: "Princ\xC3\xADpios SOLID"
  slug: principios-solid
  autoslug: "princ\xC3\xADpios-solid"
- title: Design Patterns
  slug: design-patterns
  autoslug: design-patterns
---
[![Jack Bauer faz muitas coisas!](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/jack-bauer-300x225.jpg "Jack Bauer faz muitas coisas!")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/jack-bauer.jpg)Sempre achei que o [SRP - Single Responsibility Principle](http://www.objectmentor.com/resources/articles/srp.pdf) ou Princípio da Responsabilidade Única fosse importante. E de fato é!(Veja outros [princípios SOLID aqui](http://butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod))Sabemos que um dos principais objetivos da [POO](http://en.wikipedia.org/wiki/Object-oriented_programming) é proporcionar reuso, extensibilidade, manutenabilidade, dentre outros.No entanto quando começamos a criar nosso código, nossas classes, etc, tudo é uma beleza. Cada classe tem seu papel bem claro e definido, mas em um piscar de olhos... Beng! As classes estão fazendo muitas coisas. Os métodos fazendo muitas coisas, e às vezes até mesmo as variáveis (coitadas) estão fazendo muitas coisas.Parecem com o Jack Bauer aí em cima. Parece que faz uma coisa: Salvar o mundo e os EUA, mas faz muitas coisas sozinho para atingir este objetivo.O Princípio da Responsabilidade Única diz:<blockquote>THERE SHOULD NEVER BE MORE THAN ONE REASON FOR A CLASS TO CHANGE.</blockquote>Ou seja, "Nunca deve existir mais de uma razão para que uma classe mude".Isso já diz tudo, ou não? Eu ainda gosto de tentar, ao máximo, aplicar este princípio aos métodos, ou seja, cada método deve fazer apenas "o seu trabalho sujo". [caption id="attachment_1178" align="aligncenter" width="300" caption="A classe canivete suíço"][![A classe canivete suíço](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/canivete-suico-300x212.jpg "A classe canivete suíço")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/canivete-suico.jpg)[/caption]Quando uma classe faz muitas coisas, ela acaba possuindo muitas razões para mudar. Possuir muitas razões para mudar significa que ela possui muitas razões para ter erros, ou seja, é mais fácil os erros se esconderem e grudarem nela, afinal, ela oferece esconderijos para vários tipos de bugs diferentes.Consequentemente a manutenção (corretiva ou evolutiva) nesta classe/código é mais complicada, pois mexer em um lugar pode impactar em vários outros lugares, afinal, ela faz muitas coisas.Este exemplo foi adaptado de um código no qual trabalhei esta semana. Troquei nomes e contextos para não expor partes do negócio, mas é praticamente a mesma idéia:
{% highlight csharp %}

{% endhighlight %}
Nem preciso dizer nada. Estas classes com nomes "Processador", "Coordenador", "Gerenciador" [são muito suspeitas](http://viniciusquaiato.com/blog/dica-de-leitura-clean-code/).Reparem na dificuldade de compreender as coisas. Essa classe assim, sem códigos, mal cabe no meu monitor. Agora imaginem um método onde você tem N coisas sendo feitas, tendo que passar com o mouse pra cima e pra baixo, para entender o que acontece.É muito perigoso! Criar e manter uma classe destas vai impactar em todo seu trabalho futuro. E o pior esta classe tem um papel muito importante no sistema. Ela realiza vendas! Ou seja, o faturamento da empresa depende dela, como então podemos deixar tudo em um emaranhado sujo?Quando eu precisar alterar a forma como os ItemPedido são criados, preciso alterar o Processador. Quando o PedidoVenda precisar mudar, preciso alterar o Processador. Quando dados do Usuario e da Empresa mudarem, algo talvez deva mudar no Processador. Quando os DadosAdicionais mudarem o Processador mudará.Percebem quantos bugs podemos causar com qualquer uma destas mudanças? Isso sem falar na dificuldade de entender exatamente onde alguma destas mudanças deve ser feita.E esta é a importância do SRP. Cada classe com apenas uma responsabilidade torna claro onde cada mudança deve ser feita, e além disso, diminuem as chances de bugs em outras partes do código.Este não é um post sobre [refactoring](http://en.wikipedia.org/wiki/Code_refactoring), então ficam aqui apenas algumas dicas de como estou resolvendo o problema:1. Identifique as responsabilidades da classe
2. Extraia métodos para isolar as responsabilidades
3. Extraia uma classe para isolar métodos que devem permanecer juntos
4. Se as camadas superiores podem fornecer informações, faça, não carregue tudo na classe "canivete suíço"
5. Se vários métodos compartilham parâmetros, promova-os a variáveis de instância
Desta forma eu consegui isolar algumas coisas. Ainda possuo o ProcessadorDePedidosDeVendas, mas eu terminei o dia com a seguinte estrutura de classes:[caption id="attachment_1180" align="aligncenter" width="300" caption="Diagrama resultado SRP"][![Diagrama resultado SRP](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/diagrama-300x221.jpg "Diagrama resultado SRP")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/diagrama.jpg)[/caption]Eu ainda não estou 100% feliz com esta estrutura, mas agora eu tenho classes que fazem menos coisas, sei exatamente o que cada uma delas faz. Elas ainda estão bastante acopladas, mas consigo entender que cada uma delas possui agora uma razão para mudar. Quando a estrutura de um Item mudar, eu preciso alterar apenas o Builder do Item. Quando o Pedido mudar, eu preciso alterar apenas a estrutura do Builder. Quando a forma como as coisas são feitas precisar mudar, eu mudo o processador. Disse que ainda não estou feliz pois não vejo o Processador com bons olhos. Mas não quero colocar a persistência do Pedido dentro da Fábrica. Por que utilizei [Builders](http://en.wikipedia.org/wiki/Builder_pattern)? Pelo simples fato de que são objetos complexos, com muitas propriedades, a serem preenchidas, e não quero tornar a [Fábrica](http://en.wikipedia.org/wiki/Factory_method_pattern) sobrecarregada com isso. Eu quero a fábrica tenha uma responsabilidade "me dar um Item apartir de um ItemDTO" e achei interessante ela terceirizar este processo para o Builder. Pode ser que amanhã eu veja que a Fábrica não é necessária, sei lá. Mas o design e a arquitetura são evolutivas.Agora com classes que fazem apenas uma coisa eu já posso começar a escrever testes. Pois é, o código ruim é tão ruim que nem os testes são possíveis de escrever. Agora eu posso escrevê-los, e o melhor, eu posso começar a usar [TDD](http://viniciusquaiato.com/blog/category/tdd/) sempre que for alterar cada um destes pontos.É isso galera. Eu não queria dar um exemplo "blog -> post -> comment" para que vocês pudessem ver de fato como e onde o SRP apareceu e se mostrou realmente essencial.É muito importante que vocês olhem par ao código e perguntem "O que diabos você faz?". E se você precisar perguntar isso, esteja certo de que o SRP já foi para o espaço.Percebam também como, pelos passos que eu mencionei, eu não saí buscando aplicar padrões, eles apareceram, e conhecê-los foi uma vantagem e uma arma que tive em mãos. Abraços,Vinicius Quaiato.
