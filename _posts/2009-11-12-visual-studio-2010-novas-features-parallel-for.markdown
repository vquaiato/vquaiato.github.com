--- 
layout: post
title: Visual Studio 2010 - Novas Features - Parallel For
wordpress_id: 157
wordpress_url: http://viniciusquaiato.com/blog/?p=157
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
tags: 
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: VS2010
  slug: vs2010
  autoslug: vs2010
- title: Novidades
  slug: novidades
  autoslug: novidades
---
Fala Galera!Alguns de vocês já conheciam os as Parallels Extensions do .NET que eram distribuídas para testes.Agora no Visual Studo 2010 as Parallels Extensions estão disponívels no framework 4.0.Vejam abaixo como é simples realizar um laço for de maneira paralela, ou seja, cada iteração do laço será disparada paralelamente à outra:
{% highlight csharp %}
using System.Threading.Tasks;
    Parallel.For(0, 100,        (int i) =>        {            Console.WriteLine(i.ToString());
    }
    );
    
{% endhighlight %}
O que acontece é bem simples, passamos o primeiro valor para a iteração (0) e passamos o último valor (100) [note que o 0 é inclusivo e o 100 é exclusivo!].Como terceiro parâmetro passamos uma Action<int>, que neste caso utilizamos uma lambda que será o corpo do laço.Simples!Existem outras ferramentas de suporte à programação paralela. E em breve passarei aqui mais informações!Algumas outras informações podem ser encontradas aqui: [http://channel9.msdn.com/posts/DanielMoth/VS2010-Parallel-Computing-Features-Tour](http://channel9.msdn.com/posts/DanielMoth/VS2010-Parallel-Computing-Features-Tour/)Faça o Download do Visual Studio 2010 beta 2: [http://msdn.microsoft.com/pt-br/vstudio/dd582936.aspx](http://msdn.microsoft.com/pt-br/vstudio/dd582936.aspx)Abraços,Vinicius Quaiato.</int>
