--- 
layout: post
title: "TDD: mock objects usando Moq"
wordpress_id: 1316
wordpress_url: http://viniciusquaiato.com/blog/?p=1316
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
- title: Mock
  slug: mock
  autoslug: mock
- title: Mocks
  slug: mocks
  autoslug: mocks
- title: Unit Tests
  slug: unit-tests
  autoslug: unit-tests
- title: testes
  slug: testes
  autoslug: testes
- title: "Testes Unit\xC3\xA1rios"
  slug: testes-unitarios
  autoslug: "testes-unit\xC3\xA1rios"
- title: Moq
  slug: moq
  autoslug: moq
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/logo.png "Moq")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/logo.png)[Moq](http://code.google.com/p/moq/) é um framework para a criação de [Mock Objects](http://en.wikipedia.org/wiki/Mock_object). Estes Mock Objects são muito utilizados na escrita de testes unitários para a simulação e verificação do comportamento sendo testado.Em geral utilizamos mock objects quando uma classe/método sendo testado possui uma dependência para alguma outra classe. Como os teste unitários trabalham com a questão do [SUT](http://martinfowler.com/articles/mocksArentStubs.html#RegularTests), a mínima parte sendo testa, unicamente, criamos estes "emuladores" para estas dependências, e então conseguimos verificar a interaçõe entre estes objetos.([O código completo está no final do post para download](#download)).

### Verificando se um método foi chamado
Se eu quero garantir que meu objeto chamou um método de outro objeto:
{% highlight csharp %}

{% endhighlight %}
Nexte exemplo, criamos um Mock para a interface ILogger, ou seja, o Moq criará um objeto que implementa esta interface e ainda nos fornecerá uma série de formas de verificarmos o que aconteceu com este objeto.Na **_linha 12_** utilizamos o método Verify do objeto mockado para verificarmos se o método Log foi chamado com os valores corretos. Bastante simples.

### Garantindo que um método seja chamado N vezes
Em algumas situações queremos saber quantas vezes um determinado método foi chamado. Ou seja, queremos garantir que ele não foi chamado, ou foi chamado uma vez, chamado pelo menos uma vez, ou muitas vezes.
{% highlight csharp %}

{% endhighlight %}
Neste caso temos um Relatório de Vendas, que será enviado por email. Para que não precisemos da internet, um provedor configurado, etc (isso é cenário para outro tipo de testes) vamos "mockar" quem envia os emails.Aqui estamos usando uma lista de emails, e garantindo que cada email seja enviado para seu respectivo endereço.Fazemos isso nas linhas 10 a 12, utilizando a struct Times. Na **_linha 10_** dizemos que o email "email1" deve ser enviado uma vez. Na **_linha 11_** o email "email2" que aparece duas vezes na lista, deve ser enviado exatamente duas vezes. E na **_linha 12_** o email "emailN" deve ser enviado apenas uma vez.Simples. 

### Configurando um valor de retorno
Imagine a situação onde queremos que na chamada de um objeto mockado desejamos ter um valor de retorno. Podemos fazer isso de forma simples, garantindo assim que o desacoplamento de nossas classes possue uma cobertura de testes boa e que verifica vários cenários:
{% highlight csharp %}

{% endhighlight %}
Neste exemplo estamos utilizando um mock para uma interface de algo que lê um log. Configuramos nosso mock para que quando um método específico seja chamado.Na **_linha 6_** chamamos o método Setup e informamos que queremos configurar o método Read da nossa interface. Na **_linha 7_** chamamos o método Returns e então configuramos o valor de retorno. Isso quer dizer que "quando for chamado o método Read retorne 'Erro: Acesso não autorizado'".Neste exemplo crio um mock para uma interface que abstrai a leitura de logs. Temos uma classe que depende desta abstração, e neste caso testamos se quando um erro está presente no log, esta classe dispara uma exceção. Configurando os valores de retorno no mock faz esta tarefa ser simples para testar os vários cenários em que a classe LogMonitor possa estar.

### A deixa
Bom galera, é isso. Existem muitas outras funcionalidades no Moq, e é claro que vou deixar um pouco para vocês explorarem também, senão não tem graça.Espero que tenha ajudado a mostrar alguns usos de mock objects, e acima de tudo, tenha instigado um pouco a prática de testes no dia-a-dia de vocês.Vamos continuar com a cmapanha: "Um teste por dia no seu legado".<div>

## Um teste é melhor do que nenhum teste
</div><br /><br />[Baixe a solution completa aqui](http://viniciusquaiato.com/files/codesamples/TDD/TDDComMoq.zip).Abraços,Vinicius Quaiato.
