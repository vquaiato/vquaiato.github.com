--- 
layout: post
title: "ASP.NET MVC mudando estilos de mensagens de valida\xC3\xA7\xC3\xA3o"
wordpress_id: 2601
wordpress_url: http://viniciusquaiato.com/blog/?p=2601
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: Validation message
  slug: validation-message
  autoslug: validation-message
- title: validation styling
  slug: validation-styling
  autoslug: validation-styling
- title: Validation message style
  slug: validation-message-style
  autoslug: validation-message-style
- title: validation message css
  slug: validation-message-css
  autoslug: validation-message-css
---
Respondendo uma dúvida no gtalk hoje veio a idéia de escrever este post: como mudar os estilos que são usados para exibir as mensagens de erro pelo ASP.NET MVC?Bem a dúvida era sobre como formatar as mensagens de erros que são exibidas nos formulários. É simples. Se você fuçar no fonte do ASP.NET MVC verá esta classe: [http://aspnet.codeplex.com/SourceControl/changeset/view/61289#266468](http://aspnet.codeplex.com/SourceControl/changeset/view/61289#266468).Vejam que temos constantes para as classes(css) de erro a serem utilizadas:
{% highlight csharp %}

public 
static readonly string ValidationInputCssClassName = "input-validation-error";
    
public 
static readonly string ValidationMessageCssClassName = "field-validation-error";
    
public 
static readonly string ValidationSummaryCssClassName = "validation-summary-errors";
    
{% endhighlight %}
Pois bem, são estes os estilos que precisamos configurar para que nossas mensagens de validação sejam exibidas com alguma formatação.O ASP.NET MVC já cria estes estilos no arquivo /Content/site.css:[caption id="attachment_2603" align="aligncenter" width="300" caption="Site.css criado pelo Visual Studio"][![Site.css criado pelo Visual Studio](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/site_css-300x280.png "Site.css criado pelo Visual Studio")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/site_css.png)[/caption]Se referenciarmos o arquivo de estilos(Site.css) em nossas views teremos uma mensagem de validação assim:[caption id="attachment_2605" align="aligncenter" width="300" caption="error field com estilo padrão"][![error field com estilo padrão](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/error-field-300x241.png "error field com estilo padrão")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/error-field.png)[/caption]Vamos alterar o estilo para algo assim:
{% highlight csharp %}
.field-validation-error{    color: #000;
    font-size:16px;
    border:2px solid #000066;
    padding:3px;
    padding-left:20px;
    background-image: url('/images/error.gif');
    background-repeat: no-repeat;
    }
.input-validation-error{    border: 3px solid #660066;
    background-color: #ffeeee;
    }

{% endhighlight %}
Desta forma obteremos um resultado assim:[caption id="attachment_2615" align="aligncenter" width="300" caption="custom validation style"][![custom validation style](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/custom-validation-style1-300x167.png "custom validation style")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/custom-validation-style1.png)[/caption](notem que eu não sou bom com cores e estilos :P)É isso aê galera. Bastante simples.

Abraços,
Vinicius Quaiato.
