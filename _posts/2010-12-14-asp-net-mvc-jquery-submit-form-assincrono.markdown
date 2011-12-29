--- 
layout: post
title: "ASP.NET MVC + Jquery: submit form ass\xC3\xADncrono"
wordpress_id: 2311
wordpress_url: http://viniciusquaiato.com/blog/?p=2311
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
- title: MVC + Jquery
  slug: mvc-jquery
  autoslug: mvc-+-jquery
- title: "submit ass\xC3\xADncrono"
  slug: submit-assincrono
  autoslug: "submit-ass\xC3\xADncrono"
---
Esta semana tivesse a necessidade de realizar o submit em um form de maneira assíncrona: [Hijax](http://domscripting.com/presentations/xtech2006/).Com [ASP.NET MVC](http://asp.net/mvc) e [JQuery](http://jquery.com) esta éuma tarefa bastante trivial. Então sem enrolar, vamos ao form:<pre lang="xml"><div>    @using (Html.BeginForm("cadastrar", "home", FormMethod.Post, new { id = "cadastro" })) {                     <label for="Nome" style="display:block;">Nome</label>        @Html.TextBox("Nome")<br />                    <label for="Email" style="display:block;">Email</label>        @Html.TextBox("Email")<br />                    <input type="submit" name="enviar" value="enviar" />    }</div></pre>Eu preciso que este formulário seja postado para o servidor de forma assíncrona, em bizarrices no JavaScript (no projeto em que fiz isso este era um arquivo .html e não .cshtml).Para fazermos isso vamos utilizar jquery para submeter o formulário e serializar os dados a serem enviados, sem que precisemos ficar configurando tudo como parâmetros.O código JavaScript ficou mais ou menos assim:<pre lang="javascript" line="1">$(function () {    $('#cadastrar').submit(function (e) {        e.preventDefault();        $.post($(this).attr("action"), $(this).serialize(), function (retorno) {            if (retorno.Ok) {                alert("Ok!");            }        }, "json");    });});</pre>A mágica é que atachamos um evento submit ao formulário, **_linha 2_**. Na **_linha 3_** cancelamos o evento que normalmente seria disparado pelo input submit.Na **_linha 5_** tudo o que fazemos é uma requisição [post](http://api.jquery.com/jQuery.post/). Vejam como não utilizamos "magic strings" para os parâmetros da chamada post. Ao invés disso utilizamos os próprios valores já definidos no form: sua action, serializamos os campos como parâmetros da requisição.Pronto! Simples assim. Na action no servidor eu optei por trabalhar com o request mesmo:<pre lang="csharp">public ActionResult Cadastrar(){    var ok = true;    if (string.IsNullOrWhiteSpace(Request.Form["Nome"]))        ok = false;    if (string.IsNullOrWhiteSpace(Request.Form["Email"]))        ok = false;    return Json(new { Ok = ok });}</pre>Resultados:[![MVC + Jquery submit form assíncrono](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/submit-assincrono-mvc-jquery-300x189.png "MVC + Jquery submit form assíncrono")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/submit-assincrono-mvc-jquery.png)[![MVC + Jquery submit form assíncrono](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/submit-assincrono-mvc-jquery-erro-300x189.png "MVC + Jquery submit form assíncrono")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/submit-assincrono-mvc-jquery-erro.png)[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/Firebug-300x191.png "Firebug")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/Firebug.png)Em outro post mostrarei como fazer com que o formulário funcione com ou sem JavaScript.Abraços,Vinicius Quaiato.
