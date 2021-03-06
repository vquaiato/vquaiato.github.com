--- 
layout: post
title: "Windows Azure: criando a primeira aplica\xC3\xA7\xC3\xA3o ASP.NET MVC"
wordpress_id: 2694
wordpress_url: http://viniciusquaiato.com/blog/?p=2694
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
---
Depois de vermos como [preparar o ambiente de desenvolvimento para Windows Azure](http://viniciusquaiato.com/blog/windows-azure-preparando-o-ambiente-de-desenvolvimento/) vamos criar nossa primeira aplicação ASP.NET MVC rodando no Azure e vamos então entender alguns de seus conceitos.Diversos artigos na internet descrevem em detalhes os muitos pontos importantes do Windows Azure. Nesta série de posts também veremos estes pontos, porém faremos isso de uma forma um pouco mais prática, entendendo-os à medida que isso for necessário.

## Criando uma solution Windows Azure


Vamos criar uma solution para ser executada no Windows Azure:[![Criando Projeto Windows Azure](http://viniciusquaiato.com/images_posts/Criando-Projeto-Azure-MVC-300x168.png "Criando Projeto Windows Azure")](http://viniciusquaiato.com/images_posts/Criando-Projeto-Azure-MVC.png)



Logo após a criação da solution precisamos selecionar quais os tipos de Roles serão utilizados:[![Adicionando Web Role MVC ao projeto Windows Azure](http://viniciusquaiato.com/images_posts/Adicionando-Web-Role-MVC-300x187.png "Adicionando Web Role MVC ao projeto Windows Azure")](http://viniciusquaiato.com/images_posts/Adicionando-Web-Role-MVC.png)



Feito isso temos nossa solution criada com nosso role já configurado. Como podemos ver a solution possui um projeto Windows Azure(AzureMVC) e uma aplicação ASP.NET MVC(Site).[![Solution Azure com MVC Web Role criada](http://viniciusquaiato.com/images_posts/Solution-Azure-com-MVC-Web-Role-criada-224x300.png "Solution Azure com MVC Web Role criada")](http://viniciusquaiato.com/images_posts/Solution-Azure-com-MVC-Web-Role-criada.png)



## Windows Azure e os Roles
As aplicações no Windows Azure precisam ser implementadas através de pelo menos um role. Podemos entender, a grosso modo, que um role é um tipo de aplicação a ser executada no Windows Azure.Atualmente estão disponíveis três tipos de roles: Web Roles, Worker Roles e VM Roles.

### Web Roles
Um Web Roles é basicamente uma maneira simples de criar uma aplicação web para ser executada no Windows Azure. Cada Web Role já possui uma instância do IIS 7 pré-configurada o que torna ainda mais simples o desenvolvimento destas aplicações Web no Azure.É possível criar aplicações Web Forms, ASP.NET MVC, serviços WCF, etc.O Windows Azure não é simplesmente uma opção de host para aplicativos .NET, é possível utilizar o Windows Azure com aplicações que rodem no Windows sem a necessidade do .NET como por exemplo aplicativos Java e aplicativos PHP.É possível que uma aplicação Azure mescle quaisquer tipos de roles diferentes em quaisquer quantidades, ou seja, podemos ter 1 web role com 3 worker roles. Futuramente veremos como a troca de informações é realizada entre os diferentes roles.

## Executando a aplicação Azure localmente


Quando estamos trabalhando com aplicativos Windows Azure podemos executar os mesmos localmente sem a necessidade de realizar um deploy real para a estrutura do Azure.Se executarmos **_Ctrl + F5_** em nossa aplicação a mesma será iniciada localmente (isso requer que o Visual Studio esteja sendo executado com privilégios).Quando executamos a aplicação Azure localmente o Windows Azure Emulator será iniciado. [![Windows Azure Emulator](http://viniciusquaiato.com/images_posts/Windows-Azure-Emulator-300x62.png "Windows Azure Emulator")](http://viniciusquaiato.com/images_posts/Windows-Azure-Emulator.png)



E no browser teremos nossa aplicação ASP.NET MVC sendo executada normalmente:[![Aplicacao ASP.NET MVC no Windows Azure](http://viniciusquaiato.com/images_posts/Aplicacao-ASp.NET-MVC-no-Windows-Azure-300x190.png "Aplicacao ASp.NET MVC no Windows Azure")](http://viniciusquaiato.com/images_posts/Aplicacao-ASp.NET-MVC-no-Windows-Azure.png)



## Resumo
Como pudemos perceber a criação de uma aplicação ASP.NET MVC que será executada no ambiente do Windows Azure é bastante simples e trivial.Veremos ao longo dos artigos que uma série de detalhes de implementação mudarão quando estivermos lidando com aplicações no Azure, no entanto o processo de criação destas aplicações é simples.No próximo post veremos um pouco sobre as instâncias de um role e o fabric controller e como o processo de escalonamento muda a forma como desenvolvemos aplicações web.

Abraços,
Vinicius Quaiato.
