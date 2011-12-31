--- 
layout: post
title: "DynamicObject: dinamismo no .NET 4.0"
wordpress_id: 286
wordpress_url: http://viniciusquaiato.com/blog/?p=286
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
tags: 
- title: Novidades
  slug: novidades
  autoslug: novidades
- title: dynamic
  slug: dynamic
  autoslug: dynamic
- title: ExpandoObject
  slug: expandoobject
  autoslug: expandoobject
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: c# 4
  slug: c-4
  autoslug: c#-4
---
Continuando a falar de [_dynamic_](http://msdn.microsoft.com/en-us/library/dd264736%28VS.100%29.aspx) no .NET 4.0, vamos falar um pouco sobre DynamicObject._[DynamicObject](http://msdn.microsoft.com/en-us/library/system.dynamic.dynamicobject%28VS.100%29.aspx)_ é uma classe abstrata que permite definir quais operações podem ser feitas em um objeto dynamic e como estas operações são realizadas.Falei um pouco sobre _ExpandoObject _[aqui](http://viniciusquaiato.com/blog/expandoobject-dinamismo-dotnet-4/), que é um tipo de objeto dynamic.Para não dizer que esta é uma das novas features e que ela é inútil, estou envolvido em um projeto e se esta feature já estivesse disponível em versão realease, eu já estaria utilizando a mesma por necessidades do projeto.Bom para dar um exemplo, vamos imaginar que estamos implementando um provider customizado para sessões em nossa aplicação.Muitas vezes não queremos ter que escrever algo como minhaSessao["Usuario"], afinal se sabemos que sempre haverá um Usuario na sessão ele poderia ser uma propriedade. Com _DynamicObject _podemos fazer isso (primeiro vou escrever os testes):
{% highlight csharp %}
[TestMethod]public void Deve_Criar_Uma_Propriedade_Nome_No_Objeto_Dinamico(){    dynamic sessaoDinamica = new SessaoDinamica();    sessaoDinamica.Nome = "Vinicius";    Assert.AreEqual(sessaoDinamica.Nome, "Vinicius");}
{% endhighlight %}
E a classe _SessaoDinamica_:
{% highlight csharp %}
();    public override bool TrySetMember(SetMemberBinder binder, object value)    {        sessionItems[binder.Name.ToLower()] = value;        return true;    }    public override bool TryGetMember(GetMemberBinder binder, out object result)    {        return sessionItems.TryGetValue(binder.Name.ToLower(), out result);    }}
{% endhighlight %}
Podemos notar na **linha 1** que nossa classe herda de _DynamicObject_, que como foi dito é uma classe abstrata.Na **linha 3** definimos um dicionário para ser a coleção de itens da nossa sessão.Nas** linhas 5 a 10 **fazemos um override em um dos métodos da classe _DynamicObject_. O método _TrySetMember_ é que fará toda a mágica. Quando uma propriedade for chamada no objeto dynamic o .net irá verificar se esta propriedade existe de fato e caso ela não exista o método _TrySetMember _será então chamado. Dentro deste método estamos atribuindo o nome da propriedade chamada à uma chave do nosso dicionário, e o valor que foi atribuído a ela para o valor do item do dicionário.Pronto! Com isso já é possível chamar qualquer propriedade na nossa sessão.Nas** linhas 13 a 15** fazemos o mesmo mas para um get. Sempre que tentar obter um valor de uma propriedade em um objeto dynamic o .net irá verificar se a propriedade existe, e caso não exista será chamado o método _TryGetMember_.Com isso podemos executar o código do teste abaixo:
{% highlight csharp %}
[TestMethod]public void Deve_Criar_Uma_Propriedade_Nome_E_outra_Sobrenome(){    dynamic sessaoDinamica = new SessaoDinamica();    sessaoDinamica.Nome = "Vinicius";    sessaoDinamica.Sobrenome = "Quaiato";    Assert.AreEqual(sessaoDinamica.Nome, "Vinicius");    Assert.AreEqual(sessaoDinamica.sobrenome, "Quaiato");}
{% endhighlight %}
Nas **linhas 5 e 6** estamos setando duas propriedade que "não existem" definidas na nossa classe SessaoDinamica, mas o TrySetMember está fazendo a mágica "por baixo dos panos".E nas** linhas 8 e 9 **estamos obtendo o valor das duas propriedades e o TryGetMember está fazendo a mágica também.Note que na** linha 9** usamos a propriedade com letra minúscula, podendo trabalhar com elas de modo case-sensitive ou case-insensitive.É isso galera.Tenho certeza que as capacidades dinâmicas do .net 4 irão fornecer base para muitos trabalhos interessantes, tanto em projetos na comunidade quanto em projetos particulares.Qualquer dúvida é só postar aqui ou escrever um email.Abraços,Vinicius Quaiato.
