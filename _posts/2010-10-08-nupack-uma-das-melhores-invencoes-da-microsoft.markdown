--- 
layout: post
title: "NuPack: Uma das melhores inven\xC3\xA7\xC3\xB5es da Microsoft"
wordpress_id: 1733
wordpress_url: http://viniciusquaiato.com/blog/?p=1733
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
tags: 
- title: NuPack
  slug: nupack
  autoslug: nupack
- title: Pacotes
  slug: pacotes
  autoslug: pacotes
- title: Gerenciador Pacotes
  slug: gerenciador-pacotes
  autoslug: gerenciador-pacotes
- title: Package Manager Console
  slug: package-manager-console
  autoslug: package-manager-console
- title: NuGet
  slug: nuget
  autoslug: nuget
---
[![](http://viniciusquaiato.com/images_posts/PackagesGraphic-150x150.jpg "PackagesGraphic")](http://viniciusquaiato.com/images_posts/PackagesGraphic.jpg)Ontem (dia 06/10) foi anunciado o lançamento do [NuPack](http://nupack.codeplex.com/).O projeto é realmente promissor, e não é uma simples invenção da Microsoft. É um projeto que a Microsoft abraçou ([http://weblogs.asp.net/bsimser/archive/2010/10/06/unicorns-triple-rainbows-package-management-and-lasers.aspx](http://weblogs.asp.net/bsimser/archive/2010/10/06/unicorns-triple-rainbows-package-management-and-lasers.aspx)).Em resumo: é um gerenciador de pacotes para .NET.O que é isso? É simplesmente algo parecido com [Ruby Gems](http://rubygems.org/): MUITO BOM!!!Claro, é algo que irá evoluir muito, mas já nos dá um bruta poder. De dentro do Visual Studio podermos adicionar uma referência para um pacote em nossa aplicação sem ter de abrir o google, fazer o download, tirar do zip, adicionar a referência... Ele faz isso tudo para nós: é mesmo muito incrível!

### Instalando NuPack
Façam o Download do NuPack aqui: [http://nupack.codeplex.com/](http://nupack.codeplex.com/)

### Abrindo o Package Manager Console
Após instalar, abra seu Visual Studio e digite: Ctrl + W, Ctrl + Z, ou vá ao menu View >> Other Windows >> Package Manager Console. Este console (é [Powershell](http://technet.microsoft.com/en-us/scriptcenter/powershell.aspx)!!!) é por onde você consegue instalar os pacotes. 

### Listando os pacotes disponíveis no NuPack
Para ver os pacotes disponíveis digite:_**List-Package**_[caption id="attachment_1734" align="aligncenter" width="300" caption="NuPack List-Package"][![NuPack List-Package](http://viniciusquaiato.com/images_posts/List-Package-300x111.png "NuPack List-Package")](http://viniciusquaiato.com/images_posts/List-Package.png)[/caption]

### Adicionando um pacote com o NuPack
No Package Manager Console digite:_**Add-Package Nunit**_[caption id="attachment_1736" align="aligncenter" width="300" caption="NuPack Add-Package"][![NuPack Add-Package](http://viniciusquaiato.com/images_posts/Add-Package-300x300.png "NuPack Add-Package")](http://viniciusquaiato.com/images_posts/Add-Package.png)[/caption]Assim fará o download e adicionará referências para o NUnit em seu projeto. É muito simples!

### Gerenciando os pacotes
Após adicionar uma referência para um pacote o NuPack cria um arquivo packages. config onde ele armazena o pacote e a versão que foi adicionada ao projeto. Ainda não testei isso, mas imagino que ele consiga ver a disponibilidade de uma versão mais recente para fazer um upgrade.
{% highlight csharp %}
<? xml version="1.0" encoding="utf-8"?><packages>  <package id="NUnit" version="2.5.7.10213" /></packages>
{% endhighlight %}


### Removendo pacotes com NuPack
Para remover um pacote adicionado com o NuPack você pode usar o comando:_**Remove-Package NomePacote**_[caption id="attachment_1735" align="aligncenter" width="300" caption="NuPack Remove-Package"][![NuPack Remove-Package](http://viniciusquaiato.com/images_posts/Remove-Package-300x300.png "NuPack Remove-Package")](http://viniciusquaiato.com/images_posts/Remove-Package.png)[/caption]

### Alguns vídeos sobre NuPack
Alguns vídeos sobre o NuPack podem ser vistos aqui: [http://nupack.codeplex.com/wikipage?title=Screencasts](http://nupack.codeplex.com/wikipage?title=Screencasts)É isso aê, vamos usar, dar feedback, e curtir esse projeto que realmente é MUITO bom!!!

Abraços,
Vinicius Quaiato
