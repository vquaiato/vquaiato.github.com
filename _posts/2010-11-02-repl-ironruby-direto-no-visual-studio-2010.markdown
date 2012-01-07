--- 
layout: post
title: REPL IronRuby direto no Visual Studio 2010
wordpress_id: 1985
wordpress_url: http://viniciusquaiato.com/blog/?p=1985
categories: 
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
tags: 
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
- title: REPL
  slug: repl
  autoslug: repl
- title: IronRuby tools vs2010
  slug: ironruby-tools-vs2010
  autoslug: ironruby-tools-vs2010
- title: IronRuby Tools
  slug: ironruby-tools
  autoslug: ironruby-tools
- title: IronRuby REPL Visual Studio 2010
  slug: ironruby-repl-visual-studio-2010
  autoslug: ironruby-repl-visual-studio-2010
---


Fala galera, é apenas uma "quick tip" das ferramentas do IronRuby para o Visual Studio 2010: rodar o REPL do IronRuby diretamente dentro do Visual Studio 2010.Após instalarmos as ferramentas do IronRuby para o VS2010 ([mostrado aqui](http://viniciusquaiato.com/blog/ironruby-tools-for-visual-studio-2010/)), temos a opção de rodar o ambiente REPL diretamente no Visual Studio. Com isso conseguimos realmente tirar proveito do REPL, afinal se estamos codificando IronRuby no VS não precisamos executar a aplicação para ver como funciona um determinado comando ou uma determinada estrutura que queremos executar, podemos simplesmente abrir o REPL e fazer este teste.Notem que não estamos falando de testar a aplicação, este é um teste de linguagem, é para verificarmos se a construção está certa, se um objeto possui os métodos que queremos, ou ainda se eles funcionam da forma como queremos, não tem nada a ver com funcionalidades de uma aplicação.Para abrir o REPL no VS2010 vá no menu **_Tools >> IronRuby Tools >> IronRuby Interactive_**.Podemos também utilizar o atalho **_ALT + R_**.[![Abrir REPL Visual Studio 2010](http://viniciusquaiato.com/images_posts/Abrir-REPL-Visual-Studio-2010-300x149.png "Abrir REPL Visual Studio 2010")](http://viniciusquaiato.com/images_posts/Abrir-REPL-Visual-Studio-2010.png)



Com o REPL aberto podemos experimentar o código que queremos executar, por exemplo:[![REPL IronRuby dentro do Visual Studio 2010](http://viniciusquaiato.com/images_posts/REPL-IronRuby-dentro-do-Visual-Studio-2010-300x203.png "REPL IronRuby dentro do Visual Studio 2010")](http://viniciusquaiato.com/images_posts/REPL-IronRuby-dentro-do-Visual-Studio-2010.png)



Reparem também como é simples fazer parse de um search no twitter utilizando Ruby.O REPL dentro do VS também possui alguns botões para nos auxiliarem:[![REPL buttons no Visual Studio 2010](http://viniciusquaiato.com/images_posts/REPL-buttons-300x68.png "REPL buttons no Visual Studio 2010")](http://viniciusquaiato.com/images_posts/REPL-buttons.png)

Da esquerda para a direita, os botões fazem:- "Parar a execução do comando atual"
- "Limpar o conteúdo do REPL"
- "Resetar para um ambiente novo, mas manter o histórico de comandos"
- 
É isso galera, espero que vocês consigam utilizar e aproveitar mais um pouco do IronRuby no Visual Studio 2010 e continuem explorando esta linguagem fenomenal que é o Ruby em conjunto com o .NET.

Abraços,
Vinicius Quaiato.
