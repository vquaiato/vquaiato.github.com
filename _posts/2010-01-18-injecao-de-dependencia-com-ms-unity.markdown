---
layout: post
title: "Inje\xC3\xA7\xC3\xA3o de Depend\xC3\xAAncia com MS Unity"
wordpress_id: 220
wordpress_url: http://viniciusquaiato.com/blog/?p=220
categories:
- title: .NET
  slug: dotnet
  autoslug: .net
- title: Patterns
  slug: patterns
  autoslug: patterns
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags:
- title: IoC
  slug: ioc
  autoslug: ioc
- title: "Invers\xC3\xA3o de Controle"
  slug: inversao-de-controle
  autoslug: "invers\xC3\xA3o-de-controle"
- title: "Inje\xC3\xA7\xC3\xA3o de Depend\xC3\xAAncia"
  slug: injecao-de-dependencia
  autoslug: "inje\xC3\xA7\xC3\xA3o-de-depend\xC3\xAAncia"
---
Bom pessoal, pudemos ver os benefícios e alguns usos de Inversão de Controle e Injeção de Dependências [aqui](http://viniciusquaiato.com/blog/inversao-de-controle-inversion-of-control-ioc/) e [aqui](http://viniciusquaiato.com/blog/injecao-de-dependencia/).Uma das formas de obter excelentes ganhos com a inversão de controle é através da utilização de um contêiner de Injeção de Dependências.Um contêiner de injeção de dependências é capaz de criar objetos com todas suas dependências injetadas e totalmente pronto para uso. Em geral estes conteiners podem ser configurados manualmente(programaticamente) ou dinamicamente(através de arquivos de configuração por exemplo).Falaremos um pouco do [Unity](http://www.codeplex.com/unity/) que é um contêiner de Injeção de Dependência que faz parte dos [Application Blocks da Microsoft](http://msdn.microsoft.com/en-us/practices/default.aspx).Para que vejamos como o Unity funciona faça o download do mesmo [aqui](http://www.microsoft.com/downloads/details.aspx?FamilyId=2C8B79E7-AE56-4F90-822E-A1E43C49D12E&displaylang=en) e execute o setup, que irá apenas criar uma pasta com as DLLs do Unity.O Unity, como veremos nos exemplos, suporta 3 tipos de injeção de dependência:- Constructor Injection (injeção por construtor)
- Property Injection (injeção de propriedade)
- Method Call Injection (injeção de chamada de métodos)
Vamos usar como exemplo estas classes e interfaces:
{% highlight csharp %}

public interface ILogger{
void RegistrarMensagem(string mensagem);
    }


public class SqlLogger : ILogger{

public void RegistrarMensagem(string mensagem)    {        //abre conexão SQL        //Executa insert da mensagem    }
}


public class EnviadorDeEmails{

public ILogger Logger { get;
    set;
    }

public EnviadorDeEmails(ILogger logger)    {        this.Logger = logger;
    }

public void EnviarEmail(string email, string mensagem)    {        //Envia email        //registra envio        this.Logger.RegistrarMensagem(string.Format("Email enviado para {
}
", email));
    }
}

{% endhighlight %}
Adicione as seguintes referências ao seu projeto: _Microsoft.Practices.ObjectBuilder2.dll_ e _Microsoft.Practices.Unity.dll_ que se encontram na pasta que você "instalou" o Unity, como pode ser visto na figura abaixo:![Incluindo Dlls do Unity](http://viniciusquaiato.com/images_posts/Incluindo-Dlls.jpg "Incluindo Dlls do Unity")As classes acima são bem simples, no final das contas o que faremos é com que o Unity crie um EnviadorDeEmails com a dependência de ILogger injetada e resolvida, ou seja, que ele crie um EnviadorDeEmails passando para ele um SqlLogger. Para isso vamos "ensinar" ao Unity como resolver a interface ILogger, como pode ser visto no código abaixo:
{% highlight csharp %}

var unityContainer = new UnityContainer();
    unityContainer.RegisterType<ILogger, SqlLogger>();

{% endhighlight %}
Na _**linha 1**_ criamos uma instância do contêiner do Unity. Na _**linha 2**_ dizemos para o Unity que quando quisermos o tipo ILogger (interface) ele deve utilizar a classe concreta SqlLogger. Simples assim.

## Constructor Injection
Agora podemos mandar que o Unity construa nosso EnviadorDeEmails usando constructor injection, conforme visto abaixo:
{% highlight csharp %}
[TestMethod]
public void Configurando_Unity_Para_Resolver_ILogger(){
var unityContainer = new UnityContainer();
    unityContainer.RegisterType<ILogger, SqlLogger>();
var enviadorEmails = unityContainer.Resolve<enviadordeemails>();
    Assert.IsInstanceOfType(enviadorEmails.Logger, typeof(SqlLogger));
    }
</enviadordeemails>
{% endhighlight %}
O grande segredo aí está na _**linha 7**_ onde dizemos para o Unity construir nosso EnviadorDeEmails. O Unity percebe que existe uma dependência no construtor do EnviadorDeEmails, e baseado na configuração que fizemos ele sabe como resolver esta dependência. Na _**linha 9**_ apenas verificamos se de fato o ILogger utilizado é o SqlLogger, e executando o teste obtemos sucesso.E notem que neste caso utilizamos o constructor injection pois a classe EnviadorDeEmails possui um construtor com uma dependência para uma interface, que o Unity conhece.

## Property Injection
Poderíamos dizer que a dependência não deve ser resolvida via construtor, mas sim diretamente na propriedade, para isso alteraríamos a classe EnviadorDeEmails assim:
{% highlight csharp %}

public class EnviadorDeEmails{    [Dependency]
public ILogger Logger { get;
    set;
    }

public void EnviarEmail(string email, string mensagem)    {        //Envia email        //registra envio        this.Logger.RegistrarMensagem(string.Format("Email enviado para {
}
", email));
    }
}

{% endhighlight %}
A única diferença aqui foi a utilização do DependencyAttribute na _**linha 3**_ para marcar que a propriedade Logger, do tipo ILogger, deve ser resolvida pelo Unity.Executando nosso teste mais uma vez devemos obter sucesso.

## Method Call Injection
A outra forma que o Unity tem para injetar nossas dependências é através da chamada de um método. Por exemplo, imaginem que temos um método Initialize na nossa classe, que é responsável por criar os objetos que nossa classe precisa. Podemos fazer com que o Unity execute este método resolvendo todas as dependências.Vejamos o código da classe EnviadorDeEmails utilizando um Method Call Injection:
{% highlight csharp %}

public class EnviadorDeEmails{

public ILogger Logger { get;
    set;
    }

public void EnviarEmail(string email, string mensagem)    {        //Envia email        //registra envio        this.Logger.RegistrarMensagem(string.Format("Email enviado para {
}
", email));
    }
    [InjectionMethod]
public void Inicializador(ILogger logger)    {        this.Logger = logger;
    }
}

{% endhighlight %}
Tudo o que fizemos desta vez foi criar um método, neste caso o método Inicializador, na _**linha 13**_, que recebe como parâmetros as dependências da nossa classe. E marcamos este método com o InjectionMethodAttribute, para dizer ao Unity que este método deve ser chamado e resolvidor por ele na criação de nosso EnviadorDeEmails.E novamente se executarmos o mesmo método de teste, obteremos sucesso.Como vimos nos três exemplos acima, o Unity após configurado consegue resolver as dependências de nossas classes de forma simples e trivial. Basta alterarmos a forma de resolução da dependência, por exemplo de constructor para setter, e nada no código mudará, assim como se mudar de SqlLogger para XmlLogger, nada no código mudará, apenas a configuração do Unity.Bom galera, é mais ou menos isso. O Unity é uma ferramenta bastante poderosa, extensível e simples de usar.Qualquer dúvida é só escrever nos comentários ou enviar email.

Abraços,
Vinicius Quaiato.
