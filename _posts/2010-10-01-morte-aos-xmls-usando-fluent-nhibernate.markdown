---
layout: post
title: "Morte aos XMLs: usando Fluent NHibernate"
keywords:
- Fluent NHibernate
- XML
- Mapeamento
- Objeto Relacional
- ORM
tags:
- title: NHibernate
  slug: nhibernate
---
[<img src="http://viniciusquaiato.com/images_posts/lago_com_cachoeira_25_facil-150x150.jpg" style="float:left; margin-right: 10px; margin-bottom:10px;" />](http://viniciusquaiato.com/images_posts/lago_com_cachoeira_25_facil.jpg)

Pois é, algumas coisas incomodam a vida de um desenvolvedor. Dentre elas podemos destacar XMLs de configuração.Não sei exatamente a razão de não gostarmos muito deles, mas fato é que quase ninguém gosta. Como alguns de vocês devem saber o [NHibernate](http://nhforge.org/Default.aspx) é uma das ferramentas mais poderosas no que se diz respeito a ORM na plataforma .NET.

Além de podermos configurá-lo utilizando os <del>cruéis</del> costumeiros arquivos XML, existe uma forma de fazer isso via código, com uma sintaxe mais próxima da que costumamos trabalhar diariamente: [Fluent NHibernate](http://fluentnhibernate.org/).

<div style="clear:both;"></div>

### Fluent NHibernate
Este não é um post que vai te ensinar a usar o [NHibernate](http://nhforge.org/Default.aspx). Este é um post que vai te ensinar, um pouco, a usar as configurações fluentes do NHibernate. A idéia é mostrar como configurar a conexão com a base de dados e um pouco de como mapear suas entidades e associações entre elas de uma forma mais simples e verificável utilizando o Fluent NH.

### Baixando o Fluent NHibernate
Dentro da página oficial do [Fluent NHibernate](http://fluentnhibernate.org/) temos uma seção de [Downloads](http://fluentnhibernate.org/downloads): Let's go!O download do Fluent NHibernate nos trará uma pasta com uma série de dlls, que são as dlls do NHibernate e as dlls do Fluent NHibernate.

### Referenciando o NHibernate e o Fluent NHibernate no projeto
Vamos adicionar as seguintes dlls ao nosso projeto:

[<img src="/images_posts/referencias_fluent_nhibernate-300x229.png" class="post_img" />](http://viniciusquaiato.com/images_posts/referencias_fluent_nhibernate.png)

### Configurando a sessão do NHibernate com Fluent NHibernate
Agora precisamos configurar a sessão do NHibernate para se conectar ao nosso banco de dados. É claro, não farei isso usando XML e sim o Fluent NH, como mostra o código abaixo:
{% highlight csharp linenos %}
public static ISession ObterSessao(){
  var session = Fluently.Configure()
                        .Database(MsSqlConfiguration
                        .MsSql2008
                        .ConnectionString(c => c.FromConnectionStringWithKey("ConexaoBanco")))
                        .Mappings(m => m.FluentMappings.AddFromAssembly(Assembly.GetExecutingAssembly()))
                        .BuildSessionFactory()
                        .OpenSession();
  return session;
}
{% endhighlight %}

O código por si só fica explicado, não é mesmo? Na **_linha 2_** iniciamos nossa configuração.
Na **_linha 3_** começamos a configurar o banco de dados, e dizemos que é um banco de dados MS SqlServer.
na **_linha 5_**.

Na **_linha 5_** informo a connection string que está no app.config/web.config e o nome é "ConexaoBanco". Na **_linha 6_** informamos onde estão nossos mapeamentos (este item está mais explicado abaixo). Neste caso dizemos o seguinte: *"Nossos mapeamento estão neste assembly!"*. Isto fará com que essa nossa configuração procure no assembly sendo executado pelo nosso código de mapeamento de entidades.

Nas **_linhas 7 e 8_** pedimos para que uma sessão seja criada à partir da nossa configuração. Bastante simples não?!

### Mapeando as entidades e suas associações
Imaginando que meu sistema faz vendas vou utilizar as seguintes entidades:
{% highlight csharp linenos %}
public class Venda{
  public virtual int Id { get; set; }
  public virtual IList<linhavenda> Linhas { get; set; }
}

public class LinhaVenda{
  public virtual int Id { get; set; }
  public virtual string Produto { get; set; }
  public virtual Venda Venda { get; set; }
  public virtual decimal Preco { get; set; }
  public virtual int Quantidade { get; set; }
}
{% endhighlight %}

Bastante simples, nada que precise ser comentado. Agora o mapeamento feito com Fluent NHibernate utiliza uma classe que herda de [ClassMap&lt;T&gt;](http://wiki.fluentnhibernate.org/Fluent_mapping#ClassMap). Para cada classe que queremos mapear, precisamos criar uma classe que herda de ClassMap, veja abaixo o mapeamento para nossas 3 entidades:
{% highlight csharp linenos %}
public class VendaMap : ClassMap<Venda>{
  public VendaMap()    {
    Id(v => v.Id);
    HasMany(v => v.Linhas).Cascade.All();
  }
}

public class LinhaVendaMap : ClassMap<LinhaVenda>{
  public LinhaVendaMap()    {
    Id(l => l.Id);
    References(l => l.Venda);
    Map(l => l.Produto);
    Map(l => l.Preco);
    Map(l => l.Quantidade);
  }
}
{% endhighlight %}

O código de mapeamento fluente praticamente nos diz exatamente o que ele faz, mas vamos ajudar um pouco.

Dentro do construtor de cada classe, colocamos o código de mapeamento. Na **_linha 3_** podemos ver que definimos que o id da nossa entidade vendas no banco deve ser mapeado para a propriedade Id do objeto Venda. Na **_linha 4_** dizemos que nossa Venda possui uma relação "One to Many" com *LinhaVenda*. Ou seja, uma venda possui muitas linhas de venda. Cascade All diz respeito a "cascatear" os eventos nas entidades da coleção, algo como quando salvar a Venda também salvar as linhas de venda.

No mapeamento da linha de venda temos algumas coisas a notar também. O mapeamento do id é igual ao da classe Venda. Na **_linha 11_** podemos notar que mapeamento a propriedade *Venda* utilizando o método *References*. Isso cria uma relação do tipo "Many to One", ou seja, muitas linhas de venda para uma *Venda*. Isso é o que permitirá que o id de uma venda esteja presente em cada tupla da linha de venda no banco de dados.

Depois nas **_linhas 12, 13 e 14_** mapeamos as propriedades simples utilizando o método Map, que faz com que cada propriedade seja mapeada para uma coluna na tabela respectiva.

### Utilizando
Feito isso podemos executar nosso programa e brincar um pouco. Eu utilizei o seguinte código abaixo para criar uma venda com 3 linhas de venda:
{% highlight csharp linenos %}
static void Main(string[] args){
  var session = SessaoNHibernate.ObterSessao();
  var venda = new Venda();
  venda.Linhas = new List<linhavenda>();

  var linha = new LinhaVenda();
  linha.Preco = 102;
  linha.Quantidade = 4;
  linha.Produto = "Prod 1";
  linha.Venda = venda;
  venda.Linhas.Add(linha);

  var linha2 = new LinhaVenda();
  linha2.Preco = 1;
  linha2.Quantidade = 5;
  linha2.Produto = "prod 2!";
  linha2.Venda = venda;
  venda.Linhas.Add(linha2);

  var linha3 = new LinhaVenda();
  linha3.Preco = 333;
  linha3.Quantidade = 1;
  linha3.Produto = "prod 3";
  linha3.Venda = venda;
  venda.Linhas.Add(linha3);

  session.SaveOrUpdate(venda);
  session.Close();
}
{% endhighlight %}

Esse código criará uma *Venda*, e suas respectivas *LinhaVenda*, fará a inserção desses dados no banco, de forma bastante transparente.

### Gerando o script do Banco de Dados
Se você quiser que seus mapeamentos sejam transformados em script para o banco de dados e já executado contra o database, altere o código da listagem de configuração para este código abaixo:
{% highlight csharp linenos %}
public static ISession ObterSessao(){
  var session = Fluently.Configure()
                        .Database(MsSqlConfiguration
                        .MsSql2008
                        .ConnectionString(c => c.FromConnectionStringWithKey("conexaopadrao")))
                        .Mappings(m => m.FluentMappings.AddFromAssembly(Assembly.GetExecutingAssembly()))
                        .ExposeConfiguration(cfg => new SchemaExport(cfg)
                        .Create(true, true))
                        .BuildSessionFactory()
                        .OpenSession();
  return session;
}
{% endhighlight %}

Desta forma o código das **_linhas 7 e 8_** farão com que o script do banco seja gerado e executado.Não preciso mencionar que esse código NÃO deve ir para produção não é mesmo?!

### Finalizando
Bom galera, é basicamente isso. O NHibernate é muito mais poderoso e possui uma série de recursos, bem como o Fluent NHibernate também. A idéia deste post era fornecer, de uma maneira simples e direta, um guia de como começar a trabalhar com o Fluent.Qualquer dúvida ou sugestão, basta entrar em contato.Espero que aproveitem.

Att,

Vinicius Quaiato.
