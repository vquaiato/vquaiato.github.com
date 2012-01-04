--- 
layout: post
title: ASP.NET MVC form submit com ou sem Ajax
wordpress_id: 2369
wordpress_url: http://viniciusquaiato.com/blog/?p=2369
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: JQuery
  slug: jquery
  autoslug: jquery
- title: Ajax
  slug: ajax
  autoslug: ajax
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: Hijax
  slug: hijax
  autoslug: hijax
- title: ASP.NET MVC Jquery
  slug: asp-net-mvc-jquery
  autoslug: asp.net-mvc-jquery
---
Fala galera, [neste por aqui](http://viniciusquaiato.com/blog/asp-net-mvc-jquery-submit-form-assincrono/) eu mostrei como fazer o submit assíncrono de um formulário no [ASP.NET MVC](http://asp.net/mvc) usando [Jquery](http://jquery.com).Agora quero mostrar "quase" a mesma coisa, mas deixando o formulário funcional tanto com como sem JavaScript: **Hijax!**

## O Hijax
[Hijax](http://domscripting.com/presentations/xtech2006/) é a idéia de acrescentar funcionalidades javascript/ajax para um página que já funciona semanticamente da forma tradicional fazendo posts para o servidor e causando refresh nas páginas.A idéia é melhorar e adicionar funcionalidades na página e não fazer com que ela só funcione com ajax.É um técnica não intrusiva, que permite tanto aos que possuem javascript habilitado quanto os que não possuem utilizar a aplicação da mesma maneira.

### O form html

{% highlight csharp %}
@using (Html.BeginForm("SubmitForm", "Home", FormMethod.Post, new { id = "login" }
)){    @Html.ValidationSummary(true)    <fieldset>        <legend>Fields</legend>        <div class="editor-label">            @Html.LabelFor(model => model.Usuario)        </div>        <div class="editor-field">            @Html.EditorFor(model => model.Usuario)        </div>        <div class="editor-label">            @Html.LabelFor(model => model.Senha)        </div>        <div class="editor-field">            @Html.EditorFor(model => model.Senha)        </div>        
                    
    </fieldset>}

{% endhighlight %}
Bastante simples né?!Reparem apenas que para colocar um id no form eu passei alguns parâmetros: Action, Controller, método(Get ou Post) e no final um objeto anônimo contendo a propriedade id, que é o id do elemento.

### O código jquery
Feito isso vamos criar o código JavaScript para dar o comportamento assíncrono:
{% highlight csharp %}
$(function () {    $("#login").submit(function (e) {        e.preventDefault();
    $.post($(this).attr("action"), $(this).serialize(), function (retorno) {            $("#login")[0].reset();
    alert(retorno.Resultado);
    }
);
    }
);
    }
);
    
{% endhighlight %}
Tudo que esse código faz é um post assíncrono para a action definida no form, passando seus campos como parâmetros.Na função de callback limpamos o form e exibimos um alerta com a reposta do servidor.Poderíamos fazer um monte de outras coisas, mas para não alongar muito o exemplo, apenas exibimos uma alert.

### A action MVC
A grande sacada da brincadeira está na action no nosso controller:
{% highlight csharp %}
[HttpPost]
public ActionResult SubmitForm(Login login){
if(Request.IsAjaxRequest())        return Json(new { Resultado = "Você está logado!" }
);
return RedirectToAction("Index");
    }

{% endhighlight %}
A action verifica se a requisição é uma requisição ajax utilizando o método IsAjaxRequest do objeto de Request.Caso seja uma requisição ajax o comportamento e o fluxo são diferentes de uma requisição comum. Neste caso apenas retornamos um Json com uma mensagem.Quando não é uma requisição ajax fazemos um redirecionamento para uma action. Desta forma nosso formulário funciona tanto quando o cliente possui javascript habilitado como quando não está.

### Com Javascript habilitado
[caption id="attachment_2406" align="aligncenter" width="300" caption="ASP.NET MVC form submit com jquery"][![ASP.NET MVC form submit com jquery](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/com-jquery-300x189.png "ASP.NET MVC form submit com jquery")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/com-jquery.png)[/caption]

### Sem Javascript habilitado
[caption id="attachment_2407" align="aligncenter" width="300" caption="ASP.NET MVC form submit sem jquery"][![ASP.NET MVC form submit sem jquery](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/sem-jquery-300x190.png "ASP.NET MVC form submit sem jquery")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/sem-jquery.png)[/caption]

### Quem não teria javascript habilitado?
Simples: muitos dispositivos mobile tem um péssimo suporte a javascript. E hoje é muito comum acessar a internet com browser limitado destes dispositivos.

Abraços,
Vinicius Quaiato.
