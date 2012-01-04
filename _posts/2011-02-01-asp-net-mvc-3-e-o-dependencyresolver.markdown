--- 
layout: post
title: ASP. NET MVC 3 e o DependencyResolver
wordpress_id: 3044
wordpress_url: http://viniciusquaiato.com/blog/?p=3044
categories: 
- title: ASP. NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: "Inje\xC3\xA7\xC3\xA3o de Depend\xC3\xAAncia"
  slug: injecao-de-dependencia
  autoslug: "inje\xC3\xA7\xC3\xA3o-de-depend\xC3\xAAncia"
- title: ASP. NET MVC 3
  slug: asp-net-mvc-3
  autoslug: asp.net-mvc-3
- title: MVC 3
  slug: mvc-3
  autoslug: mvc-3
- title: Service Locator
  slug: service-locator
  autoslug: service-locator
- title: Dependency Injection
  slug: dependency-injection
  autoslug: dependency-injection
- title: DependencyResolver
  slug: dependencyresolver
  autoslug: dependencyresolver
---
Na última semana vi várias dúvidas surgindo sobre [IoC e DI](http://viniciusquaiato.com/blog/wp-admin/edit-tags.php?action=edit&taxonomy=post_tag&post_type=post&tag_ID=27) no [ASP.NET MVC 3](http://viniciusquaiato.com/asp-net-mvc-3).O que poucas pessoas sabem é que no ASP. NET MVC 3 há uma forma bastante simples de resolvermos dependências.

## IDependencyResolver
O MVC 3 faz uso de um Service Locator do tipo [IDependencyResolver](http://msdn.microsoft.com/en-us/library/system.web.mvc.idependencyresolver(v=vs.98).aspx). Esta interface possui 2 métodos:- GetService
- GetServices
e existem ainda mais 2 extension methods:- GetService&lt;
    TService&gt;
    - GetServices&lt;
    TService&gt;
    Como vocês podem ver esta interface permite ao ASP. NET MVC abstrair a resolução de dependências.

## A classe DependencyResolver
A classe DependencyResolver atua como um Registry para os provedores de serviços, que como podemos imaginar são objetos do tipo IDependencyResolver. O principal método utilizado(o mais simples e trivial) é o [SetResolver(IDependencyResolver)](http://msdn.microsoft.com/en-us/library/gg401985(v=vs.98).aspx).

## Injetando dependências nos controllers
Chega de falatório e vamos ver como podemos resolver dependências nos construtores de nossos controllers com um objeto do tipo IDependencyResolver. Vamos criar um controller bem simples:
{% highlight csharp %}

public class TemDependenciasController : Controller{    

public IDependencia1 Dependencia1 { get;
    set;
    }
    
public IDependencia2 Dependencia2 { get;
    set;
    }
    
public TemDependenciasController(IDependencia1 dependencia1, IDependencia2 dependencia2)    {        Dependencia1 = dependencia1;
    Dependencia2 = dependencia2;
    }
    
public ActionResult Index()    {
var b = this.Dependencia1.Metodo("foo");
    this.Dependencia2.AlgumMetodo();
return View();
    }
}

{% endhighlight %}
Este controller possui duas dependências em seu construtor. Este código compila porém não conseguimos executar esta aplicação pois no momento em que o ASP. NET MVC tentar instanciar o controller não conseguirá resolver as dependências do seu construtor. Vamos então criar uma classe que implemente IDependencyResolver que atuará como nosso SL:
{% highlight csharp %}

public class MeuDependencyResolver : IDependencyResolver{    

private 
static ILookup<Type, object> lookup;
    
public MeuDependencyResolver()    {        lookup = AsDependencias().ToLookup(l => l.GetType().GetInterfaces().FirstOrDefault());
    }
    
public IEnumerable<object> AsDependencias()    {        yield
return new DummyDependencia1();
    yield
return new DummyDependencia2();
    yield
return new DummyDependencia2_2();
    }
    
public object GetService(Type serviceType)    {
var ctorInfo = serviceType.GetConstructors().FirstOrDefault();
if(ctorInfo == null)
return null;
var paramInfo = ctorInfo.GetParameters();
var resolvedParams = ResolveParamTypes(paramInfo);
var resolvedParamDependencies = ResolveDependencies(resolvedParams).ToList();
return Activator.CreateInstance(serviceType, resolvedParamDependencies.ToArray());
    }
    
private IEnumerable<object> ResolveDependencies(IEnumerable<type> resolvedParams)    {
return resolvedParams            .Select(paramType => lookup[paramType].FirstOrDefault());
    }
    
private IEnumerable<type> ResolveParamTypes(ParameterInfo[] paramInfo)    {
foreach(var param in paramInfo)        {            yield
return param.ParameterType;
    }
    }
    
public IEnumerable<object> GetServices(Type serviceType)    {
return new List<object>();
    }
}
</object></object></type></type></object></object>
{% endhighlight %}
 Este código não possui nada muito diferente do normal. O que fazemos é configurar tipos de forma hard-coded que serão utilizados pelo ASP. NET MVC para resolver as dependências. E usamos um pouco de reflection para resolver estas dependências. Percebam que este nosso SL é bem pobrinho. Ele só sabe resolver dois tipos de dependências(e para este exemplo é tudo o que precisamos, pois o foco aqui é a feature e não a implementação).Usamos reflection pois o type do service que é informado no método GetService não é o type da dependência e sim o type do controller que está sendo criado. Por isso descobrimos quais os parâmetros do construtor do controller, obtemos os mesmos do nosso dicionário e criamos então uma instância do controller.**O código acima serve para mostrar que é sempre melhor usar um container de IoC/DI de mercado. Não tente criar o seu. Mas fiz isso pois mostrarei em outro post como é simples fazer isso  com Ninject**

## Configurando o DependencyResolver
Para configurarmos nossa classe para ser utilizada precisamos chamar o método SetResolver da classe DependencyResolver. O melhor para fazer isso neste caso é o Application_Start no Global.asax:
{% highlight csharp %}

protected void Application_Start(){    AreaRegistration.RegisterAllAreas();
    RegisterGlobalFilters(GlobalFilters.Filters);
    RegisterRoutes(RouteTable.Routes);
    DependencyResolver.SetResolver(new MeuDependencyResolver());
    }

{% endhighlight %}
Na **_linha 8_** chamamos o método SetResolver para informar ao ASP. NET MVC que o IDependecyResolver a ser utilizado é o que criamos(MeuDependencyResolver).Desta forma podemos executar nossa aplicação e ver que "magicamente" nossas dependências serão resolvidas e passadas para o construtor do nosso controller.[caption id="attachment_3045" align="aligncenter" width="300" caption="Resolvendo dependencias controller MVC3 com  IDependencyResolver"][![Resolvendo dependencias controller MVC3 com  IDependencyResolver](http://viniciusquaiato.com/images_posts/Resolvendo-dependencias-controller-IDependencyResolver-300x209.png "Resolvendo dependencias controller MVC3 com  IDependencyResolver")](http://viniciusquaiato.com/images_posts/Resolvendo-dependencias-controller-IDependencyResolver.png)[/caption][caption id="attachment_3046" align="aligncenter" width="300" caption="Dependencias controller MVC3 resolvidas com IDependencyResolver"][![Dependencias controller MVC3 resolvidas com IDependencyResolver](http://viniciusquaiato.com/images_posts/Dependencias-controller-resolvidas-com-IDependencyResolver-300x196.png "Dependencias controller MVC3 resolvidas com IDependencyResolver")](http://viniciusquaiato.com/images_posts/Dependencias-controller-resolvidas-com-IDependencyResolver.png)[/caption]

## Fontes
Confira os fontes completos aqui no Github: [https://github.com/vquaiato/MVC3DependencyResolver](https://github.com/vquaiato/MVC3DependencyResolver)

## Resumo
Todo o trabalho que tivemos aqui foi para criar uma classe que sabe resolver dependências, pois o resto a infra do ASP. NET MVC 3 cuidou de tudo. No próximo post faremos exatamente a mesma coisa porém utilizando o Ninject ao invés de criar nosso próprio container. O ASP.NET MVC 3 possui boas melhorias com relação a injeção de dependências e resolução de dependências. Muitas coisas ficaram simples. No exemplo acima não precisamos mais criar uma classe que implemente [IControllerFactory](http://msdn.microsoft.com/en-us/library/system.web.mvc.icontrollerfactory.aspx).Se você ainda está por fora do [ASP.NET MVC 3 confira estes posts](http://viniciusquaiato.com/blog/asp-net-mvc-3/) e não perca o [MVC Summit em março](http://mvcsummit.net)!

Abraços,
Vinicius Quaiato.
