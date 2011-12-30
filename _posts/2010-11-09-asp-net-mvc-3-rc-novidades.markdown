--- 
layout: post
title: ASP.NET MVC 3 RC Novidades
wordpress_id: 2095
wordpress_url: http://viniciusquaiato.com/blog/?p=2095
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: ASP.NET MVC 3
  slug: asp-net-mvc-3
  autoslug: asp.net-mvc-3
- title: ASP.NET MVC 3 RC
  slug: asp-net-mvc-3-rc
  autoslug: asp.net-mvc-3-rc
- title: MVC 3 RC
  slug: mvc-3-rc
  autoslug: mvc-3-rc
- title: ASP.NET MVC 3 Release Candidate
  slug: asp-net-mvc-3-release-candidate
  autoslug: asp.net-mvc-3-release-candidate
- title: Novidades ASP.NET MVC 3 RC
  slug: novidades-asp-net-mvc-3-rc
  autoslug: novidades-asp.net-mvc-3-rc
---
# Novidades no ASP.NET MVC 3 Release Candidate
Fala galera, este pequeno post visa elencar as novidades contidas na versão RC do ASP.NET MVC 3.Faça o [download do ASP.NET MVC 3 RC aqui](http://viniciusquaiato.com/blog/asp-net-mvc-3-rc-download/).

### Razor intellisense
Suporte para colorização e intellisense dos arquivos Razor. ficou show de bola!

### NuGet Package Manager
Conhecido como NuPack, o NuGet é o gerenciados de pacotes que a Microsoft está liberando juntamente com o ASP.NET MVC 3, que já virá instalado nesta versão RC.

### Melhorias na caixa de "New Project"
Talvez alguma melhoria tenha sido feita nesta janela, mas ela já estava disponpivel na versão Beta do ASP.NET MVC 3.

### Sessionless Controllers
Esta feature é bastante interessante! Agora podemos configurar, com atributos, como um determinado controller utiliza o session state: somente leitura, sem session state, padrão ou habilitado/requerido.

### Novos atributos de validação
Finalmente lançado um atributo para comparação, por exemplo Senha e Confirmação de Senha.Também existe um atributo que permite ao JQuery chamar a validação server side configurada para o objeto.Output Cache para child actions, que são chamadas com Html.RenderAction ou Html.Action.

### Melhorias na janela de "Add View"
Agora os tipos são exibidos de acordo com o nome da classe não com o nome completo. melhorando a usabilidade.

### SkipRequestValidationAttribute
Com este atributo dizemos para o model binder pular a validação de request para um determinado atributo. O Antigo Exclude não existe mais.É isso aê galera, várias novidades, mas sem dúvida a maior delas é o suporte a colorização e intellisense do Razor View Engine._(todas as informações foram tiradas dos Release Notes do ASP.NET MVC 3 RC)_Abraços,Vinicius Quaiato.
