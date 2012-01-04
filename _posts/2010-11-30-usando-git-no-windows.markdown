--- 
layout: post
title: Usando Git no Windows
wordpress_id: 2251
wordpress_url: http://viniciusquaiato.com/blog/?p=2251
categories: 
- title: Projetos
  slug: projetos
  autoslug: projetos
tags: 
- title: git
  slug: git
  autoslug: git
- title: github
  slug: github
  autoslug: github
- title: msysgit
  slug: msysgit
  autoslug: msysgit
- title: git no windows
  slug: git-no-windows
  autoslug: git-no-windows
- title: git com .NET
  slug: git-com-net
  autoslug: git-com-.net
- title: github no windows
  slug: github-no-windows
  autoslug: github-no-windows
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/github-profile-200x300.png "github-profile")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/github-profile.png)Bom, para quem ainda não sabe [Git](http://git-scm.com/) é um [sistema de controle de versão distribuído](http://en.wikipedia.org/wiki/Distributed_Version_Control_System). Esqueça o mundo [TFS](http://en.wikipedia.org/wiki/Team_Foundation_Server) um pouco, pois o Git é bem diferente dele!Este não é exatamente um post sobre o que é um controle de versão distribuído, suas características ou benefícios. Este é um post que mostra como configurar um ambiente para trabalhar com Git(e GitHub) no Windows.

## Instalando o msysgit
De uma forma simples podemos dizer que [Msysgit](http://code.google.com/p/msysgit/) é uma forma de habilitar o uso de Git no Windows (há um pouco mais de informações que estou omitindo, mas você pode conferir [aqui](http://www.mingw.org/wiki/MSYS) e [aqui](http://www.ohloh.net/p/msysgit).).Faça o download aqui do msysgit: [http://code.google.com/p/msysgit/](http://code.google.com/p/msysgit/).A instalação é no padrão NNF, então, não se preocupe.

## O bash
Teremos então um bash instalado. Esse [bash](http://www.gnu.org/software/bash/) é parte do [MSys](http://www.mingw.org/wiki/MSYS). Com ele é que vamos trabalhar com o Git. E como estamos usando o MSysGit, temos então um bash para Git.Basicamente está tudo pronto. Já podemos criar um repositório e começar a trabalhar.Abra o bash e digite algo como:
{% highlight csharp %}
cd "c:\Users\SeuUser\Desktop"mkdir "RepositorioQualquer"cd "RepositorioQualquer"git init
{% endhighlight %}
Pronto! Você verá a seguinte mensagem:[caption id="attachment_2253" align="aligncenter" width="300" caption="Criando Repositorio Git no Windows"][![Criando Repositorio Git no Windows](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/Criando-Repositorio-300x87.png "Criando Repositorio Git no Windows")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/Criando-Repositorio.png)[/caption]Para ver um tutorial mais completo de Git dê uma xeretada [aqui no gittutorial](http://www.kernel.org/pub/software/scm/git/docs/gittutorial.html)._**"git init"**_ é o comando necessário para criar um repositório com Git. Simples assim.

## Integrando o Git com o GitHub no Windows
O legal de usar Git é o [GitHub](http://github.com). Como o nome já diz o GitHub é um hub de usuários e projetos Git. Alguns dos maiores e mais importantes projetos estão no GitHub: Linux, Rails, Apache, Jquery, Castle.ActiveRecord, IronRuby e [muitos outros](https://github.com/repositories).O GitHub atua como uma rede social. Você pode seguir outros devs, ser seguido. Acompanhar repositórios, etc. Vale dar uma fuçada.Para que você se conecte ao GitHub usando o msysgit você precisa gerar uma chave localmente e informar essa chave para o GitHub. Vou assumir que você já [criou sua conta no GitHub](https://github.com/signup/free).É algo muito simples, abra o bash instalado anteriormente e digite:
{% highlight csharp %}
cd ~/.sshssh-keygen -t rsa -C "seuemail@provedor.com"
{% endhighlight %}
Quando esta mensagem aparecer:
{% highlight csharp %}
Enter file in which to save the key (/c/Users/SeuUser/.ssh/id_rsa):
{% endhighlight %}
Apenas pressione Enter.Feito isso você será solicitado para informar uma senha (passphrase). Digite uma senha(que você se lembre!) e depois confirme.Pronto você deverá ver a uma mensagem parecida com esta:
{% highlight csharp %}
Your identification has been saved in /c/Users/SeuUser/.ssh/id_rsa.Your 
public key has been saved in /c/Users/SeuUser/.ssh/id_rsa.pub.The key fingerprint is:e8:ae:60:8f:38:c2:98:1d:6d:84:60:8c:9e:dd:47:81 seuemail@provedor.com
{% endhighlight %}
Agora abra o arquivo id_rsa.pub gerado (abrir com -> Notepad) e copie todo o conteúdo dele.Vá ao **_GitHub -> Account Settings -> SSH Public Keys_**.Clique em "Add another 
public key". Dê um título para ela (eu uso id_rsa mesmo). E o conteúdo do arquivo id_rsa.pub que você copiou cole ele todo no campo key.Pronto pode salvar.Este processo só precisa ser feito uma vez. Bastante simples.Você pode testar se tudo está ok abrindo bash e digitando:
{% highlight csharp %}
ssh git@github.com
{% endhighlight %}
Se tudo der certo sua senha(passphrase) será solicitada e você receberá uma mensagem semelhante a esta:[caption id="attachment_2265" align="aligncenter" width="300" caption="github ssh"][![github ssh](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/ssh-300x39.png "github ssh")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/ssh.png)[/caption](se você tiver problemas, pode conferir este [tutorial sobre a geração da key](http://help.github.com/msysgit-key-setup/) também.)Agora você só precisa criar um repositório no GitHub e logo em seguida ele lhe dará as informações sobre como enviar do seu repositório local para o repositório do GitHub.Você pode aprender um pouco mais sobre Git [aqui](http://www.kernel.org/pub/software/scm/git/docs/gittutorial.html).Existem alguns [livros sobre Git](http://www.amazon.co.uk/s/ref=nb_sb_noss?url=search-alias%3Daps&field-keywords=git&x=0&y=0) na Amazon também.

## Resuminho
O Git é um DVCS muito bacana. Aliado ao GitHub chega a ser fantástico (confesso que estou gostando muito de trabalhar mais e mais com ele).É MUITO legal trabalhar com bash (depois postarei sobre Git + Powershell). Recomendo fortemente que vocês exercitem um pouco a linha de comando: É produtiva!Olhem um pouco além do TFS e do SVN: vale a pena! É bom conhecer coisas novas e questionar o que já conhecemos. Isso nos faz crescer.Espero que vocês curtam a experiência, pois é muito bacana!Meu usuário lá é vquaiato: [https://github.com/vquaiato](https://github.com/vquaiato). Dá pra ver meus projetos, fazer fork, contribuir, etc.

Abraços,
Vinicius Quaiato.
