--- 
layout: post
title: "Dom\xC3\xADnios pr\xC3\xB3prios no Windows Azure"
wordpress_id: 2898
wordpress_url: http://viniciusquaiato.com/blog/?p=2898
categories: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
- title: "Dom\xC3\xADnio"
  slug: dominio
  autoslug: "dom\xC3\xADnio"
- title: "Dom\xC3\xADnio pr\xC3\xB3prio"
  slug: dominio-proprio
  autoslug: "dom\xC3\xADnio-pr\xC3\xB3prio"
- title: "Windows Azure dom\xC3\xADnio pr\xC3\xB3prio"
  slug: windows-azure-dominio-proprio
  autoslug: "windows-azure-dom\xC3\xADnio-pr\xC3\xB3prio"
---
Quando criamos uma aplicação no [Windows Azure](http://viniciusquaiato.com/blog/category/windows-azure/) a mesma é disponibilizada com uma URI do tipo: minhaaplicacao.cloudapp.net.Ok, não é uma URI tão feia mas não atende minhas necessidades de negócio, aifnal, quero que meu site/aplicação tenha um nome único e que o identifiquem no "mercado". Me faz lembrar dos hpg.com.br ou cjb.net.Quero poder configurar meu domínio próprio para minhas aplicações no Windows Azure.

## Obtendo o domínio
Bom registrar um domínio não está bem no escopo deste post, mas aconselho vocês a visitarem o [godaddy.com](http://godaddy.com) para domínios internacionais e o [registro.br](http://registro.br) para nacionais.

## Configurando o domínio para usar com o Windows Azure
Não há nenhuma configuração que você precise fazer no Windows Azure para utilizar seu domínio próprio. Você não registra seu domínio no portal do Azure nem nada do tipo. O que fazemos é registrar uma entrada CNAME no DNS do nosso domínio. Isto é feito pois o Azure não pode nos garantir o IP em que nossa aplicação estará, afinal ele pode mudá-la de máquina, e fazemos isso simplesmente por realizar um [Swap VIP](http://viniciusquaiato.com/blog/deploy-no-windows-azure-portal/), por exemplo. O DNS que o Azure nos fornece é: minhaaplicacao.cloudapp.net.

## Configurando uma entrada CNAME
Não é possível configurar uma entrada do tipo A no DNS do nosso domínio pois não temos um IP fornecido pelo Azure, e não podemos colocar o DNS que ele nos fornece como uma entrada A. Vamos então criar uma entrada CNAME mapeando para www. Meu domínio está registrado no Godaddy, mas no seu gerenciador de DNS deve ser algo parecido com isso:[caption id="attachment_2996" align="aligncenter" width="300" caption="Criando entrada CNAME para www"][![Criando entrada CNAME para www](http://viniciusquaiato.com/images_posts/cname-www-300x102.png "Criando entrada CNAME para www")](http://viniciusquaiato.com/images_posts/cname-www.png)[/caption]Feito isso estamos dizendo que o subdomain www irá apontar para nossa aplicação no Windows Azure.

## Removendo o www da url
Eu não gosto de digitar www e nem http, mas da forma como configuramos o www é a única maneira de acessar no aplicação. Se digitarmos sem o www teremos um erro. Vamos então fazer um redirecionamento da raíz do nosso domínio para www, simples não? Assim quando acessarmos o endereço sem o www teremos um redirect automático para a entrada www que aponta para o Windows Azure. Êta![caption id="attachment_3000" align="aligncenter" width="300" caption="Redirecionando domínio para www"][![Redirecionando domínio para www](http://viniciusquaiato.com/images_posts/forward-300x140.png "Redirecionando domínio para www")](http://viniciusquaiato.com/images_posts/forward.png)[/caption]

## Propagação das mudanças
É importante dizer que estas mudanças podem levar algum tempo para fazerem efeito. No caso do MVC Summit levou mais do que algumas horas. Em alguns casos a propagação das mudanças pode chegar a 48 horas. Após propagadas as mudanças pelos servidores DNS mundo a fora você já pode acessar sua aplicação no Windows Azure com seu domínio próprio, com ou sem o www: [http://mvcsummit.net](http://mvcsummit.net) ou [www.mvcsummit.net](http://www.mvcsummit.net).Mais informações [veja aqui](http://blog.smarx.com/posts/custom-domain-names-in-windows-azure).

Abraços,
Vinicius Quaiato.
