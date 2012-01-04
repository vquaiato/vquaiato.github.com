--- 
layout: post
title: "Windows Azure: preparando o ambiente de desenvolvimento"
wordpress_id: 2674
wordpress_url: http://viniciusquaiato.com/blog/?p=2674
categories: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
- title: Ambiente Azure
  slug: ambiente-azure
  autoslug: ambiente-azure
- title: Ambiente Desenvovlimento Azure
  slug: ambiente-desenvovlimento-azure
  autoslug: ambiente-desenvovlimento-azure
---
[![](http://viniciusquaiato.com/images_posts/windows-azure-platform-headline.jpg "windows-azure-platform-headline")](http://viniciusquaiato.com/images_posts/windows-azure-platform-headline.jpg)Eu confesso que não tinha muita pretensão de falar sobre [Windows Azure](http://www.microsoft.com/windowsazure/) tão cedo. Realmente acreditei que ele fosse demorar um pouco para bater à porta. Fiz o [QuantoEh](http://viniciusquaiato.com/blog/quantoeh-calculadora-social-via-twitter/) utilizando Azure, mas foi uma brincadeira. Agora é diferente: preciso desenvolver uma aplicação utilizando Azure. Então decidi compartilhar um pouco com vocês essa minha primeira experiência em 2011. Quero compartilhar um pouco dos conceitos, estratégias e claro muito código à medida que eu mesmo for progredindo nos estudos e desenvolvimento. [![](http://viniciusquaiato.com/images_posts/banner_5.jpg "MS0974_Banners_111810")](http://viniciusquaiato.com/images_posts/banner_5.jpg)Para começar então vamos preparar nosso ambiente. Desenvolver para Windows Azure não requer muitas ferramentas e nem muita configuração, é bastante simples. Nos posts que virão vou explicar um pouco o que é e o que pode ser feito com o Windows Azure e então vamos começar a "brincar" de forma prática.

### Instalando as ferramentas de desenvolvimento do Windows Azure
Antes de instalarmos as ferramentas de desenvolvimento do Windows Azure precisamos instalar alguns pré-requisitos para que tudo funcione corretamente. 

##

## Visual Studio
O [atual release do Windows Azure](http://msdn.microsoft.com/en-us/windowsazure/cc974146.aspx) funciona apenas com Visual Studio 2010, mas não se preocupe você pode utilizar o Visual Studio Web Developer 2010 Express: [faça o download gratuito aqui](http://www.microsoft.com/express/web/).

##

## Sql Server(express)
É necessário o Sql Server instalado na máquina. Pode ser utilizado na versão express tanto do 2005 quanto 2008. O [Sql Express 2005 pode ser baixado aqu](http://www.microsoft.com/downloads/en/details.aspx?familyid=220549B5-0B07-4448-8848-DCC397514B41&displaylang=en)i.O [Sql Express 2008 pode ser baixado aqui](http://www.microsoft.com/express/Database/).E se você possui o Sql Server instalado, funcionará também.

##

## Internet Information Services 7. 0 
É necessário ter instalado e habilitado o IIS 7. 0 ou superior com suporte para ASP.NET.[Confira aqui como habilitar o IIS 7](http://msdn.microsoft.com/en-us/library/gg465715.aspx#IIS).

##

## Azure Tools & SDK for Visual Studio
Agora vamos instalar as ferramentas do Azure para trabalharmos com Visual Studio e o SDK do Windows Azure.Faça o download direto [neste link aqui](http://care.dlservice.microsoft.com/dd/download/3/3/2/3321A9FA-64C3-463F-981A-4E17FC29B15B/VSCloudService.exe?lcid=1033&cprod=azurepd).Estas ferramentas instalarão os templates de projetos e outras tools necessárias ao desenvolvimento de aplicações para o Windows Azure utilizando o Visual Studio e também instalarão o SDK do Windows Azure. No momento é tudo que precisamos.

##

## Standalone Windows Azure SDK
Se você não quer trabalhar com Visual Studio você pode instalar apenas o SDK do Windows Azure: [Standalone SDK x64](http://download.microsoft.com/download/3/3/2/3321A9FA-64C3-463F-981A-4E17FC29B15B/WindowsAzureSDK-x64.exe) ou [Standalone SDK x86](http://download.microsoft.com/download/3/3/2/3321A9FA-64C3-463F-981A-4E17FC29B15B/WindowsAzureSDK-x86.exe).Pronto, agora você está com o ambiente configurado para começar a acompanhar os posts que virão.

Abraços,
Vinicius Quaiato.
