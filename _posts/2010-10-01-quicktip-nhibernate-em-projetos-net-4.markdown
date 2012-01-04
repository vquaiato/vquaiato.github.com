--- 
layout: post
title: "QuickTip: NHibernate em projetos .NET 4"
wordpress_id: 1621
wordpress_url: http://viniciusquaiato.com/blog/?p=1621
categories: 
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
tags: 
- title: NHibernate
  slug: nhibernate
  autoslug: nhibernate
- title: Fluent NHibernate
  slug: fluent-nhibernate
  autoslug: fluent-nhibernate
- title: target framework
  slug: target-framework
  autoslug: target-framework
- title: client profile
  slug: client-profile
  autoslug: client-profile
---
Estes dias estava preparando um post utilizando [NHibernate](http://nhforge.org/Default.aspx) em um projeto .NET 4.0 quando me deparei com as seguintes mensagens de erro:[![](http://viniciusquaiato.com/images_posts/nh-300x107.png "NHibernate System.Web")](http://viniciusquaiato.com/images_posts/nh.png)Na verdade são warnings, no entanto por causa destes warnings eu não conseguia utilizar nenhuma classe do [NHibernate](http://nhforge.org/Default.aspx) ou do [Fluent NHibernate](http://fluentnhibernate.org/). Não fazia sentido para mim o NHibernate ser dependente de System.Web, afinal, eu deveria poder utilizar o NH normalmente em um projeto desktop, console, etc.Então discutindo com um grande conhecedor do NHibernate (a.k.a [@tucaz](http://twitter/com/tucaz)) ele mencionou de que como o build do NH está sendo feito com o target framework 3.5, meu projeto 4.0 provavelmente estava utilizando o target framework: [.NET Framework 4.0 Client Profile](http://msdn.microsoft.com/en-us/library/cc656912.aspx), que é um subset do framework otimizado.Então eu alterei para: .NET Framework 4.0 e tudo voltou ao normal.Para fazer isso selecione seu projeto no Solution Explorer, presisone "alt + Enter" e a janela de propriedades se abrirá. Então na lista "Target framework" altere conforme mostrado abaixo:[caption id="attachment_1623" align="aligncenter" width="300" caption=".NET framework 4.0"][![.NET framework 4.0](http://viniciusquaiato.com/images_posts/ALTERANDO-PROFILE-300x172.png ".NET framework 4.0")](http://viniciusquaiato.com/images_posts/ALTERANDO-PROFILE.png)[/caption]Agora o projeto compila normalmente.

Abraços,
Vinicius Quaiato.
