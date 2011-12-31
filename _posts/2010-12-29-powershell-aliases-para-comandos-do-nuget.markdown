--- 
layout: post
title: Powershell aliases para comandos do NuGet
wordpress_id: 2636
wordpress_url: http://viniciusquaiato.com/blog/?p=2636
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
- title: Powershell aliases
  slug: powershell-aliases
  autoslug: powershell-aliases
- title: NuGet alias
  slug: nuget-alias
  autoslug: nuget-alias
---
Bom todo programador bom precisa ser lazy. E é por isso que eu acho meio chato digitar todos os comandos do [NuGet](http://viniciusquaiato.com/blog/tag/nuget/) (ainda que o tab auxilie).A grande mágica é que podemos utilizar o recurso de alias do Powershell para melhorar a vida com os comandos do [NuGet](http://viniciusquaiato.com/blog/tag/nuget/).No Powershell podemos definir um alias (apelido) para um comando e forma bastante simples:
{% highlight csharp %}
Set-Alias nome_alias comando
{% endhighlight %}
Então por exemplo, se quero definir um alias para o comando [Test-Path](http://technet.microsoft.com/en-us/library/ff730955.aspx) poderia fazer algo como:
{% highlight csharp %}
Set-Alias tp Test-Path
{% endhighlight %}
Pronto, agora podemos usar o alias tp ao invés de digitar Test-Path.Com o console do [NuGet](http://nuget.codeplex.com) podemos fazer a mesma coisa. O problema é que os aliases vão existir enquanto o powershell estiver aberto.Para manter manter o alias sempre que fecharmos e abrirmos o Powershell precisamos alterar o profile do Powershell (aqui vai um muito obrigado à [Sara Barbosa](http://sarajbarbosa.wordpress.com/) [[@Sarabarbosa](http://twitter.com/Sarabarbosa)]que é uma IT pro sabida dessas coisas).Vamos abrir o Visual Studio e o Package Manager Console. Este console é um console Powershell.Vamos então abrir o profile dele:
{% highlight csharp %}
notepad $profile
{% endhighlight %}
Uma janela do notepad será aberta:[caption id="attachment_2642" align="aligncenter" width="300" caption="editando profile do console nuget"][![editando profile do console nuget](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/editando-profile-do-console-nuget-300x159.png "editando profile do console nuget")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/editando-profile-do-console-nuget.png)[/caption]Vamos colocar neste arquivo os nossos aliases e depois simplesmente salvar:
{% highlight csharp %}
Set-Alias lspkg Get-PackageSet-Alias ip Install-PackageSet-Alias up Uninstall-Package
{% endhighlight %}
Feito isso podemos recarregar o profile com o seguinte comando:
{% highlight csharp %}
.$profile
{% endhighlight %}
Percebam que existe um "."(ponto) antes do $profile.E como resultado podemos utilizar nossos aliases:[caption id="attachment_2644" align="aligncenter" width="150" caption="Utilizando alias lspkg ao invés de Get-Package"][![Utilizando alias lspkg ao invés de Get-Package](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/lspkg-150x150.png "Utilizando alias lspkg ao invés de Get-Package")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/lspkg.png)[/caption][caption id="attachment_2643" align="aligncenter" width="150" caption="Utilizando alias ip ao invés de Install-Package"][![Utilizando alias ip ao invés de Install-Package](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/install-150x150.png "Utilizando alias ip ao invés de Install-Package")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/install.png)[/caption][caption id="attachment_2645" align="aligncenter" width="150" caption="Utilizando alias up ao invés de Uninstall-Package"][![Utilizando alias up ao invés de Uninstall-Package](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/uninstall-150x150.png "Utilizando alias up ao invés de Uninstall-Package")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/uninstall.png)[/caption]É isso aê galera, simples, rápido e prático. Para deixar até o [Juan Lopes](http://twitter.com/juanplopes) feliz.Abraços,Vinicius Quaiato.
