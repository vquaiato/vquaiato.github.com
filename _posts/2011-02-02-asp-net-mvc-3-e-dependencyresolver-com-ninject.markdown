--- 
layout: post
title: ASP.NET MVC 3 e DependencyResolver com Ninject
wordpress_id: 3057
wordpress_url: http://viniciusquaiato.com/blog/?p=3057
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
---
Fala galera [o post de ontem sobre DependencyResolver](http://viniciusquaiato.com/blog/asp-net-mvc-3-e-o-dependencyresolver/) foi um pouco mais pesado(e burro) não? Mostrei como criar um Service Locator **bem pobre** e o código ficou um pouco <del datetime="2011-02-02T16:14:00+00:00">pesado</del> ruim mesmo.A idéia é mostrar que não precisamos cair na tentação de resolver tudo por nós mesmos, que temos já boas soluções de mercado preparadas para nos auxiliar.

## Ninject.MVC3
Como dissemos o [ASP.NET MVC 3](http://viniciusquaiato.com/blog/asp-net-mvc-3) conta com a interface IDependencyResolver para atuar como um Service Locator. O [Ninject](http://ninject.org/) é um injetor de dependências open source, ou podemos chamá-lo também de container de IoC/DI. Estou falando do Ninject pois ele já possui uma implementação de IDependencyResolver que podemos utilizar e facilitar infinitamente nossas vidas.

## Instalando o Ninject.MVC3
É óbvio que isso tudo já está disponível com o [NuGet](http://viniciusquaiato.com/blog/tag/nuget/), então vamos digitar o seguinte comando no Package Manager Console:

{% highlight csharp %}
Install-Package Ninject.MVC3 
{% endhighlight %}

Feito isso teremos as referências do [Ninject](http://viniciusquaiato.com/blog/singletons-ecologicos/) e Ninject.MVC3 adicionadas ao nosso projeto. Teremos também um arquivo criado, com o código abaixo:

{% highlight csharp %}
using System.Web.Mvc;
using Ninject;
using Ninject.Mvc3;
[assembly: WebActivator.PreApplicationStartMethod(typeof(ExemploDependencyResolver.AppStart_NinjectMVC3), "Start")]

namespace ExemploDependencyResolver{    
	public static class AppStart_NinjectMVC3 {        
		public static void RegisterServices(IKernel kernel) { }
		public static void Start() {
			// Create Ninject DI Kernel             
			IKernel kernel = new StandardKernel();
    		// Register services with our Ninject DI Container            
    		RegisterServices(kernel);
    		// Tell ASP.NET MVC 3 to use our Ninject DI Container             
    		DependencyResolver.SetResolver(new NinjectServiceLocator(kernel));
    	}
    }
}
{% endhighlight %}

Este código está pronto para utilizarmos. Ele configura o Ninject como sendo nossa implementação de [IDependencyResolver ](http://viniciusquaiato.com/blog/asp-net-mvc-3-e-o-dependencyresolver/)e já configura o mesmo para o ASP.NET MVC. Tudo que precisamos fazer é registrar nossas dependências utilizando o código da linha 13. Algo mais ou menos assim:

{% highlight csharp %}
public static void RegisterServices(IKernel kernel){    
	kernel.Bind<idependencia1>().To<dummydependencia1>();
    kernel.Bind<idependencia2>().To<dummydependencia2>();
}
{% endhighlight %}

Pronto! Isso é tudo que precisamos! Não precisamos nem alterar o Global.asax para adicionar o DependencyResolver, pois esta classe criada pelo pacote do NuGet já faz esse trabalho.

## Resumo
Vimos que trabalhar com injeção de dependências em nossos controllers no ASP.NET MVC 3 é algo bastante trivial e simples quando utilizando o DependencyResolver. Se trabalharmos com Ninject então essa tarefa fica praticamente inexistente, afinal só precisamos configurar umas poucas linhas com a resolução das dependências.Chega de sofrer com soluções mirabolantes não é?!

## Código fonte
Confira o código fonte deste segundo exemplo aqui no github: [http://github.com/vquaiato/MVC3DependencyResolver](https://github.com/vquaiato/MVC3DependencyResolver/tree/master/src)

Abraços,

Vinicius Quaiato.
