--- 
layout: post
title: "ASP.NET MVC AjaxOptions: UpdateTargetId"
wordpress_id: 3164
wordpress_url: http://viniciusquaiato.com/blog/?p=3164
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
---
Trabalhar com forms e ajax no ASP.NET MVC é algo relativamente bastante simples, seja escrevendo o código diretamente com [JQuery](http://viniciusquaiato.com/blog/tag/jquery/) ou então utilizando o [Ajax helper](http://msdn.microsoft.com/en-us/library/system.web.mvc.ajaxhelper.aspx).Estes posts sobre o AjaxHelper serão bem simples e diretos. Trabalharemos com [ASP.NET MVC 3](http://viniciusquaiato.com/blog/asp-net-mvc-3/).Vou assumir também que você já incluiu o JQuery e o JQuery Unobtrusive:
{% highlight csharp %}

{% endhighlight %}


## Criando o formulário na View
Nosso formulário será criado com a utilização do helper BeginForm:
{% highlight csharp %}
@using (Ajax.BeginForm("AjaxAction",    new AjaxOptions { UpdateTargetId = "div_nome" }
)){    @Html.TextBox("nome")<br />    @Html.TextBox("sobrenome")    <input type="submit" value="ajax" />}

{% endhighlight %}
Notem que criamos o form passando o nome da action e um objeto do tipo [AjaxOptions](http://msdn.microsoft.com/en-us/library/system.web.mvc.ajax.ajaxoptions.aspx). AjaxOptions possui uma série de propriedades, e neste caso estamos utilizando apenas [UpdateTargetId](http://msdn.microsoft.com/en-us/library/system.web.mvc.ajax.ajaxoptions.updatetargetid.aspx).Isto que dizer que o resultado da execução desta operação ajax deve ser colocado no elemento com id "div_nome".Nossa action AjaxAction está assim:
{% highlight csharp %}

public ActionResult AjaxAction(string nome, string sobrenome){
var ti = new CultureInfo("pt-BR").TextInfo;
var nomeFormatado = string.Format("{
}
 {
}
", ti.ToTitleCase(nome), ti.ToTitleCase(sobrenome));
return PartialView("PartialNomes", nomeFormatado);
    }



{% endhighlight %}
Não existe nenhum segredo nessa action. Ela recebe 2 parâmetros e tudo que faz é renderizar uma Partial View com os parâmetros em capital case.Como resultado teremos uma página com um form que será executado com ajax:[![ASP.NET MVC Ajax.BeginForm](http://viniciusquaiato.com/images_posts/Ajax-BeginForm-300x243.png "ASP.NET MVC Ajax.BeginForm")](http://viniciusquaiato.com/images_posts/Ajax-BeginForm.png)

É isso galera, essa é uma das maneiras de carregar dados do servidor em uma div específica utilizando o helper Ajax.BeginForm do ASP.NET MVC em conjunto com o JQuery.

### Código fonte
O fonte deste e outros exemplos estão no Github: [https://github.com/vquaiato/ajaxhelpersamples](https://github.com/vquaiato/ajaxhelpersamples)Abraços,Vinicius Quaiato.
