--- 
layout: post
title: Entity Framework 4 - Model First com POCOs
wordpress_id: 254
wordpress_url: http://viniciusquaiato.com/blog/?p=254
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
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
---


Fala galera, de buenas? Resolvi escrever um pouco sobre o [Entity Framework 4.0](http://msdn.microsoft.com/en-us/library/bb399572%28VS.100%29.aspx) (na verdade é a versão 2 do EF mas para acompanhar o .NET 4.0 ele será chamado assim também).Hoje vou mostrar uma característica bem interessante, que é o model first trabalhando com POCOs. Model First diz respeito a primeiro criar suas entidades, ou seja, suas classes, e somente depois modelar o banco de dados - e é isto que queremos fazer quando desenvolvemos aplicações usando Orientação a Objetos, não é?[POCOs](http://en.wikipedia.org/wiki/Plain_Old_CLR_Object) são classes simples, que não herdam nem implementam nenhuma outra classes/interface específica de frameworks, dizendo respeito exclusivamente ao nosso domínio e contendo apenas o necessário ao nosso domínio.Para começar vamos criar um projeto de testes e adicionar um arquivo .edmx como mostra a figura abaixo:[[Criando o arquivo edmx](http://viniciusquaiato.com/images_posts/Criando-o-arquivo-edmx-300x190.jpg "Criando o arquivo edmx")](http://viniciusquaiato.com/images_posts/Criando-o-arquivo-edmx.jpg)



Feito isso vamos selecionar o tipo de modelo _**"empty model"**_:[[Selecionando o empty model](http://viniciusquaiato.com/images_posts/Selecionando-o-empty-model-300x266.jpg "Selecionando o empty model")](http://viniciusquaiato.com/images_posts/Selecionando-o-empty-model.jpg)



Pronto!Vamos então adicionar duas entidades ao nosso design surface. Estas serão nossas entidades POCO, ou seja, não terão nenhuma dependência do Entity Framework, nem do Linq, nem de nada, é apenas o nosso modelo de classes, vamos ainda desabilitar a geração de código do Visual Studio, para que ele não "polua" as classes:[[edmx com 2 entidades](http://viniciusquaiato.com/images_posts/edmx-com-2-entidades-300x181.jpg "edmx com 2 entidades")](http://viniciusquaiato.com/images_posts/edmx-com-2-entidades.jpg)



E então clicamos na parte branca do design e abrimos a janela de propriedades para desabilitar a geração de código:[[desabilitando geração de código no EF 4.0](http://viniciusquaiato.com/images_posts/desabilitando-geracao-de-codigo-no-EF4-300x157.jpg "desabilitando geração de código no EF4")](http://viniciusquaiato.com/images_posts/desabilitando-geracao-de-codigo-no-EF4.jpg)

Estamos a meio caminho andado. Pode parecer muito trabalho a ser feito, mas isso não leva mais do que 2 minutos. É realmente simples e os resultados são muito bons.Agora vamos para a parte bacana, codificar nossas classes.Vamos iniciar codificando as classes Pedido e ItemPedido, que são classes realmente bastante simples:
{% highlight csharp %}

public class Pedido{    

public virtual int Id { get;
    set;
    }
    
private IList<itempedido> itens = new List<itempedido>();
    
public virtual IList<itempedido> Itens    {        get {
return this.itens;
    }
        set { this.itens = value;
    }
    }
}


public class ItemPedido{    

public virtual int Id { get;
    set;
    }
    
public virtual string Produto { get;
    set;
    }
    
public virtual int Quantidade { get;
    set;
    }
    
public virtual Pedido Pedido { get;
    set;
    }
}
</itempedido></itempedido></itempedido>
{% endhighlight %}
Os virtuais que usamos nas nossas classes são para que o Entity Framework possa fazer o "tracking" dos nossos objetos. Internamente ele criará proxies para nossas classes. Em um primeiro momento basta colocarmos as propriedades como virtual e ele se encarregará de tudo, isso ainda ajudará no Lazy Loading.Agora, como desabilitamos a geração de código, precisamos também criar o nosso contexto do EF. Isso é bastante simples, e neste cenário nos obrigará a escrever apenas umas 10 linhas de código, como pode ser visto abaixo:
{% highlight csharp %}

public class EF4Context : ObjectContext{    

public EF4Context()        : base("name=EF4Container", "EF4Container") { }
    
private IObjectSet<pedido> pedidos;
    
public IObjectSet<pedido> Pedidos    {        get        {
if(pedidos == null)                pedidos = CreateObjectSet<pedido>();
return pedidos;
    }
    }
}


</pedido></pedido></pedido>
{% endhighlight %}
Feito isso nos resta apenas gerar o banco de dados. Como dissemos, geramos primeiro nossas classes, sem nos preocupar em como estes dados seriam armazenados, conseguimos focar puramente no nosso domínio e no nosso modelo, afinal estamos pensando em classes e objetos, e não em linhas/tuplas de banco, chaves, índices, etc.O Visual Studio irá gerar o código necessário para nosso banco de dados veja abaixo:[[gerar banco de dados usando o modelo do EF 4.0](http://viniciusquaiato.com/images_posts/gerar-banco-de-dados-usando-o-modelo-300x158.jpg "gerar banco de dados usando o modelo do EF4")](http://viniciusquaiato.com/images_posts/gerar-banco-de-dados-usando-o-modelo.jpg)



Agora é só executar o SQL gerado:[[executando SQL gerado pelo EF 4.0](http://viniciusquaiato.com/images_posts/executando-SQL-gerado-300x180.jpg "executando SQL gerado pelo EF4")](http://viniciusquaiato.com/images_posts/executando-SQL-gerado.jpg)

Se vocês fizeram tudo certinho até o momento, devem ser capazes de executar os seguintes códigos de testes com sucesso:
{% highlight csharp %}
[TestMethod]
public void Deve_Adicionar_Um_Pedido_No_DB_Usando_Contexto_E_Poco(){
var contexto = new EF4Context();
var pedido = new Pedido();
    pedido.Itens.Add(new ItemPedido    {        Produto = "Novo Produto",        Quantidade = 5,        Pedido = pedido    }
);
    contexto.AddObject("PedidoSet", pedido);
    contexto.SaveChanges();
    }

{% endhighlight %}
Depois este:
{% highlight csharp %}
[TestMethod]
public void Deve_Obter_Todos_Os_Pedidos_Do_Banco_Usando_Contexto_E_Pocos(){
var contexto = new EF4Context();
var pedidos = contexto.Pedidos.ToList();
    Assert.IsTrue(pedidos.Count > 0);
    }

{% endhighlight %}
E por fim este:
{% highlight csharp %}
[TestMethod]
public void Deve_Selecionar_1_Pedido_Do_Banco_Usando_Contexto_E_Pocos(){
var contexto = new EF4Context();
    contexto.ContextOptions.LazyLoadingEnabled = true;
var pedido = contexto.Pedidos                            .Where(p => p.Id == 1).Single();
    Assert.AreEqual(1, pedido.Id);
    Assert.IsTrue(pedido.Itens.Count > 0);
    Assert.AreEqual("Novo Produto", pedido.Itens[0].Produto);
    }



{% endhighlight %}
Percebam como na _**linha 5**_ habilitamos o _lazy loading_ para que as propriedades sejam carregadas no momento em que forem chamadas apenas.E se fizermos uma consulta no banco de dados, veremos que de fato os dados estão lá:[[dados armazenados no banco pelo EF 4.0 usando Pocos](http://viniciusquaiato.com/images_posts/dados-armazenados-no-banco-pelo-EF4-usando-Pocos-300x180.jpg "dados armazenados no banco pelo EF 4.0 usando Pocos")](http://viniciusquaiato.com/images_posts/dados-armazenados-no-banco-pelo-EF4-usando-Pocos.jpg)

Bom pessoal, é isso.Esta é uma das funcionalidades presentes no Entity Framework 4.0. É claro que existe muita coisa a ser explorada ainda, e existem muitas coisas a serem feitas ainda, mas é um enorme avanço poder trabalhar com POCOs e utilizar os recursos de uma ferrmenta ORM como o EF. Poder dar "tchau" para os _SqlConnection_, _SqlCommand_, _ExecuteScalar_, etc, é algo realmente incrível.Espero que tenham gostado. Dúvidas, críticas e sugestões me enviem email ou comentários.

Abraços,
Vinicius Quaiato.
