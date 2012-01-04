--- 
layout: post
title: "Nodejs no Windows: Agora \xC3\xA9 poss\xC3\xADvel!"
wordpress_id: 3793
wordpress_url: http://viniciusquaiato.com/blog/?p=3793
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: NodeJs
  slug: nodejs
  autoslug: nodejs
- title: Nodejs no Windows
  slug: nodejs-no-windows
  autoslug: nodejs-no-windows
- title: node.exe
  slug: node-exe
  autoslug: node.exe
---
Fala galera está disponível o primeiro release do [Nodejs](http://nodejs.org/) com suporte nativo para rodar no Windows.O post oficial no blog do [Nodejs](http://blog.nodejs.org/) pode ser conferido aqui: [http://blog.nodejs.org/2011/07/14/node-v0-5-1/](http://blog.nodejs.org/2011/07/14/node-v0-5-1/).Este post também traz o executável para o windows: node.exe. Exatamente como havia sido prometido há algum tempo pelo time do Node: [Porting Node to Windows with Microsoft's help](http://blog.nodejs.org/2011/06/23/porting-node-to-windows-with-microsoft%e2%80%99s-help/).

## Executando Nodejs no Windows
Após realizar o download do [node.exe aqui](http://nodejs.org/dist/v0.5.1/node.exe) vamos criar uma aplicação simples.Crie um arquivo windows.js com o seguinte código:
{% highlight csharp %}
var http = require('http');
    http.createServer(function (req, res) {  res.writeHead(200, {
Content-Type': 'text/plain'}
);
    res.end('Hello World\n');
    }
).listen(1234, "127.0.0.1");
    console.log('Server running at http://127.0.0.1:1234/');
    
{% endhighlight %}
Isto criará um servidor na porta 1234 respondendo com "Hello World" para todos os requests.Para iniciar o servidor node execute o comando abaixo no cmd ou no powershell:
{% highlight csharp %}
.\node.exe windows.js
{% endhighlight %}
Você verá uma mensagem como a abaixo:[caption id="attachment_3794" align="aligncenter" width="300" caption="rodando nodejs no windows"][![rodando nodejs no windows](http://viniciusquaiato.com/images_posts/rodando-nodejs-no-windows-300x108.png "rodando nodejs no windows")](http://viniciusquaiato.com/images_posts/rodando-nodejs-no-windows.png)[/caption]E quando acessarmos esta url receberemos a resposta do servidor node:[caption id="attachment_3795" align="aligncenter" width="300" caption="rodando nodejs no windows - browser"][![rodando nodejs no windows - browser](http://viniciusquaiato.com/images_posts/rodando-nodejs-no-windows-browser-300x138.png "rodando nodejs no windows - browser")](http://viniciusquaiato.com/images_posts/rodando-nodejs-no-windows-browser.png)[/caption]É isso aew galera. Agora já podemos rodar Nodejs em servidores Windows de forma nativa e sem nenhuma trabalho de instalação, um simples executável. Notem que isso já torna o Nodejs facimente executável no [Windows Azure](http://viniciusquaiato.com/blog/tag/windows-azure/). <o/Para saber mais sobre o Nodejs: [http://www.nodebeginner.org/](http://www.nodebeginner.org/)Abraços,Vinicius Quaiato.
