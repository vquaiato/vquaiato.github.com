--- 
layout: post
title: "Quick Tip: Criar menu Ribbon em WPF"
wordpress_id: 3316
wordpress_url: http://viniciusquaiato.com/blog/?p=3316
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: Wpf
  slug: wpf
  autoslug: wpf
- title: Ribbon
  slug: ribbon
  autoslug: ribbon
- title: Menu Ribbon
  slug: menu-ribbon
  autoslug: menu-ribbon
- title: WPF Ribbon
  slug: wpf-ribbon
  autoslug: wpf-ribbon
---
Fala galera, essa dica é bem rápida(talvez eu detalhe mais depois). Estou trabalhando em uma aplicação [WPF](http://windowsclient.net/wpf/default.aspx) e precisei criar um menu e optei por utilizar [Ribbon](http://en.wikipedia.org/wiki/Ribbon_(computing)).# Microsoft Ribbon for WPF
A Microsoft disponibiliza uma biblioteca para criação de Ribbons no WPF - Microsoft Ribbon for WPF - e a mesma pode ser baixada [aqui](http://www.microsoft.com/downloads/en/details.aspx?FamilyID=2bfc3187-74aa-4154-a670-76ef8bc2a0b4&displaylang=en).O código fonte também pode ser obtido no mesmo link.# Criando um menu Ribbon em WPF
Vamos criar então uma aplicação utilizando o template de projeto do Visual Studio adicionado pela instalação da biblioteca, como mostra abaixo:[caption id="attachment_3317" align="aligncenter" width="300" caption="Template de Aplicacao Ribbon em WPF"][![Template de Aplicacao Ribbon em WPF](http://viniciusquaiato.com/blog/wp-content/uploads/2011/04/Template-de-Aplicacao-Ribbon-em-WPF-300x182.png "Template de Aplicacao Ribbon em WPF")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/04/Template-de-Aplicacao-Ribbon-em-WPF.png)[/caption]Feito isso teremos um projeto WPF criado com uma janela já preparada para acessar a biblioteca de Ribbons. Além disso essa janela já possui um menu criado com alguns botões desta forma fica bastante simples ver como manipular o menu, adicionar e remover opções:[caption id="attachment_3318" align="aligncenter" width="300" caption="Janela WPF Ribbon criada no Visual Studio"][![Janela WPF Ribbon criada no Visual Studio](http://viniciusquaiato.com/blog/wp-content/uploads/2011/04/Janela-WPF-Ribbon-criada-no-Visual-Studio-300x239.png "Janela WPF Ribbon criada no Visual Studio")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/04/Janela-WPF-Ribbon-criada-no-Visual-Studio.png)[/caption]O código do Ribbon criado é bastante simples e intuitivo, segue abaixo:
{% highlight csharp %}
 
{% endhighlight %}
Vejam que dentro de um Ribbon é criado uma RibbonTab e dentor dela são criados grupos com botões. É batsante simples.É isso aê galera, tá aí a dica :DAh, a aplicação rodando: [caption id="attachment_3319" align="aligncenter" width="300" caption="Aplicacao WPF com Ribbon"][![Aplicacao WPF com Ribbon](http://viniciusquaiato.com/blog/wp-content/uploads/2011/04/Aplicacao-WPF-com-Ribbon-300x225.png "Aplicacao WPF com Ribbon")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/04/Aplicacao-WPF-com-Ribbon.png)[/caption]Abraços,Vinicius Quaiato.
