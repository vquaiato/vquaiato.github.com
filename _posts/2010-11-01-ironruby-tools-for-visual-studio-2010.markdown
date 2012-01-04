--- 
layout: post
title: IronRuby tools for Visual Studio 2010
wordpress_id: 1963
wordpress_url: http://viniciusquaiato.com/blog/?p=1963
categories: 
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
tags: 
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
- title: IronRuby no Visual Studio
  slug: ironruby-no-visual-studio
  autoslug: ironruby-no-visual-studio
- title: IronRuby tools vs2010
  slug: ironruby-tools-vs2010
  autoslug: ironruby-tools-vs2010
---
[![http://www.flickr.com/photos/roundrabbit/2846774316/](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/craftsman-tools-150x150.jpg "craftsman tools")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/craftsman-tools.jpg)Como eu já [publiquei aqui](http://viniciusquaiato.com/blog/iron-entregues-para-a-comunidade/), o IronRuby(e IronPython) foram entregues para a comunidade, e com isso já temos uma versão [Alpha do IronRuby](http://ironruby.codeplex.com/releases/view/49097), juntamente com as ferramentas do IronRuby para o Visual Studio 2010.Já é possível [fazer o download](http://ironruby.codeplex.com/releases) e instalar os complementos necessários para criar projetos IronRuby utilizando o Visual Studio 2010.São adicionados alguns templates de projeto que já facilitam a integração com a IDE e a execução dos mesmos.

## Instalando IronRuby para Visual Studio 2010
O instalador desta nova versão é um arquivo .msi padrão. Faça o download aqui:[http://ironruby.codeplex.com/releases](http://ironruby.codeplex.com/releases)Antes de executar/instalar o arquivo, remova outras versões do IronRuby ou do IronPython que você possua. **É uma versão Alpha e por isso existem erros e incompatibilidades ainda!!!**Após remover, execute o instalador. É um setup no melhor estilo [NNF](http://www.urbandictionary.com/define.php?term=Next%20next%20finish).

## Templates de projeto IronRuby no Visual Studio 2010
Após terminada a instalção os seguintes templates de projeto serão adicionado ao seu Visual Studio 2010:[![IronRuby Tools for Visual Studio 2010](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/New-Project_2010-10-29_17-02-10-300x190.png "Templates IronRuby para o Visual Studio 2010")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/New-Project_2010-10-29_17-02-10.png)- IronRuby - Console Applicaton
- IronRuby - Ruby Gem
- IronRuby - Ruby on Rails Application
- IronRuby - Sinatra Web Application
- IronRuby - Silverlight Web Page


## Criando um projeto IronRuby no Visual Studio 2010
Vamos criar uma primeira aplicação utilizando o Visual Studio 2010 e o IronRuby. Vamos criar uma aplicação Console mesmo, apenas para ver a integração do VS com o IronRuby.Selecione a opção "Console Application". Será aberta a seguinte tela:[caption id="attachment_1973" align="aligncenter" width="300" caption="ConsoleApplication IronRuby Visual Studio 2010"][![ConsoleApplication IronRuby Visual Studio 2010](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/ConsoleApplication_IronRuby_VisualStudio2010-300x173.png "ConsoleApplication IronRuby Visual Studio 2010")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/ConsoleApplication_IronRuby_VisualStudio2010.png)[/caption]O problema com esse código é que ele vai executar e a console irá fechar na sequência. Pressione F5 para rodar sua aplicação. Isso mesmo, assim como executamos qualquer aplicação no Visual Studio, basta pressionar F5.Para que nossa aplicação execute e pare, vamos mudar o código para:
{% highlight c# %}
include Systemputs "Hello Visual Studio 2010 using IronRuby"Console.ReadKey
{% endhighlight %}
O que fazemos é utilizar o namespace System, para podermos usar a classe Console. Agora se executarmos nossa aplicação teremos:[caption id="attachment_1975" align="aligncenter" width="300" caption="Rodando Console Application Com IronRuby usando VisualStudio 2010"][![Rodando Console Application Com IronRuby usando VisualStudio 2010](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Rodando_Console_Application_Com_IronRuby_VisualStudio_2010-300x200.png "Rodando Console Application Com IronRuby usando VisualStudio 2010")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Rodando_Console_Application_Com_IronRuby_VisualStudio_2010.png)[/caption]

## Visual Studio 2010 mostrando erros de syntax no IronRuby
Com a integração do IronRuby no VS2010 podemos ver quando estamos cometendo algum erro de sintaxe. Isso é bastante interessante, pois apesar de não termos a compilação o Visual Studio consegue saber se estamos escrevendo Ruby da maneira correta:[caption id="attachment_1976" align="aligncenter" width="300" caption="Visual Studio 2010 exibindo Syntax error no IronRuby"][![Visual Studio 2010 exibindo Syntax error no IronRuby](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Syntax-error-300x173.png "Visual Studio 2010 exibindo Syntax error no IronRuby")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Syntax-error.png)[/caption]Neste caso o erro é mostrado pois como estou trabalhando com um block inline não preciso da keyword **do**.

## Debugando IronRuby no Visual Studio 2010
É possível debugar as aplicações IronRuby no VS2010 também. O problema é que, ao menos na minha máquina, eu não consegui inspecionar os valores de variáveis.[caption id="attachment_1978" align="aligncenter" width="300" caption="Debugando IronRuby no Visual Studio 2010"][![Debugando IronRuby no Visual Studio 2010](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Debugando-IronRuby-no-Visual-Studio-2010-300x173.png "Debugando IronRuby no Visual Studio 2010")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Debugando-IronRuby-no-Visual-Studio-2010.png)[/caption]

## Finalizando...
Este foi um primeiro olhar sobre as ferramentas do IronRuby para o VS2010. Continuaremos a explorar as mesmas e acompanhar seu desenvolvimento.Confesso que estou fazendo um esforço para olhar o os fontes e tentar de alguma maneira contribuir como committer, quem sabe.

## IronPython Tools
Não poderia ter deixado de dizer que também já existem ferramentas para trabalhar com IronPython no Visual Studio 2010. As ferramentas do IronPython já haviam sido lançadas antes dos projetos Iron* serem entregues para as comunidaes, portanto está mais estável e funcional que a versão do IronRuby.Confira aqui: [http://ironpython.net/tools/](http://ironpython.net/tools/)Sugestões e críticas são bem vindas, façam seus comentários.

Abraços,
Vinicius Quaiato.
