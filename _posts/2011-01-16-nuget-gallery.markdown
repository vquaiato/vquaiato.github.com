--- 
layout: post
title: NuGet Gallery
wordpress_id: 2844
wordpress_url: http://viniciusquaiato.com/blog/?p=2844
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: NuGet
  slug: nuget
  autoslug: nuget
- title: MVCTestsEx
  slug: mvctestsex
  autoslug: mvctestsex
---
Fala galera, não sei se todos acompanharam mas a [NuGet Gallery](http://nuget.org) está disponível já em um site: [http://nuget.org](http://nuget.org).Se você não sabe ainda o que é NuGet [confira estes posts sobre o NuGet](http://viniciusquaiato.com/blog/tag/nuget/).

## NuGet Gallery - nuget.org


[![NuGet Gallery home](http://viniciusquaiato.com/images_posts/NuGet-Gallery-home-300x223.png "NuGet Gallery home")](http://viniciusquaiato.com/images_posts/NuGet-Gallery-home.png)



No site é possível ver todos os pacotes disponíveis e realizar uma pesquisa dentre eles:[![NuGet Gallery listagem de pacotes](http://viniciusquaiato.com/images_posts/Listagem-pacotes-300x223.png "NuGet Gallery listagem de pacotes")](http://viniciusquaiato.com/images_posts/Listagem-pacotes.png)



## Cadastro NuGet Gallery


Desta forma a contribuição com pacotes para o [NuGet](http://nuget.codeplex.com) ficou muito mais simples.Para enviar um pacote é preciso realizar um cadastro no portal:[![NuGet Gallery registro](http://viniciusquaiato.com/images_posts/NuGet-Gallery-registro-300x223.png "NuGet Gallery registro")](http://viniciusquaiato.com/images_posts/NuGet-Gallery-registro.png)



Você receberá um email de confirmação.**Atenção!** Apenas realizar o cadastro não é suficiente! Você precisará responder o email de confirmação dizendo qual ou quais projetos você quer submeter para o NuGet Gallery, veja abaixo:[![Verificacao Email NuGet Gallery](http://viniciusquaiato.com/images_posts/Verificacao-Email-300x166.png "Verificacao Email NuGet Gallery")](http://viniciusquaiato.com/images_posts/Verificacao-Email.png)

Como a própria mensagem diz, você só precisa de um login se for submeter um pacote, caso contrário pode usar a galeria sem um.

## Contribuindo NuGet Gallery


Após termos sido aprovados e nosso login liberado podemos acessar a aba contribute sem problemas.[![NuGet Gallery Contribute](http://viniciusquaiato.com/images_posts/NuGet-Gallery-Contribute-300x208.png "NuGet Gallery Contribute")](http://viniciusquaiato.com/images_posts/NuGet-Gallery-Contribute.png)



Aqui podemo enviar um novo pacote, gerenciar nossos pacotes ou ainda reservar um nome para um pacote futuro.Quando vamos enviar um pacote(escreverei um próximo post mostrando como criar pacotes NuGet) podemos escolher um pacote para upload ou informar um url para um pacote que esteja na web:[![NuGet Gallery enviando pacote](http://viniciusquaiato.com/images_posts/NuGet-Gallery-enviando-pacote-300x208.png "NuGet Gallery enviando pacote")](http://viniciusquaiato.com/images_posts/NuGet-Gallery-enviando-pacote.png)



Após enviar um arquivo do tipo .nupkg(que veremos em um próximo post) uma tela para edição dos detalhes do pacote é exibida.[![NuGet Gallery editando detalhes do pacote enviado](http://viniciusquaiato.com/images_posts/NuGet-Gallery-editando-detalhes-do-pacote-enviado-300x208.png "NuGet Gallery editando detalhes do pacote enviado")](http://viniciusquaiato.com/images_posts/NuGet-Gallery-editando-detalhes-do-pacote-enviado.png)



O passo final é selecionar uma imagem, uma espécie de ícone, para o pacote. Após este último passo em algum tempo o pacote deve estar disponível na galeria.[![NuGet Gallery escolhendo imagem para o pacote](http://viniciusquaiato.com/images_posts/NuGet-Gallery-escolhendo-imagem-para-o-pacote-300x208.png "NuGet Gallery escolhendo imagem para o pacote")](http://viniciusquaiato.com/images_posts/NuGet-Gallery-escolhendo-imagem-para-o-pacote.png)



Se fizermos a pesquisa na galeria, poderemos ver nosso pacote:[![Pacote aparecendo na NuGet Gallery](http://viniciusquaiato.com/images_posts/Pacote-aparecendo-na-NuGet-Gallery-300x208.png "Pacote aparecendo na NuGet Gallery")](http://viniciusquaiato.com/images_posts/Pacote-aparecendo-na-NuGet-Gallery.png)



## MVCTestsEx
O projeto que eu submeti é o MVCTestsEx, um projeto Open Source que eu estou desenvolvendo. Este projeto tem por intuito facilitar a escrita de testes de unidade no ASP.NET MVC, fornecendo uma série de helpers para trabalharmos.Mais informações podem ser encontradas no [github](http://github.com) do projeto: [http://github.com/vquaiato/MVCTestsEx](https://github.com/vquaiato/MVCTestsEx).

## Resumo
Vimos como ficou fácil adicionar um pacote no NuGet. Não é mais necessário fazer um fork do projeto, etc, agora basta gerarmos o pacote e submetermos na NuGet Gallery.Em poucos segundos o projeto já está disponível tanto no site quanto no Package Manager Console no Visual Studio.Espero que isso incentive mais e mais devs da plataforma .NET a contirbuírem com projetos Open Source.

Abraços,
Vinicius Quaiato.
