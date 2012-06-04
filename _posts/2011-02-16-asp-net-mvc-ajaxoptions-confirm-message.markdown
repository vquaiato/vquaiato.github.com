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
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
---
No [post anterior](http://viniciusquaiato.com/blog/asp-net-mvc-ajaxoptions-e-updatetargetid/) mostrei como criar uma chamada ajax para carregar um pedaço específico da página utilizando o Ajax Helper com o AjaxOptions UpdateTargetId.

Agora vou mostrar como podemos, de maneira bastante simples, exibir uma mensagem solicitando a confirmação da requisição a ser realizada.

Vamos aproveitar todo [o código anterior](http://viniciusquaiato.com/blog/asp-net-mvc-ajaxoptions-e-updatetargetid/) e apenas realizar uma modificação, como mostra o código abaixo:
{% highlight csharp linenos %}
@using (Ajax.BeginForm("AjaxAction",new AjaxOptions {
						UpdateTargetId = "div_nome",
						Confirm = "Você está certo disso?" })){
	@Html.TextBox("nome")<br />
	@Html.TextBox("sobrenome")
	<input type="submit" value="ajax" />
}
{% endhighlight %}

Reparem na **_linha 3_** que estamos passando o valor *"Você está certo disso?"* para a propriedade [Confirm](http://msdn.microsoft.com/en-us/library/system.web.mvc.ajax.ajaxoptions.confirm.aspx) do nosso objeto [AjaxOptions](http://msdn.microsoft.com/en-us/library/system.web.mvc.ajax.ajaxoptions.aspx).
Esta propriedade, quando setada, configura a mensagem de confirmação a ser solicitada, como podemo ver abaixo:

<img src="/images_posts/Ajax-Helper-Confirm-Message.png" class="post_img" title="ASP.NET MVC AjaxHelper Confirm Message" alt="ASP.NET MVC AjaxHelper Confirm Message" />

Podemos ver que antes de confirmar a mensagem nenhuma requisição é realizada. Mas no momento em que confirmamos, então o request é feito:

<img src="/images_posts/Ajax-Helper-Confirm-Message-2.png" class="post_img" title="ASP.NET MVC AjaxHelper Confirm Message request" alt="ASP.NET MVC AjaxHelper Confirm Message request" />


### Código fonte
O fonte deste e outros exemplos estão no Github: [https://github.com/vquaiato/ajaxhelpersamples](https://github.com/vquaiato/ajaxhelpersamples)

É isso aê galera.

Abraços,

Vinicius Quaiato.
