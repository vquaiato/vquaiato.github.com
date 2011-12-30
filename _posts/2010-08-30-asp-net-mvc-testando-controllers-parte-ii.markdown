--- 
layout: post
title: "ASP.NET MVC: Testando Controllers parte II"
wordpress_id: 1532
wordpress_url: http://viniciusquaiato.com/blog/?p=1532
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: Testar Controllers
  slug: testar-controllers
  autoslug: testar-controllers
- title: Controllers
  slug: controllers
  autoslug: controllers
- title: "Testes Unit\xC3\xA1rios"
  slug: testes-unitarios
  autoslug: "testes-unit\xC3\xA1rios"
- title: Unit Tests
  slug: unit-tests
  autoslug: unit-tests
- title: Mocks
  slug: mocks
  autoslug: mocks
- title: Tests
  slug: tests
  autoslug: tests
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/08/controllers-150x150.jpg "controllers")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/08/controllers.jpg)Continuando a falar sobre [testes de controllers no ASP.NET MVC](http://viniciusquaiato.com/blog/asp-net-mvc-testando-controllers-parte-i/), neste post mostrarei como realizar alguns testes para garantir que as actions retornem as views corretas e com os dados corretos.A questão de testar os controllers é que, inevitavelmente, eles possuem comportamentos. Suas actions tomam decisões, sabem falar com partes do nosso domínio, e sabem o que retornam para a exibição e de que forma essa exebição será (escolhendo entre as views disponíveis). Desta forma é importante que tenhamos testes que nos auxiliem neste processo, não apenas na "captura" de bugs (pois acho que testes unitários não atuam dessa forma) mas no auxílio a manutenção e evolução do nosso sistema.

### Testando uma action de listagem
Este teste é um teste simples que mostra como verificar o comportamento de uma action que deve coordenar a listagem de Produtos.<pre lang="csharp" line="1">[TestMethod]public void Action_Listar_Retorna_Todos_Produtos_Para_View_ListarProdutos(){    var todosProdutos = new List<produto>                            {                                new Produto("Computador"),                                new Produto("Teclado"),                                new Produto("Mouse"),                            };    repositorio        .Setup(r => r.Todos())        .Returns(todosProdutos);    var resultView = controller.Listar();    Assert.AreEqual("ListarProdutos", resultView.ViewName);    Assert.IsTrue(resultView.ViewData.Model is List<produto>);    Assert.AreEqual(todosProdutos, resultView.ViewData.Model);}</produto></produto></pre>Neste teste criamos uma lista de produtos e configuramos o mock do nosso repositório para retornar esta lista.Na **_linha 15_** fazemos a chamada para a action Listar do nosso controller.Na **_linha 17_** verificamos se a view retornada é a view ListarProdutos.Na **_linha 18_** verificamos se o que foi passado para a view é realmente uma List<produto>.E na **_linha 19_** fazemos uma verificação para garantir que os dados passados para a view são os mesmos dados retornados pelo repositório.Esta última verificação poderia ser diferente, pois poderíamos trabalhar com um ViewModel de produto e não a própria classe, mas isso fica como lição de casa para vocês.

### Testando action que retorna 2 views diferentes
Nossa action de listagem pode assumir um outro comportamento. Quando não existe nenhum produto para ser exibido ela deve retornar uma view diferente, uma view de NenhumProduto. Vejamos o teste:<pre lang="csharp" line="1">[TestMethod]public void Action_Listar_Sem_Nenhum_Produto_Deve_Retornar_View_NenhumProduto(){    repositorio        .Setup(r => r.Todos())        .Returns(new List<produto>());    var viewResult = controller.Listar();    Assert.AreEqual("NenhumProduto", viewResult.ViewName);}</produto></pre>Este é um teste bastante simples também. Configuramos o repositório para retornar uma lista vazia de produtos.Na **_<em>linha 8</em>_** realizamos a chamada para a action de listagem.E na **_linha 10_** verificamos que a view retornada deve ser a view NenhumProduto, afinal o repositório não retornou nenhum produto.

### Testando action que retorna Json
Agora faremos um pequeno teste em uma action que deve listar os produtos em formato Json. Esta action recebe 2 parâmetros, mais ou menos para realizar uma paginação via ajax.Vejamos como ficou o teste:<pre lang="csharp" line="1">[TestMethod]public void Action_Obter_Deve_Retornar_Produtos_Em_Formato_Json(){    var todosProdutos = new List<produto>                    {                        new Produto("Teclado"),                        new Produto("Monitor")                    };    repositorio        .Setup(r => r.Todos())        .Returns(todosProdutos);    var viewResult = controller.Obter(pagina: 1, quantidade: 10);    Assert.IsTrue(viewResult is JsonResult, "Deve ser um JsonResult");    var jsonResult = viewResult as JsonResult;    var jsonData = jsonResult.Data as List<produto>;    Assert.AreEqual(2, jsonData.Count);}</produto></produto></pre>Neste teste configuro o repositório para retornar uma lista de produtos. Na **_linha 13_** fazemos a chamada para a action informando que queremos 10 resultados da página 1, ou seja, os 10 primeiros resultados vindos do repositório.Na **_linha 15_** fazemos um assert para verificar que nossa view é na verdade um JsonResult. Fiz isso antes das conversões para obter os dados pois desta forma eu consigo saber se o teste falhará por que não é um JsonResult, caso contrário o cast daria erro e eu ficaria sem uma mensagem clara do que aconteceu.Por fim, na **_linha 19_** verifico se o total de dados retornados para a view é 2, afinal configurei meu repositório com apenas 2 produtos.

### Em resumo...
Desta forma vimos que testar actions que retornam dados, decidem sobre quais views exibir e como os dados devem ser exibidos é relativamente simples. Vimos que uma mesma action que retorna 2 views diferentes está com seu comportamento garantido, e qualquer alteração que for feita será impactada e validada pelos testes que já existem, deixando assim a aplicação mais saudável e simples de evoluir e manter.

### Fontes
Os fontes podem ser [baixados aqui em Zip](http://viniciusquaiato.com/files/codesamples/TDD/TestesControllerII.zip), ou [aqui no github](http://github.com/vquaiato/Testes-Controllers-ASP.NET-MVC).Abraços,Vinicius Quaiato.</produto>
