--- 
layout: post
title: MVC Scaffolding e relacionamentos no Model
wordpress_id: 3108
wordpress_url: http://viniciusquaiato.com/blog/?p=3108
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: MVC Scaffold
  slug: mvc-scaffold
  autoslug: mvc-scaffold
- title: MVC Scaffolding
  slug: mvc-scaffolding
  autoslug: mvc-scaffolding
- title: MVC Scaffolding relacionamentos
  slug: mvc-scaffolding-relacionamentos
  autoslug: mvc-scaffolding-relacionamentos
---
[![neurônios](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/neurônios-150x150.jpg "neurônios")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/neurônios.jpg)Mostrei como utilizar o [MVC Scaffolding neste por aqui](http://viniciusquaiato.com/blog/mvc-scaffolding/). O MVC Scaffolding nos permite criar código para tarefas repetitivas e sem muito valor de negócio. Aquele código mais de infra e simples: controllers básicos, views, repositórios, etc. [Confira lá](http://viniciusquaiato.com/blog/mvc-scaffolding/) para entender um pouco mais.Desta vez vou mostrar um pouco como utilizar o MVC Scaffolding com relacionamentos entre classes do nosso model.

## Definindo uma relação simples
Vamos trabalhar com a idéia de Receita e Categorias. Abaixo temos a classe para representar nossas categorias:<pre lang="csharp">public class Categoria{    public string Nome { get; set; }    public int CategoriaId { get; set; }}</pre>Vamos criar uma classe para representar nossas receitas:<pre lang="csharp" line="1">public class Receita{    public string Nome { get; set; }    public int TempoPreparo { get; set; }    public int CategoriaId { get; set; }}</pre>Se as classes acima precisam de explicação: [http://bit.ly/hvQQ7f](http://bit.ly/hvQQ7f)Reparem na **_linha 5_**. Esta é a mágica de um relacionamento para o MVC Scafolding. Uma propriedade do tipo &lt;Model&gt;Id define uma relação. No exemplo acima uma receita possui uma relação com uma categoria.Vamos então executar o scaffolding:<pre lang="powershell">Scaffold Controller ReceitaScaffold Controller Categoria</pre>Isso irá criar nossos controllers, contextos do EF4 e views.[caption id="attachment_3113" align="aligncenter" width="177" caption="MVC Scaffolding relacionamento simples"][![MVC Scaffolding relacionamento simples](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/scaffolding-relacionamento-simples-177x300.png "MVC Scaffolding relacionamento simples")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/scaffolding-relacionamento-simples.png)[/caption]Agora podemos ver na view de criação de uma receita que o MVC Scaffolding já nos colocou um dropdown para selecionarmos a qual categoria esta receita pertence:[caption id="attachment_3114" align="aligncenter" width="282" caption="MVC Scaffolding view com relacionamento"][![MVC Scaffolding view com relacionamento](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/MVC-Scaffolding-view-282x300.png "MVC Scaffolding view com relacionamento")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/MVC-Scaffolding-view.png)[/caption]

## Exibindo as relações nas views de listagem
Para exibirmos as relações nas views de listagem(index) vamos modificar um pouco nosso model para conter informações além de simplesmente o id.Ficaremos com classes assim:<pre lang="csharp" line="1">public class Categoria{    public string Nome { get; set; }    public int CategoriaId { get; set; }    public virtual ICollection<receita> Receitas { get; set; }    public override string ToString()    {        return this.Nome;    }}</receita></pre>Vejam na **_linha 6_** podemos ver que temos uma coleção de receitas. Desta forma é possível saber quais as receitas estão presentes em uma categoria.O override do método ToString é apenas para facilitar as views.<pre lang="csharp" line="1">public class Receita{    public string Nome { get; set; }    public int TempoPreparo { get; set; }    public int ReceitaId { get; set; }    public int CategoriaId { get; set; }    public virtual Categoria Categoria { get; set; }}</pre>Aqui apenas uma alteração na **_linha 8_** onde criamos uma propriedade do tipo Receita.Vamos executar os comandos de scaffolding novamente, desta vez com o parâmetro -Force, para sobrescrever o código já usado antes:<pre lang="powershell">Scaffold Controller Receita -ForceScaffold Controller Categoria -Force</pre>Com isso temos como resultado:[caption id="attachment_3122" align="aligncenter" width="300" caption="MVC Scaffolding index views"][![MVC Scaffolding index views](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/MVc-Scaffolding-index-views-300x227.png "MVC Scaffolding index views")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/MVc-Scaffolding-index-views.png)[/caption][caption id="attachment_3123" align="aligncenter" width="300" caption="MVC Scaffolding index views 2"][![MVC Scaffolding index views 2](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/MVc-Scaffolding-index-views-2-300x227.png "MVC Scaffolding index views 2")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/MVc-Scaffolding-index-views-2.png)[/caption]

## Resumindo...
O MVC Scaffolding vai ajudar muito nestas atividades mais "braçais" e vale muito acompanhar e utilizar o projeto.O blog do Steve Sanderson possui muitas informações mais detalhadas sobre a ferramenta. [Confira aqui](http://blog.stevensanderson.com/2011/01/28/mvcscaffolding-one-to-many-relationships/).Abraços,Vinicius Quaiato.
