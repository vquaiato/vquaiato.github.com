--- 
layout: post
title: ASP.NET MVC controlando a ordem dos action filters
wordpress_id: 2624
wordpress_url: http://viniciusquaiato.com/blog/?p=2624
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: Filters
  slug: filters
  autoslug: filters
- title: Action Filters
  slug: action-filters
  autoslug: action-filters
- title: "ordem execu\xC3\xA7\xC3\xA3o filters"
  slug: ordem-execucao-filters
  autoslug: "ordem-execu\xC3\xA7\xC3\xA3o-filters"
---
Fuçando na lista de discussões da [Caelum](http://www.caelum.com.br/) sobre o [Restfulie](http://restfulie.caelum.com.br/) comecei a me perguntar como definir a ordem em que os action filters são executados no [ASP.NET MVC](http://viniciusquaiato.com/blog/category/dotnet/asp-net-dotnet/asp-net-mvc/).Bom, é algo bastante simples e fácil, vejamos:
{% highlight csharp %}

public class HomeController : Controller{    [SomeFilter]    [AnotherFilter]    
public ActionResult Index()    {        return View();
    }
}

{% endhighlight %}
Criei dois [action filters](http://msdn.microsoft.com/en-us/library/dd470536(v=VS.90).aspx) e apliquei na action Index do meu Home Controller. O [ASP.NET MVC](http://asp.net/mvc) não garante a ordem em que os filters de um mesmo tipo são executados. Existe uma ordem para filters serem executados mas esta ordem diz respeito a filters de tipos diferentes, [veja aqui](http://www.asp.net/mvc/tutorials/understanding-action-filters-cs).Desta forma se temos um ou mais action filters(ou mais de um filter de outro tipo qualquer) e queremos que eles sejam executados em uma ordem específica precisamos utilizar sua propriedade [Order](http://msdn.microsoft.com/en-us/library/system.web.mvc.filterattribute.order(v=VS.90).aspx).Vamos então setar esta propriedade:
{% highlight csharp %}

public class HomeController : Controller{    [SomeFilter(Order = 2)]    [AnotherFilter(Order = 1)]    
public ActionResult Index()    {        return View();
    }
}

{% endhighlight %}
Pronto. Agora estamos explicitamente dizendo que o action filter AnotherFilter deve ser executado primeiro, e depois o action filter SomeFilter.Estes valores podem ser utilizados em ordem de grandeza ou seja poderiam ser utilizados os valores 5 e 6, 10 e 11, 3 e 4. Funcionaria da mesma maneira.Simples não? Tá aí a dica.

Att,
Vinicius Quaiato.
