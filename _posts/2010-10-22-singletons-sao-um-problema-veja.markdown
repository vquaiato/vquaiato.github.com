--- 
layout: post
title: "Singletons s\xC3\xA3o um problema, veja"
wordpress_id: 1867
wordpress_url: http://viniciusquaiato.com/blog/?p=1867
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
- title: "Singleton \xC3\xA9 ruim"
  slug: singleton-e-ruim
  autoslug: "singleton-\xC3\xA9-ruim"
- title: Singletons are evil
  slug: singletons-are-evil
  autoslug: singletons-are-evil
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/singletons-evil.jpg "singletons are evil")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/singletons-evil.jpg)Semana passada ocorreu uma discussão até que acalorada sobre Singletons no grupo .NET Architects ([veja aqui a thread](http://groups.google.com/group/dotnetarchitects/browse_thread/thread/379192a5e97b6597)). E [aqui temos um post](http://blog.caelum.com.br/2006/08/08/singletons-e-static-perigo-a-vista/) sobre isso no blog da Caelum também.Foram levantados lá alguns pontos justificando a afirmação: "Singletons são um problema!", e eu concordo com isso. A idéia que eu tenho é que o [padrão Singleton](http://pt.wikipedia.org/wiki/Singleton) traz consigo, de maneira inerente, alguns design issues, ou seja, alguns problemas e pontos de atenção no design do seu software. Vamos analisar um pouco estes pontos.

### Singletons violam o SRP
Uma classe que implementa o padrão Singleton está claramente violando o SRP. Isso é bastante simples de perceber, afinal esta classe está, além de contendo toda sua lógica e funcionalidades, ela está responsável por gerenciar seu ciclo de vida, garantindo que exista apenas uma única instância de si mesma.Mais de uma responsabilidade, sabemos, problemas para manter e problemas para testar. Por menor que um problema possa parecer, ele ainda é um problema. Zero problemas é melhor que 1/2 problema.

### Singletons são dependências ocultas
Classes que dependem de singletons ocultam essa dependência. Já sabemos que dependências são algo ruim quando elas não são dependências estáveis ([leia mais aqui](http://www.aniche.com.br/2010/10/tdd-diminui-o-acoplamento-mas-so-isso-nao-resolve/)). O cenário piora então quando a dependência está oculta, pois não há o que se possa fazer.

### Singletons dificultam os testes
É difícil testar uma classe que faz uso de um singleton. Em virtude do acoplamento oculto testar unitariamente uma classes destas é um grande problema.Além disso singletons mantém seu estado de forma persistente, ou seja, se eu executar uma bateria de 10 testes, o segundo teste a ser executado terá o estado do singleton após o primeiro teste executado. Mega problema!

### Singletons dificultam o paralelismo
A utilização de singletons acaba dificultando aplicações que precisam de paralelismo. Apesar de existirem recursos como lock, isso traz um overhead a maior e a mais para gerenciar (Sem falarmos nos problemas de performances que os locks podem causar).

### Singletons são convites para não usar OO
 Um dos argumentos levantados pelo Juan Lopes([@juanplopes](http://twitter.com/juanplopes)) é que geralmente um singleton vai começar a agrupar um monte de métodos, e desta forma acabamos perdendo a OO, afinal, estamos com um amontoado de métodos agrupados: um módulo, pois o estado do Singleton geralmente não é definido, não é alterado, não é manipulado. Em alguns casos até, os singletons acabam virando famigerados "helpers".Poderia citar outros motivos aqui, e talvez vocês saibam de mais alguns.Muitos vão dizer que singletons são bons em alguns casos, e que não devemos abrir mão deles. Cabe a cada um gerenciar com quantos problemas quer e pode sobreviver. O fato é que estes problemas (design issues) são inerentes aos singletons, eles existem e vão estar presentes no seu uso, então cabe a você gerenciá-los.

### Em resumo...
Singletons são um problema real! Não é apenas uma questão de "saber usar", "usar pouco", ou ainda "usar moderadamente". Os singletons trazem consigo estas questões, não adianta ignorarmos. E novamente, se você precisa (ou acha que precisa) utilizá-lo, saiba gerenciá-las.Escreverei um post demonstrando a diferença entre a implementação do padrão singleton(que é evil!) e o ciclo de vida singleton(que 'sounds goods').Mostrarei como fazer uso de singletons de uma forma menos dolorosa, gerenciável e até "elegante".Veja aqui também alguns pontos que usei como base: [http://blogs.msdn.com/b/scottdensmore/archive/2004/05/25/140827.aspx](http://blogs.msdn.com/b/scottdensmore/archive/2004/05/25/140827.aspx)Abraços,Vinicius Quaiato.
