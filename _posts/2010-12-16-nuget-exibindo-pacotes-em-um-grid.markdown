--- 
layout: post
title: NuGet exibindo pacotes em um Grid
wordpress_id: 2365
wordpress_url: http://viniciusquaiato.com/blog/?p=2365
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: NuGet
  slug: nuget
  autoslug: nuget
- title: Powershell
  slug: powershell
  autoslug: powershell
- title: Out-GridView
  slug: out-gridview
  autoslug: out-gridview
- title: NuGet Grid
  slug: nuget-grid
  autoslug: nuget-grid
- title: NuGet filtros
  slug: nuget-filtros
  autoslug: nuget-filtros
---
Fala galera. Já falei sobre o [NuGet](http://nuget.codeplex.com/) antes, então confiram [aqui](http://viniciusquaiato.com/blog/videos-pelestra-sobre-nuget-do-dnad-2010/), [aqui](http://viniciusquaiato.com/blog/aprenda-os-comandos-para-adicionar-pacotes-com-nupack/), [aqui](http://viniciusquaiato.com/blog/aprenda-os-comandos-de-listagem-do-nupack/) e [aqui](http://viniciusquaiato.com/blog/nupack-uma-das-melhores-invencoes-da-microsoft/).Desta vez quero mostrar algo que pode ser útil para quem está procurando um pacote mas não sabe qual.

## O Cmdlet Out-GridView
Powershell. Já disse isso antes: corra estudar um pouco de powershell, é bacana.Como o console do NuGet roda no [Powershell](http://technet.microsoft.com/pt-br/library/bb978526.aspx) podemos utilizar Cmdlets do PowerShell.Um destes Cmdlets bacanas é o [Out-GridView](http://technet.microsoft.com/en-us/library/ff730930.aspx).O que este Cmdlet faz é pegar uma saída e canalizar em um GridView. Habilitando filtros e seleções.Vamos ver na prática isso acontecendo, abra o console do NuGet no Visual Studio 2010 e digite:
{% highlight csharp %}
List-Package -Remote | Out-GridView
{% endhighlight %}
Isto quer dizer que a saída do comando List-Package será jogada para o commando Out-GridView, produzindo o seguinte resultado:[caption id="attachment_2392" align="aligncenter" width="300" caption="NuGet com out-gridview cmdlet"][![NuGet com out-gridview cmdlet](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/NuGet_com_out-gridview-300x171.png "NuGet com out-gridview cmdlet")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/NuGet_com_out-gridview.png)[/caption]Wow! Incrível!E nesse grid podemos brincar filtrando pacotes NuGet por nome:[caption id="attachment_2393" align="aligncenter" width="300" caption="NuGet com out-gridview cmdlet filtrando por nome"][![NuGet com out-gridview cmdlet filtrando por nome](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/NuGet_com_out-gridview_e_filtro-300x171.png "NuGet com out-gridview cmdlet filtrando por nome")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/NuGet_com_out-gridview_e_filtro.png)[/caption]Nice and clever!Adicionando critérios para filtros de pacotes do NuGet no GridView:[caption id="attachment_2394" align="aligncenter" width="300" caption="NuGet com out-gridview adicionando critérios para filtros"][![NuGet com out-gridview adicionando critérios para filtros](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/NuGet_com_out-gridview_e_filtro_adicionando_criterios-300x171.png "NuGet com out-gridview adicionando critérios para filtros")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/NuGet_com_out-gridview_e_filtro_adicionando_criterios.png)[/caption]Feito isso podemos filtrar pelos critérios que adicionamos:[caption id="attachment_2395" align="aligncenter" width="300" caption="NuGet com out-gridview filtrando por critérios"][![NuGet com out-gridview filtrando por critérios](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/NuGet_com_out-gridview_e_filtro_por_criterios-300x171.png "NuGet com out-gridview filtrando por critérios")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/NuGet_com_out-gridview_e_filtro_por_criterios.png)[/caption]É isso aê galera. NuGet + Powershell podem ser bem bacanas se usados juntos e com sabedoria.O [Out-GridView](http://technet.microsoft.com/en-us/library/ff730930.aspx) **não** faz parte do NuGet e sim do PowerShell. Sendo assim funciona com qualquer saída de comando.

Abraços,
Vinicius Quaiato.
