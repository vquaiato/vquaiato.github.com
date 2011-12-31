--- 
layout: post
title: TDD - Test-driven Development + c# + Mocks - Parte IV
wordpress_id: 76
wordpress_url: http://viniciusquaiato.com/blog/?p=76
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: .NET
  slug: dotnet
  autoslug: .net
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: Tests
  slug: tests
  autoslug: tests
- title: C#
  slug: c
  autoslug: c#
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: Mocks
  slug: mocks
  autoslug: mocks
---
Fala galera, beleza?Dando continuidade a nossa série de artigos sobre TDD, vamos hoje falar de um ponto muito interessante: [Mocks](http://pt.wikipedia.org/wiki/Mock_Object).Artigos anteriores:Parte I – [http://viniciusquaiato.com/blog/tdd-test-driven-development-c/](http://viniciusquaiato.com/blog/tdd-test-driven-development-c/) Parte II – [http://viniciusquaiato.com/blog/tdd-test-driven-development-c-parte-ii/](http://viniciusquaiato.com/blog/tdd-test-driven-development-c-parte-ii/)Parte III – [http://viniciusquaiato.com/blog/tdd-test-driven-development-c-parte-iii/](http://viniciusquaiato.com/blog/tdd-test-driven-development-c-parte-iii/)De uma maneira resumida_** mocks são objetos que simulam o comportamento de outros objetos**_. Desta forma quando testamos com mocks geralmente [testamos o comportamento](http://martinfowler.com/articles/mocksArentStubs.html) entre os objetos e não os seus estados.Utilizar mocks é algo muito interessante, pois eles nos permitem realizar testes com objetos "de mentira" ao invés de objetos que temos implementados como bancos de dados, serviços, web services, por exemplo. Ou seja, conseguimos verificar o comportamente de nossos objetos de negócios quando relacionados com objetos/ações que não temos o controle para testar (por exemplo uma ida ao web service), ou que são muito pesadas para colocar em unit testes automatizados (idas ao banco, chamadas a um webservice, envios de e-mail, etc).Vamos continuar nosso exemplo das contas bancárias, e imaginar que a cada operação se depósito realizada é necessário utilizar um webservice do banco para registrar um log da ação.Não vou abordar a criação do Web Service, e de fato nem vou utilizar um, vamos apenas definir que ele implementa a seguinte interface que recebe uma string com o nome da operação e o valor:
{% highlight csharp %}
public interface IWebServiceContas{    string RegistrarOperacaoEmConta(string nomeOperacao, decimal valorOperacao);}
{% endhighlight %}
Para trabalhar com [mocks](http://www.mockobjects.com/) neste post utilizarei o framework Moq(lê-se Mock you), que pode ser baixado aqui: [http://code.google.com/p/moq/](http://code.google.com/p/moq/)Para que possamos adicionar este comportamento às nossas contas(fazer chamada ao webservice), precisaremos alterar o código que já funciona, desta forma os testes que já existem nos ajudarão a saber se algo novo quebrou algo que já estava funcionando.Vamos começar criando um teste de depósito que deverá fazer uma chamada para o webservice:
{% highlight csharp %}
[TestMethod]public void Deve_Realizar_Deposito_10_E_Chamar_WebService(){    var conta = new ContaBancaria(10);    conta.Depositar(10);}
{% endhighlight %}
Este teste por enquanto só está realizando o depósito, precisamos então garantir que o webservice seja chamado, e é utilizando um mock que faremos isso.Adicione a dll do Moq ao seu projeto:[caption id="attachment_79" align="aligncenter" width="482" caption="Adicionar Dll Moq"]![Adicionar Dll Moq](http://viniciusquaiato.com/blog/wp-content/uploads/2009/11/Dll_Moq.jpg "Adicionar Dll Moq")[/caption]Agora vamos criar nosso primeiro mock e também incluir a referência na classe de testes:
{% highlight csharp %}
using Moq;
{% endhighlight %}
e
{% highlight csharp %}

{% endhighlight %}
Podemos perceber que, agora, estamos com um problema. Nossa classe de contas não possui uma instância de IWebServiceContas, e não me parece uma boa solução passar esta instância para o método Depositar. Sendo assim, vamos deixar este teste "pausado" por enquanto.Para fazermos isso basta colocarmos o[ Attribute [Ignore]](http://msdn.microsoft.com/pt-br/library/microsoft.visualstudio.testtools.unittesting.ignoreattribute%28VS.80%29.aspx) antes do teste e ele não será executado:
{% highlight csharp %}
[Ignore][TestMethod]public void Este_Teste_Esta_Ignorado() { //teste ignorado }
{% endhighlight %}
Vamos alterar nossos testes para que garantam que a nossa conta receba uma instância de IWebServiceContas([injeção de dependância](http://www.google.com.br/url?sa=t&source=web&ct=res&cd=1&ved=0CAcQFjAA&url=http%3A%2F%2Fpt.wikipedia.org%2Fwiki%2FInje%25C3%25A7%25C3%25A3o_de_depend%25C3%25AAncia&ei=YWf4SrSeE4Kb8AaE8tHzCQ&usg=AFQjCNF6lSWAr8HzikKzJFV9FvQmFuIPFA&sig2=IxjgnqaJzUDx2mzjFcdeQA)) no seu construtor, para isso vamos alterar nosso primeiro teste bem como o seu nome (lembrem, os testes devem evoluir junto com o código e com o modelo do domínio):
{% highlight csharp %}

{% endhighlight %}
Ok, agora nada compila. Perfeito! Vamos alterar nossa classe para que ela receba um objeto que implemente IWebServiceContas:
{% highlight csharp %}
public ContaBancaria(decimal depositoInicial, IWebServiceContas webservice){    Validar(depositoInicial);    this.SaldoAtual += depositoInicial;}
{% endhighlight %}
Comos todos os nossos testes criam instâncias de contas, vamos atualizá-los para que compilem e então vamos executar todos os testes:[caption id="attachment_82" align="aligncenter" width="549" caption="Executando todos os testes"]![Executando todos os testes](http://viniciusquaiato.com/blog/wp-content/uploads/2009/11/Executando_todos_os_testes.jpg "Executando todos os testes")[/caption]Agora podemos voltar ao teste que estávamos escrevendo, afinal nossa alteração não quebrou nada.Para que configuremos nosso mock para atuar como o webservice precisamos fazer seu setup (linhas 5 e 6), e depois verificamos se tudo ocorreu como esperado (linha 11):
{% highlight csharp %}

{% endhighlight %}
O que fizemos nas linhas 5 e 6 foi dizer ao mock **_"hey mock! Espero que o método RegistrarOperacaoEmConta seja chamado com os argumentos "Depósito" e 10"_**.Depois na linha 11 dizemos para ele **_"hey! Verifique se tudo o que eu configurei aconteceu aê!"_**.Desta forma nosso mock se comporta como se fosse o webservice, ele está imitando o comportamento do webservice através de sua interface IWebServiceContas, com a enorme vantagem de que temos total controle sobre o mock e não estamos dependentes do webservice e nem de uma implementação concreta para testar.Se rodarmos nossos testes teremos:[caption id="attachment_91" align="aligncenter" width="884" caption="Executand teste com Mock do Moq"]![Executand teste com Mock do Moq](http://viniciusquaiato.com/blog/wp-content/uploads/2009/11/Moq_verificando_setup1.jpg "Executand teste com Mock do Moq")[/caption]É bem simples o que aconteceu, configuramos nosso mock dizendo que o método RegistrarOperacaoEmConta seria chamado, no entanto esse método não foi chamado. Para isso precisamos alterar nossa classe conta, para que de fato ela chame o método do webservice (ou melhor, do objeto que implementa a interface do webservice).Porém quando passamos o parâmetro no construtor da nossa classe de ContaBancaria não armazenamos este objeto em um campo da classe. Vamos então criar uma propriedade privada deste tipo na classe conta bancária(linhas 5 e 9):
{% highlight csharp %}
public class ContaBancaria{    //outros membros da classe    private IWebServiceContas webServiceContas = null;    public ContaBancaria(decimal depositoInicial, IWebServiceContas webservice)    {        this.webServiceContas = webservice;        Validar(depositoInicial);        this.SaldoAtual += depositoInicial;    }//continuação da classe
{% endhighlight %}
Agora que fizemos uma alteração, vamos rodar todos os testes e ver se tudo está ok. O resultado deve ser de que tudo está funcionando perfeitamente.Agora vamos retomar a alteração do método Depositar para que ele passe no teste do mock:
{% highlight csharp %}
public void Depositar(decimal valorDoDeposito){    this.SaldoAtual += valorDoDeposito;    this.webServiceContas.RegistrarOperacaoEmConta("Depósito", 10);}
{% endhighlight %}
E quando rodamos os testes obtivemos vários erros:[caption id="attachment_100" align="aligncenter" width="559" caption="Rodando Teste Mock"]![Rodando Teste Mock](http://viniciusquaiato.com/blog/wp-content/uploads/2009/11/Rodando_Teste_Mock.jpg "Rodando Teste Mock")[/caption]Isso ocorreu pois eu alterei meus testes passando _null_ para o parâmetro do IWebServiceContas, desta forma vou acrescentar uma validação extra ao meu construtor, garantindo que o serviço esteja presente na construção da conta (vamos imaginar que é uma regra):
{% highlight csharp %}
[TestMethod][ExpectedException(typeof(ArgumentException))]public void Deve_Lancar_Excecao_Deposito_Inicial_Valido_E_Servico_Nulo(){    ContaBancaria conta = new ContaBancaria(10, null);}
{% endhighlight %}
E agora altero o construtor para respeitar a regra:
{% highlight csharp %}
public ContaBancaria(decimal depositoInicial, IWebServiceContas webservice){    Validar(depositoInicial);    Validar(webservice);    this.webServiceContas = webservice;    this.SaldoAtual += depositoInicial;}private void Validar(IWebServiceContas webservice){    if (webservice == null)        throw new ArgumentException("Serviço de Contas não pode ser nulo!");}
{% endhighlight %}
E rodando os testes vamos ver que só falharam os lugares onde eu mantive o construtor passando _null_, ou seja, sem respeitar a regra, desta forma vou atualizar os testes para respeitar.Agora vou executar novamente todos os testes e ver o que aconteceu:[caption id="attachment_103" align="aligncenter" width="559" caption="Rodando Todos Testes e Teste Mock"]![Rodando Todos Testes e Teste Mock](http://viniciusquaiato.com/blog/wp-content/uploads/2009/11/Rodando_Todos_Testes_e_Teste_Mock.jpg "Rodando Todos Testes e Teste Mock")[/caption]Pronto agora podemos ver que até mesmo nosso teste com o mock está funcionando!O que isso quer dizer? Quer dizer que a nossa classe ContaBancaria está se comportando como esperado. Está está enviando uma chamada para o objeto webservice, passando os parâmetros corretamente no momento em que é feito um depósito.Para garantir isso, vamos escrever mais um teste, passando outros valores:
{% highlight csharp %}

{% endhighlight %}
Este teste irá falhar, pois eu deixei hardcoded a chamada para o webservice dentro do método, para isso vamos alterar a chamada do método:
{% highlight csharp %}
public void Depositar(decimal valorDoDeposito){    this.SaldoAtual += valorDoDeposito;    this.webServiceContas.RegistrarOperacaoEmConta("Depósito", valorDoDeposito);}
{% endhighlight %}
E finalmente, rodando nossos testes:[caption id="attachment_104" align="aligncenter" width="559" caption="Rodando Todos Testes e Testes com Mocks passando"]![Rodando Todos Testes e Testes com Mocks passando](http://viniciusquaiato.com/blog/wp-content/uploads/2009/11/Rodando_Todos_Testes_e_Testes_com_mocks_passando.jpg "Rodando Todos Testes e Testes com Mocks passando")[/caption]Bom galera é isso.Sei que existe muito mais complexidade em realizar testes, usar mocks, etc. E sei também que TDD não é algo que podemos sair aplicando da noite para o dia. É preciso maturidade. No entanto a maturidae só virá com a prática e a utilização.Corroborando o [Giovanni Bassi](http://unplugged.giggio.net/): "Testar é caro, não testar é mais caro ainda!".Neste post vimos como usar mocks, e também vimos como os testes nos ajudaram a encontrar erros, afinal, fizemos algumas alterações no código e alguns testes pararam de rodar. É disso que eu estou falando! É para isso que os testes servem!Qualquer dúvida podem entrar em [contato comigo](http://viniciusquaiato.com/blog/about/).Abraços,Vinicius Quaiato.
