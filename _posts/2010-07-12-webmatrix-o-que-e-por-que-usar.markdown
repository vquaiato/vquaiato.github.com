--- 
layout: post
title: "WebMatrix: O que \xC3\xA9? Por que e quando usar?"
wordpress_id: 1245
wordpress_url: http://viniciusquaiato.com/blog/?p=1245
categories: 
- title: ASP.NET
  slug: asp-net-dotnet
  autoslug: asp.net
tags: 
- title: Novidades
  slug: novidades
  autoslug: novidades
- title: ASP.NET
  slug: asp-net
  autoslug: asp.net
- title: WebMatrix
  slug: webmatrix
  autoslug: webmatrix
- title: Razor
  slug: razor
  autoslug: razor
---
[caption id="attachment_1270" align="alignleft" width="150" caption="WebMatrix"][![WebMatrix](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/splash-150x150.jpg "WebMatrix")](http://viniciusquaiato.com/blog/webmatrix-o-que-e-por-que-usar/splash-2/)[/caption]Semana passada foi anunciado o lançamento do [WebMatrix](http://www.asp.net/webmatrix). Um conjunto de ferramentas que simplificam a vida de quem deseja desenvolver alguns sites utilizando Windows.Atendendo a um pedido da Janynne Gomes([@devnetgomez](http://twitter.com/devnetgomez)) estou escrevendo este post para falar um pouco da ferramenta.O [WebMatrix](http://www.asp.net/webmatrix) integra uma série de ferramentas e componentes que visam facilitar e tornar o processo de desenvolvimento de deploy de um website bastante tranquilos.Para baixar o WebMatrix utilize este link [aqui](http://www.microsoft.com/web/webmatrix/).

### O que há no WebMatrix?
O [WebMatrix](http://www.microsoft.com/web/webmatrix/features/) vem com uma versão [Express do IIS(IIS Express)](http://weblogs.asp.net/scottgu/archive/2010/06/28/introducing-iis-express.aspx). Desta forma você não precisa instalar nem configurar um servidor web para criar seus sites com o WebMatrix.Ele também faz uso da versão[ Compact do SqlServer](http://weblogs.asp.net/scottgu/archive/2010/06/30/new-embedded-database-support-with-asp-net.aspx), que é uma versão embarcada. Mais uma vez, você não precisa instalar e nem configurar um servidor de banco de dados para começar a criar websites. Bastante simples.O WebMatrix faz uso do .Net framework, e você acaba desenvolvendo com C# ou VB e utilizando algo muito próximo do que será o [Razor](http://weblogs.asp.net/scottgu/archive/2010/07/02/introducing-razor.aspx), a nova View Engine para o Asp.NET MVC.

### Qual a finalidade do WebMatrix?
Não sei exatamente qual a proposta do WebMatrix. Ele nos permite desenvolver websites utilizando algumas ferramentas open sources já consolidades pela comunidade/mercado.Mas a uma primeira vista, e é muito cedo para dizer com certeza, eu me arrisco a palpitar de que esta é uma ferramenta que tornará simples a criação de websites simples. E quando eu falo de websites eu não estou falando de sistemas, mas sim de pequenos websites.Posso estar muito enganado, e no futuro o WebMatrix pode vir a mostrar um grande potencial e poder para a criação de sistemas (que são complexos por natureza). Mas a uma primeira vista, me arrisco a dizer isso mesmo.Chega de blá blá blá, e vamos ver um pequeno exemplo.

### Criando um simples Site bookmark com WebMatrix
Após instalar o WebMatrix abra o mesmo. Vamos selecionar a opção "Site From Folder" conforme a imagem abaixo:[caption id="attachment_1246" align="aligncenter" width="300" caption="WebMatrix - Criando site"][![WebMatrix - Criando site](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/Inicial-300x220.jpg "WebMatrix - Criando site")](http://viniciusquaiato.com/blog/webmatrix-o-que-e-por-que-usar/inicial-2/)[/caption]Com isso criaremos uma pasta e utilizaremos ela para guardar os arquivos de nosso site. Eu criei a pasta no desktop mesmo. Como estamos trabalhando com a versão Express do IIS, não há problemas com isso. Cool han?!Como podemos ver abaixo, está o "Workspace" do WebMatrix. Na parte de cima podemos ver as opções relacionadas com a execução do website. Na parte inferior da tela vemos as opções de acesso aos arquivos e banco de dados do nosso website.[caption id="attachment_1247" align="aligncenter" width="300" caption="WebMatrix - Área de Trabalho"][![WebMatrix - Área de Trabalho](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/Workspace-300x181.jpg "WebMatrix - Área de Trabalho")](http://viniciusquaiato.com/blog/webmatrix-o-que-e-por-que-usar/workspace/)[/caption]Selecionando a opção "Files" na parte inferior, vamos então adicionar 2 arquivos conforme mostra a figura abaixo:[caption id="attachment_1248" align="aligncenter" width="300" caption="WebMatrix - Adicionando arquivos "][![WebMatrix - Adicionando arquivos ](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/fILES-300x216.jpg "WebMatrix - Adicionando arquivos ")](http://viniciusquaiato.com/blog/webmatrix-o-que-e-por-que-usar/files/)[/caption]O código destes 2 arquivos é bastante simples, segue nas listagens abaixo:
{% highlight csharp %}
@{
var database = Database.OpenFile("Site.sdf");
    }
<!DOCTYPE html SYSTEM><html>    <head>        <title>Quaiato's WebMatrix Bookmarks</title>    </head>    <body>                    - <a href="@Href("/NovoBookmark")">Novo Bookmark
                

## Bookmarks
                @foreach(var row in database.Query("select * from bookmarks"))        {             -                 
                    [@row.Url](@row.Url)                    @row.Descricao                
            
        }
               </body></html>
{% endhighlight %}

{% highlight csharp %}
@{
var database = Database.OpenFile("Site.sdf");
var descricao = Request["descricao"];
var url = Request["bookmarkurl"];
    if(IsPost)    {        if(descricao.IsEmpty())        {            Validation.AddFieldError("Descricao", "Preencha a descrição do site.");
    }
            if(url.IsEmpty())        {            Validation.AddFieldError("Url","Preencha a url do site.");
    }
                if(Validation.Success) {
var insertQuery = "INSERT INTO Bookmarks (Descricao, Url) VALUES (@0, @1)";
    database.Execute(insertQuery, descricao, url);
    Response.Redirect(@Href("~/Bookmarks"));
    }
    }
}
<!DOCTYPE html SYSTEM><html>    <head>        <title>Quaiato's WebMatrix Bookmarks</title>    </head>    <body>        <div>            @Html.ValidationSummary("Erros no cadastro do Bookmark:")        </div>             <form method="post" action="">            <fieldset>                <legend>Novo Bookmark</legend>                <div>                    <label>Descrição:</label>                    <input name="descricao" type="text" size="50" value="@descricao" />                </div>                <div>                    <label>Url:</label>                    <input name="bookmarkurl" type="text" size="50" value="@url" />                </div>                <div>                    <label>&nbsp;
    </label>                    <input type="submit" value="Adicionar Bookmark" />                </div>            </fieldset>        </form>    </body></html>
{% endhighlight %}
O código é bastante simples, não vou entrar em muitos detalhes, você pode conferir aqui mais informações sobre a sintaxe e as funcionalidades: [http://www.asp.net/webmatrix/tutorials/2-introduction-to-asp-net-web-programming-using-the-razor-syntax](http://www.asp.net/webmatrix/tutorials/2-introduction-to-asp-net-web-programming-using-the-razor-syntax)Agora vamos criar o banco de dados:[caption id="attachment_1259" align="aligncenter" width="300" caption="WebMatrix - Criando um banco de dados"][![WebMatrix - Criando um banco de dados](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/database-300x216.jpg "WebMatrix - Criando um banco de dados")](http://viniciusquaiato.com/blog/webmatrix-o-que-e-por-que-usar/database/)[/caption]Na guia "Tables" Selecione "New Table" como mostra a imagem abaixo:[caption id="attachment_1260" align="aligncenter" width="300" caption="WebMatrix - criando tabela banco de dados"][![WebMatrix - criando tabela banco de dados](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/new_table-300x216.jpg "WebMatrix - criando tabela banco de dados")](http://viniciusquaiato.com/blog/webmatrix-o-que-e-por-que-usar/new_table/)[/caption]Então defina duas colunas para a tabela, como mostra a imagem abaixo:[caption id="attachment_1261" align="aligncenter" width="300" caption="WebMatrix - definindo colunas da tabela"][![WebMatrix - definindo colunas da tabela](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/table_definition-300x216.jpg "WebMatrix - definindo colunas da tabela")](http://viniciusquaiato.com/blog/webmatrix-o-que-e-por-que-usar/table_definition/)[/caption]Feito isso, e com o código que já havíamos criado, já podemos executar nosso website, veja abaixo o resultado (não utilizei CSS para deixar as coisas mais atraentes ¬¬ ):[caption id="attachment_1264" align="aligncenter" width="300" caption="WebMatrix - rodando web site"][![WebMatrix - rodando web site](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/Rodando_Site-300x230.jpg "WebMatrix - rodando web site")](http://viniciusquaiato.com/blog/webmatrix-o-que-e-por-que-usar/rodando_site/)[/caption][caption id="attachment_1265" align="aligncenter" width="300" caption="WebMatrix - novo bookmark"][![WebMatrix - novo bookmark](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/Novo_Bookmark-300x230.jpg "WebMatrix - novo bookmark")](http://viniciusquaiato.com/blog/webmatrix-o-que-e-por-que-usar/novo_bookmark/)[/caption]É isso galera. Espero que tenha conseguido passar como funciona e dado uma idéia inicial de quando utilizar.Vamos ver no que vai dar o WebMatrix, é uma ferramenta interessante. Ainda há muito o que melhorar. Sofri várias lentidões na máquina, alguns "travamentos", e às vezes algumas funcionalidades pararam de executar (ctrl+z, ctrl+s, etc).Senti falta de um ctrl+k,m para formatar o código, mas tudo bem, isso não faz da ferramenta algo ruim. Se você já testou, deixe seu feedback.

Abraços,
Vinicius Quaiato.
