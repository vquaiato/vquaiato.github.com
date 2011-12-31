--- 
layout: post
title: "QuickTip: Obter o diret\xC3\xB3rio de execu\xC3\xA7\xC3\xA3o de um Assembly em C#"
wordpress_id: 1591
wordpress_url: http://viniciusquaiato.com/blog/?p=1591
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: C#
  slug: c
  autoslug: c#
- title: tips
  slug: tips
  autoslug: tips
- title: quick tip
  slug: quick-tip
  autoslug: quick-tip
- title: Assembly
  slug: assembly
  autoslug: assembly
- title: Directory
  slug: directory
  autoslug: directory
---
Essa necessidade surge bastante na escrita de testes: Como pegar o diretório de execução de um assembly?Para obter o diretório basta utilizar o fragmento de código abaixo:
{% highlight csharp %}
var diretorio = Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location);
{% endhighlight %}
É dica rápida mesmo!Abraços,Vinicius Quaiato.
