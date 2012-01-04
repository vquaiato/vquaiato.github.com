--- 
layout: post
title: "Inje\xC3\xA7\xC3\xA3o de Depend\xC3\xAAncia no C#"
wordpress_id: 289
wordpress_url: http://viniciusquaiato.com/blog/?p=289
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
- title: C#
  slug: c
  autoslug: c#
- title: Arquitetura
  slug: arquitetura
  autoslug: arquitetura
- title: IoC
  slug: ioc
  autoslug: ioc
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
- title: "Invers\xC3\xA3o de Controle"
  slug: inversao-de-controle
  autoslug: "invers\xC3\xA3o-de-controle"
- title: "Inje\xC3\xA7\xC3\xA3o de Depend\xC3\xAAncia"
  slug: injecao-de-dependencia
  autoslug: "inje\xC3\xA7\xC3\xA3o-de-depend\xC3\xAAncia"
---
Hoje vamos falar um pouco sobre Injeção de Dependências no C#.Injeção de Dependência é uma das formas de obter [Inversão de Controle](http://viniciusquaiato.com/blog/inversao-de-controle-inversion-of-control-ioc/).O nome já diz quase tudo, quando uma classe possui dependência de alguma outra classe concreta, devemos então criar uma dependência para uma [interface](http://msdn.microsoft.com/pt-br/library/87d83y5b.aspx), ou seja, uma abstração.Com nossa classe dependendo de uma abstração, nós injetamos um objeto concreto nela.É um conceito bastante simples, vamos entender com um pouco de código. A classe abaixo é uma classe de acesso ao banco de dados. Ela é responsável por executar um comando SQL apenas:
{% highlight csharp %}

public class SqlClass{    

public void ExecutarComando(string comando)    {        try        {            using (SqlConnection conexao = new SqlConnection("CONNECTION STRING"))            {                using (SqlCommand comandoSql = conexao.CreateCommand())                {                    comandoSql. CommandText = comando;
    comandoSql. CommandType = CommandType.Text;
    comandoSql.ExecuteNonQuery();
    }
            }
        }
        catch (SqlException sqlEx)        {            new LogErros().RegistrarArquivoTexto(sqlEx.Message);
    throw sqlEx;
    }
    }
}

{% endhighlight %}
Qual o problema desta classe? Simples, ela depende de uma classe concreta de log, como pode ser visto na **linha 20**.O que podemos fazer para resolver este problema? Em primeiro lugar precisamos extrair uma interface para a geração de logs, teríamos uma interface mais ou menos assim:
{% highlight csharp %}

public interface ILogErros{
void RegistrarErro(string mensagemDeErro);
    }

{% endhighlight %}
Agora fazemos nossa classe de banco de dados conhecer esta interface e criar uma forma de ter um objeto que implemente esta interface injetado:
{% highlight csharp %}

public class SqlClass{    

private ILogErros logErros = null;
    
public SqlClass(ILogErros objetoLog)    {        this. logErros = objetoLog;
    }
    
public void ExecutarComando(string comando)    {        try        {            using (SqlConnection conexao = new SqlConnection("CONNECTION STRING"))            {                using (SqlCommand comandoSql = conexao.CreateCommand())                {                    comandoSql. CommandText = comando;
    comandoSql. CommandType = CommandType.Text;
    comandoSql.ExecuteNonQuery();
    }
            }
        }
        catch (SqlException sqlEx)        {            logErros.RegistrarErro(sqlEx.Message);
    throw sqlEx;
    }
    }
}

{% endhighlight %}
Na **linha 3** criamos um campo na classe do tipo da interface. É importante perceber que agora nossa classe de banco de dados não conhece o objeto de log, ela apenas conhece sua interface. Ela não sabe como o log será gravado. Nas **linhas 5 a 8** criamos um construtor que recebe um objeto que implementa a interface _ILogErros_, e este construtor irá garantir que **_quem quer que instancie a classe tenha que injetar um objeto_** de log para ela. E isto é Injeção de Dependências! Este tipo de injeção de dependência é conhecido como _[Constructor Injection](http://martinfowler.com/articles/injection.html#ConstructorInjectionWithPicocontainer)_, ou seja, injeção via construtor. Agora para que consigamos instanciar nossa classe _SqlClass _precisamos passar um objeto que implemente _ILogErros_, algo mais ou menos assim:
{% highlight csharp %}
SqlClass sql = new SqlClass(new LogEmArquivoTexto());
    
{% endhighlight %}
Onde _LogEmArquivoTexto_ implementa _ILogErros_. Podemos usar o recurso de Inversão de Controle visto [aqui](http://viniciusquaiato.com/blog/inversao-de-controle-inversion-of-control-ioc/) para criarmos uma factory que já nos retorne um objeto SqlClass com a dependência injetada, nos poupando algum trabalho. E no próximo post veremos como utilizar o _[Unity](http://www.codeplex.com/unity/)_, um contêiner de injeção de dependências da Microsoft.Abraços galera, espero que tenham gostado. Qualquer dúvida é só escrever.

Att,
Vinicius Quaiato.
