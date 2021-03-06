---
layout: post
title: "Diferen\xC3\xA7a entre Mocks e Stubs"
wordpress_id: 2042
wordpress_url: http://viniciusquaiato.com/blog/?p=2042
categories:
- title: TDD
  slug: tdd
  autoslug: tdd
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags:
- title: TDD
  slug: tdd
  autoslug: tdd
- title: DNAD
  slug: dnad
  autoslug: dnad
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
---
Há algum tempo eu estava com este post "engavetado". Então tive a idéia de submeter este tema para um Lightning Talk no DNAD 2010.Antes de ler o texto, veja o vídeo da minha apresentação pois servirá como base para o que segue:<object width="640" height="390"><param name="movie" value="http://www.youtube.com/v/gMkiKtxrvx8&hl=pt_BR&feature=player_embedded&version=3" /><param name="allowFullScreen" value="true" /><param name="allowScriptAccess" value="always" /><embed src="http://www.youtube.com/v/gMkiKtxrvx8&hl=pt_BR&feature=player_embedded&version=3" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="640" height="390"></embed></object>(Este vídeo foi feito pelo equipe da [Gonow Tecnologia](http://www.gonow.com.br), e disponibilizado originalmente no [Blog da Gonow](http://www.gonow.com.br/blog/2010/11/20/gonow-tecnologia-no-net-architects-day-2010/))

### Um resumo do vídeo
**Mocks** são utilizados para verificarmos a interação entre objetos. No geral não existem asserts quando trabalhamos com [Mocks](http://pt.wikipedia.org/wiki/Mock_Object), e sim a verificação das interações.**Stubs** são utilizados para preparar algum estado para a execução do teste. Os asserts existem e são feitos contra o SUT.

### Vamos entender com um pouco de código
Para entender um pouco a diferença vamos utilizar o [framework Moq](http://viniciusquaiato.com/blog/tdd-mock-objects-usando-moq/) e um pouco de código para deixar tudo mais claro.Recentemente tive que preparar uma forma de cadastrar emails em uma base de dados. Fiz isso utilizando [ASP.NET MVC](http://viniciusquaiato.com/blog/asp-net-mvc-3/) e claro, [utilizando TDD](http://viniciusquaiato.com/blog/category/tdd/). Foram escritos poucos testes, mas precisei utilizar tanto mocks quanto stubs, então vamos ver.

### Utilizando Stubs
Um exemplo bastante simples do uso de Stubs é quando precisamos testar algo que depende do banco de dados para verificar a existência de uma entidade/objeto no mesmo. Quando isso acontece **não** estamos utilizando um mock, e sim um stub. Isso acontece pois este objeto fake(o stub) não está testando a comunicação entre o SUT e o banco, mas sim fornecendo um estado(a existência de algo ou não) para o SUT.Exemplo:
{% highlight csharp %}
[Test]
public void Quando_email_existe_retorna_mensagem_email_existente(){
var repositorioEmails = new Mock<ilistadeemails>();
    repositorioEmails        .Setup(r => r.Existe(email_existente))        .Returns(true);
var controller = new EmailController(repositorioEmails.Object);
var retorno = controller.Cadastrar(email_existente);
    Assert.AreEqual("E-mail já cadastrado.", retorno.JsonDataAsString());
    }
</ilistadeemails>
{% endhighlight %}
Percebam como apesar de estar utilizando o Moq, que é um mocking framework ou [framework de isolamento](http://artofunittesting.com/), estamos trabalhando com o objeto criado por ele como um stub.Permanecemos realizando um assert no nosso teste, contra o retorno do SUT, desta forma estamos trabalhando com um Stub.Um outro exemplo disso se deu em outros testes na mesma aplicação. Eu precisava garantir que minha aplicação não iria "explodir" caso alguma exception ocorresse no acesso ao banco de dados. Desta forma utilizei também um Stub para simular este comportamento, vejamos:
{% highlight csharp %}
[Test]
public void Quando_ocorre_erro_db_no_metodo_existe_retorna_mensagem_tente_novamente(){
var repositorioEmails = new Mock<ilistadeemails>();
    repositorioEmails        .Setup(r => r.Existe(email_novo))        .Throws(new Exception());
var controller = new EmailController(repositorioEmails.Object);
var retorno = controller.Cadastrar(email_novo);
    Assert.AreEqual("Por favor tente novamente.", retorno.JsonDataAsString());
    }
</ilistadeemails>
{% endhighlight %}
Desta forma fica bem claro qual é o papel de um Stub: _fornecer estados para que possamos exercitar o SUT_.

### Utilizando Mocks
Os Mocks serão então utilizados quando realmente queremos testar a interação entre nossos objetos, por exemplo garantir que de fato o controller chame o meu banco de dados passando as informações corretas, vamos ver:
{% highlight csharp %}
[Test]
public void Quando_email_nao_existe_adiciona_na_lista_de_emails(){
var repositorioEmails = new Mock<ilistadeemails>(MockBehavior.Strict);
    repositorioEmails        .Setup(r => r.Existe(email_novo))        .Returns(false);
var controller = new EmailController(repositorioEmails.Object);
    controller.Cadastrar(email_novo);
    repositorioEmails.Verify(r => r.Inserir(email_novo), Times.Once());
    }
</ilistadeemails>
{% endhighlight %}
Notem que criamos um mock com o [comportamento Strict](http://code.google.com/p/moq/wiki/QuickStart). Isso quer dizer que o Moq está criando um Mock real. Um mock real só permite que você realize chamada para métodos que tenham sido configuradas ou esperadas, afinal ele testar a interação entre os objetos, garantindo que apenas sejam executadas as operações esperadas.No exemplo acima queremos saber se ele de fato chama o método Inserir, com o parâmetro enviado para o controller, e que só seja chamado uma única vez.Não existem asserts nos testes com mocks, isto por que se alguma configuração do mock não acontecer o mock irá falhar o teste.

### Conclusão
Quando precisamos preparar dados que estejam fora do nosso controle, utilizamos stubs para fornecer estes dados de maneira controlada.Quando precisamos exercitar a interação e comunicação entre objetos, sendo que algum destes objetos não está sob nosso controle, utilizamos então os mocks.Ambos sao muito parecidos, e a maneira como utilizamos é que revelam suas diferenças, então: **atenção aos detalhes!**Abraços,Vinicius Quaiato.
