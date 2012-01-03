--- 
layout: post
title: Aprenda os comandos para adicionar pacotes com NuPack
wordpress_id: 2020
wordpress_url: http://viniciusquaiato.com/blog/?p=2020
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: NuPack
  slug: nupack
  autoslug: nupack
- title: NuGet
  slug: nuget
  autoslug: nuget
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/pacotes-150x150.jpg "pacotes")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/pacotes.jpg)Vimos anteriormente como utilizar os comandos e opções de listagens de pacotes utilizando o NuPack. (Se você não sabe o que é o NuPack dê uma olhada [aqui](http://viniciusquaiato.com/blog/aprenda-os-comandos-de-listagem-do-nupack/), [aqui](http://viniciusquaiato.com/blog/nupack-uma-das-melhores-invencoes-da-microsoft/) e [aqui](http://unplugged.giggio.net/unplugged/post/NuPack-porque-voce-deveria-se-importar.aspx)).Agora vamos ver os comandos e opções para adicionarmos pacotes utilizando o NuPack.

## Comandos para adicionar pacotes com NuPack
Assim como os comandos de listagem os comandos para adicionar pacotes podem receber alguns parâmetros que interferem na forma como funcionam.Estes parâmetros têm por objetivo dar maior flexibilidade e poder ao NuPack e seus comandos.Para adicionar um pacote ao projeto o comando básico a ser utilizado é: 
{% highlight csharp %}
Add-Package nome_pacote
{% endhighlight %}
Um exemplo para adicionarmos o pacote NUnit para testes de unidade seria:
{% highlight csharp %}
Add-Package nunit
{% endhighlight %}
Feito isso o pacote NUnit e suas dependências, se houverem, serão instaladas.

### Adicionando pacotes e ignorando dependências
Quando adicionamos um pacote que possui dependências o NuPack fará o download e as adicionará automáticamente, veja um exemplo com o pacote Castle.Windsor:[caption id="attachment_2052" align="aligncenter" width="300" caption="add-package no NuPack com Dependencias"][![add-package no NuPack com Dependencias](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/add-package_nupack_com_dependencias-300x129.png "add-package no NuPack com Dependencias")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/add-package_nupack_com_dependencias.png)[/caption]Se não quisermos baixar as dependências (por alguma razão) basta utilizarmos o argumento -IgnoreDependencies:
{% highlight csharp %}
Add-Package Nome_Pacote -IgnoreDependencies
{% endhighlight %}
Com isso apenas o pacote solicitado será instalado e suas dependências não. Tome cuidado pois isso provavelmente irá prejudicar o uso do pacote.[caption id="attachment_2054" align="aligncenter" width="300" caption="add-package NuPack IgnoreDependencies"][![add-package NuPack IgnoreDependencies](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/add-package__nupack_ignoredependencies-300x129.png "add-package NuPack IgnoreDependencies")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/add-package__nupack_ignoredependencies.png)[/caption]

### Instalando uma versão específica de um pacote com NuPack
Caso queiramos instalar uma versão de um pacote, mas não a versão mais atual, precisamos dizer para o NuPack qual versão é esta. Fazemos isso de forma bastante simples com o argumento -Version:
{% highlight csharp %}
Add-Package Nome_Pacote -Version 1.0.0
{% endhighlight %}
Por exemplo, o Ninject possui 2 versões disponíveis pelo NuPack, para instalar a mais velha preciso informar:
{% highlight csharp %}
Add-Package Ninject 2.0.1.0
{% endhighlight %}
Caso contrário (até o momento de escrita deste artigo) o pacote 2.1.0.76 seria instalado.**Eu não consegui com que esse comando funcionasse. Eu sempre obtenho um erro:**[caption id="attachment_2057" align="aligncenter" width="300" caption="add-package NuPack usando -version dá erro"][![add-package NuPack usando -version dá erro](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/add-package_nupack_-version_error-300x76.png "add-package NuPack usando -version dá erro")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/add-package_nupack_-version_error.png)[/caption]Se repararmos no console do NuPack ele possui uma lista dos projetos da nossa solution para informar em qual projeto devemos adicionar o pacote:[caption id="attachment_2059" align="aligncenter" width="300" caption="projeto default consoel NuPack"][![projeto default consoel NuPack](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/projeto_default-300x115.png "projeto default consoel NuPack")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/projeto_default.png)[/caption]Mas agora nós somos "caras legais" que gostam de linha de comando (eu gosto :D) então queremos dizer em qual projeto o pacote será adicionado usando o shell mesmo, para nisso temos o argumento -Project:
{% highlight csharp %}
Add-Package nome_pacote -Project nome_projeto
{% endhighlight %}
Vejamos abaixo como adicionar o NUnit ao projeto de testes da solution:
{% highlight csharp %}
Add-Package NUnit -Project ProjetoDeTestes
{% endhighlight %}
[caption id="attachment_2061" align="aligncenter" width="300" caption="add-package nupack argumento -project "][![add-package nupack argumento -project ](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/add-package_nupack_-project-300x177.png "add-package nupack argumento -project ")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/add-package_nupack_-project.png)[/caption]

### Em resumo...
O NuPack ([Já renomeado para "NuGet"](http://haacked.com/archive/2010/10/29/nupack-is-now-nuget.aspx)) possui comandos interessantes para adicionarmos os pacotes. Confesso que estou com problemas em alguns deles e por isso nem mencionei algumas funcionalidades.Ainda assim, e um produto lançado como alpha ainda, e vale muito olharmos para ele, vale!Ao que parece o pessoal está bastante aberto a aceitar contribuições, e já estão com issues cadastrados lá no [codeplex](http://nuget.codeplex.com/workitem/list/basic). Colaborar pode ser o simples ato de criar uma issue e dar um report lá.Já foi lançado também uma [versão 0.2 deste alpha do NuPack](http://nuget.codeplex.com/releases/view/54662), mas eu instalei e tive problemas com comandos simples como Add-Package Nunit. Então decidi nem mostrar nada ainda deste novo build.

Abraços,
Vinicius Quaiato.
