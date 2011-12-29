--- 
layout: post
title: "ASP.NET MVC servindo p\xC3\xA1ginas HTML"
wordpress_id: 2315
wordpress_url: http://viniciusquaiato.com/blog/?p=2315
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: "p\xC3\xA1ginas html"
  slug: paginas-html
  autoslug: "p\xC3\xA1ginas-html"
- title: MVC e html
  slug: mvc-e-html
  autoslug: mvc-e-html
---
Trabalhando em um projeto recente tive a necessidade de entregar um site estático. Sim, isso mesmo, um site estático. Html puro!O problema é que este site deveria ter alguns formulários de contato, um gadget de ações e um cadastro de email, além é claro de uma dezena de páginas HTML.As páginas foram criadas com HTML sem problemas. Então pensei em colocar estas páginas dentro de uma aplicação ASP.NET MVC para criar assim os serviços server side.Pensei em um primeiro momento em transformar todas as páginas em views e servir através de actions e controllers.Não havia sentido para isso!Estas páginas HTML nunca seriam mais do que HTML, não precisava fazer serví-las como views.A solução é que não foi necessária nenhuma solução, o ASP.NET MVC serve muito bem as páginas estáticas sem nenhum problema.Abraços,Vinicius Quaiato.
