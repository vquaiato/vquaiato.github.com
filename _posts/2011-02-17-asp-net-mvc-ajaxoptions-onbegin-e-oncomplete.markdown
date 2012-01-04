--- 
layout: post
title: "ASP.NET MVC AjaxOptions: OnBegin e OnComplete"
wordpress_id: 3205
wordpress_url: http://viniciusquaiato.com/blog/?p=3205
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
- title: AjaxHelper
  slug: ajaxhelper
  autoslug: ajaxhelper
- title: OnBegin
  slug: onbegin
  autoslug: onbegin
- title: OnComplete
  slug: oncomplete
  autoslug: oncomplete
---
Dando continuidade aos exemplos de manipulação do [AjaxOptions com o AjaxHelper](http://viniciusquaiato.com/blog/tag/ajaxoptions/) do ASP.NET MVC vamos agora falar sobre os eventos [OnBegin](http://msdn.microsoft.com/en-us/library/system.web.mvc.ajax.ajaxoptions.onbegin.aspx) e [OnComplete](http://msdn.microsoft.com/en-us/library/system.web.mvc.ajax.ajaxoptions.oncomplete.aspx).Confira os demais posts aqui:- [UpdateTargetId](http://viniciusquaiato.com/blog/asp-net-mvc-ajaxoptions-updatetargetid/)
- [Confirm message](http://viniciusquaiato.com/blog/asp-net-mvc-ajaxoptions-confirm-message/)
- [LoadingElementId](http://viniciusquaiato.com/blog/asp-net-mvc-ajaxoptions-loadingelementid/)
Estas propriedades do objeto [AjaxOptions](http://msdn.microsoft.com/en-us/library/system.web.mvc.ajax.ajaxoptions.aspx) são configuradas com nomes de funções javascript que serão executadas uma no início da requisição, e a outra ao término da mesma.Vamos continuar utilizando o mesmo exemplo dos posts anteriores. Desta vez vamos fazer com que nossa página fique com um background azul no momento em que o request for iniciado, e volte para o normal ao término:
{% highlight c# %}
@using (Ajax.BeginForm(    "AjaxAction",    new AjaxOptions { UpdateTargetId = "div_nome", OnBegin = "init", OnComplete = "complete" }
)){    @Html.TextBox("nome")<br />    @Html.TextBox("sobrenome")    <input type="submit" value="ajax" />}

{% endhighlight %}
Nada de novo, apenas a configuração das duas propriedades OnBegin e OnComplete. As funções javascript a que elas se referem estão aqui:
{% highlight c# %}
function init() {    $("body").addClass("azul");
    }
function complete() {    $("body").removeClass("azul");
    }

{% endhighlight %}
Bastante simples hein?! Sem necessidade de maiores explicações.Bom o efeito pode ser visto abaixo:[caption id="attachment_3206" align="aligncenter" width="300" caption="ASP.NET MVC AjaxHelper OnBegin e OnComplete"][![ASP.NET MVC AjaxHelper OnBegin e OnComplete](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/Ajax-Helper-OnBegin-e-OnComplete-300x256.png "ASP.NET MVC AjaxHelper OnBegin e OnComplete")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/Ajax-Helper-OnBegin-e-OnComplete.png)[/caption]Quando a requisição é iniciada o fundo da página é mudado para azul, conforme a função javascript definida.Já ao término da requisição, tudo volta ao normal:[caption id="attachment_3207" align="aligncenter" width="300" caption="ASP.NET MVC AjaxHelper OnBegin e OnComplete completo"][![ASP.NET MVC AjaxHelper OnBegin e OnComplete completo](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/Ajax-Helper-OnBegin-e-OnComplete-2-300x256.png "ASP.NET MVC AjaxHelper OnBegin e OnComplete completo")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/Ajax-Helper-OnBegin-e-OnComplete-2.png)[/caption]É isso aê galera, mais simples que isso só usando updatepanel hein?! #NOT

### Código fonte
O fonte deste e outros exemplos estão no Github: [https://github.com/vquaiato/ajaxhelpersamples](https://github.com/vquaiato/ajaxhelpersamples)Abraços,Vinicius Quaiato.
