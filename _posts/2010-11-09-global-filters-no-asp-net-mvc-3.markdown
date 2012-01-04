--- 
layout: post
title: Global Filters no ASP. NET MVC 3
wordpress_id: 2079
wordpress_url: http://viniciusquaiato.com/blog/?p=2079
categories: 
- title: ASP. NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: ASP. NET MVC 3
  slug: asp-net-mvc-3
  autoslug: asp.net-mvc-3
- title: ASP. NET MVC 3 Beta
  slug: asp-net-mvc-3-beta
  autoslug: asp.net-mvc-3-beta
- title: GlobalFilters
  slug: globalfilters
  autoslug: globalfilters
- title: Global Filters
  slug: global-filters
  autoslug: global-filters
---
Fala galera, [ASP.NET MVC 3](http://viniciusquaiato.com/blog/asp-net-mvc-3/) tá demais! Desta vez vou mostrar, de forma bastante simples o recurso de Global Filters que será lançado nesta próxima versão.# Global Filters ASP. NET MVC 3
Global Filters são filtros que podemos definir para todos os nossos controllers, ou seja, temos a possibilidade de configurar filtros que serão aplicados para todas as actions de todos os nossos controllers de uma maneira centralizada e unificada. Antes o que tínhamos de fazer era configurar o filtro em cada controller ou em um controller base a ser herdado. Funciona, mas... Pode ser melhor!

## Criando Global Filters ASP. NET MVC 3
Vamos criar um filtro que interceptará todas as nossas actions, acrescentando no nosso response a data e hora em que a execução da action começou, e o tempo total de execução da action. Para isso precisamos criar uma classe que herde de [ActionFilterAttribute](http://msdn.microsoft.com/en-us/library/system.web.mvc.actionfilterattribute.aspx), veja:
{% highlight csharp %}

public class MeuGlobalFilter : ActionFilterAttribute{    

private Stopwatch tempoDoRequest = new Stopwatch();
    
public override void OnActionExecuting(ActionExecutingContext filterContext)    {        filterContext. HttpContext            .Response.Write(string.Format("Execução começou em: {
}
", DateTime.Now));
    base.OnActionExecuting(filterContext);
    tempoDoRequest.Start();
    }
    
public override void OnActionExecuted(ActionExecutedContext filterContext)    {        base.OnActionExecuted(filterContext);
    tempoDoRequest.Stop();
    filterContext. HttpContext            .Response.Write(string.Format("<br />Tempo de execução: {
}
<br /><br />", tempoDoRequest.Elapsed));
    }
}

{% endhighlight %}
Este código é bastante simples, e fala por si só. O que precisamos notar são os métodos em que fizemos o override. São métodos definidos na classe [ActionFilterAttribute](http://msdn.microsoft.com/en-us/library/system.web.mvc.actionfilterattribute.aspx). Como o nome dos métodos são bem claros, neste caso um deles é disparado quando a action está executando, ou começa a executar. E o outro é disparado quando a action terminou de executar. O argumento passado, _filterContext_ dos tipos [ActionExecutingContext](http://msdn.microsoft.com/en-us/library/dd505190(v=VS.90).aspx) e [ActionExecutedContext](http://msdn.microsoft.com/en-us/library/system.web.mvc.actionexecutedcontext.aspx), contém informações necessárias para realizarmos algum processamento: nome da action, argumentos enviados, result, execptions, controller contexto, etc. Para que este Global Filter esteja disponível é necessário que adicionemos ele a lista de Global Filters no arquivo Global.asax:
{% highlight csharp %}

public 
static void RegisterGlobalFilters(GlobalFilterCollection filters){    filters.Add(new HandleErrorAttribute());
    filters.Add(new MeuGlobalFilter());
    }

{% endhighlight %}
Bastante simples não?! E quando executarmos nossa aplicação:[caption id="attachment_2081" align="aligncenter" width="300" caption="executando aplicacao com globalfilters asp. net mvc 3"][![executando aplicacao com globalfilters asp. net mvc 3](http://viniciusquaiato.com/images_posts/executando-aplicacao-com-globalfilters-300x181.png "executando aplicacao com globalfilters asp. net mvc 3")](http://viniciusquaiato.com/images_posts/executando-aplicacao-com-globalfilters.png)[/caption]

## Concluindo
Os Global Filters são uma mão na roda para uma série de atividades, como logging, tracing, verificação de segurança e autorização (vou mostrar mais como trabalhar com isso), etc.É uma forma simples de configurar um comportamento comum em nossas aplicações.Veja mais em: [http://www.dotnetcurry.com/ShowArticle.aspx?ID=578](http://www.dotnetcurry.com/ShowArticle.aspx?ID=578)[http://weblogs.asp.net/gunnarpeipman/archive/2010/08/15/asp-net-mvc-3-global-action-filters.aspx](http://weblogs.asp.net/gunnarpeipman/archive/2010/08/15/asp-net-mvc-3-global-action-filters.aspx)Abraços,Vinicius Quaiato.
