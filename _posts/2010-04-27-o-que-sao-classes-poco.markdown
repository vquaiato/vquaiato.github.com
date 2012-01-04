--- 
layout: post
title: "O que s\xC3\xA3o classes POCO? " wordpress_id: 887
wordpress_url: http://viniciusquaiato.com/blog/?p=887
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
- title: POCO
  slug: poco
  autoslug: poco
---
Nos últimos meses tem-se falado muito de classes POCO. É POCO pra cá e POCO pra lá. Mas o que são classes POCO?

### O termo POCO
POCO - Plain Old CLR Object - diz respeito a uma classe que não depende e não conhece frameworks externos ao .net framework. O termo POCO vem do termo POJO - Plain Old Java Object - utilizado pela comunidade Java. Atualmente classes POCO estão bastante associadas ao trabalho com ferramentas [ORM](http://msdn.microsoft.com/en-us/library/aa697427%28VS.80%29.aspx). No geral estas ferramentas definem classes para serem herdadas, interfaces implementadas ou atributos para serem utilizados nas classes ou propriedades. São estas dependências que as classes POCOs não criam, elas ficam independentes destes frameworks externos. Veja abaixo uma classe utilizada pelo WCF em conjunto com o LinqToSql:
{% highlight csharp %}
[DataContract][Table(Name="Usuarios")]
public class Usuario{    [DataMember]    [Column]    
public int Id {
et;
    set;
    }
    [DataMember]    [Column]    
public string Nome {
et;
    set;
    }
    [DataMember]    [Column]    
public string Email {
et;
    set;
    }
        
private bool EmailValido(){
eturn false;
    }
}

{% endhighlight %}
Na classe acima temos a dependência de dois frameworks distintos: o WCF e o LinqToSql. E apesar destes dois frameworks serem parte do .Net, eles criam em nossa classe uma dependência direta para estas ferramentas que estão além do domínio do nosso software. O problema desta dependência é a dificuldade em testar estas classes, dar manutenção(em alguns casos é difícil entender o que a classe é ou faz), evoluir, e o principal é complicado utilizar estas classes em outros projetos. Na classe do exemplo acima poderíamos ter uma situação onde Usuario herdasse de uma classe de framework ORM, ou implementasse uma interface deste framework, alterando assim seu comportamento e estrutura, incluindo métodos que dizem respeito ao framework e não a classe Usuario, o que criaria um grande problema, como mencionado antes. Neste exemplo simples isso pode não parecer um grande problema, mas imagine todo um sistema de uma empresa. Ou então imagine todas as classes core dos sistemas de uma empresa. Como você vai reutilizar estas classes core em outros sistemas se elas dependem de frameworks que podem não estar relacionados com este novo desenvolvimento? O ideal é manter as classes de domínio o mais desacopladas possível. Procure por frameworks que permitam a utilização de classes POCO, ou desenhe suas aplicações de forma a manter seu core livre destas dependências ou com a menor quantidade delas. A classe POCO para o cenário acima, seria apenas removendo os atributos:
{% highlight csharp %}

public class Usuario{    

public int Id {
et;
    set;
    }
    
public string Nome {
et;
    set;
    }
    
public string Email {
et;
    set;
    }
    
private bool EmailValido(){
eturn false;
    }
}

{% endhighlight %}
O Entity Framework 4 permite trabalhar com classes POCO, e o WCF também permite trabalhar com classes POCO usando o [DataContractSerializer](http://msdn.microsoft.com/en-us/library/system.runtime.serialization.datacontractserializer.aspx).

### Não confunda com classes anêmicas/DTOs
É importante não confundir POCO com uma [classe anêmica](http://en.wikipedia.org/wiki/Anemic_Domain_Model) ou [DTO](http://en.wikipedia.org/wiki/Data_transfer_object). Apesar de uma classe anêmica poder ser uma classe POCO, o conceito de POCO não diz que a classe deva ser anêmica. As classes POCO podem sim ter métodos e comportamentos, elas apenas não possuem dependências de outros frameworks e não alteram seu comportamento/estrutura em razão destes. Qualquer dúvida, estou à disposição.

Att,
Vinicius Quaiato.
