--- 
layout: post
title: MVCTestsEx mais um projeto open source
wordpress_id: 2240
wordpress_url: http://viniciusquaiato.com/blog/?p=2240
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: Projetos
  slug: projetos
  autoslug: projetos
tags: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: testes
  slug: testes
  autoslug: testes
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: Unit Test
  slug: unit-test
  autoslug: unit-test
- title: MVCTestsEx
  slug: mvctestsex
  autoslug: mvctestsex
---
Fala galera.Quem me conhece provavelmente já me ouviu dizer que "em ASP.NET MVC tudo é testável". Sendo assim nossos controllers também são testáveis. [Postei muito sobre isso aqui](http://viniciusquaiato.com/blog/mvc-tdd/).A verdade é que testar os results dos controllers começa a ficar um pouco chato. Quando o controller retorna um [ActionResult](http://msdn.microsoft.com/en-us/library/system.web.mvc.actionresult(VS.98).aspx) é chato verificar se a view retornada é a correta:<pre lang="csharp">var result = controller.Action();Assert.AreEqual("Nome",(result as ViewResult).ViewName);</pre>Esse cast me incomoda.E fica pior quando queremos verificar alguma coisa no model desse ActionResult:<pre lang="csharp">var result = controller.Action();var model = ((result as ViewResult).ViewData.Model as TipoDoModel);//algum assert</pre>Ficou pior ainda né?!Pensando nisso decidi criar um projeto com alguns helpers para [testar controllers no ASP.NET MVC: MVCTestsEx](https://github.com/vquaiato/MVCTestsEx).A idéia é um projeto simples que encapsule algumas operações de testes. Não quero criar um framework de testes! E é por isso que estou usando o NUnit por debaixo dos panos nesse projeto. Quero escrever algo como:<pre lang="csharp">var result = controller.Action();result.AssertViewName("SomeName");</pre>Isso independente de ser um ActionResult ou um ViewResult.Uma interface fluent também pode surgir, como sugeriu o Juan Lopes:<pre lang="csharp">var result = controller.Action();result.Should().Be.View("SomeName");</pre>A princípio estou incluindo alguns dos helpers que eu já utilizo em projetos pessoais. Mas a idéia é que conforme eu consiga tempo vá melhorando a sintaxe e a forma como as coisas estão sendo escritas.[![github](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/github.png "github")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/github.png)O projeto está no [GitHub](http://github.com) e pode ser acessado aqui:  [MVCTestsEx](https://github.com/vquaiato/MVCTestsEx). Você não sabe o que é o GitHub? Em que mundo você vive? Corra [aqui](https://github.com/), veja [o que é](http://en.wikipedia.org/wiki/GitHub)(GitHub), [estude](http://gitref.org/), e [use](https://github.com/signup/free)!Faça um fork do projeto se você achar interessante. Ah, não sabe o que é fork? Corra [aqui](http://en.wikipedia.org/wiki/Fork_(software_development)) e descubra e [faça](http://help.github.com/forking/)!É isso, o fonte já está lá, com pouca coisa mas caminhando. Esse projeto surgiu enquanto eu trabalhava em outro projeto. Infelizmente eu sou um só, e meus dias são limitados a 24 horas :PAbraços,Vinicius Quaiato.
