--- 
layout: post
title: TDD - Test-driven Development + c# - Parte II
wordpress_id: 18
wordpress_url: http://viniciusquaiato.com/blog/?p=18
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: Tests
  slug: tests
  autoslug: tests
- title: Visual Studio
  slug: visual-studio
  autoslug: visual-studio
- title: Refactoring
  slug: refactoring
  autoslug: refactoring
- title: C#
  slug: c
  autoslug: c#
---
[TDD - Test-driven Development - Parte I](http://viniciusquaiato.com/blog/tdd-test-driven-development-c/)[TDD - Test-driven Development - Parte III](http://viniciusquaiato.com/blog/tdd-test-drive…nt-c-parte-iii/)Após o que foi apresentado no [primeiro post da série](http://viniciusquaiato.com/blog/tdd-test-driven-development-c/), faremos nesta segunda parte um exemplo prático de TDD.Para efeito didático este será um exemplo bem simples e trivial, para que possamos focar nas práticas de TDD.Antes de começarmos gostaria de mencionar o "mantra do TDD":<blockquote># **"<span style="color: #ff0000;
    ">Red</span>, <span style="color: #008000;
    ">green</span>, <span style="color: #333399;
    ">refactoring</span>"**
</blockquote>Ou seja, escreva um teste que falhe, na verdade um teste que nem compila (<span style="color: #ff0000;
    ">vermelho</span>). Escreva um código que compile e faça o teste passar (<span style="color: #008000;
    ">verde</span>), mesmo que seja um código ruim. Então, após o teste passar melhoramos o código, com a finalidade de deixá-lo mais claro, coeso e simples (<span style="color: #333399;
    ">refactoring</span>).Tendo isso em mente, vamos para o nosso caso de uso em C#:<blockquote>Desenvolver uma aplicação bancária que controle saques, depósitos e transferências.</blockquote>Como eu disse o caso de uso é simples, para que foquemos no TDD.Vamos criar uma nova solution no Visual Studio. Aqui já começa a mudança de pensamento. Antes de criar o projeto da conta bancária, eu começo criando o projeto de testes da conta bancária. Eu gosto de pensar assim para ir me acostumando com a idéia do Test First.

[caption id="attachment_33" align="aligncenter" width="630" caption="TDD - criando projeto de testes"]![TDD_criando_projeto_testes](http://viniciusquaiato.com/images_posts/TDD_criando_projeto_testes.jpg "TDD - criando projeto de testes")[/caption]Agora que estamos com o projeto criado, vamos escrever nosso primeiro teste. Vocês vão perceber que a prática do TDD nos leva a pensar melhor em nossas classes. Vamos ver.Bom, em nosso primeiro teste vamos nos assegurar de que quando uma conta seja criada ela obrigatóriamente necessite de um depósito inicial:
{% highlight csharp %}
[TestMethod]
public void Deve_Criar_Conta_Com_Deposito_Inicial(){    ContaBancaria conta = new ContaBancaria(50.0m);
    Assert.AreEqual(50, conta.SaldoAtual);
    }

{% endhighlight %}
Como podemos ver, este teste nem irá compilar, afinal, estamos criando o teste antes mesmo de criarmos a classe ContaBancaria.
{% highlight csharp %}

public class ContaBancaria{    

public decimal SaldoAtual { get;
    set;
    }
    
public ContaBancaria(decimal depositoInicial) { }
}

{% endhighlight %}
Assi podemos executar nosso teste. Eu gosto de utilizar dois atalhos CTRL + R + T (executa o teste corrente em modo debug) ou CTRL + R + A (executa todos os testes da solution em modo debug).Teremos o resultado como abaixo:[caption id="attachment_34" align="aligncenter" width="652" caption="TDD - executando primeiro teste"]![TDD - executando primeiro teste](http://viniciusquaiato.com/images_posts/TDD_executando_primeiro_teste.jpg "TDD - executando primeiro teste")[/caption]Este teste falhou. Ótimo! Obtemos um <span style="color: #ff0000;
    ">red</span> e sabemos que estamos no caminho certo. Aconteceu que estávamos esperando um saldo de 50 e o saldo obtido foi 0.Agora devemos voltar ao código e fazer o teste passar:
{% highlight csharp %}

public class ContaBancaria{    

public decimal SaldoAtual { get;
    set;
    }
    
public ContaBancaria(decimal depositoInicial)    {        this.SaldoAtual += depositoInicial;
    }
}

{% endhighlight %}
Neste caso nossa mudança é bem pequena. Agora vamos executar o mesmo teste e ver o que acontece:[caption id="attachment_35" align="aligncenter" width="655" caption="TDD - executando primeiro teste verde"]![TDD - executando primeiro teste verde](http://viniciusquaiato.com/images_posts/TDD_executando_primeiro_teste_verde.jpg "TDD - executando primeiro teste verde")[/caption]Pronto! Obtivemos um <span style="color: #008000;
    ">verde</span>, e isso quer dizer que podemos prosseguir, escrevendo os próximos testes. Antes disso acontecer, devemos lembrar do próximo passo: refactoring!Vamos voltar ao nosso código e entender o que pode ser refatorado.Me parece que a propriedade SaldoAtual não deveria ter um setter público, desta forma vamos torná-lo privado:
{% highlight csharp %}

public class ContaBancaria{    

public decimal SaldoAtual { get;
    
private set;
    }
    
public ContaBancaria(decimal depositoInicial)    {        this.SaldoAtual += depositoInicial;
    }
}

{% endhighlight %}
Agora devemos novamente executar nossos testes, para termos certeza de que não acabamos estragando nada.Agora precisamos garantir que o depósito inicial seja um depósito válido. Ou seja, o que acontece com um depósito inicial igual a 0? E se for menor que 0?De acordo com a regra de negócio que eu inventei, uma conta sempre deve ser criada com um depósito inicial. Quando quisermos carregar uma conta específica, utilizaremos outra notina e não o construtor público.Assim, vamos criar um deste que garanta que o depósito inicial seja válido.Vamos usar um atributo(attribute) do framework de testes do visual studio que nos permite testar se um determinado teste lança uma exceção - ExpectedException:
{% highlight csharp %}
[TestMethod][ExpectedException(typeof(DepositoInicialInvalidoException))]
public void Deve_Lancar_Excecao_Deposito_Inicial_Invalido(){    ContaBancaria conta = new ContaBancaria(0);
    }

{% endhighlight %}
Para que este teste compile, vamos criar uma Exception:
{% highlight csharp %}

public class DepositoInicialInvalidoException : Exception{    

public DepositoInicialInvalidoException()        : base("Depósito inicial deve ser um valor maior que 0(Zero)!") { }
}

{% endhighlight %}
Agora vamos rodar nosso test. Pumba! Obtivemos um red. Afinal, não estamos validando o depósito inicial. Vamos fazer o código passar:
{% highlight csharp %}

public ContaBancaria(decimal depositoInicial){
if(depositoInicial &lt;
    = 0)        throw new DepositoInicialInvalidoException();
    this.SaldoAtual += depositoInicial;
    }

{% endhighlight %}
Agora já podemos executar nossos testes (sim, devemos executar todos os testes, para ter certeza que nada quebrou no meio do caminho). Pronto, temos um verde. Vamos para o refactoring. A validação dentro do construtor não ficou muito elegante. Afinal, no futuro podemos ter outros tipos de validações, desta forma vamos refatorar:[caption id="attachment_36" align="aligncenter" width="669" caption="TDD - refatorando"]![TDD - refatorando](http://viniciusquaiato.com/images_posts/TDD_refatorando.jpg "TDD - refatorando")[/caption]Assim o visual studio criará para nós um método, e ficaremos com a seguinte estrutura:
{% highlight csharp %}

public ContaBancaria(decimal depositoInicial){    Validar(depositoInicial);
    this.SaldoAtual += depositoInicial;
    }


private void Validar(decimal depositoInicial){
if(depositoInicial &lt;
    = 0)        throw new DepositoInicialInvalidoException();
    }

{% endhighlight %}
É importante que a cada refatoring, cada mudança de código, executemos novamente os testes. Mesmo que achemos que a mudança é pouca e pequena, isso nos fará ter o hábito de sempre executar os testes, e no futuro faremos isso para mudanças mais drásticas e severas.Bom pessoal, nesta segunda parte espero ter mostrado o início do TDD utilizando C# + Visual Studio.Na próxima parte deste artigo criaremos os testes para depósitos e saques.

Abraços,
Vinicius Quaiato.
