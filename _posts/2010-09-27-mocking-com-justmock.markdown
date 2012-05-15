---
layout: post
title: Mocking com JustMock
wordpress_id: 1594
wordpress_url: http://viniciusquaiato.com/blog/?p=1594
categories:
- title: TDD
  slug: tdd
  autoslug: tdd
tags:
- title: Mock
  slug: mock
  autoslug: mock
- title: TDD
  slug: tdd
  autoslug: tdd
- title: testes
  slug: testes
  autoslug: testes
---
Estou experimentando o framework de Mocking da Telerik: [JustMock](http://www.telerik.com/products/mocking.aspx).O framework é bastante interessante, simples e fácil de utilizar. Não é verboso e permite fazer coisas como por exemplo mockar propriedades não virtuais (que não é possível com Rhino e Moq), classes sealed, métodos não virtuais, métodos estáticos, classes como DateTime, etc.Aqui fica apenas uma sintaxe e exemplo de uso, futuramente escreverei mais sobre como utilizar e as funcionalidades que ele oferece:
{% highlight csharp %}
[TestMethod]
public void TestMethod1(){
var mock = Mock.Create<myclass>();
    //configurando que uma chamada para a propriedade deve ser feita    //e deve retornar 10    Mock.Arrange(() => mock.Propriedade).Returns(10);
int a = mock.Propriedade;
    //verificando se a chamada foi realizada    Mock.Assert(() => mock.Propriedade);
    }
</myclass>
{% endhighlight %}
Não é uma ferramenta gratuita, mas vale a pena usar o trial e verificar até onde ele atende.

Abraços,
Vinicius Quaiato.
