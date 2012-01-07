--- 
layout: post
title: "ASP.NET MVC 3 RC 2 mudan\xC3\xA7as!"
wordpress_id: 2563
wordpress_url: http://viniciusquaiato.com/blog/?p=2563
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: ASP.NET MVC 3
  slug: asp-net-mvc-3
  autoslug: asp.net-mvc-3
- title: ASP.NET MVC 3 RC 2
  slug: asp-net-mvc-3-rc-2
  autoslug: asp.net-mvc-3-rc-2
- title: MVC 3 RC 2
  slug: mvc-3-rc-2
  autoslug: mvc-3-rc-2
- title: Novidades ASP.NET MVC 3 RC 2
  slug: novidades-asp-net-mvc-3-rc-2
  autoslug: novidades-asp.net-mvc-3-rc-2
- title: "mudan\xC3\xA7as MVC 3 RC 2"
  slug: mudancas-mvc-3-rc-2
  autoslug: "mudan\xC3\xA7as-mvc-3-rc-2"
---
Fala galera, o time do [ASP.NET MVC](http://asp.net/mvc/mvc3) não dá tempo nem de nos acostumarmos com as novidades e já saem mais novidades.Neste post vou tentar resumir um pouco as mudanças no [RC 2 do ASP.NET MVC 3](http://viniciusquaiato.com/blog/instalando-asp-net-mvc-3-rc-2/). Vou apenas listar as mudanças, e as novidades virão em outro post.

### Jquery
Agora os projetos ASP.NET MVC estão com a versão mais recente do [Jquery](http://jquery.com)(1.4.4) e do Jquery.Validation(1.7).A novidade é que foi adicionado ao projeto o [Jquery.UI](http://jqueryui.com/), que é uma biblioteca oficial do Jquery para tratar especificamente de User Interface: animações, efeitos, controles, etc. A versão adicionada é a 1.8.6.

### Propriedades ViewModel e View
Uma das novidades do [ASP.NET MVC 3](http://viniciusquaiato.com/blog/asp-net-mvc-3/) foi a abstração do acesso ao ViewData através de propriedades dinâmicas nos controllers e na view. No controller havia uma propriedade chamada **<del datetime="2010-12-23T14:50:25+00:00">ViewModel</del>** e na view uma propriedade chamada **<del datetime="2010-12-23T14:50:25+00:00">View</del>**. Agora ambas as propriedades foram renomeadas para **ViewBag**. Então se você estava usando o ASP.NET MVC 3 precisará arrumar estas propriedades. 

### Controller Session State
Outra novidade no [ASP.NET MVC 3](http://viniciusquaiato.com/blog/asp-net-mvc-3-rc-sessionless-controllers/) é a possibilidade de gerenciar a forma como o [controller acessa o session state](http://viniciusquaiato.com/blog/asp-net-mvc-3-rc-sessionless-controllers/), através do astributo **<del datetime="2010-12-23T14:50:25+00:00">ControllerSessionStateAttribute</del>**. Agora no RC 2 este atributo foi renomeado para **SessionStateAttribute**.

### RemoteAttribute
Na classe RemoteAttribute a propriedade **<del datetime="2010-12-23T14:50:25+00:00">Fields</del>** foi renomeada para **AdditionalFields**.

### SkipRequestValidation
O atributo **<del datetime="2010-12-23T14:50:25+00:00">SkipRequestValidationAttribute</del>** foi também renomeado para melhorar o entendimento sobre seu propósito. Agora ele se chama **AllowHtmlAttribute**.

### Html.ValidationMessage
Uma mellhoria no ValidationMessage faz com que agora seja retornada a primeira mensagem de erro utilizável. Se houver mensagem de erro proveniente de exceptions elas não serão exibidas e caso sejam as únicas, então uma mensagem padrão é mostrada, evitando exibir exceptions ao usuário da aplicação.

### LabelFor
Agora o helper Html.LabelFor aponta para o id de um elemento e não para o seu name. Isto está de acordo com a W3C.É isso galera, esse é um resumo das alterações que estão contempladas na versão RC 2 do ASP.NET MVC 3. Em um próximo post eu comentarei sobre as features adicionadas.Muitas das novidades do ASP.NET MVC 3 você pode conferir aqui: [http://viniciusquaiato.com/blog/asp-net-mvc-3/](http://viniciusquaiato.com/blog/asp-net-mvc-3/)E à partir de janeiro em uma série de 3 artigos para a revista .NET Magazine também.

Abraços,
Vinicius Quaiato.
