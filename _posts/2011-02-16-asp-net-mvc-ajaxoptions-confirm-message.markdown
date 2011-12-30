--- 
layout: post
title: "ASP.NET MVC AjaxOptions: Confirm message"
wordpress_id: 3179
wordpress_url: http://viniciusquaiato.com/blog/?p=3179
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: Ajax
  slug: ajax
  autoslug: ajax
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: BeginForm
  slug: beginform
  autoslug: beginform
- title: AjaxOptions
  slug: ajaxoptions
  autoslug: ajaxoptions
- title: Confirm
  slug: confirm
  autoslug: confirm
---
No [post anterior](http://viniciusquaiato.com/blog/asp-net-mvc-ajaxoptions-e-updatetargetid/) mostrei como criar uma chamada ajax para carregar um pedaço específico da página utilizando o Ajax Helper com o AjaxOptions UpdateTargetId.Agora vou mostrar como podemos, de maneira bastante simples, exibir uma mensagem solicitando a confirmação da requisição a ser realizada.Vamos aproveitar todo [o código anterior](http://viniciusquaiato.com/blog/asp-net-mvc-ajaxoptions-e-updatetargetid/) e apenas realizar uma modificação, como mostra o código abaixo:<pre lang="html4strict" line="1">@using (Ajax.BeginForm("AjaxAction",    new AjaxOptions { UpdateTargetId = "div_nome", Confirm = "Você está certo disso?" })){    @Html.TextBox("nome")<br />    @Html.TextBox("sobrenome")    <input type="submit" value="ajax" />}</pre>Reparem na **_linha 2_** que estamos passando o valor "Você está certo disso?" para a propriedade [Confirm](http://msdn.microsoft.com/en-us/library/system.web.mvc.ajax.ajaxoptions.confirm.aspx) do nosso objeto [AjaxOptions](http://msdn.microsoft.com/en-us/library/system.web.mvc.ajax.ajaxoptions.aspx). Esta propriedade, quando setada, configura a mensagem de confirmação a ser solicitada, como podemo ver abaixo:[caption id="attachment_3199" align="aligncenter" width="300" caption="ASP.NET MVC AjaxHelper Confirm Message"][![ASP.NET MVC AjaxHelper Confirm Message](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/Ajax-Helper-Confirm-Message-300x256.png "ASP.NET MVC AjaxHelper Confirm Message")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/Ajax-Helper-Confirm-Message.png)[/caption]Podemos ver que antes de confirmar a mensagem nenhuma requisição é realizada. Mas no momento em que confirmamos, então o request é feito:[caption id="attachment_3181" align="aligncenter" width="300" caption="Ajax Helper Confirm Message 2"][![Ajax Helper Confirm Message 2](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/Ajax-Helper-Confirm-Message-2-300x243.png "Ajax Helper Confirm Message 2")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/Ajax-Helper-Confirm-Message-2.png)[/caption]

### Código fonte
O fonte deste e outros exemplos estão no Github: [https://github.com/vquaiato/ajaxhelpersamples](https://github.com/vquaiato/ajaxhelpersamples)É isso aê galera.Abraços,Vinicius Quaiato.
