--- 
layout: post
title: ASP.NET MVC no Mono
wordpress_id: 3323
wordpress_url: http://viniciusquaiato.com/blog/?p=3323
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: Mono
  slug: mono
  autoslug: mono
tags: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: Mono
  slug: mono
  autoslug: mono
- title: Mono Project
  slug: mono-project
  autoslug: mono-project
- title: MonoDevelop
  slug: monodevelop
  autoslug: monodevelop
- title: Mono Mac
  slug: mono-mac
  autoslug: mono-mac
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/Mono-Project.jpeg "Mono Project")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/Mono-Project.jpeg)Fala galera, faz algum tempo que estou sem postar e vou retomar falando um pouco do ASP.NET MVC rodando no [Mono](http://www.mono-project.com/Main_Page).Estou utilizando um Macbook e por isso vou começar a relatar algumas experiências com [Mono](http://www.mono-project.com/Main_Page).Não vou entrar em detalhes de implementação do Mono ou coisas do tipo. A princípio vou falar sobre como utilizar o Mono para criar projetos _quase_ como faria no Windows rodando o .NET.# Montando o ambiente
### Instalando Mono
Primeiramente o que precisamos fazer é instalar o Mono (eu estou usando um Mac lembrem-se). A [página de downloads](http://www.go-mono.com/mono-downloads/download.html) no site do [Projeto Mono](http://mono-project.com/Main_Page) possui versões para todos os ambientes suportados por ele:[http://www.go-mono.com/mono-downloads/download.html](http://www.go-mono.com/mono-downloads/download.html).### Instalando o MonoDevelop
O [MonoDevelop](http://monodevelop.com/) é a IDE que vamos utilizar para criar e trabalhar com nossos projetos. Faça o download do MonoDevelop para o seu ambiente(Windows, Linux, Mac, etc) na página de downloads do projeto: [http://monodevelop.com/Download](http://monodevelop.com/Download)Depois de terminar a instalação do Mono e do MonoDevelop vamos abrir a IDE.[caption id="attachment_3327" align="aligncenter" width="300" caption="MonoDevelop Mac"][![MonoDevelop Mac](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-01-at-9.53.50-PM-300x179.png "MonoDevelop Mac")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-01-at-9.53.50-PM.png)[/caption]# Criando o projeto ASP.NET MVC no Mono com MonoDevelop
Vamos então criar um novo projeto ASP.NET MVC .[caption id="attachment_3328" align="aligncenter" width="300" caption="Criando projecto ASP.NET MVC no Mono com MonoDevelop"][![Criando projecto ASP.NET MVC no Mono com MonoDevelop](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-01-at-9.54.46-PM-300x235.png "Criando projecto ASP.NET MVC no Mono com MonoDevelop")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-01-at-9.54.46-PM.png)[/caption]Depois de criado um projeto vazio vamos adicionar um controller. Notem que a versão suportada totalmente é o ASP.NET MVC 2 ([saiba aqui por que a versão 3 ainda não é totalmente suportada](http://www.mono-project.com/Release_Notes_Mono_2.10#ASP.NET_MVC3_Support)).Criarei um controller com duas actions. Uma recebendo uma mensagem que será exibida em uma view. E a outra recebendo o nome de uma view a ser exibida.[caption id="attachment_3336" align="aligncenter" width="300" caption="Criando controllers ASP.NET MVC no Mono com MonoDevelop"][![Criando controllers ASP.NET MVC no Mono com MonoDevelop](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-02-at-11.53.28-PM-300x179.png "Criando controllers ASP.NET MVC no Mono com MonoDevelop")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-02-at-11.53.28-PM.png)[/caption]
{% highlight csharp %}
public class HomeController : Controller{public ActionResult Say(string message){ViewData["message"] = message;return View("message");}public ActionResult Show(string view){return View(view);}}
{% endhighlight %}
As views não possuem nada além do normal. Vou apenas mostrar a view Message.aspx que acessa o ViewData:
{% highlight csharp %}
# Hello Mono, seu lindo!
## A Mensagem: <%= ViewData["message"].ToString() %> 
</div></body></html>
{% endhighlight %}
E adicionei as rotas no Global.asax também para trabalhar com nossos parâmetros:
{% highlight csharp %}
public class MvcApplication : System.Web.HttpApplication{public static void RegisterRoutes (RouteCollection routes){routes.IgnoreRoute ("{resource}.axd/{*pathInfo}");routes.MapRoute ("DefaultWithMessage", "{controller}/Say/{message}", new { controller = "Home",action = "say", message = "" });routes.MapRoute ("DefaultShowView", "{controller}/Show/{view}", new { controller = "Home",action = "Show", view = "" });routes.MapRoute ("Default", "{controller}/{action}/{id}", new { controller = "Home", action = "Index", id = "" });}protected void Application_Start (){RegisterRoutes (RouteTable.Routes);}}
{% endhighlight %}
E o resultado:[caption id="attachment_3342" align="aligncenter" width="300" caption="ASP.NET MVC rodando no Mono"][![ASP.NET MVC rodando no Mono](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-03-at-12.02.39-AM-300x256.png "ASP.NET MVC rodando no Mono")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-03-at-12.02.39-AM.png)[/caption][caption id="attachment_3343" align="aligncenter" width="300" caption="ASP.NET MVC rodando no Mono"][![ASP.NET MVC rodando no Mono](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-03-at-12.02.53-AM-300x256.png "ASP.NET MVC rodando no Mono")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-03-at-12.02.53-AM.png)[/caption][caption id="attachment_3344" align="aligncenter" width="300" caption="ASP.NET MVC rodando no Mono"][![ASP.NET MVC rodando no Mono](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-03-at-12.03.00-AM-300x256.png "ASP.NET MVC rodando no Mono")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/05/Screen-shot-2011-05-03-at-12.03.00-AM.png)[/caption]# Resumo
Por enquanto é possível dizer que as funcionalidades mais básicas e triviais de aplicações ASP.NET MVC 2 estão rodando conforme o esperado no Mono.Fiz outros testes mais complexos e tudo está correndo bem, pretendo ir postando sobre no decorrer da semana.Se você quer saber se eu pretendo torcar o Windows pelo Mac e o .NET pelo Mono? Acredito que não, mas já estava mais do que na hora de começar a utilizar o Mono e oferecer soluções com ele para sistemas comerciais. E acreditem o [Fábio Akita](http://akitaonrails.com) me cobra isso quase diariamente na Gonow :DAbraços e podem esperar que virão mais coisas sobre Mono, Monotouch e projetos utilizando a plataforma.Vinicius Quaiato.
