--- 
layout: post
title: Trabalhando com Boo no MonoDevelop
wordpress_id: 3388
wordpress_url: http://viniciusquaiato.com/blog/?p=3388
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: Mono
  slug: mono
  autoslug: mono
tags: 
- title: Testes
  slug: testes
  autoslug: testes
- title: Boo
  slug: boo
  autoslug: boo
- title: MonoDevelop
  slug: monodevelop
  autoslug: monodevelop
- title: "Testes Unit\xC3\xA1rios com Boo"
  slug: testes-unitarios-com-boo
  autoslug: "testes-unit\xC3\xA1rios-com-boo"
---


[![](http://viniciusquaiato.com/images_posts/Boo-Language.png "Boo Language")](http://viniciusquaiato.com/images_posts/Boo-Language.png)

Fala galera. Como o próximo Dojo do .NET Architects também será em [Boo](http://boo.codehaus.org/) vou falar um pouquinho dele aqui, mas bem pouquinho mesmo pois o [Elemar está mostrando um pouco do Boo](http://elemarjr.net/2011/04/23/vamos-aprender-boo-parte-1-fundamentos/) e o [Giovanni já falou sobre o Boo na época em que fizemos outro dojo utilizando a linguagem](http://blog.lambda3.com.br/2010/10/boo-muito-legal/).Se você está perdido e nunca ouvi falar sobre a linguagem Boo ([que foi criada pelo brasileiro Rodrigo Bamboo](http://en.wikipedia.org/wiki/Rodrigo_B._De_Oliveira)!) leia aqui o [Boo Primer](http://boo.codehaus.org/Boo+Primer) e o [Boo Manifesto](http://boo.codehaus.org/BooManifesto.pdf).# Instalando Boo no MonoDevelop


Para usar o Boo no MonoDevelop é bastante simples. Vamos ao Add-In Manager:[![MonoDevelop Add-In Manager](http://viniciusquaiato.com/images_posts/MonoDevelop-Add-In-Manager-300x43.png "MonoDevelop Add-In Manager")](http://viniciusquaiato.com/images_posts/MonoDevelop-Add-In-Manager.png)



Feito isso vamos para a galeria e então selecionar a opção de linguagens:[![MonoDevelop Add-In Manager Instalando Boo](http://viniciusquaiato.com/images_posts/MonoDevelop-Add-In-Manager-Instalando-Boo1-300x222.png "MonoDevelop Add-In Manager Instalando Boo")](http://viniciusquaiato.com/images_posts/MonoDevelop-Add-In-Manager-Instalando-Boo1.png)

Selecione a opção "install" e pronto! Agora podemos criar projetos usando Boo diretamente no MonoDevelop \o/# Brincando com Boo no MonoDevelop


Vamos fazer algumas brincadeiras simples(pois minha idéia não é ensinar Boo).Para trabalhar com NUnit usano Boo é bastante simples: primeiro referencie os NUnit no projeto e depois escreva seus testes:
{% highlight csharp %}
import NUnit.Framework from "nunit.framework"import System[TestFixture]class PrimeiroTesteEmBoo:[Test]def dado_1_mais_1_igual_2():assert 1 + 1 == 2[Test]def dado_um_datetime_deve_ser_menor_que_datetime_now():data = DateTime.Nowassert DateTime.Now > data[Test]def dado_um_boolean_verdadeiro_nao_eh_falso():verdadeiro = 2>1Assert.IsTrue(verdadeiro)
{% endhighlight %}
Simples não? E o resultado disso, totalmente integrado na IDE:[![Rodando testes em Boo no MonoDevelop](http://viniciusquaiato.com/images_posts/Rodando-testes-em-Boo-no-MonoDevelop-300x202.png "Rodando testes em Boo no MonoDevelop")](http://viniciusquaiato.com/images_posts/Rodando-testes-em-Boo-no-MonoDevelop.png)



[![](http://viniciusquaiato.com/images_posts/DSLs_in_Boo_rahien_cover150.jpg "DSLs in Boo - Ayend")](http://viniciusquaiato.com/images_posts/DSLs_in_Boo_rahien_cover150.jpg)

Para vocês terem uma idéia de que o Boo não é tão underground assim o Ayende (sim O CARA do NHibernate) escreveu um [livro sobre DLSs em Boo](http://www.manning.com/rahien/): 

### Resumindo
A plataforma .NET possui algumas opções interessantes além do default (C#) e do primo feio (VB). Vale muito dar uma olhada nestas linguagens (Boo, IronRuby, IronPython, etc). Mesmo que você não as use como sua linguagem número 1 é interessante ter coisas novas na sua toolkit (ou no seu batbelt).Conhecer o poder e a elegância do Boo provavelmente vão te fazer gostar menos do C# hahah.Divirtam-se e bons estudos.

Abraços,
Vinicius Quaiato. 
