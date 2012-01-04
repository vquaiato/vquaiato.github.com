--- 
layout: post
title: ASP.NET MVC 3 RC Sessionless Controllers
wordpress_id: 2091
wordpress_url: http://viniciusquaiato.com/blog/?p=2091
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
- title: SessionStateBehavior
  slug: sessionstatebehavior
  autoslug: sessionstatebehavior
- title: ControllerSessionState
  slug: controllersessionstate
  autoslug: controllersessionstate
---
Agora no ASP.NET MVC 3 Release Candidate temos uma facilidade para trabalhar com Controllers que devem ser totalmente desprovidos de session state: ControllerSessionStateAttribute.Este atributo permite configurar de forma bastante simples a forma como o controller lida com seu session state.Ele possui um parâmetro que diz como o controller deve se comportar. Este pasrâmetr recebe um enum: SessionStateBehavior, que possui os valores: Default, Disabled, ReadOnly, Required.

## SessionStateBehavior.Default
Este é o padrão de session state do ASP.NET. Usa as configurações de session state do request. 

## SessionStateBehavior.Disabled
Com este modo a sessão não fica disponível, causando uma exception quando tentamos acessar a mesma, seja para escrita ou leitura. Literalmente não há acesso ao session state.

## SessionStateBehavior.ReadOnly
Com este modo configurado o session state pode apenas ser lido. Quaisquer alterações(updates) realizados não surtirão efeito. Exceptions não são disparadas, mas valores setados não estarão disponíveis.

## SessionStateBehavior.Required
Acesso total de escrita e leitura. Esta configuração irá sobrescrever outras configurações que possam ter sido feitar para o request.Vamos ver um pequeno exemplo (retirado do Release Notes do ASP.NET MVC 3 RC):
{% highlight c# %}
[ControllerSessionState(SessionStateBehavior.Disabled)]
public class CoolController : Controller {    

public ActionResult Index()     {        object o = Session["Key"];
    // Causes an exception.    }
}

{% endhighlight %}
Como podemos ver na linha 1 este controller está com session state desabilitado, desta forma ao tentar acessar a Session receberemos uma exception. Em outras palavras: Este controller é Sessionless, não possui sessão!Abaixo vemos um controller que só pode ler a Session e não pode colocar dados na mesma:
{% highlight c# %}
[ControllerSessionState(SessionStateBehavior.ReadOnly)]
public class CoolController : Controller {    

public ActionResult Index()     {        Session["Key"] = "value";
    // Value is not available in the next request    }
}

{% endhighlight %}
Como vemos, uma exception não é disparada, mas os dados colocados na sessão não permanecerão lá. É como ter acesso e não conseguir gravar os dados.

## Em resumo o ControllerSessionState é...
Um recurso bem interessante, que começa a aproximar o ASP.NET MVC ainda mais do HTTP, que por padrão é stateless. Minha idéia é de que isto tudo está correto, porém apesar de o HTTP ser stateless a web não é. Estamos acostumados a trabalhar com aplicativos que mantém estado. Agora, cabe a nós o cuidado e a sabedoria de como manter e fornecer estes estados.Abraços e enjoy ASP.NET MVC 3 RC,Vinicius Quaiato.
