--- 
layout: post
title: TDD - Test-driven Development + c# - parte III
wordpress_id: 52
wordpress_url: http://viniciusquaiato.com/blog/?p=52
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: .NET
  slug: dotnet
  autoslug: .net
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: Tests
  slug: tests
  autoslug: tests
- title: C#
  slug: c
  autoslug: c#
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
---
Vamos lá galera, vamos continuar nossa série sobre [TDD](http://dojofloripa.wordpress.com/2007/09/10/tudo-sobre-tdd/) + C#.Para conferir os outros posts da série:Parte I - [http://viniciusquaiato.com/blog/tdd-test-driven-development-c/](http://viniciusquaiato.com/blog/tdd-test-driven-development-c/)Parte II - [http://viniciusquaiato.com/blog/tdd-test-driven-development-c-parte-ii/](http://viniciusquaiato.com/blog/tdd-test-driven-development-c-parte-ii/)Neste artigo abordaremos depósitos.A primeira coisa que precisamos fazer para realizar nosso depósito é escrever um teste:
{% highlight csharp %}
[TestMethod]public void Deve_Realizar_Deposito(){    var conta = new ContaBancaria(10);    conta.Depositar(10);}
{% endhighlight %}
Este método ainda nem compila, afinal precisamos implementar o método Depositar na classe ContaBancaria.E o resultado deve ser este (lembrando que fazemos o mínimo para o programa compilar e rodarmos o teste):
{% highlight csharp %}
public void Depositar(decimal valorDoDeposito){}
{% endhighlight %}
Agora vamos executar todos os nossos testes. É importante executarmos todos os testes para garantir que tudo funciona:[caption id="attachment_56" align="aligncenter" width="663" caption="TDD Realizando testes"]![TDD Realizando testes](http://viniciusquaiato.com/blog/wp-content/uploads/2009/11/TDD_Realizando_testes.jpg "TDD_Realizando_testes")[/caption]Percebam também a importância de um nome descritivo para os testes. Desta forma podemos saber exatamente o que está sendo garantido com aquele teste.Agora conseguimos um verde, afinal nosso teste apenas garante um depósito. Vamos prosseguir criando um teste para verificar se o valor depositado foi somado ao saldo:
{% highlight csharp %}
[TestMethod]public void Deve_Realizar_Deposito_de_5_Em_Conta_Com_Saldo_10_E_Saldo_Deve_Ficar_15(){    var conta = new ContaBancaria(10);    conta.Depositar(5);    Assert.AreEqual(15, conta.SaldoAtual);}
{% endhighlight %}
E ao rodarmos nossos testes temos:[caption id="attachment_59" align="aligncenter" width="709" caption="TDD realizando tetses obtendo erro"]![TDD realizando tetses obtendo erro](http://viniciusquaiato.com/blog/wp-content/uploads/2009/11/TDD_realizando_tetses_obtendo_erro.jpg "TDD_realizando_tetses_obtendo_erro")[/caption]O erro é bem claro: diz que estávamos esperando 15 e o resultado foi 10. Isso por que nosso método de depósito não possui nenhuma implementação.Agora vamos alterar o código para que consigamos um verde nos testes:
{% highlight csharp %}
public void Depositar(decimal valorDoDeposito){    this.SaldoAtual = 15;}
{% endhighlight %}
E executando nossos testes:[caption id="attachment_61" align="aligncenter" width="709" caption="TDD obtendo um verde nos testes"]![TDD obtendo um verde nos testes](http://viniciusquaiato.com/blog/wp-content/uploads/2009/11/TDD_obtendo_um_verde_nos_testes.jpg "TDD_obtendo_um_verde_nos_testes")[/caption]Agora que conseguimos um verde, devemos escrever mais testes para garantir que tudo funciona:
{% highlight csharp %}
[TestMethod]public void Deve_Realizar_Deposito_de_10_Em_Conta_Com_Saldo_10_E_Saldo_Deve_Ficar_20(){    var conta = new ContaBancaria(10);    conta.Depositar(10);    Assert.AreEqual(20, conta.SaldoAtual);}
{% endhighlight %}
E rodando nossos testes temos:[caption id="attachment_63" align="aligncenter" width="709" caption="TDD obtendo erro em segundo teste"]![TDD obtendo erro em segundo teste](http://viniciusquaiato.com/blog/wp-content/uploads/2009/11/TDD_obtendo_erro_em_segundo_teste.jpg "TDD_obtendo_erro_em_segundo_teste")[/caption]Isso mostra que o código que escrevemos para o teste anterior passar deve ser alterado para que todos os testes passem. Desta forma obtemos o seguinte código no método Depositar:
{% highlight csharp %}
public void Depositar(decimal valorDoDeposito){    this.SaldoAtual += valorDoDeposito;}
{% endhighlight %}
Agora precisamos executar todos nossos testes para ver se tudo está ok:[caption id="attachment_64" align="aligncenter" width="709" caption="TDD todos testes verdes"]![TDD todos testes verdes](http://viniciusquaiato.com/blog/wp-content/uploads/2009/11/TDD_todos_testes_verdes.jpg "TDD_todos_testes_verdes")[/caption]Bom galera, espero ter mostrado mais um pouco de TDD para vocês.Na próxima parte do artigo abordaremos como testar a interação com um repositório de contas.Abraços e até a próxima.
