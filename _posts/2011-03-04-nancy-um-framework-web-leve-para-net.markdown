--- 
layout: post
title: "Nancy: um framework web leve para .NET"
wordpress_id: 3263
wordpress_url: http://viniciusquaiato.com/blog/?p=3263
categories: 
- title: ASP. NET   slug: asp-net-dotnet
  autoslug: asp. net tags: 
- title: Nancy
  slug: nancy
  autoslug: nancy
- title: Nancy framework
  slug: nancy-framework
  autoslug: nancy-framework
- title: projeto Nancy
  slug: projeto-nancy
  autoslug: projeto-nancy
---
[![](http://viniciusquaiato.com/images_posts/Frank-Sinatra-234x300.jpg "Frank Sinatra")](http://viniciusquaiato.com/images_posts/Frank-Sinatra.jpg)O desenvolvimento web em .NET limitou-se por alguns anos ao ASP. NET WebForms. Apesar de termos o [ASP.NET](http://asp.net) como uma plataforma robusta para web, só havia a opção de trabalharmos com [WebForms](http://msdn.microsoft.com/en-us/library/ms973868.aspx).Após algum tempo começaram a surgir alternativas bastante interessantes, dentre as quais as mais notáveis talvez sejam o [ASP.NET MVC](http://asp.net/mvc) e o [FubuMVC](http://fubumvc.com/). No entanto estas não são as únicas opções interessantes.# Sinatra
A foto que vocês observam neste post é de [Frank Sinatra](http://en.wikipedia.org/wiki/Frank_Sinatra). O que ela faz ali? Bem... [Sinatra é uma DSL para a criação de aplicações web em Ruby](http://www.sinatrarb.com/intro). Sim, nem só de Rails vive o mundo web em Ruby. Eu não sou um especialista em [Sinatra](http://www.sinatrarb.com/)(e nem em Frank Sinatra :P ) mas o que podemos perceber é que ele é simples e fácil de usar. Resolve muitos problemas simples e pontuais. Mas eu não duvido que algumas aplicações mais complexas tenham sido feitas com ele. A idéia é manter as coisas simples. [![](http://viniciusquaiato.com/images_posts/Nancy-Sinatra-222x300.jpg "Nancy Sinatra")](http://viniciusquaiato.com/images_posts/Nancy-Sinatra.jpg)# Mas e a Nancy?
[Nancy Sinatra](http://en.wikipedia.org/wiki/Nancy_Sinatra) é o nome da filha de Frank Sinatra. E eis que a comunidade .NET se mobiliza para criar um framework que nos possibilite trabalhar também ao estilo Sinatra.(você que é apressado pode já pode conferir mais sobre ele [aqui](http://elegantcode.com/2010/11/28/introducing-nancy-a-lightweight-web-framework-inspired-by-sinatra/))[Nancy](https://github.com/thecodejunkie/Nancy#readme) é um projeto aberto e bastante interessante. É uma alternativa aos frameworks mais robustos que temos disponíveis para a criação de aplicações web. Por ser um framework menos robusto é preciso que tenhamos em mente que seu uso não cubrirá uma grande gama de situações e é preciso que estejamos atentos às oportunidades que temos para utilizá-lo.Nancy não está escrito sobre um framework, desta forma ele está totalmente livre para ser executado e utilizado em diversos ambientes. Por padrão ele pode ser executado com ASP. NET ou WCF, mas é possível utilizá-lo no Mono com FastCGI.# Setup
O que me espantou foi a facilidade de usar o framework. Acho que nem o [ASP.NET MVC](http://viniciusquaiato.com/blog/category/dotnet/asp-net-dotnet/asp-net-mvc/) é tão simples e direto :DTudo que fiz foi [baixar o código fonte do Nancy no github](https://github.com/thecodejunkie/Nancy/archives/master).Este download contém uma série de projetos: testes, demos, e o próprio Nancy. Tudo o que precisamos em nossa aplicação, a mais simples possível, são referências para 3 dlls, no nosso caso:- Nancy. dll 
- Nancy.Hosting.Aspnet
- Nancy.ViewEngines.Razor
Estas dlls você encontra no download que realizou. Adicione-as em um projeto ASP. NET vazio(ASP.NET Empty Web Application).É preciso adicionar uma configuração no web.config. Tudo o que fazemos aqui é configurar um IHttpModule do Nancy no nosso projeto. Adicione o seguinte código dentro da section configuration:
{% highlight csharp %}
  <system.webserver>    <modules runallmanagedmodulesforallrequests="true" />    <validation validateintegratedmodeconfiguration="false" />    <handlers>      <add name="Nancy" verb="*" type="Nancy.Hosting.Aspnet.NancyHttpRequestHandler" path="*" />    </handlers>  </system.webserver>
{% endhighlight %}
E adicione o seguinte código dentro de system.web:
{% highlight csharp %}
    <httphandlers>      <add verb="*" type="Nancy.Hosting.Aspnet.NancyHttpRequestHandler" path="*" />    </httphandlers>
{% endhighlight %}
Simples. O setup está tudo pronto! (você sabe realizar o setup de uma app ASP. NET MVC sem o Visual Studio?)# Primeiro site usando Nancy
Tudo o que precisamos fazer é criar uma classe, um módulo Nancy. Isso é feito herdando nossa classe de NancyModule:
{% highlight csharp %}
namespace MyNancyApp{    using Nancy;
    
public class Module : NancyModule    {        

public Module() { }
    }
}

{% endhighlight %}
Quando estivermos usando o Nancy um module será a chave para muitas coisas e um ponto central e bastante importante. Futuramente veremos mais detalhes sobre ele. Este módulo não faz nada. Vamos então definir algumas rotas para ele, bem simples claro (estamos apenas começando certo?):
{% highlight csharp %}

public class Module : NancyModule{    

public Module()    {        Get["/"] = x => {
return "Hey eu estou usando Nancy!!!";
    }
;
    }
}

{% endhighlight %}
Ahn?! Simples assim! Este código está dizendo que quando recebermos uma requisição GET para a raiz será retornado o texto "Hey eu estou usando Nancy!!!".Executando temos a saída:[caption id="attachment_3276" align="aligncenter" width="367" caption="Site Nancy executando GET na raiz"][![Site Nancy executando GET na raiz](http://viniciusquaiato.com/images_posts/Site-Nancy-executando-GET-na-raiz.png "Site Nancy executando GET na raiz")](http://viniciusquaiato.com/images_posts/Site-Nancy-executando-GET-na-raiz.png)[/caption]Vamos então adicionar uma rota que nos retornará uma view enviando para ela um objeto como model:
{% highlight csharp %}

public class Module : NancyModule{    

public Module()    {        Get["/"] = x => {
return "Hey eu estou usando Nancy!!!";
    }
;
    Get["/usando view"] = x => {
return View["alguma_view", "É nóis que voa bruxão!"];
    }
;
    }
}

{% endhighlight %}
Reparem na **_linha 7_** que estamos informando que as requisições GET para "/usando view" devem retornar a view de nome "alguma_view" e enviar para ela a string "É nóis que voa bruxão!".Esta view está criada em uma pasta que eu chamei de Views e estou utilizando Razor para isso (você pode usar ndjango, spark, html, etc).O código da View é:
{% highlight csharp %}
<html><head>    <title></title></head><body>    @Model</body></html>
{% endhighlight %}
Simples e direto. O resultado será:[caption id="attachment_3277" align="aligncenter" width="445" caption="Site Nancy executando GET e retornando View Razor"][![Site Nancy executando GET e retornando View Razor](http://viniciusquaiato.com/images_posts/Site-Nancy-executando-GET-e-retornando-View-Razor.png "Site Nancy executando GET e retornando View Razor")](http://viniciusquaiato.com/images_posts/Site-Nancy-executando-GET-e-retornando-View-Razor.png)[/caption]# Enfim... resumindo...
O Nancy é um framework simples mas que pode ser usado para criar diversas aplicações, também, de propósito simples. Há o que explorar e contribuir. Então fica o convite. Contribuir não necessariamente quer dizer "faça um fork e comece a codificar". A utilização e o feedback já podem ser um bom ponto de partida. Pretendo escrever mais coisas sobre o framework Nancy pois ele é bastante interessante em alguns cenários. Quer um exemplo? O site do MVC Summit que está no ar hoje poderia ter sido feito com Nancy de forma muito simples :DDeixem seu feedback, e até breve.

Abraços,
Vinicius Quaiato.
