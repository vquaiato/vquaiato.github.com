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
Pesquisando algumas IDEs para trabalhar com [IronRuby](http://ironruby.codeplex.com/), já que o Visual Studio não possui suporte, pelo menos ainda, encontrei o [SharpDevelop](http://www.icsharpcode.net/opensource/sd/)._([mais sobre IronRuby aqui](http://viniciusquaiato.com/blog/category/ironruby/))_A IDE é bastante legal, se parece um pouco com o Visual Studio, apesar de ter menos funcionalidades.[caption id="attachment_1107" align="aligncenter" width="300" caption="Splash screen SharpDevelop"][![Splash screen SharpDevelop](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/splash-300x149.jpg "Splash screen SharpDevelop")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/splash.jpg)[/caption]Dentre as funcionalidades com IronRuby é possível trabalhar com console, classes, e Windows Forms.Senti falta de um intellisense, mas ok, eu posso sobreviver sem isso. Me faz deixar de ser preguiçoso e estudar mais o framework e a linguagem \o/Após instalar e executar o SharpDevelop temos a seguinte tela:[caption id="attachment_1108" align="aligncenter" width="300" caption="Tela inicial SharpDevelop"][![Tela inicial SharpDevelop](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/inicial-300x181.jpg "Tela inicial SharpDevelop")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/inicial-1024x621.jpg)[/caption]Vamos então criar uma nova solution para trabalhar com IronRuby (File -> New -> Solution):[caption id="attachment_1110" align="aligncenter" width="300" caption="Criando solution IronRuby no SharpDevelop"][![Criando solution IronRuby no SharpDevelop](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/Criando-solution-300x260.jpg "Criando solution IronRuby no SharpDevelop")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/Criando-solution.jpg)[/caption]Interessante, o trabalho já começa a ser facilitado hein. =DTemos então nosso Windows Form:[caption id="attachment_1111" align="aligncenter" width="300" caption="Windows Form com SharpDevelop e IronRuby"][![Windows Form com SharpDevelop e IronRuby](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/Form-300x182.jpg "Windows Form com SharpDevelop e IronRuby")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/Form-1024x622.jpg)[/caption]O código que ele gera é em IronRuby:[caption id="attachment_1118" align="aligncenter" width="300" caption="Código WinForm gerado em IronRuby com SharpDevelop"][![Código WinForm gerado em IronRuby com SharpDevelop](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/codigo-gerado-300x182.jpg "Código WinForm gerado em IronRuby com SharpDevelop")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/codigo-gerado-1024x622.jpg)[/caption]Agora vamos para o design do nosso Form, e vamos adicionar 3 controles da toolbox na tela:[caption id="attachment_1112" align="aligncenter" width="300" caption="Controles no WinForm com SharpDevelop e IronRuby"][![Controles no WinForm com SharpDevelop e IronRuby](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/controles-300x182.jpg "Controles no WinForm com SharpDevelop e IronRuby")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/controles-1024x622.jpg)[/caption]E só pra brincar vamos adicionar um evento no click do botão. Quando clicarmos no botão pegaremos a data selecionada no DateTimePicker e adicionaremos no ListBox, como pode ser visto no código da imagem abaixo:[caption id="attachment_1120" align="aligncenter" width="300" caption="Click botão WinForms com IronRuby no SharpDevelop"][![Click botão WinForms com IronRuby no SharpDevelop](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/click-300x182.jpg "Click botão WinForms com IronRuby no SharpDevelop")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/click-1024x622.jpg)[/caption]E quando executamos a aplicação, tudo funciona perfeitamente.[caption id="attachment_1116" align="aligncenter" width="300" caption="Rodando WinForms com IronRuby no SharpDevelop"][![Rodando WinForms com IronRuby no SharpDevelop](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/rodando-300x180.jpg "Rodando WinForms com IronRuby no SharpDevelop")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/06/rodando-1024x616.jpg)[/caption]É isso galera, a idéia era mostrar o SharpDevelop e como ele pode auxiliar na criação de aplicativos utilizando IronRuby.Com certeza escreverei mais coisas sobre ele ou utilizando-o.

Abraços,
Vinicius Quaiato.
