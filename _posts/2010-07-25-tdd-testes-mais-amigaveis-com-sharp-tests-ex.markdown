--- 
layout: post
title: "TDD: Testes mais amig\xC3\xA1veis com Sharp Tests Ex"
wordpress_id: 1406
wordpress_url: http://viniciusquaiato.com/blog/?p=1406
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: Tests
  slug: tests
  autoslug: tests
- title: Unit Tests
  slug: unit-tests
  autoslug: unit-tests
- title: TDD
  slug: tdd
  autoslug: tdd
- title: "Testes Unit\xC3\xA1rios"
  slug: testes-unitarios
  autoslug: "testes-unit\xC3\xA1rios"
- title: SharpTestsEx
  slug: sharptestsex
  autoslug: sharptestsex
- title: Sharp Tests Ex
  slug: sharp-tests-ex
  autoslug: sharp-tests-ex
- title: "Testando cole\xC3\xA7\xC3\xB5es"
  slug: testando-colecoes
  autoslug: "testando-cole\xC3\xA7\xC3\xB5es"
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/MonsterBook.jpg "MonsterBook")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/MonsterBook.jpg)Código é código, seja ele código de produção, aquele que implementa o negócio a qual o software se propõe a atender, ou o código de testes. Tudo isso faz parte do software, e desta maneira deve ser tratado com carinho igual.Clareza no código, legibilidade, flexibilidade não devem ser considerados apenas em código de produção, devemos considerar com muito cuidado em nossos testes também. Testes são código executável, ou melhor, são documentações e especificações executáveis, sendo assim precisamos que eles sejam claros e simples, fácil de ler, entender e modificar. Deve ser um livro fácil de ler e entender.

### Sharp Tests Ex
[Sharp Tests Ex](http://sharptestex.codeplex.com/) são um conjunto de extensões que visam ajudar a escrever asserções simples, guiadas pelo intellisense do Visual Studio e provendo legibilidade.Vale dizer também que é perfeitamente extensível, ou seja, você pode escrever suas próprias extensões e integrá-las à biblioteca de forma simples e direta.Outro detalhe muito importante é o fato de poder utilizar o SharpTestEx com vários frameworks de testes, e não apenas o MsTests: [NUnit](http://www.nunit.org/), [MsTests](http://msdn.microsoft.com/en-us/library/ms243147(VS.80).aspx), [xUnit](http://xunit.codeplex.com/), [MbUnit](http://www.mbunit.com/).

### Os exemplos
Bem, abaixo segue uma série de exemplos de como utilizar a biblioteca. Não vou detalhar cada um dos testes, pois na verdade eles são muito explicativos. A leitura é bastante simples.<pre lang="csharp" line="1">[TestClass]public class Dado_Um_Novo_Pedido{    [TestMethod]    public void Items_Deve_Conter_Zero_Elementos()    {        var pedido = new Pedido();        pedido.Items.Count            .Should()            .Be            .EqualTo(0);    }    [TestMethod]    public void Quando_Adiciono_Item_Ao_Pedido_Deve_Conter_Mais_que_Zero_Elementos()    {        var pedido = new Pedido();        pedido.AddItem(new ItemPedido(new Produto("prod")));        pedido.Items.Count            .Should()            .Be            .GreaterThan(0);    }    [TestMethod]    public void EstaFaturado_Deve_Ser_Falso()    {        var pedido = new Pedido();        pedido.EstaFaturado            .Should()            .Be            .False();    }    [TestMethod]    public void Quando_Adiciono_Produto_Bola_Deve_Conter_Produto_Bola()    {        var pedido = new Pedido();        var bola = new Produto("Bola");        pedido.AddItem(new ItemPedido(bola));        pedido.Produtos            .Should()            .Contain(bola);    }}</pre>Veja que o código fica mais fluido e legível. Achei bastante interessante.Outra detalhe bacana é o trabalho com coleções, como pode ser visto no exemplo abaixo:<pre lang="csharp" line="1">[TestMethod]public void Os5_primeiros_impares_devem_ser_1_3_5_7_9(){    var impares = ObterImpares();    impares.Should()        .Have        .SameSequenceAs(new List<int> { 1, 3, 5, 7, 9 });}[TestMethod]public void Os5_primeiros_impares_nao_devem_ser_3_5_7_9_11(){    var impares = ObterImpares();    impares.Should()        .Not        .Have        .SameSequenceAs(new List<int> { 3, 5, 7, 9, 11 });}[TestMethod]public void Os5_primeiros_primos_nao_devem_ser_1_3_5_7_9(){    var primos = ObterPrimos();    primos.Should()        .Not        .Have        .SameSequenceAs(ObterImpares());}</int></int></pre>Vejam como é simples e interessante trabalhar com coleções. Verificar os valores que devem ou não estar presentes em uma coleção, etc.Outro exemplo de trabalho com coleções pode ser visto abaixo, onde verificamos que um valor deve estar presente e outro não:<pre lang="csharp" line="1">[TestMethod]public void Divisiveis_por_3_impares_menores_que_15(){    var multiplos = ObterDivisiveisPor3ImparesMenoresQue15();    multiplos.Should()        .Contain(3)        .And        .Contain(9)        .And        .Not        .Contain(6);}</pre>Bastante interessante não? Podemos dizer "Essa coleção deve conter 3 e deve conter 9 e não deve conter 6". Isso fica bastante legível hein.É isso galera. A dica desta biblioteca me foi passada pelo Juan Lopes ([@juanplopes](http://twitter.com/juanplopes)).[Baixe a solution completa aqui](http://viniciusquaiato.com/files/codesamples/TDD/TDDWithSharpTestsEx.zip).

## Um teste é melhor que nenhum teste.
Abraços,Vinicius Quaiato.
