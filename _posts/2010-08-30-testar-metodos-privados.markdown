---
layout: post
title: "Testar m\xC3\xA9todos privados"
wordpress_id: 1550
wordpress_url: http://viniciusquaiato.com/blog/?p=1550
categories:
- title: TDD
  slug: tdd
  autoslug: tdd
- title: .NET
  slug: dotnet
  autoslug: .net
tags:
- title: TDD
  slug: tdd
  autoslug: tdd
- title: testes
  slug: testes
  autoslug: testes
---


[![](http://viniciusquaiato.com/images_posts/top-secret-150x150.jpg "top-secret")](http://viniciusquaiato.com/images_posts/top-secret.jpg)

Não sou fã de testar métodos privados. Na teoria deveríamos testar a interface pública de nossos objetos, porém em alguns casos é necessário testar a interface privada de um objeto.Em .NET isso está bastante simples coma a utilização da classe [PrivateObject](http://msdn.microsoft.com/en-us/library/microsoft.visualstudio.testtools.unittesting.privateobject(VS.80).aspx).Vamos ver um exemplo de como isso funciona. Abaixo temos uma classe com 2 métodos e uma propriedade, todos privados:
{% highlight csharp %}

public class Privados{

private string Nome { get;
    set;
    }

private int Soma(int n1, int n2)    {
return n1 + n2;
    }

private string HelloPrivateWorld()    {
return "Hello
private world";
    }
}

{% endhighlight %}
E aqui temos os métodos de teste utilizando o PrivateObject:
{% highlight csharp %}
[TestMethod]
public void Soma_2_e_2_Deve_Retornar_4(){    PrivateObject privateObj = new PrivateObject(new Privados());
var res = privateObj.Invoke("Soma", 2, 2);
    Assert.AreEqual(4, res);
    }
[TestMethod]
public void HelloPrivateWorld_deve_retorar_string_Hello_Private_World(){    PrivateObject privateObj = new PrivateObject(new Privados());
var res = privateObj.Invoke("HelloPrivateWorld");
    Assert.AreEqual("Hello
private world", res);
    }
[TestMethod]
public void Deve_Setar_e_Dar_Get_Em_Pripriedade_Privada(){    PrivateObject privateObj = new PrivateObject(new Privados());
    privateObj.SetProperty("Nome", "Vinicius");
    Assert.AreEqual("Vinicius", privateObj.GetProperty("Nome"));
    }

{% endhighlight %}
O código dos testes é bastante simples. Notem que na criação do PrivateObject passo em seu construtor uma instância do objeto que possui os métodos e propriedades privados que eu quero testar.Depois disso, executo os métodos privados utilizando o método [Invoke](http://msdn.microsoft.com/en-US/library/microsoft.visualstudio.testtools.unittesting.privateobject.invoke(v=VS.80).aspx), conforme mostrado nas linhas 5 e 13.No caso da propriedade privada eu utilizo o método [SetProperty](http://msdn.microsoft.com/en-US/library/microsoft.visualstudio.testtools.unittesting.privateobject.setproperty(v=VS.80).aspx) para definir o seu valor, e [GetProperty](http://msdn.microsoft.com/en-US/library/microsoft.visualstudio.testtools.unittesting.privateobject.getproperty(v=VS.80).aspx) para obter o seu valor.Simples!

### Cuidado!
Nem tudo que é possível é certo de ser feito. É possível roubar um banco, mas nem por isso vamos roubar um banco. Se você tem o código fonte que está sendo testado, e ainda assim tem a necessidade de testar métodos privados, talvez haja um erro de desenho da sua solução e esse código privado deva ser transformado em alguma outra coisa que exponha este conhecimento para o mundo. Não é apenas uma questão de tornar "public", não estou falando isso. Estou dizendo que talvez deva-se gastar um tempinho compreendendo melhor o cenário, as relações e responsabilidades dos objetos, e talvez extrair algumas classes que estejam "ocultas" pela atual solução.

Abraços,
Vinicius Quaiato.
