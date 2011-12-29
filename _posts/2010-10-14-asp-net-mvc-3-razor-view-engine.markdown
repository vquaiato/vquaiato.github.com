--- 
layout: post
title: "ASP.NET MVC 3 \xE2\x80\x93 Razor View Engine"
wordpress_id: 1771
wordpress_url: http://viniciusquaiato.com/blog/?p=1771
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: Novidades
  slug: novidades
  autoslug: novidades
- title: Razor
  slug: razor
  autoslug: razor
- title: ASP.NET MVC 3
  slug: asp-net-mvc-3
  autoslug: asp.net-mvc-3
- title: ASP.NET MVC 3 Beta
  slug: asp-net-mvc-3-beta
  autoslug: asp.net-mvc-3-beta
- title: Razor View Engine
  slug: razor-view-engine
  autoslug: razor-view-engine
- title: Razor syntax
  slug: razor-syntax
  autoslug: razor-syntax
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/razor-150x150.jpg "razor")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/razor.jpg)Razor é o nome (espero que definitivo) para a nova View Engine disponível para as aplicações ASP.NET MVC. O Razor não está somente no ASP.NET MVC, mas também em aplicações desenvolvidas com WebMatrix como mostrei [aqui](http://viniciusquaiato.com/blog/webmatrix-o-que-e-por-que-usar/).### Qual objetivo do Razor?
A idéia principal é a simplicidade. A idéia é diminuir o ruído entre o código HTML e o código C# (ou VB) em nossas views. Os caracteres de controle causam muita poluição, e a necessidade de muita digitação.Hoje para exibir uma data por exemplo em uma view é necessário fazer algo como:<pre lang="xml">
<%= DateTime.Now %>
</pre>Com Razor faremos algo como:<pre lang="xml">
@DateTime.Now
</pre>Ao invés de 5 caracteres digitamos apenas 1. \o/Outro detalhe interessante mencionado pelo Scott Gu é o fato de que o símbolo de "%" está quase no meio do teclado, e não é muito simples para digitarmos, enquanto o símbolo "@" está bem ao alcance de nossos dedos do lado esquerdo do teclado.### Razor é uma nova linguagem?
Não! Razor não é uma nova linguagem. É apenas uma forma diferente de escrever nossas views. Razor utiliza tanto C# quanto VB, não é necessário aprender uma linguagem nova.### Razor é inteligente!
Razor realmente é muito podereso. Seu parser é muito inteligente, ele conhece C#, conhece VB, e é claro conhece HTML. Desta forma podemos escrever um código como este:<pre lang="xml"><div>            @foreach(var pessoa in Model){- @pessoa.Nome (@pessoa.Sexo) - @pessoa.Idade anos
}    </div></pre>E podemos ver que o resultado está correto:[caption id="attachment_1807" align="aligncenter" width="300" caption="Resultado do uso do Razor"][![Resultado do uso do Razor](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/syntax-result-300x116.png "Resultado do uso do Razor")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/syntax-result.png)[/caption]Ou seja: não há diferença no resultado final! O Razor se integra muito bem ao código HTML, você não fica com muito ruído no código.### Ok, mas como utilizo o Razor?
Uma das opções é trabalhando com o WebMatrix ([mostrei o WebMatrix aqui](http://viniciusquaiato.com/blog/webmatrix-o-que-e-por-que-usar/)), a outra é bem mais bacana: trabalhando com ASP.NET MVC 3 Beta ([veja como instalar aqui](http://viniciusquaiato.com/blog/asp-net-mvc-3/)).### Criando um projeto ASP.NET MVC 3 Beta para usar Razor
Vamos criar um novo projeto ASP.NET MVC 3:[caption id="attachment_1809" align="aligncenter" width="300" caption="Criando projeto ASP.NET MVC 3"][![Criando projeto ASP.NET MVC 3](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Criando-projeto-300x190.png "Criando projeto ASP.NET MVC 3")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Criando-projeto.png)[/caption]Feito isso, na versão Beta do MVC 3 veremos a seguinte tela:[caption id="attachment_1810" align="aligncenter" width="300" caption="Nova janela projeto ASP.NET MVC 3 beta"][![Nova janela projeto ASP.NET MVC 3 beta](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/nova-janela-projeto-asp-net-mvc-3-beta-300x268.png "Nova janela projeto ASP.NET MVC 3 beta")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/nova-janela-projeto-asp-net-mvc-3-beta.png)[/caption]Teoricamente esta janela deveria definir a View Engine padrão para o nosso projeto. No entanto quando formos adicionar uma nova View veremos que por padrão ainda vem "ASPX (C#)" (um bug provavelmente).#### Criando um controller
Vamos criar um controller bem simples, como pode ser visto abaixo:<pre lang="csharp">public class HomeController : Controller{    public ActionResult Index()    {        var viewModel = new SimpleViewModel                            {                                DataQualquer = DateTime.Now.AddDays(3),                                Nome = "Quaiato ASP.NET MVC Razor",                                ListaInteiros = new[] { 1, 1, 2, 3, 5, 8 }                            };        return View(viewModel);    }}</pre>Apenas criei uma classe com as propriedades acima, para servir como meu "view model" (veja mais sobre ViewModels aqui).Com o ASP.NET MVC 3 temos views com model dynamic, ou seja, o model type da nossa view é dynamic, e podemos passar qualquer objeto para ela, desde que seus membros existam, pois serão avaliados em runtime.#### Criando a view com Razor
Abaixo temos a view de exemplo:<pre lang="xml">@model dynamic<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><title>Index</title></head><body># Olá @Model.Nome
<div>
Você foi cadastrado em: @Model.DataQualquer.ToString("dd/MMM/yyyy")
Sua sequência fibonacci é:@foreach(var num in Model.ListaInteiros){<span>@num,</span>}</div></body></html></pre>O código da view é bastante simples. Reparem na **_linha 12_** que podemos formatar nossa data, assim como faríamos em um código C# mesmo. Este é o poder do Razor: simplicidade e flexibilidade, sem dores.E o resultado podemos conferir aqui:[caption id="attachment_1816" align="aligncenter" width="300" caption="Resultado da aplicacao ASP.NET MVC 3 com Razor"][![Resultado da aplicacao ASP.NET MVC 3 com Razor](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/resultado-da-aplicacao-MVC-3-com-Razor-300x171.png "Resultado da aplicacao ASP.NET MVC 3 com Razor")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/resultado-da-aplicacao-MVC-3-com-Razor.png)[/caption]### Conclusão
Com isso pudemos ver alguns princípios básicos do Razor. Em breve mostrarei mais funcionalidades, algumas coisas mais avançadas e interessantes.É nítido o ganho de produtividade que temos. Isso sem falar em como é bom nos sentirmos afastados do "asp 3". \o/Abraços galera, fiquem ligados.Vinicius Quaiato.
