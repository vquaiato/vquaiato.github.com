--- 
layout: post
title: ASP.NET MVC e ajax com Jquery load
wordpress_id: 2374
wordpress_url: http://viniciusquaiato.com/blog/?p=2374
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: JQuery
  slug: jquery
  autoslug: jquery
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: Load
  slug: load
  autoslug: load
- title: ASP.NET MVC e Jquery
  slug: asp-net-mvc-e-jquery
  autoslug: asp.net-mvc-e-jquery
- title: Jquery load
  slug: jquery-load
  autoslug: jquery-load
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/Metallica_Load-150x150.jpg "Metallica - Load (por favor não me processem)")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/Metallica_Load.jpg)Já falamos sobre AJAX com ASP.NET MVC e Jquery aqui [usando Hijax com form submit](http://viniciusquaiato.com/blog/asp-net-mvc-submit-com-ou-sem-ajax/) e aqui [usando a função ajax](http://viniciusquaiato.com/blog/asp-net-mvc-jquery-ajax/).Agora vamos ver uma das formas mais simples de carregar dados do servidor em uma chamada ajax: a [função load](http://api.jquery.com/load/).

## A função load
Basicamente o que a função load do [Jquery](http://jquery.com) faz é uma requisição para dados no servidor e coloca o resultado(HTML) dentro de um elemento na página.Isto quer dizer que a action no nosso controller já vai retornar o HTML formatado. Isso é bem simples de ser feito, qualquer return View ou return PartialView fará esse trabalho.

### O exemplo
Vamos ver um exemplo para ficar mais claro: Nossa página deverá carregar em uma área específica os top 5 textos mais lidos do site, e em outra área os últimos 5 comentários realizados. Bastante simples.

### A view
A view é bastante simples neste exemplo. Temos inicialmente 2 divs para exibir nossas informações:<pre lang="xml"><!DOCTYPE html SYSTEM><html><head>    <title>Index</title></head><body>    <div>        # Página inicial
    </div>    

### Últimos posts
    <div class="box" id="ultimos_posts">    </div>    

### Últimos comments
    <div class="box" id="ultimos_comments">    </div></body></html></pre>Vamos então adicionar a referência para o Jquery e criar o código para chamar a function load adicionando o seguinte script:<pre lang="javascript" line="1"><script src="../../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script><script>    $(function () {        var url = "@Url.Action("Recent", "Posts")";        $("#ultimos_posts").load(url);    });</script></pre>Wow! É muito simples!Na **_linha 4_** estou definindo a url para a action que retorna os posts mais recents. Notem que eu não estou usando a url hardcoded, ao invés disso utilizo o helper Url.Acion do ASP.NET MVC. Faço isso pois caso o esquema de rotas mude eu não preciso sair caçando minhas urls na aplicação. É uma boa prática.Na **_linha 5_** chamamos a function load na div "ultimos_posts". Isso quer dizer que vamos fazer um request assíncrono para a url informada e o HTML resultante deste request será inserido na nossa div. É muito fácil!

### A action
Vamos agora espiar como está a action Recent no controller Posts:<pre lang="csharp" line="1">public ActionResult Recent(){    return PartialView("RecentPosts", new Posts().GetAll());}</pre>Nice! Código bastante enxuto e limpo. Estamos retornando uma Partial View e passando como model a listagem dos últimos posts vindas do repositório(em uma app real esse repositório seria injetado via DI ou obtido através de um SL).

### A partial view
 E para finalizar a tarefa temos a partial view que faz a renderização de uma listagem de posts. É um código muito simples, apliquei algum estilo CSS apenas para deixar menos feio:<pre lang="xml">@model IEnumerable<aspnetmvc_jquery_load.controllers.post>    @foreach (var post in Model)    {        -             <div class="recent">                <span class="item_title">@post.Title</span>                <span class="item_content">@post.Body.Substring(0, 25)...</span>            </div>        
    }</aspnetmvc_jquery_load.controllers.post></pre>O comportamento de ambas as actions é igual, então devemos ter nossa view mais ou menos assim:[caption id="attachment_2456" align="aligncenter" width="300" caption="asp.net mvc executando jquery load"][![asp.net mvc executando jquery load](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/asp.net-mvc-executando-jquery-load-300x226.png "asp.net mvc executando jquery load")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/asp.net-mvc-executando-jquery-load.png)[/caption]

## Exibindo imagem de progresso
Podemos facilmente colocar uma imagem de progresso dentro das nossas divs e deixar que o load mesmo se encarregue de remover o progresso.Batando para isso incluir dentro da nossa div uma imagem de progresso:[caption id="attachment_2457" align="aligncenter" width="222" caption="asp.net mvc executando jquery load exibindo progress"][![asp.net mvc executando jquery load exibindo progress](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/asp.net-mvc-executando-jquery-load-exibindo-progress-222x300.png "asp.net mvc executando jquery load exibindo progress")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/asp.net-mvc-executando-jquery-load-exibindo-progress.png)[/caption]

### Tratamento de erros
A function load também possui formas de tratar erros que ocorram no request. Para isso é preciso informar um callback recebendo alguns parâmetros.Vou deixar essa tarefa como lição de casa para vocês, mas na documentação da função load há exemplos de como fazer isso: [http://api.jquery.com/load/](http://api.jquery.com/load/).

## Resumo
Assim como vimos com o método ajax do Jquery e com o formulário utilizando Hijax é muito simples também fazer a carga direta de HTML do servidor e colocar dentro de um elemento em nossa página.É possível também passar seletores para a função load, onde você seleciona apenas parte do conteúdo HTML retornado, é bem interessante.Baixe ou visualize todo código aqui: [![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/icon-github2.png "icon-github")https://github.com/vquaiato/ASP.NET-MVC-Jquery-Load](https://github.com/vquaiato/ASP.NET-MVC-Jquery-Load)Abraços,Vinicius Quaiato.
