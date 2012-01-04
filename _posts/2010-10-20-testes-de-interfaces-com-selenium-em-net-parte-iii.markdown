--- 
layout: post
title: Testes de interfaces com Selenium em .NET parte III
wordpress_id: 1782
wordpress_url: http://viniciusquaiato.com/blog/?p=1782
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: Selenium
  slug: selenium
  autoslug: selenium
- title: Selenium IDE
  slug: selenium-ide
  autoslug: selenium-ide
- title: Selenium RC
  slug: selenium-rc
  autoslug: selenium-rc
- title: Selenium Server
  slug: selenium-server
  autoslug: selenium-server
- title: Testes interface
  slug: testes-interface
  autoslug: testes-interface
- title: "testes integra\xC3\xA7\xC3\xA3o"
  slug: testes-integracao
  autoslug: "testes-integra\xC3\xA7\xC3\xA3o"
---
[![Automation](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/automation-150x150.jpg "Automation")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/automation.jpg)Neste post mostrarei a utilização dos testes automatizados de interface, ou testes de integração, de forma mais programática.Utilizaremos código C# para a criação de nossos testes com [Selenium RC](http://seleniumhq.org/projects/remote-control/), desta forma poderemos colocar os testes de interface em nossa solution e executá-los com nosso teste runner preferido, integrá-los às nossas build tasks, etc.

### O projeto ASP.NET MVC
Continuaremos utilizando o projeto ASP.NET MVC do post anterior, que [pode ser conferido aqui](http://viniciusquaiato.com/blog/testes-de-interfaces-com-selenium-em-net-parte-ii/).

### Criar o código C# usando o Selenium IDE
Vamos utilizar o teste que tínhamos salvo com o [Selenium IDE](http://seleniumhq.org/projects/ide/) para criar o nosso teste em C# ([veja o post anterior](http://viniciusquaiato.com/blog/testes-de-interfaces-com-selenium-em-net-parte-ii/)). Isso é bastante trivial, basta utilizarmos o menu **_Options >> Format >> C#_**:[caption id="attachment_1783" align="aligncenter" width="272" caption="Convertando teste case Selenium em código teste C#"][![Convertando teste case Selenium em código teste C#](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/convertando-teste-em-teste-csharp-272x300.png "Convertando teste case Selenium em código teste C#")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/convertando-teste-em-teste-csharp.png)[/caption]Com isso teremos o seguinte código utilizando o Selenium RC:[caption id="attachment_1785" align="aligncenter" width="287" caption="Codigo csharp gerado para Selenium RC"][![Codigo csharp gerado para Selenium RC](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Codigo-csharp-gerado-Selenium-RC-287x300.png "Codigo csharp gerado para Selenium RC")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Codigo-csharp-gerado-Selenium-RC.png)[/caption]Podemos reparar que o código que utiliza o Selenium RC foi gerado e é possível copiarmos o mesmo. Uma outra opção é exportarmos estes testes para um arquivo .cs:[caption id="attachment_1786" align="aligncenter" width="288" caption="Exportando testsuite para arquivo csharp com Selenium RC"][![Exportando testsuite para arquivo csharp com Selenium RC](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/exportando-testsuite-para-arquivo-csharp-com-Selenium-RC-288x300.png "Exportando testsuite para arquivo csharp com Selenium RC")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/exportando-testsuite-para-arquivo-csharp-com-Selenium-RC.png)[/caption]Feito isso, salve e adicione o arquivo a um projeto de testes em nossa solution.

### Adicionando referências ao Selenium RC no projeto
Precisamos adicionar a referência para a DLL do Selenium RC ao nosso projeto de testes. Basta adicionar a DLL que foi baixada anteriormente (caso você não saiba como, [veja aqui neste post, na parte do Selenium RC](http://viniciusquaiato.com/blog/testes-de-interfaces-com-selenium-em-net/)).[caption id="attachment_1788" align="aligncenter" width="300" caption="Adicionando referencia para o Selenium RC"][![Adicionando referencia para o Selenium RC](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/adicionando-referencia-para-o-Selenium-RC-300x225.png "Adicionando referencia para o Selenium RC")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/adicionando-referencia-para-o-Selenium-RC.png)[/caption]Podemos reparar que o código gerado utiliza o NUnit para rodar os testes. Para adicionar a referência do NUnit eu vou utilizar o NuPack, é claro! (Infelizmente o Selenium ainda não está disponível =/ )[caption id="attachment_1790" align="aligncenter" width="300" caption="Adicionando referencia NUnit usando NuPack"][![Adicionando referencia NUnit usando NuPack](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/adicionando-referencia-NUnit-usando-NuPack-300x124.png "Adicionando referencia NUnit usando NuPack")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/adicionando-referencia-NUnit-usando-NuPack.png)[/caption]Feito isso já podemos executar os nossos testes. Eu utilizo o test runner do R#, mas o runner do NUnit vai funcionar da mesma forma.[caption id="attachment_1791" align="aligncenter" width="300" caption="Executando testes com Selenium RC"][![Executando testes com Selenium RC](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Executando-testes-com-Selenium-RC-300x121.png "Executando testes com Selenium RC")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Executando-testes-com-Selenium-RC.png)[/caption]Como podemos reparar nosso teste falhou, e a mensagem de erro nos diz que não foi possível conectar ao servidor. Isso quer dizer que precisamos iniciar o Selenium Server.

### Iniciando o Selenium Server e rodando os testes
O Selenium Server vem junto com o Selenium RC. Como mostrado no post anterior [(veja aqui](http://viniciusquaiato.com/blog/testes-de-interfaces-com-selenium-em-net-parte-ii/)), vamos executar nosso bat para iniciar o Selenium Server.Feito isso podemos rodar nossos testes novamente:[caption id="attachment_1792" align="aligncenter" width="300" caption="Executando testes com Selenium RC e Selenium Server"][![Executando testes com Selenium RC e Selenium Server](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Executando-testes-com-Selenium-RC-e-Selenium-Server-300x145.png "Executando testes com Selenium RC e Selenium Server")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Executando-testes-com-Selenium-RC-e-Selenium-Server.png)[/caption]Caso você obtenha um erro pedindo para adicionar o Firefox 3 ao Path, faça isso.O Selenium por padrão inicia o Firefox utilizando o chrome launcher. E se não encontra o firefox retorna este erro.Você pode especificar um browser de sua escolha alterando a linha abaixo:
{% highlight csharp %}
selenium = new DefaultSelenium("localhost", 4444, "*chrome", "http://localhost:1115");
    
{% endhighlight %}
para
{% highlight csharp %}
selenium = new DefaultSelenium("localhost", 4444, "*custom C:\Program Files (x86)\Mozila Firefox\firefox.exe", "http://localhost:1115");
    
{% endhighlight %}
Isto funcionará para qualquer browser que você tenha, e que o Selenium RC suporte.No [trunk do Selenium Server](http://svn.openqa.org/fisheye/browse/selenium-rc/trunk/server-coreless/src/main/java/org/openqa/selenium/server/browserlaunchers/BrowserLauncherFactory.java?r=2703) podemos ver uma lista dos browsers suportados:- firefoxproxy
- firefox
- chrome
- firefoxchrome
- firefox2
- firefox3
- iexploreproxy
- safari
- safariproxy
- iehta
- iexplore
- opera
- piiexplore
- pifirefox
- konqueror
- mock
- googlechrome


### Em resumo
Desta forma vimos como executar nossos testes utilizando Selenium RC e Selenium Server. Ainda estamos com uma parte manual em nossos testes que é iniciar o Selenium Server. Veremos como resolver isso em um próximo post.Com a utilização do Selenium RC, e o conhecimento da API, os comandos e métodos disponíveis, a escrita dos testes começa a ficar mais simples. Podemos "abandonar" o Selenium IDE e passar a escrever os testes já através do nosso projeto .NET. É apenas uma questão de obter alguma fluência na tecnologia.É importante lembrar que testes de interface são frágeis. Talvez demore um pouco para entender os pormenores, compreender os detalhes e os pontos de fragilidade, e começar a escrever bons testes. Mas é para isso que somos pagos: escrever bons softwares, que são possíveis passando por bons testes.É isso galera, tão logo eu experimente mais do Selenium colocarei mais novidades aqui. Se tudo der certo o próximo post será sobre o [Selenium Grid](http://selenium-grid.seleniumhq.org/).

Abraços,
Vinicius Quaiato.
