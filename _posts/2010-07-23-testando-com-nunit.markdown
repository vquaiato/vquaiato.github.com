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
[caption id="attachment_1387" align="alignleft" width="133" caption="NUnit"][![NUnit](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/logo.gif "NUnit")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/logo.gif)[/caption]Para quem trabalha com Visual Studio e costuma escrever testes é comum o uso do MSTests: o framework para unit tests integrado a ele.Algumas versões do Visual Studio, porém, não possuem estas ferramentas, mas isso não te impede de escrever seus testes.[NUnit](http://www.nunit.org/index.php?p=home) é um framework para unit testing. Inicialmente portado do JUnit, atualmente é 100% escrito em C# e é possível utilizá-lo com todas as linguagens do .NET.Além da situação onde não se possui o MSTests, o NUnit é válido ser utilizado em muitos outros casos, pois é um framework bastante maduro e possui muitas facilidades e possibilidades na escrita dos testes.Não farei um comparativo entre ele e o MSTests, mas mostrarei algumas features que ele possui.### O download e instalação
O download e instalação são bastante simples, você pode optar entre um instalador MSI, um zip ou baixar o fonte e compilar, confira tudo aqui: [http://www.nunit.org/index.php?p=download](http://www.nunit.org/index.php?p=download)Faça o download do MSI, e siga o melhor padrão NNF.### Criando um projeto no VisualStudio
Como eu possuo o Visual Studio 2010 com todas as ferramentas de testes e mais ainda as adicionadas pelo [R#](http://www.jetbrains.com/resharper/), eu vou remover as referências para o MSTests do meu projeto:[caption id="attachment_1389" align="aligncenter" width="300" caption="Remover referencia MSTests"][![Remover referencia MSTests](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/Remover-referencia-mstests-300x216.jpg "Remover referencia MSTests")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/Remover-referencia-mstests.jpg)[/caption]E vamos adicionar a referência para o NUnit:[caption id="attachment_1390" align="aligncenter" width="300" caption="Adicionar referencia NUnit"][![Adicionar referencia NUnit](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/add-referencia-nunit-300x216.jpg "Adicionar referencia NUnit")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/add-referencia-nunit.jpg)[/caption]A DLL do NUnit estará em "Program Files\NUnit x.x\bin\.net 2.0\framework\nunit.framework.dll".### Escrevendo os testes
A escrita dos testes é bem simples. Vamos utilizar os atributos [[TestFixture]](http://www.nunit.org/index.php?p=testFixture&r=2.5.5) em uma classe, meio que para dizer que "aqui estão meus testes". E em cada método de teste vamos utilizar o atributo [[Test]](http://www.nunit.org/index.php?p=test&r=2.5.5). Diferença com o MSTests onde usávamos [[TestMethod]](http://msdn.microsoft.com/en-us/library/microsoft.visualstudio.testtools.unittesting.testmethodattribute(VS.80).aspx).Existem vários métodos que podem ser utilizados para asserções. Abaixo vou demonstrar alguns deles, e acho que são bem explicativos. Notem que existem métodos assertivos que não existem no MSTests mas que facilitam bastante a vida. É o caso do [Contains](http://www.nunit.org/index.php?p=collectionAssert&r=2.5.5) para trabalharmos com coleções. [Greater](http://www.nunit.org/index.php?p=comparisonAsserts&r=2.5.5) e [Less](http://www.nunit.org/index.php?p=comparisonAsserts&r=2.5.5) para trabalharmos com comparação de valores. 
{% highlight csharp %}

{% endhighlight %}
Reparem nos 3 últimos testes, nas linhas 49 a 65 que utilizamos Assert.That e dentro da chamada do método utilizamos alguns helpers que tornam a leitura dos testes bastante interessantes.No primeiro caso, na **_linha 52_** dizemos algo como _"Confirme para mim que 20 é pelo menos maior ou igual a 10"_. Isso é bastante legível.Na **_linha 58_** temos algo como _"Confirme para mim que 'vinicius' é uma string iniciando com 'v'"_. Clever hun?!E na **_linha 64_** temos _"Confirme para mim que 20 não é igual a 19+2"_.Existem várias outras contraints (é assim que é chamado esse tipo de asserção) que podem ser utilizadas, confira mais sobre elas aqui: [http://www.nunit.org/index.php?p=constraintModel&r=2.5.5](http://www.nunit.org/index.php?p=constraintModel&r=2.5.5)### Executando os testes dentro do Visual Studio
Para executarmos os testes eu poderia simplesmente utilizar meu teste runner dentro do Visual Studio, como mostra a figura abaixo:[caption id="attachment_1393" align="aligncenter" width="300" caption="Executando testes do NUnit dentro do Visual Studio"][![Executando testes do NUnit dentro do Visual Studio](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/executando-no-VS-300x271.jpg "Executando testes do NUnit dentro do Visual Studio")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/executando-no-VS.jpg)[/caption]### Executando os testes com o NUnitTests
Outra forma de executar os testes é com o teste runner do NUnit. Para isso abra o NUnitTests que foi instalado na máquina. Utilize o menu File -> Open Project e selecione a DLL do projeto que criamos no Visual Studio:[caption id="attachment_1395" align="aligncenter" width="300" caption="Carregando DLL dos testes no NUnitTests"][![Carregando DLL dos testes no NUnitTests](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/Carregando-DLL-dos-testes-300x222.jpg "Carregando DLL dos testes no NUnitTests")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/Carregando-DLL-dos-testes.jpg)[/caption]Feito isso os nossos testes aparecerão no NUnitTests:[caption id="attachment_1396" align="aligncenter" width="300" caption="DLL com testes carregada no NUnitTests"][![DLL com testes carregada no NUnitTests](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/DLL-com-testes-carregada-300x222.jpg "DLL com testes carregada no NUnitTests")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/DLL-com-testes-carregada.jpg)[/caption]Clicando no botão _**Run**_ nossos testes serão executados. Veja um exemplo com um teste falhando:[caption id="attachment_1397" align="aligncenter" width="300" caption="Teste falhando com NUnitTests"][![Teste falhando com NUnitTests](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/Teste-falhando-com-NUnitTests-300x218.jpg "Teste falhando com NUnitTests")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/Teste-falhando-com-NUnitTests.jpg)[/caption]O NUnitTests nos mostra informações de quantos testes passaram, quantos falharam, quantos foram inconclusivos, ignorados, o tempo de execução, etc.No caso de um teste com falha ele nos dá informações sobre o que deveria acontecer e o que aconteceu. Além de no painel inferior mostrar aonde a falha aconteceu. Bastante interessante.Quando eu corrigir meu teste e recompilar o projeto automagicamente o NUnitTests irá recarregar os testes e estou pronto para executar novamente, sem precisar fazer o load do arquivo novamente.E agora todos os testes passando:[caption id="attachment_1399" align="aligncenter" width="300" caption="Testes executados com NUnitTests"][![Testes executados com NUnitTests](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/Testes-executados-com-NUnitTests-300x218.jpg "Testes executados com NUnitTests")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/Testes-executados-com-NUnitTests.jpg)[/caption]### Considerações
Bom pessoal, é isso. O NUnit é um framework bastante interessante e completo, maduro e robusto. Em alguns momentos acho a execução pelo runner dele mais rápida do que direto no Visual Studio. Vale a pena experimentar, principalmente pela quantidade de métodos que tornam os testes mais legíveis e simples. Testar deve ser simples e divertido =DEm um próximo post falarei sobre o framework [Sharp Test Ex](http://sharptestex.codeplex.com/), indicado pelo [Juan Lopes](http://juanlopes.net/), que tem o intuito de tornar a escrita dos testes ainda mais legível e fluente.## Um teste é melhor do que nenhum teste.
Abraços,Vinicius Quaiato.
