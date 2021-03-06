--- 
layout: post
title: Testando com NUnit
wordpress_id: 1386
wordpress_url: http://viniciusquaiato.com/blog/?p=1386
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
- title: testes
  slug: testes
  autoslug: testes
- title: "Testes Unit\xC3\xA1rios"
  slug: testes-unitarios
  autoslug: "testes-unit\xC3\xA1rios"
- title: NUnit
  slug: nunit
  autoslug: nunit
---


[![NUnit](http://viniciusquaiato.com/images_posts/logo.gif "NUnit")](http://viniciusquaiato.com/images_posts/logo.gif)

Para quem trabalha com Visual Studio e costuma escrever testes é comum o uso do MSTests: o framework para unit tests integrado a ele.Algumas versões do Visual Studio, porém, não possuem estas ferramentas, mas isso não te impede de escrever seus testes.[NUnit](http://www.nunit.org/index.php?p=home) é um framework para unit testing. Inicialmente portado do JUnit, atualmente é 100% escrito em C# e é possível utilizá-lo com todas as linguagens do .NET.Além da situação onde não se possui o MSTests, o NUnit é válido ser utilizado em muitos outros casos, pois é um framework bastante maduro e possui muitas facilidades e possibilidades na escrita dos testes.Não farei um comparativo entre ele e o MSTests, mas mostrarei algumas features que ele possui.

### O download e instalação
O download e instalação são bastante simples, você pode optar entre um instalador MSI, um zip ou baixar o fonte e compilar, confira tudo aqui: [http://www.nunit.org/index.php?p=download](http://www.nunit.org/index.php?p=download)Faça o download do MSI, e siga o melhor padrão NNF.

### Criando um projeto no VisualStudio


Como eu possuo o Visual Studio 2010 com todas as ferramentas de testes e mais ainda as adicionadas pelo [R#](http://www.jetbrains.com/resharper/), eu vou remover as referências para o MSTests do meu projeto:[![Remover referencia MSTests](http://viniciusquaiato.com/images_posts/Remover-referencia-mstests-300x216.jpg "Remover referencia MSTests")](http://viniciusquaiato.com/images_posts/Remover-referencia-mstests.jpg)



E vamos adicionar a referência para o NUnit:[![Adicionar referencia NUnit](http://viniciusquaiato.com/images_posts/add-referencia-nunit-300x216.jpg "Adicionar referencia NUnit")](http://viniciusquaiato.com/images_posts/add-referencia-nunit.jpg)

A DLL do NUnit estará em "Program Files\NUnit x.x\bin\.net 2.0\framework\nunit.framework.dll".

### Escrevendo os testes
A escrita dos testes é bem simples. Vamos utilizar os atributos [[TestFixture]](http://www.nunit.org/index.php?p=testFixture&r=2.5.5) em uma classe, meio que para dizer que "aqui estão meus testes". E em cada método de teste vamos utilizar o atributo [[Test]](http://www.nunit.org/index.php?p=test&r=2.5.5). Diferença com o MSTests onde usávamos [[TestMethod]](http://msdn.microsoft.com/en-us/library/microsoft.visualstudio.testtools.unittesting.testmethodattribute(VS.80).aspx).Existem vários métodos que podem ser utilizados para asserções. Abaixo vou demonstrar alguns deles, e acho que são bem explicativos. Notem que existem métodos assertivos que não existem no MSTests mas que facilitam bastante a vida. É o caso do [Contains](http://www.nunit.org/index.php?p=collectionAssert&r=2.5.5) para trabalharmos com coleções. [Greater](http://www.nunit.org/index.php?p=comparisonAsserts&r=2.5.5) e [Less](http://www.nunit.org/index.php?p=comparisonAsserts&r=2.5.5) para trabalharmos com comparação de valores. 
{% highlight csharp %}
[TestFixture]
public class UsandoNUnitTests{    [Test]    
public void AreEqual()    {        Assert.AreEqual(0, 1 - 1);
    }
    [Test]    
public void Contains_Com_Inteiros()    {        Assert.Contains(10, new List<int> { 2, 5, 99, 100, 10 }
);
    }
    [Test]    
public void Contains_Com_String()    {        Assert.Contains("Vinicius", new List<string> { "Vinicius", "Janynne", "Robinho" }
);
    }
    [Test]    
public void Greater()    {        Assert.Greater(1000, 100);
    }
    [Test]    
public void Greater_Com_Strings()    {        Assert.Greater("viniciuz", "vinicius");
    }
    [Test]    
public void IsEmpty()    {        Assert.IsEmpty(new Stack<datetime>());
    }
    [Test]    
public void IsNotEmpty()    {
var queue = new Queue<string>();
    queue.Enqueue("Vinicius");
    queue.Enqueue("Janny");
    Assert.IsNotEmpty(queue);
    }
    [Test]    
public void Less()    {        Assert.Less(10, 34 * 100 / 3 + 9);
    }
    [Test]    
public void That_AtLeast_GreaterOrEqual()    {        Assert.That(20, Is.AtLeast(10));
    }
            [Test]    
public void That_String_Starting()    {        Assert.That("vinicius", Is.StringStarting("v"));
    }
    [Test]    
public void That_Is_Not_Equal_To()    {        Assert.That(20, Is.Not.EqualTo(19 + 2));
    }
}
</string></datetime></string></int>
{% endhighlight %}
Reparem nos 3 últimos testes, nas linhas 49 a 65 que utilizamos Assert.That e dentro da chamada do método utilizamos alguns helpers que tornam a leitura dos testes bastante interessantes.No primeiro caso, na **_linha 52_** dizemos algo como _"Confirme para mim que 20 é pelo menos maior ou igual a 10"_. Isso é bastante legível.Na **_linha 58_** temos algo como _"Confirme para mim que 'vinicius' é uma string iniciando com 'v'"_. Clever hun?!E na **_linha 64_** temos _"Confirme para mim que 20 não é igual a 19+2"_.Existem várias outras contraints (é assim que é chamado esse tipo de asserção) que podem ser utilizadas, confira mais sobre elas aqui: [http://www.nunit.org/index.php?p=constraintModel&r=2.5.5](http://www.nunit.org/index.php?p=constraintModel&r=2.5.5)

### Executando os testes dentro do Visual Studio


Para executarmos os testes eu poderia simplesmente utilizar meu teste runner dentro do Visual Studio, como mostra a figura abaixo:[![Executando testes do NUnit dentro do Visual Studio](http://viniciusquaiato.com/images_posts/executando-no-VS-300x271.jpg "Executando testes do NUnit dentro do Visual Studio")](http://viniciusquaiato.com/images_posts/executando-no-VS.jpg)



### Executando os testes com o NUnitTests


Outra forma de executar os testes é com o teste runner do NUnit. Para isso abra o NUnitTests que foi instalado na máquina. Utilize o menu File -> Open Project e selecione a DLL do projeto que criamos no Visual Studio:[![Carregando DLL dos testes no NUnitTests](http://viniciusquaiato.com/images_posts/Carregando-DLL-dos-testes-300x222.jpg "Carregando DLL dos testes no NUnitTests")](http://viniciusquaiato.com/images_posts/Carregando-DLL-dos-testes.jpg)



Feito isso os nossos testes aparecerão no NUnitTests:[![DLL com testes carregada no NUnitTests](http://viniciusquaiato.com/images_posts/DLL-com-testes-carregada-300x222.jpg "DLL com testes carregada no NUnitTests")](http://viniciusquaiato.com/images_posts/DLL-com-testes-carregada.jpg)



Clicando no botão _**Run**_ nossos testes serão executados. Veja um exemplo com um teste falhando:[![Teste falhando com NUnitTests](http://viniciusquaiato.com/images_posts/Teste-falhando-com-NUnitTests-300x218.jpg "Teste falhando com NUnitTests")](http://viniciusquaiato.com/images_posts/Teste-falhando-com-NUnitTests.jpg)



O NUnitTests nos mostra informações de quantos testes passaram, quantos falharam, quantos foram inconclusivos, ignorados, o tempo de execução, etc.No caso de um teste com falha ele nos dá informações sobre o que deveria acontecer e o que aconteceu. Além de no painel inferior mostrar aonde a falha aconteceu. Bastante interessante.Quando eu corrigir meu teste e recompilar o projeto automagicamente o NUnitTests irá recarregar os testes e estou pronto para executar novamente, sem precisar fazer o load do arquivo novamente.E agora todos os testes passando:[![Testes executados com NUnitTests](http://viniciusquaiato.com/images_posts/Testes-executados-com-NUnitTests-300x218.jpg "Testes executados com NUnitTests")](http://viniciusquaiato.com/images_posts/Testes-executados-com-NUnitTests.jpg)



### Considerações
Bom pessoal, é isso. O NUnit é um framework bastante interessante e completo, maduro e robusto. Em alguns momentos acho a execução pelo runner dele mais rápida do que direto no Visual Studio. Vale a pena experimentar, principalmente pela quantidade de métodos que tornam os testes mais legíveis e simples. Testar deve ser simples e divertido =DEm um próximo post falarei sobre o framework [Sharp Test Ex](http://sharptestex.codeplex.com/), indicado pelo [Juan Lopes](http://juanlopes.net/), que tem o intuito de tornar a escrita dos testes ainda mais legível e fluente.

## Um teste é melhor do que nenhum teste.
Abraços,Vinicius Quaiato.
