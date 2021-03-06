--- 
layout: post
title: "IronRuby + WPF: Abrindo janelas de di\xC3\xA1logo"
wordpress_id: 1460
wordpress_url: http://viniciusquaiato.com/blog/?p=1460
categories: 
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
tags: 
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
- title: Wpf
  slug: wpf
  autoslug: wpf
- title: Dialogs
  slug: dialogs
  autoslug: dialogs
---


Fala galera, este post é bem curto, apenas para mostrar como abrir janelas de diálogo no WPF utilziando IronRuby ([veja outro exemplo simples aqui](http://viniciusquaiato.com/blog/ironruby-rodando-ruby-dentro-do-net/)).Estou montando alguns exemplos para a palestra de IronRuby no [TDC 2010](http://thedevelopersconference.com.br/), e resolvi colocar algumas coisas aqui.Vou fazer tudo no console, então digite os comandos de cada linha e pressione enter no console do IronRuby.Inicie o Command do Windows e digite ir (adicione o IronRuby no Path, para facilitar).
{% highlight csharp %}
require 'PresentationFramework'require 'PresentationCore'#este é o namespace onde temos alguns dialogsinclude Microsoft::Win32#este namespace tem o dialog de impressãoinclude System::Windows::Controlsfile_dialog = OpenFileDialog.newfile_dialog.ShowDialogsave_file = SaveFileDialog.newsave_file.ShowDialogprint_dialog = PrintDialog.newprint_dialog.ShowDialog
{% endhighlight %}
Com isso teremos algo como:[![Save File Dialog em WPF com IronRuby](http://viniciusquaiato.com/images_posts/save-300x283.png "Save File Dialog em WPF com IronRuby")](http://viniciusquaiato.com/images_posts/save.png)



[![Open File Dialog em WPF com IronRuby](http://viniciusquaiato.com/images_posts/open-300x181.png "Open File Dialog em WPF com IronRuby")](http://viniciusquaiato.com/images_posts/open.png)



[![Print File Dialog em WPF com IronRuby](http://viniciusquaiato.com/images_posts/print-300x222.png "Print File Dialog em WPF com IronRuby")](http://viniciusquaiato.com/images_posts/print.png)

Você também pode salvar estes comandos em um arquivo, por exemplo dialogs.rb.Depois no cmd digite "ir dialogs.rb" e os dialogs serão abertos =)É isso galera. No T[DC 2010 tem mais exemplos de IronRuby](http://viniciusquaiato.com/blog/palestras-e-eventos/) com WinForms, WPF, Silverlight e integração com C#. Não percam!

Abraços,
Vinicius Quaiato.
