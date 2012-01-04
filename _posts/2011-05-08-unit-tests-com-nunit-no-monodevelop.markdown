--- 
layout: post
title: Unit Tests com NUnit no MonoDevelop
wordpress_id: 3356
wordpress_url: http://viniciusquaiato.com/blog/?p=3356
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: Mono
  slug: mono
  autoslug: mono
tags: 
- title: "Testes Unit\xC3\xA1rios"
  slug: testes-unitarios
  autoslug: "testes-unit\xC3\xA1rios"
- title: NUnit
  slug: nunit
  autoslug: nunit
- title: Mono
  slug: mono
  autoslug: mono
- title: MonoDevelop
  slug: monodevelop
  autoslug: monodevelop
- title: Unit Testing
  slug: unit-testing
  autoslug: unit-testing
---
[![](http://viniciusquaiato.com/images_posts/MonoDevelopLogo.png "MonoDevelop Logo")](http://viniciusquaiato.com/images_posts/MonoDevelopLogo.png)Fala galera marvada, beleza? Continuando a falar das minhas [aventuras com o Mono, MonoDevelop e o Mac](http://viniciusquaiato.com/blog/asp-net-mvc-no-mono/) vou mostrar como trabalhar com [Unit Testing](http://en.wikipedia.org/wiki/Unit_testing) usando o [NUnit](http://www.nunit.org/) no [MonoDevelop](http://monodevelop.com/).Os exemplo serão bem simples apenas para mostrar o uso da ferramenta mesmo.# NUnit no MonoDevelop
Vamos criar um projeto Class Library apenas para servir como nosso [SUT](http://en.wikipedia.org/wiki/System_Under_Test):[caption id="attachment_3357" align="aligncenter" width="300" caption="Criando Class Library para ser o SUT no MonoDevelop"][![Criando Class Library para ser o SUT no MonoDevelop](http://viniciusquaiato.com/images_posts/Screen-shot-2011-05-08-at-1.35.29-PM-300x235.png "Criando Class Library para ser o SUT no MonoDevelop")](http://viniciusquaiato.com/images_posts/Screen-shot-2011-05-08-at-1.35.29-PM.png)[/caption]O código da minha classe [SUT](http://en.wikipedia.org/wiki/System_Under_Test) é bastante simples e "bobo":
{% highlight csharp %}

public class Foo{
ublic int Soma(int a, int b){
eturn a+b;
    }


public double Divide(int a, int b){
eturn a/b;
    }
}

{% endhighlight %}
Agora vamos criar mais um projeto Class Library para servir como nosso projeto de testes usando o NUnit. Crie o projeto igual fizemos acima. Vamos então criar nossa classe de testes:
{% highlight csharp %}
[TestFixture]
public class FooTest{
Test]
public void sum_1_plus_1_should_return_2(){
ssert.AreEqual(2,new Foo().Soma(1,1));
    }
}

{% endhighlight %}
Antes de mais nada precisamos adicionar as referências do NUnit ao nosso projeto de testes. Vamos clicar com o botão direito em "references" no projeto -> "edit references":[caption id="attachment_3358" align="aligncenter" width="300" caption="Adicionar referências no MonoDevelop"][![Adicionar referências no MonoDevelop](http://viniciusquaiato.com/images_posts/Screen-shot-2011-05-08-at-2.43.22-PM-300x187.png "Adicionar referências no MonoDevelop")](http://viniciusquaiato.com/images_posts/Screen-shot-2011-05-08-at-2.43.22-PM.png)[/caption]Na janela que se abrirá vamos selecionar as referências do NUnit:[caption id="attachment_3359" align="aligncenter" width="300" caption="Adicionando referências do NUnit no MonoDevelop"][![Adicionando referências do NUnit no MonoDevelop](http://viniciusquaiato.com/images_posts/Screen-shot-2011-05-08-at-2.43.36-PM-300x280.png "Adicionando referências do NUnit no MonoDevelop")](http://viniciusquaiato.com/images_posts/Screen-shot-2011-05-08-at-2.43.36-PM.png)[/caption](adicione também a referência para o projeto SUT)Feito isso vamos compilar nosso projeto. Veremos que na aba "Unit Tests" que fica do lado esquerdo da IDE temos todos os nossos testes já identificados:[caption id="attachment_3360" align="aligncenter" width="300" caption="Aba de Unit Tests no MonoDevelop"][![Aba de Unit Tests no MonoDevelop](http://viniciusquaiato.com/images_posts/Screen-shot-2011-05-08-at-2.56.32-PM-300x179.png "Aba de Unit Tests no MonoDevelop")](http://viniciusquaiato.com/images_posts/Screen-shot-2011-05-08-at-2.56.32-PM.png)[/caption]Agora podemos clicar no nossos testes e pedir para eles serem executados. Veremos uma janela com o resultado de cada teste também:[caption id="attachment_3362" align="aligncenter" width="300" caption="Executando testes com NUnit no MonoDevelop"][![Executando testes com NUnit no MonoDevelop](http://viniciusquaiato.com/images_posts/Screen-shot-2011-05-08-at-3.06.09-PM1-300x179.png "Executando testes com NUnit no MonoDevelop")](http://viniciusquaiato.com/images_posts/Screen-shot-2011-05-08-at-3.06.09-PM1.png)[/caption]# Resumindo
Bom galera como vimos é tudo bastante simples para criarmos e executarmos testes de unidade com NUnit no MonoDevelop. O runner de testes nativo da IDE já suporta o NUnit sem maiores problemas além das dlls do mesmo já estarem disponíveis para uso. Agora é só brincar.

Abraços,
Vinicius Quaiato.
