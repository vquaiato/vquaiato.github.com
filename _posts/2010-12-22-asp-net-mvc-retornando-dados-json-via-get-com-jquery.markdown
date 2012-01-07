--- 
layout: post
title: ASP.NET MVC retornando dados Json via Get com Jquery
wordpress_id: 2378
wordpress_url: http://viniciusquaiato.com/blog/?p=2378
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: JQuery
  slug: jquery
  autoslug: jquery
- title: ASP.NET MVC Json
  slug: asp-net-mvc-json
  autoslug: asp.net-mvc-json
- title: Jquery get
  slug: jquery-get
  autoslug: jquery-get
- title: get json
  slug: get-json
  autoslug: get-json
---
Se você não sabe o que é GET, POST, PUT, DELETE, entre outros dê um pulinho [aqui](http://www.w3.org/Protocols/rfc2616/rfc2616-sec9.html).Quando trabalhamos com Ajax em nossas aplicações (sejam MVC ou não) precisamos decidir sobre qual o método HTTP será utilizado: GET ou POST.Resumidamente se nossa requisição **não** vai modificar nada no servidor então realizamos uma requisição do tipo GET.Em ASP.NET MVC esta tarefa é bastante simples, principalmente quando utilizamos também o [Jquery](http://jquery.com)(já falei dele [aqui](http://viniciusquaiato.com/blog/asp-net-mvc-ajax-com-jquery-load/), [aqui](http://viniciusquaiato.com/blog/asp-net-mvc-jquery-ajax/) e [aqui](http://viniciusquaiato.com/blog/asp-net-mvc-submit-com-ou-sem-ajax/)).Existem alguns detalhes importantes que devem ser levados em consideração e abordaremos.

## Criando o controller
O controller que utilizaremos é bastante simples:
{% highlight csharp %}

public class HomeController : Controller{    

public ActionResult Index()    {
return View();
    }
    [HttpGet]    
public ActionResult DadosEmJson()    {        return Json(new {
ome = "Vinicius", Twitter = "@vquaiato"}
);
    }
}

{% endhighlight %}
Vejam que temos uma action, que só pode ser acessa via GET e que simplesmente retorna alguns dados em formato [Json](http://json.org/). Estamos retornando um anonymous object com as informações que queremos, bastante simples.

## A view
A view que consome nossa action via GET usando Jquery é bastante simples também e todo o segredo está aqui neste trecho de código javascript usando Jquery:
{% highlight csharp %}
$(function () {
var url = '@Url.Action("DadosEmJson","Home")';
    $.get(url, function(dados){        $("#nome").append(dados.Nome);
    $("#twitter").append(dados.Twitter);
    }
);
    }
);
    
{% endhighlight %}
Pronto! Estamos executando uma requisição GET para nossa action e obtendo dados em formato Json. Tudo isso é feito com a utilização da [função get do Jquery](http://api.jquery.com/jQuery.get/). Esta função nada mais é do que um atalho para a função ajax.

## O erro


Por razões de segurança não é possível retornar de forma automática dados Json em requisições GET.[![Ajax get retornando Json dá erro](http://viniciusquaiato.com/images_posts/This-request-has-been-blocked-because-sensitive-information-could-be-disclosed-t_2010-12-22_13-14-24-300x174.png "Ajax get retornando Json dá erro")](http://viniciusquaiato.com/images_posts/This-request-has-been-blocked-because-sensitive-information-could-be-disclosed-t_2010-12-22_13-14-24.png)



## Habilitando Json via GET
Para contornar esse problema basta permitir o retorno de dados Json em requisições do tipo GET. Fazemos isso alterando nossa action conforme abaixo:
{% highlight csharp %}
[HttpGet]
public ActionResult DadosEmJson(){    return Json(new {
ome = "Vinicius", Twitter = "@vquaiato"}
, JsonRequestBehavior.AllowGet);
    }



{% endhighlight %}
Pronto, agora tudo funciona![![json com jquery get](http://viniciusquaiato.com/images_posts/json-com-jquery-get-283x300.png "json com jquery get")](http://viniciusquaiato.com/images_posts/json-com-jquery-get.png)



## Cuidado: Json hijacking!
tudo está funcionando perfeitamente, o problema é que não é confiável e nem recomendável retornar dados Json via GET.Existe uma falha de segurança que pode ser explorada nesta situação: [Json Hijacking](http://haacked.com/archive/2009/06/25/json-hijacking.aspx).Estou mostrando como fazer, mas se possível evite esse tipo de uso para o Json.É possível retornar Json via POST normalmente e sem esses problemas todos.No geral esta é uma falha explorada quando se retornam coleções via Json. E ainda existe uma série de outros fatores que precisam ocorrer para que isso aconteça. Mas é bom não dar mole.Se você precisar mesmo retornar uma coleção via Json e precisar mesmo que ela seja retornada usando GET coloque seu conteúdo dentro de uma propriedade:
{% highlight csharp %}
[HttpGet]
public ActionResult DadosEmJsonPropriedade(){
var dados = new[] { "ASP.NET MVC", "ASP.NET MVC 3", "Jquery" }
;
    return Json(new { Dados = dados }
, JsonRequestBehavior.AllowGet);
    }

{% endhighlight %}
Vejam que colocamos nossa coleção dentro de uma propriedade Dados no objeto que será serializado para Json. Isso só não basta mas ajuda a previnir o Json Hijacking.

## Resumo
É preciso habilitar retorno de Json via GET na action. É preciso tomar cuidado com Json Hijacking. Se possível, evite retornar Json via GET.É isso aê galera, depois mostro como é "difícil" fazer o mesmo com POST.

Abraços,
Vinicius Quaiato.
