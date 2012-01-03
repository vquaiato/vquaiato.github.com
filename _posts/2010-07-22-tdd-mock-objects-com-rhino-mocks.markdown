--- 
layout: post
title: "TDD: mock objects com Rhino Mocks"
wordpress_id: 1318
wordpress_url: http://viniciusquaiato.com/blog/?p=1318
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: Mock
  slug: mock
  autoslug: mock
- title: Mocks
  slug: mocks
  autoslug: mocks
- title: testes
  slug: testes
  autoslug: testes
- title: "Testes Unit\xC3\xA1rios"
  slug: testes-unitarios
  autoslug: "testes-unit\xC3\xA1rios"
- title: Rhino Mocks
  slug: rhino-mocks
  autoslug: rhino-mocks
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/rhinomocks-120x90.png "Rhino Mocks")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/rhinomocks-120x90.png)[Rhino Mocks](http://www.ayende.com/projects/rhino-mocks.aspx) é um framework para a criação e trabalho de mock objects no .NET. Ele possui a forma de trabalho um pouco diferente do [Moq](http://viniciusquaiato.com/blog/tdd-mock-objects-usando-moq/), mas é tão bom quanto e junto com o Moq figura entre os mais utilizados frameworks para este propósito (para alguns é apenas questão de gosto entre um ou outro).(Para saber mais sobre mock objects veja [aqui](http://viniciusquaiato.com/blog/tdd-test-driven-development-c-parte-iv/) e [aqui](http://viniciusquaiato.com/blog/tdd-mock-objects-usando-moq/))Seguirei com exemplos simples e bastante didáticos. É importante notar que a maioria dos exemplos só fará sentido se você, de alguma forma, consegue compreender um pouco da utilização de interfaces, [abstrações](http://viniciusquaiato.com/blog/ocp-open-closed-principle/), inversão de controle, [injeção de dependências](http://viniciusquaiato.com/blog/tag/injecao-de-dependencia/), etc. Estas são práticas muito comuns quando você está trabalhando com [TDD](http://viniciusquaiato.com/blog/category/tdd/). Isso não quer dizer que deve você sair utilizando estas técnicas, mas o TDD acaba lhe levando a isso, pois ele guia o design da sua aplicação, com o apoio dos testes.

### Configurando expectativas
Vamos para um exemplo simples. Neste caso temos uma "fila de pedidos" que quando um novo pedido for adicionado à fila o mesmo deve ser inserido em um repositório e um email enviado.Utilizaremos o Rhino Mocks para emular o repositório e também o objeto enviador de emails, vejamos:
{% highlight csharp %}
[TestMethod]
public void Quando_Adiciono_Produto_Na_Fila_Deve_Adicionar_No_Repositorio_E_Notificar_Por_Email(){
var pedido = new Pedido { Email = "email", Produto = "produto" }
;
var mocks = new MockRepository();
var repositorio = mocks.StrictMock<irepositoriopedidos>();
var notificador = mocks.StrictMock<inotificadoremail>();
    repositorio.Expect(r => r.Adicionar(pedido));
    notificador.Expect(n => n.Notificar("email", "produto"));
var filaPedidos = new FilaDePedidos(repositorio, notificador);
    mocks.ReplayAll();
    filaPedidos.AdicionarNaFila(pedido);
    mocks.VerifyAll();
    }
</inotificadoremail></irepositoriopedidos>
{% endhighlight %}
Rhino Mocks utiliza o conceito de repositório de mocks, e é com este repositório que criamos nossos mocks. Na **_linha 5_** criamos nosso MockRepository. Nas **_linhas 7 e 8_** criamos mocks para o repositório de pedidos e para o notificador de email.Nas **_linhas 10 e 11_** configuramos as expectativas para nossos mocks, ou seja, informamos quais métodos deverão ser chamados. e quais os parâmetros que eles deverão receber.O método ReplayAll na **_linha 15_** irá reproduzir todas as configurações que foram feitas. E na **_linha 19_** fazemos a verificação para saber se todas expectativas foram atingidas.

### Chamando um método N vezes
Assim como com o Moq podemos utilizar o Rhino para verificar se um método de um objeto mockado foi chamado N vezes, de acordo com as nossas configurações. Vou utilizar o mesmo exemplo do post do Moq:
{% highlight csharp %}
[TestMethod]
public void Dados_4_Emails_Para_Relatorio_De_Vendas_Deve_Enviar_Os_4(){
var mocks = new MockRepository();
var enviadorEmails = mocks.StrictMock<ienviadoremail>();
var relatorioVendas = new RelatorioVendas(enviadorEmails);
var emails = new List<string> { "email1", "email2", "emailN", "email2" }
;
    enviadorEmails.Expect(e => e.Enviar("email1")).Repeat.Once();
    enviadorEmails.Expect(e => e.Enviar("email2")).Repeat.Twice();
    enviadorEmails.Expect(e => e.Enviar("emailN")).Repeat.Times(1);
    mocks.ReplayAll();
    relatorioVendas.EnviarPorEmail(emails);
    mocks.VerifyAll();
    }
</string></ienviadoremail>
{% endhighlight %}
A diferença para o Moq é que aqui utilizamos _Repeat_ e configuramos quantas vezes esperamos que esta expectativa ocorra.Temos alguns métodos já definidos, como podemos ver _Once_, _Twice_, _Never_, _Any_ e o _Times_, que configuramos com um valor. No exemplo utilizamos 1, apenas para mostrar o método.

### Configurando valores de retorno
Em diversas situações é necessário configurarmos valores de retornos para nossos objetos mockados, sendo assim o Rhino Mocks também nos dá essa possibilidade.É bastante parecido com o Moq:
{% highlight csharp %}
[TestMethod][ExpectedException(typeof(AppErrorException))]
public void Quando_LogError_Possui_Erro_LogMonitor_Deve_Lancar_Excecao(){
var mocks = new MockRepository();
var logReader = mocks.StrictMock<ilogreader>();
    logReader.Expect(l => l.Read())        .Return("Erro: Acesso não autorizado.").Repeat.Times(2);
var logMonitor = new LogMonitor(logReader);
    mocks.ReplayAll();
    logMonitor.Inspect();
    mocks.VerifyAll();
    }
</ilogreader>
{% endhighlight %}
A diferença que temos com relação ao Moq neste caso é que precisamos informar quantas vezes o método será chamado, caso contrário obteremos um erro de expectativa. Como meu código chama o método duas vezes, vou colocar o Repeat.Times(2).

### Finalizando
Bom galera, é basicamente isso. É claro que existe muito mais do que eu mostrei aqui, mas a idéia é apssar um pouco do conceito e funcionamento do TDD utilizando Mock Objects. Também preferi não seguir com um passo-a-passo do TDD pois já fiz isso em uma outra série, e queria focar mais nos aspectos dos frameworks de Mock mesmo.Espero que isso os deixe mais instigados a praticar e escrever testes de unidade, e se possível, TDD.Lembrem-se:

## Um teste é melhor que nenhum teste.
[Aqui segue o fonte da solution utilizada com todas as classes](http://viniciusquaiato.com/files/codesamples/TDD/TDDComRhinoMocks.zip).[Mais sobre Rhino Mocks aqui](http://en.wikibooks.org/wiki/How_to_Use_Rhino_Mocks/Introduction).

Abraços,
Vinicius Quaiato.
