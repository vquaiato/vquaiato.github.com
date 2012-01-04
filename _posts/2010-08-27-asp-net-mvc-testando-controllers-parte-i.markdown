--- 
layout: post
title: "ASP.NET MVC: Testando Controllers parte I"
wordpress_id: 1510
wordpress_url: http://viniciusquaiato.com/blog/?p=1510
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: Testar Controllers
  slug: testar-controllers
  autoslug: testar-controllers
- title: Controllers
  slug: controllers
  autoslug: controllers
- title: Moq
  slug: moq
  autoslug: moq
- title: testes
  slug: testes
  autoslug: testes
- title: MVC
  slug: mvc
  autoslug: mvc
- title: Mock
  slug: mock
  autoslug: mock
- title: ViewModel
  slug: viewmodel
  autoslug: viewmodel
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/08/tests-150x150.jpg "tests")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/08/tests.jpg)Fala-se muito que com a utilização do [ASP.NET MVC](http://www.asp.net/mvc) ganhamos maior controle sobre o projeto, existe facilidade na escrita e manutenção de testes, etc.Mas, afinal de contas: _C**omo é que eu testo os meus controllers**_?Essa é uma questão que não é muito falada, e por vezes nem muito exercitada. Neste primeiro post sobre o assunto vou falar um pouco sobre como testar controllers que trabalham puramente com dados, ou seja, quero enviar dados para uma fonte de dados, garantir que o controller está usando ModelState de forma correta, etc.Vou omitir algumas coisas aqui para manter o post breve (vou detalhar apenas os testes), mas o código fonte está completo e disponível: [TestesControllerI.zip](http://viniciusquaiato.com/files/codesamples/TDD/TestesControllerI.zip)Cenário 1: Controller recebe dados da view para adicionar na fonte de dados.
{% highlight c# %}
[TestMethod]
public void E_UsuarioCriar_Valido_Entao_Adiciona_Ao_Repositório_E_Retorna_View_Sucesso(){
var controller = new CriarUsuarioController();
var repositorio = new Mock<irepositoriousuarios>();
    controller.RepositorioDeUsuarios = repositorio.Object;
var usuarioCriar = new UsuarioCriar                            {                                Nome = "Nome",                                Login = "Login",                                Senha = "Senha"                            }
;
var result = controller.Criar(usuarioCriar);
    repositorio        .Verify(r => r.Adicionar(It.Is<usuario>(u => Iguais(u, usuarioCriar))), Times.Once());
    Assert.AreEqual("Sucesso", result.ViewName);
    }
</usuario></irepositoriousuarios>
{% endhighlight %}
O que fazemos neste teste é bastante simples. Primeiro instanciamos nosso controller, <strong_linha 4_.Após isso, fazemos um mock no nosso repositório, **_linha 5_**. (não sabe o que é mock? Veja [aqui](http://viniciusquaiato.com/blog/tdd-mock-objects-usando-moq/), e [aqui](http://viniciusquaiato.com/blog/tdd-mock-objects-com-rhino-mocks/)).Criado nosso mock, dizemos ao controller que é para utilizar este repositório de dados, **_linha 6_**. Reparem que poderíamos fazer isso via construtor, mas ainda assim estamos [IoC](http://viniciusquaiato.com/blog/tag/ioc/)!Na **_linha 8_** criamos uma instância do [ViewModel](http://geekswithblogs.net/michelotti/archive/2009/10/25/asp.net-mvc-view-model-patterns.aspx) de criação de usuários. Estou utilizando um ViewModel pois com ele eu faço uso dos DataAnnotations para validar esses dados, sem sujar minhas entidades. E também para representar os dados da View, afinal, poderia ter um campo de confirmação de senha, captcha, etc, e isso não tem relação com minha entidade Usuario.Na **_linha 14_** fazemos a chamada para nossa action, passando o ViewModel como parâmetro. Notem que eu tenho um retorno da minha action, e atribuí para a variável chamada result.Na **_linha 16_** fazemos a verificação do nosso mock. Neste caso estou verificando se o método Adicionar foi chamado, e recebeu como parâmetro um Usuario, com as propriedades iguais as do ViewModel. Isso para nós quer dizer que o controller soube mapear um ViewModel para um Usuario e então chamou o repositório passando este usuário.Por fim, na **_linha 19_** verifico se a View retornada é a view com nome "Sucesso", isto por que este teste diz que para um ViewModel preenchido corretamente, deve ser adicionado no repositório e então a view de sucesso deve ser exibida.Simples não é? Vamos garantir o cenário inverso agora:
{% highlight c# %}
[TestMethod]
public void E_UsuarioCriar_Inalido_Entao_Nao_Adiciona_Ao_Repositório_E_Retorna_View_CriarUsuario(){
var controller = new CriarUsuarioController();
var repositorio = new Mock<irepositoriousuarios>();
    controller.RepositorioDeUsuarios = repositorio.Object;
    controller.ModelState.AddModelError("Senha", "Senha deve ser preenchida");
var usuarioCriar = new UsuarioCriar                            {                                Nome = "Teste",                                Login = "Login",                                Senha = null                            }
;
var view = controller.Criar(usuarioCriar);
    repositorio        .Verify(r => r.Adicionar(It.IsAny<usuario>()), Times.Never());
    Assert.AreEqual("CriarUsuarioView", view.ViewName);
    Assert.AreEqual(usuarioCriar, view.ViewData.Model);
    }
</usuario></irepositoriousuarios>
{% endhighlight %}
O código é quase igual ao da listagem anterior. Então vamos direto para a **_linha 8_**. Na linha 8 o que fazemos é adicionar um erro ao ModelState do controller. Este erro fará com que a validação do ModelState tenha o resultado inválido, mudando assim o comportamento do nosso controller.Na **_linha 18_** fazemos a verificação do nosso mock, garantindo que o método Adicionar não foi chamado nenhuma vez.Nas **_linhas 21 e 22_** fazemos os asserts de que a view retornada é a view de cadastro, pois os dados precisam ser corrigidos, e que a ViewModel retornada é a mesma que foi enviada para o controller.Bom pessoa, para essa primeira parte é basicamente isso. São testes simples, que até podem parecer bobos, mas que nos ajudam a ter controle total sobre nosso código. Com esse tipo de testes conseguimos melhorar a escalabilidade de nossos sistemas MVC, garantimos que nossos controllers fazem apenas aquilo que devem fazer e conseguimos ter um pouco mais de segurança em nossas implementações futuras.Estes testes podem ser refatorados, afinal a criação do controller, mock de repositório e configuração do repositório no controller se repetem nos dois testes. Isso pode ser feito então através de um TestInitialize. Fica aí o exercício para vocês.No próximo post veremos como testar melhor retornos de views, redirects e retorno de dados.

Abraços,
Vinicius Quaiato.
