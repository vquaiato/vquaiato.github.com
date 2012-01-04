--- 
layout: post
title: Por que escrever unit tests?
wordpress_id: 1292
wordpress_url: http://viniciusquaiato.com/blog/?p=1292
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: Unit Tests
  slug: unit-tests
  autoslug: unit-tests
- title: TDD
  slug: tdd
  autoslug: tdd
- title: testes
  slug: testes
  autoslug: testes
---
[![](http://viniciusquaiato.com/images_posts/macaco-reveillon-150x150.jpg "Unit Tests")](http://viniciusquaiato.com/images_posts/macaco-reveillon.jpg)Bom, atualmente eu trabalho 90% do meu tempo com código legado. Legado no sentido de ser legado mesmo. Sem cobertura de testes, escrito de qualquer jeito, baseado no "achismo técnico". Resultado: impossível usar TDD sempre, e também impossível escrever testes depois. É necessário muita refatoração para conseguir escrever alguns testes. Mas... Sempre temos um mas...Isso não quer dizer que a culpa seja dos testes: não é! Hoje me deparei com um bug. Ao final de um processo demorado, cerca de 6min. para conseguir chegar em uma determinada parte do sistema, um valor obtido de um serviço de um parceiro deveria ser "36,00" e o sistema estava obtendo "3.600,00".Eu Identifiquei que o problema estava no parser, de string para decimal. Eu corrigi o parser? Não! Eu escrevi testes para o parser, e então corrigi o parser. Levei 2 minutos para criar uma classe de testes, e escrever 6 testes. Imaginem se eu levasse os 6 minutos (do teste do macaco, passando por 5 telas do sistema e umas 20 chamadas a webservices diferentes) em cada teste, e precisasse cobrir os 6 casos? Seriam pelos menos 35min "tentando" testar a pequena mudança que fiz. E o pior disso tudo é que eu acabaria não garantindo nada, afinal, os "testes do macaco" se perdem. No final das contas acabei com algo assim:
{% highlight csharp %}
[TestClass]
public class Dado_O_Valor_De_Retorno_Do_WS_Do_Parceiro_X{    [TestMethod]    
public void Quando_Retorno_For_10ponto00_Devo_Obter_10()    {
var valorRetornadoPeloParceiro = "10.00";
var valorParseado = MinhaClasse.ParsearValor(valorRetornadoPeloParceiro);
    Assert.AreEqual(10m,valorParseado);
    }
    [TestMethod]    
public void Quando_Retorno_For_10ponto23_Devo_Obter_10ponto23()    {
var valorRetornadoPeloParceiro = "10.23";
var valorParseado = MinhaClasse.ParsearValor(valorRetornadoPeloParceiro);
    Assert.AreEqual(10.23m, valorParseado);
    }
}

{% endhighlight %}
Claro, talvez não faça muito sentido estes testes, mas o "parser" tinha algumas regrinhas. E eu escrevi mais alguns testes. E no final das contas, tudo está ok. Estes testes garantem que o código funciona? Talvez. Podem haver brechas. Mas o teste garante que o código funciona para estas situações. Se houverem novas situações, basta atualizar os testes, atualizar o código, deixar tudo passando, e pronto. Muito minutos economizados.

## Então, mantenham seus testes rodando. Ter 1 teste é melhor do que não ter nenhum teste.
<br />Eu não me vejo como uma pessoa que escreve código perfeito, desta forma, eu gosto de ter uma forma simples, rápida e verificável do que estou escrevendo. A maioria de nós sabe português, mas o Word sempre coloca tracejados vermelhos em nossos textos: erramos sem perceber. Ocorre o mesmo com o código. Se você não é o Chuck Norris, escreva testes!<div align="center">[![Chuck Norris](http://viniciusquaiato.com/images_posts/ChuckNorrisApproved-150x150.png "Chuck Norris")](http://viniciusquaiato.com/images_posts/ChuckNorrisApproved.png)</div>
Abraços,Vinicius Quaiato.
