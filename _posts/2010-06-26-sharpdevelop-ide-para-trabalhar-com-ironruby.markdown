--- 
layout: post
title: SharpDevelop - IDE para trabalhar com IronRuby
wordpress_id: 1106
wordpress_url: http://viniciusquaiato.com/blog/?p=1106
categories: 
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
tags: 
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
- title: Windows Forms
  slug: windows-forms
  autoslug: windows-forms
- title: SharpDevelop
  slug: sharpdevelop
  autoslug: sharpdevelop
- title: IDE
  slug: ide
  autoslug: ide
---


Pesquisando algumas IDEs para trabalhar com [IronRuby](http://ironruby.codeplex.com/), já que o Visual Studio não possui suporte, pelo menos ainda, encontrei o [SharpDevelop](http://www.icsharpcode.net/opensource/sd/)._([mais sobre IronRuby aqui](http://viniciusquaiato.com/blog/category/ironruby/))_A IDE é bastante legal, se parece um pouco com o Visual Studio, apesar de ter menos funcionalidades.[![Splash screen SharpDevelop](http://viniciusquaiato.com/images_posts/splash-300x149.jpg "Splash screen SharpDevelop")](http://viniciusquaiato.com/images_posts/splash.jpg)



Dentre as funcionalidades com IronRuby é possível trabalhar com console, classes, e Windows Forms.Senti falta de um intellisense, mas ok, eu posso sobreviver sem isso. Me faz deixar de ser preguiçoso e estudar mais o framework e a linguagem \o/Após instalar e executar o SharpDevelop temos a seguinte tela:[![Tela inicial SharpDevelop](http://viniciusquaiato.com/images_posts/inicial-300x181.jpg "Tela inicial SharpDevelop")](http://viniciusquaiato.com/images_posts/inicial-1024x621.jpg)



Vamos então criar uma nova solution para trabalhar com IronRuby (File -> New -> Solution):[![Criando solution IronRuby no SharpDevelop](http://viniciusquaiato.com/images_posts/Criando-solution-300x260.jpg "Criando solution IronRuby no SharpDevelop")](http://viniciusquaiato.com/images_posts/Criando-solution.jpg)



Interessante, o trabalho já começa a ser facilitado hein. =DTemos então nosso Windows Form:[![Windows Form com SharpDevelop e IronRuby](http://viniciusquaiato.com/images_posts/Form-300x182.jpg "Windows Form com SharpDevelop e IronRuby")](http://viniciusquaiato.com/images_posts/Form-1024x622.jpg)



O código que ele gera é em IronRuby:[![Código WinForm gerado em IronRuby com SharpDevelop](http://viniciusquaiato.com/images_posts/codigo-gerado-300x182.jpg "Código WinForm gerado em IronRuby com SharpDevelop")](http://viniciusquaiato.com/images_posts/codigo-gerado-1024x622.jpg)



Agora vamos para o design do nosso Form, e vamos adicionar 3 controles da toolbox na tela:[![Controles no WinForm com SharpDevelop e IronRuby](http://viniciusquaiato.com/images_posts/controles-300x182.jpg "Controles no WinForm com SharpDevelop e IronRuby")](http://viniciusquaiato.com/images_posts/controles-1024x622.jpg)



E só pra brincar vamos adicionar um evento no click do botão. Quando clicarmos no botão pegaremos a data selecionada no DateTimePicker e adicionaremos no ListBox, como pode ser visto no código da imagem abaixo:[![Click botão WinForms com IronRuby no SharpDevelop](http://viniciusquaiato.com/images_posts/click-300x182.jpg "Click botão WinForms com IronRuby no SharpDevelop")](http://viniciusquaiato.com/images_posts/click-1024x622.jpg)



E quando executamos a aplicação, tudo funciona perfeitamente.[![Rodando WinForms com IronRuby no SharpDevelop](http://viniciusquaiato.com/images_posts/rodando-300x180.jpg "Rodando WinForms com IronRuby no SharpDevelop")](http://viniciusquaiato.com/images_posts/rodando-1024x616.jpg)

É isso galera, a idéia era mostrar o SharpDevelop e como ele pode auxiliar na criação de aplicativos utilizando IronRuby.Com certeza escreverei mais coisas sobre ele ou utilizando-o.

Abraços,
Vinicius Quaiato.
