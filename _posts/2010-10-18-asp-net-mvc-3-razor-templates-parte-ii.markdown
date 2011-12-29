--- 
layout: post
title: "ASP.NET MVC 3 \xE2\x80\x93 Razor templates parte II"
wordpress_id: 1833
wordpress_url: http://viniciusquaiato.com/blog/?p=1833
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
- title: MVC 3
  slug: mvc-3
  autoslug: mvc-3
- title: Razor View Engine
  slug: razor-view-engine
  autoslug: razor-view-engine
- title: Razor syntax
  slug: razor-syntax
  autoslug: razor-syntax
- title: Razor section
  slug: razor-section
  autoslug: razor-section
- title: RenderSection
  slug: rendersection
  autoslug: rendersection
---
[Na primeira parte deste post](http://viniciusquaiato.com/blog/asp-net-mvc-3-razor-templates/) vimos como o [Razor](http://viniciusquaiato.com/blog/asp-net-mvc-3-razor-view-engine/) trabalha o conceito de MasterPages/Layout Pages, e o RenderBody, que é o método padrão para renderização do conteúdo customizado.Agora veremos como criar nossas proprias sections ou áreas dentro da nossas MasterPage utilizando o Razor.### Criando nossas próprias sections com Razor
a href="http://viniciusquaiato.com/blog/asp-net-mvc-3-razor-templates/">No post anterior nossa MasterPage tinha o seguinte conteúdo:<pre lang="xml"><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><title>@View.Title</title></head><body><div>@RenderBody()</div></body></html></pre>O único lugar que poderia variar e ter um código específico era no local da chamada @RenderBody. Agora criaremos nosas sections, vejamos um exemplo:<pre lang="xml"><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"><html xmlns="http://www.w3.org/1999/xhtml"><head><title>@View.Title</title></head><body>        <div>@RenderSection("Superior")</div><div>@RenderBody()</div>         @RenderSection("Gadget")</body></html></pre>Com isto estamos dizendo que nossas páginas possuirão um section chamada "Superior", que podemos imaginar como sendo uma área para menu, banners, algo do tipo. E também uma section chamada "Gadget" onde podemos definir um gadget qualquer no site.### Criando as sections na view com Razor
Agora basta que em nossa View criemos as duas sections, como mostra o exemplo abaixo:<pre lang="xml">@model dynamic@{View.Title = "Index";Layout = "~/Views/Shared/_LayoutPage1.cshtml";}@section Superior{
Esta é a section superior
}## Olá @Model.Nome
@section Gadget{<div style="width:200px;border:2px solid #ffcc00;">Este é um gadget qualquer</div>}</pre>Reparem que fazemos isso utilizando a sintaxe do Razor: @section NomeSection{/* conteúdo */}.É uma maneira bastante simples de trabalhar com as sections.Você deve estar se perguntando: "Ah ok. Bacana, mas eu sou obrigado a criar TODAS as sections?".### Trabalhando com sections opcionais no Razor
A resposta para a pergunta acima é: não! Você pode trabalhar com sections opcionais. Ou seja, a definição da sections nas views passa a ser opcional.Voltando ao nosso exemplo, a section Gadget é candidata a ser uma section opcional, vamos então alterar nossa MasterPage Razor:<pre lang="xml">@RenderSection("Gadget", required:false)</pre>Desta forma estamos sinalizando que a presença desta section não é obrigatória, ela pode ou não ser definida.(observação: no Preview 1 do MVC 3 o parâmetro era _optional:true_).Assim podemos definir a mesma apenas nas views que quisermos. Caso não coloquemos o required:false e deixemos de definir a section teremos um erro em runtime.### Em resumo
A definição das sections dentro de uma MasterPage no Razor é algo bastante simples, e implementar estas sections é algo trivial também.Com isso vimos mais uma vez o poder e a versatilidade da sintaxe Razor: o código fica simples e legível. Não há ruído.Em um próximo post veremos como definir MasterPages de forma automatizada para todas as views de um diretório utilizando o Razor.Abraços,Vinicius Quaiato.
