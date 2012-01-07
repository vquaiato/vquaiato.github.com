--- 
layout: post
title: "Windows Azure: rodando ASP.NET MVC 3"
wordpress_id: 2714
wordpress_url: http://viniciusquaiato.com/blog/?p=2714
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: ASP.NET MVC 3
  slug: asp-net-mvc-3
  autoslug: asp.net-mvc-3
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
- title: MVC 3 Azure
  slug: mvc-3-azure
  autoslug: mvc-3-azure
---


[![](http://viniciusquaiato.com/images_posts/Sky-Fluffy-Clouds-150x150.jpg "Sky-Fluffy-Clouds")](http://viniciusquaiato.com/images_posts/Sky-Fluffy-Clouds.jpg)

No [post anterior vimos como é muito simples criar e executar uma aplicação ASP.NET MVC no Windows Azure](http://viniciusquaiato.com/blog/windows-azure-criando-a-primeira-aplicacao-asp-net-mvc/).O ponto é que até o momento só está disponível um role para o ASP.NET MVC 2.

## Criando a solution


Para criar uma aplicação utilizando o [ASP.NET MVC 3](http://viniciusquaiato.com/blog/asp-net-mvc-3/) é também bastante simples. Tudo que precisamos fazer é criar um projeto Azure que pode ser criado sem nenhum role, como vemos abaixo:[![Solution Azure sem nenhum role](http://viniciusquaiato.com/images_posts/solution-azure-sem-nenhum-role-300x202.png "Solution Azure sem nenhum role")](http://viniciusquaiato.com/images_posts/solution-azure-sem-nenhum-role.png)



Depois vamos criar nesta solution um projeto ASP.NET MVC 3, normalmente:[![Solution Azure com projeto ASP.NET MVC 3](http://viniciusquaiato.com/images_posts/solution-azure-com-projeto-MVC-3-300x293.png "Solution Azure com projeto ASP.NET MVC 3")](http://viniciusquaiato.com/images_posts/solution-azure-com-projeto-MVC-3.png)



## Configurando o ASP.NET MVC 3 como um Web Role


Agora precisamos fazer com que nosso projeto ASP.NET MVC 3 se torne um Web Role do Windows Azure. Isso é extremamente simples.Precisamos adicionar algumas referências do Windows Azure no projeto ASP.NET MVC 3:[![Adicionando referencias do Azure no projeto ASP.NET MVC 3](http://viniciusquaiato.com/images_posts/Adicionando-referencias-do-Azure-no-projeto-MVC-3-300x172.png "Adicionando referencias do Azure no projeto ASP.NET MVC 3")](http://viniciusquaiato.com/images_posts/Adicionando-referencias-do-Azure-no-projeto-MVC-3.png)

Além de adicionar estas referências precisamos criar uma classe que herde de [RoleEntryPoint](http://msdn.microsoft.com/en-us/library/microsoft.windowsazure.serviceruntime.roleentrypoint.aspx) para sinalizar que este projeto é um Web Role. Esta classe é bastante simples e pode ser criada com o seguinte código:
{% highlight csharp %}
using Microsoft.WindowsAzure.ServiceRuntime;
    namespace SiteMVC3{    

public class WebRole : RoleEntryPoint    {        

public override bool OnStart()        {            // For information on handling configuration changes            // see the MSDN topic at http://go.microsoft.com/fwlink/?LinkId=166357.
return base.OnStart();
    }
    }
}

{% endhighlight %}
Pronto! Vamos então adicionar nossa aplicação como um Web Role no projeto Azure:Agora vamos criar um controller e uma view utilizando Razor!
{% highlight csharp %}
using System.Web.Mvc;
    namespace SiteMVC3.Controllers{    

public class HomeController : Controller    {        

public ActionResult Index()        {            return View(new[] { "ASP.NET MVC 3 no Windows Azure", "Vinicius Quaiato" }
);
    }
    }
}

{% endhighlight %}
E a View:
{% highlight csharp %}
@model string[]<!DOCTYPE html SYSTEM><html><head>    <title>Index</title></head><body>    <div>        # @Model[0]
        

### Por: @Model[1]
    </div></body></html>
{% endhighlight %}


### Referenciando o Web Role


Agora basta incluir a aplicação ASP.NET MVC 3 como sendo um Web Role no projeto Azure:[![Adicionando projeto ASP.NET MVC 3 como Web Role no Azure](http://viniciusquaiato.com/images_posts/Adicionando-projeto-MVC-3-como-Web-Role-no-Azure-300x185.png "Adicionando projeto ASP.NET MVC 3 como Web Role no Azure")](http://viniciusquaiato.com/images_posts/Adicionando-projeto-MVC-3-como-Web-Role-no-Azure.png)



[![Selecionando projeto ASP.NET MVC 3 como Web Role no Azure](http://viniciusquaiato.com/images_posts/Selecionando-projeto-MVC-3-como-Web-Role-no-Azure-300x220.png "Selecionando projeto ASP.NET MVC 3 como Web Role no Azure")](http://viniciusquaiato.com/images_posts/Selecionando-projeto-MVC-3-como-Web-Role-no-Azure.png)



[![Projeto ASP.NET MVC 3 configurado como Web Role no Azure](http://viniciusquaiato.com/images_posts/Projeto-MVC-3-configurado-como-Web-Role-no-Azure-277x300.png "Projeto ASP.NET MVC 3 configurado como Web Role no Azure")](http://viniciusquaiato.com/images_posts/Projeto-MVC-3-configurado-como-Web-Role-no-Azure.png)



## Executando


É tudo bastante simples! E funciona normalmente, assim como se estivéssemos utilizando o ASP.NET MVC 2 Web Roles.[![Aplicação ASP.NET MVC 3 rodando no Azure](http://viniciusquaiato.com/images_posts/Aplicacao-MVC-3-rodando-no-Azure-300x209.png "Aplicação ASP.NET MVC 3 rodando no Azure")](http://viniciusquaiato.com/images_posts/Aplicacao-MVC-3-rodando-no-Azure.png)

É isso galera, no próximo post falarei um pouco sobre as "armadilhas" de rodar aplicações web no Azure e depois sobre as configurações de uma aplicação no Azure.**Importante!**Para fazer o deploy do ASP.NET MVC 3 marque as dll's abaixo para serem copiadas para o diretório de output(copy local = true):- System.WebPages.dll
- System.Web.WebPages.Razor.dll
- System.Web.Helpers.dll
- System.Web.Razor.dll
- WebMatrix.Data.dll
- Microsoft.Web.Infrastructure.dll
E também System.Web.MVC versão 3.0.0.0.Estas Dll's podem ser encontradas em: _C:\Program Files (x86)\Microsoft ASP.NET\ASP.NET Web Pages\v1.0\Assemblies_.[Veja mais aqui](http://code-inside.de/blog/2011/01/01/howto-windows-azure-asp-net-mvc-3-was-braucht-man-fr-dlls/).

Abraços,
Vinicius Quaiato.
