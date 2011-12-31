--- 
layout: post
title: Testes de interfaces com Selenium em .NET
wordpress_id: 1638
wordpress_url: http://viniciusquaiato.com/blog/?p=1638
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: testes
  slug: testes
  autoslug: testes
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
- title: Testes web
  slug: testes-web
  autoslug: testes-web
- title: testes automatizados
  slug: testes-automatizados
  autoslug: testes-automatizados
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/computer-monkey-210.jpg "computer-monkey-210")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/computer-monkey-210.jpg)Testar software é importante - fato! Existem algumas maneiras de testar software. Se podemos automatizar algum tipo de teste isso quer dizer que teremos algum tipo de economia, seja em tempo, dinheiro ou mão de obra (que também significa dinheiro). Pagar um testador não é barato, e a quantidade de testes que ele pode executar é BEM inferior a uma quantidade de testes automatizados a serem executados, devemos então empregar bem este testador e não fazê-lo testar o que pode ser automtizado.Testes de interface gráfica podem ser automatizados, isso significa que tarefas "simples" na interface gráfica de nossas aplicações podem e devem ser automatizadas.

### Selenium
[Selenium](http://seleniumhq.org) é um conjunto de ferramentas que possibilitam o desenvolvimento de testes de interface automatizados para aplicações web.Neste post mostrarei como instalar e configurar tudo para que possamos utilizar o Selenium para automatizar e testar interfaces Web com o apoio do C#.Nos próximos artigos veremos como de fato utilizar o Selenium. 

### Selenium IDE
 [Selenium IDE](http://seleniumhq.org/projects/ide/) é um ambiente de desenvolvimento para os test cases. Esta IDE funciona como um plugin para o Firefox. Este plugin nos auxilia na criação e edição dos test cases.Os testes gerados pelo [Selenium IDE](http://seleniumhq.org/projects/ide/) podem ser executados contra qualquer browser, independente de terem sido criados pelo plugin do firefox.Importante dizer, como a própria [página de licenças](http://seleniumhq.org/about/license.html), que todos os projetos Selenium estão sob a [licença Apache 2.0](http://www.apache.org/licenses/LICENSE-2.0).

### Selenium RC
[Selenium RC](http://seleniumhq.org/projects/remote-control/), ou Selenium Remote Control, é capaz de executar os testes gerados pelo Selenium IDE de forma automatizada através de uma linguagem de programação, seja ela C#, Java, Ruby, Python, etc.Com o Selenium IDE conseguimos automatizar um teste e gerar um código em nossa linguagem preferida, e então automatizar isso com o Selenium RC.

### Selenium Server
Esta é uma ferramenta Java que precisamos iniciar. Basicamente o Selenium RC (as bibliotecas que suportam as linguagens) fará a comunicação com o Selenium Server para abrir o browser e executar as ações necessárias contra as páginas que estamos testando.

### Instalando Selenium IDE
Para este pequeno exemplo utilizarei o google.com mesmo. [Baixe o Selenium IDE aqui](http://release.seleniumhq.org/selenium-ide/1.0.7/selenium-ide-1.0.7.xpi).Instale o Selenium IDE como plugin do Firefox. Se não souber como fazer, apenas peça para abrir o arquivo .xpi com o Firefox e pronto, ele instalará.Feito isso, o IDE já deve estar lá: [caption id="attachment_1701" align="aligncenter" width="249" caption="Selenium IDE instalado"][![Selenium IDE instalado](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Selenium-IDE-instalado-249x300.png "Selenium IDE instalado")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Selenium-IDE-instalado.png)[/caption]

### Instalando Selenium RC
O Selenium RC é na verdade um conjunto de bibliotecas que você utiliza com sua linguagem de programação preferida. No caso do .NET é um conjunto de Dlls. Além disso há um programa Java que é o Selenium Server, sem o qual o Selenium RC não funciona!Faça o [download do Selenium RC aqui](http://selenium.googlecode.com/files/selenium-remote-control-1.0.3.zip) e descompacte o arquivo .zip para um local de sua preferência.[caption id="attachment_1713" align="aligncenter" width="300" caption="Selenium RC e Server"][![Selenium RC e Server](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Selenium-RC-300x221.png "Selenium RC e Server")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Selenium-RC.png)[/caption]Para que possamos executar o Selenium Server precisamos do JDK instalado. Caso você não possua faça o [download do JDK aqui](http://www.oracle.com/technetwork/java/javase/downloads/jdk6-jsp-136632.html).Após o download apenas execute o instalador. Ao término da instalação verifique se o diretório do jdk\bin foi adicionado à variável path de ambiente:**_Meu computador >> propriedades >> configurações avançadas >> variáveis de ambiente_**Caso não tenha sido adicionada, adicione.Para que possamos executar o Selenium Server precisamos rodar a seguinte linha no prompt de comando:
{% highlight csharp %}
java -jar LOCAL_DOWNLOAD_SELENIUM\selenium-server1.versao\selenium-server.jar
{% endhighlight %}
Você deve obter uma tela parecida com esta:[caption id="attachment_1704" align="aligncenter" width="300" caption="Selenium server running"][![Selenium server running](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Selenium-server-running-300x83.png "Selenium server running")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Selenium-server-running.png)[/caption]Para nos auxiliar com esta última etapa, vamos criar um arquivo .bat que fará o start do Selenium Server de forma mais automatizada. Crie um arquivo no notepad com o seguinte conteúdo e salve como selenium-server.bat:
{% highlight csharp %}
@echo offjava -jar LOCAL_DOWNLOAD_SELENIUM_SERVER\selenium-server-1.0.3\selenium-server.jar
{% endhighlight %}
Feito isso, execute este arquivo para ver se o server sobe normalmente. Se subir, basta teclar ctrl + c para finalizar o server.

### Resumo
Se você conseguiu instalar o Selenium IDE, baixar e executar o Selenium Server então seu ambiente está pronto para começarmos a trabalhar com automatização de testes de interface web.Lembrem-se, testar não é algo tão simples no começo, mas é algo que deve ser feito. É imprudente demais não testar, e automatizar nos traz muitos benefícios e economia. Utilize seu testador para atividades inteligentes, afinal, como pessoa ele é muito mais inteligente do que um runner de testes automatizados, então não o utilize como script de testes.Se você está morreno de curiosidade, veja os links no artigo e veja este vídeo do Selenium IDE em ação: [http://seleniumhq.org/movies/intro.mov](http://seleniumhq.org/movies/intro.mov)Abraços, e até o próximo artigo.Vinicius Quaiato.
