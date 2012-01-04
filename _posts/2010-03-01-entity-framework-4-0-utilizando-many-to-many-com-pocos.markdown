--- 
layout: post
title: "Entity Framework 4.0: Utilizando many-to-many com POCOs"
wordpress_id: 493
wordpress_url: http://viniciusquaiato.com/blog/?p=493
categories: 
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: Entity Framework
  slug: entity-framework
  autoslug: entity-framework
tags: 
- title: VS2010
  slug: vs2010
  autoslug: vs2010
- title: ORM
  slug: orm
  autoslug: orm
- title: Entity Framework
  slug: entity-framework
  autoslug: entity-framework
- title: POCO
  slug: poco
  autoslug: poco
- title: Many-To-Many
  slug: many-to-many
  autoslug: many-to-many
---
Fala galera, recebi algumas dúvidas por e-mail e vamos resolver aqui.Vamos trabalhar com relações many-to-many utilizando POCO e o Entity Framework 4.0.Para ver como trabalhar com POCO no EF4 veja [este post aqui](http://viniciusquaiato.com/blog/entity-framework-4-model-first-com-pocos/).Vamos fazer um exemplo bem simples, trabalhando com produtos e lojas. Cada produto poderá estar em muitas lojas, e uma loja poderá conter muitos produtos.Abaixo temos o desenho de nosso modelo inicial:[caption id="attachment_634" align="aligncenter" width="300" caption="Modelo de Classes Entity Framework 4.0"][![Modelo de Classes Entity Framework 4.0](http://viniciusquaiato.com/images_posts/Modelo-300x175.jpg "Modelo de Classes Entity Framework 4.0")](http://viniciusquaiato.com/images_posts/Modelo.jpg)[/caption]Feito isso vamos criar uma associação entre nossas entidades, como pode ser visto abaixo:[caption id="attachment_639" align="aligncenter" width="300" caption="Criando associação no modelo do EF 4.0"][![Criando associação no modelo do EF 4.0](http://viniciusquaiato.com/images_posts/Criando-associacao-no-modelo-300x194.jpg "Criando associação no modelo do EF 4.0")](http://viniciusquaiato.com/images_posts/Criando-associacao-no-modelo.jpg)[/caption][caption id="attachment_642" align="aligncenter" width="268" caption="Definindo a Associacao Many-To_Many no EF 4.0"][![Definindo a Associacao Many-To_Many no EF 4.0](http://viniciusquaiato.com/images_posts/Definindo-a-Associacao-268x300.jpg "Definindo a Associacao Many-To_Many no EF 4.0")](http://viniciusquaiato.com/images_posts/Definindo-a-Associacao.jpg)[/caption]Feito isso basta salvarmos nosso modelo e gerar o banco de dados. Lembrando de desmarcar a opção de geração de código no modelo ([veja aqui como fazer isso](http://viniciusquaiato.com/blog/entity-framework-4-model-first-com-pocos/)).Nossas classes ficarão simples, como não poderia deixar de ser.Abaixo vemos a classe Produto, que como pode-se notar não possui nenhuma dependência do entity Framework e nem conhece nada relacionado com banco de dados:
{% highlight csharp %}

public class Produto{    

public virtual int Id { get;
    set;
    }
    
public virtual string Nome { get;
    set;
    }
    
public virtual decimal ValorSugerido { get;
    set;
    }
    
private IList<loja> lojasOndeVende = new List<loja>();
    
public virtual IList<loja> LojasOndeVende    {        get        {
return this.lojasOndeVende;
    }
        set        {            this.lojasOndeVende = value;
    }
    }
}
</loja></loja></loja>
{% endhighlight %}
Abaixo temos a classe Loja:
{% highlight csharp %}

public class Loja{    

public virtual int Id { get;
    set;
    }
    
public virtual string Nome { get;
    set;
    }
    
public virtual string Cidade { get;
    set;
    }
    
private IList<produto> produtosQueVende = new List<produto>();
    
public virtual IList<produto> ProdutosQueVende    {        get        {
return this.produtosQueVende;
    }
        set        {            this.produtosQueVende = value;
    }
    }
}
}
</produto></produto></produto>
{% endhighlight %}
E aqui temos nossa classe de contexto do Entity Framework, que também criamos, de forma bastante simples:
{% highlight csharp %}

public class EF4Context : ObjectContext{    

public EF4Context()        : base("name=ModeloManyToManyContainer", "ModeloManyToManyContainer") { }
    
private IObjectSet<produto> produtos;
    
public IObjectSet<produto> Produtos    {        get        {
if(produtos == null)                produtos = CreateObjectSet<produto>();
return produtos;
    }
    }
    
private IObjectSet<loja> lojas;
    
public IObjectSet<loja> Lojas    {        get        {
if(lojas == null)                lojas = CreateObjectSet<loja>();
return lojas;
    }
    }
}
</loja></loja></loja></produto></produto></produto>
{% endhighlight %}
E isto é tudo que precisamos. Já podemos trabalhar com nossas entidades de forma a terem a relação Many-to-Many feita e funcionando.Criei uma aplicação console para demonstrar isso. O método abaixo faz algumas inserções no banco, e o resultado da consulta pode ser visto na imagem a seguir:
{% highlight csharp %}

private 
static void InserirNovosProdutosELojas(){
var contexto = new EF4Context();
var produto = new Produto();
    produto.Nome = "Produto de Soja";
    produto.ValorSugerido = 10;
var produto2 = new Produto();
    produto2.Nome = "Produto de tofu";
    produto2.ValorSugerido = 10;
var loja = new Loja();
    loja.Nome = "Loja do Vinicius";
    loja.Cidade = "São Paulo";
    loja.ProdutosQueVende.Add(produto);
var loja2 = new Loja();
    loja2.Nome = "Loja Vegetariana";
    loja2.Cidade = "São Paulo";
    loja2.ProdutosQueVende.Add(produto);
    loja2.ProdutosQueVende.Add(produto2);
    contexto.AddObject("Produtos", produto);
    contexto.AddObject("Produtos", produto2);
    contexto.AddObject("Lojas", loja);
    contexto.AddObject("Lojas", loja2);
    contexto.SaveChanges();
    Console.ReadKey();
    }

{% endhighlight %}
Reparem que apenas adicionamos os produtos nas lojas, e não precisamos adicionar as lojas aos produtos também. O Entity Framework é esperto para fazer essa associação.Aqui podemos ver uma saída gráfica das nossas relações:[caption id="attachment_649" align="aligncenter" width="300" caption="Resultado da relação Many-to-Many"][![Resultado da relação Many-to-Many](http://viniciusquaiato.com/images_posts/Resultado-300x151.jpg "Resultado da relação Many-to-Many")](http://viniciusquaiato.com/images_posts/Resultado.jpg)[/caption]Bom pessoal, éisso aê. A relação Many-to-Many com POCOs no Entity Framework 4.0 é bastante simples e natural. Não requer passos adicionais e nem complicados.Qualquer dúvida, crítica ou sugestão, deixem seus comentários ou podem escrever email.

Att,
Vinicius Quaiato.
