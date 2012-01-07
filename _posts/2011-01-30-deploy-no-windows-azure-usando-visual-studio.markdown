--- 
layout: post
title: "Deploy no Windows Azure: Usando o Visual Studio"
wordpress_id: 2912
wordpress_url: http://viniciusquaiato.com/blog/?p=2912
categories: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
- title: Windows Azure deploy
  slug: windows-azure-deploy
  autoslug: windows-azure-deploy
- title: Windows Azure deploy VS2010
  slug: windows-azure-deploy-vs2010
  autoslug: windows-azure-deploy-vs2010
- title: Windows Azure certificado
  slug: windows-azure-certificado
  autoslug: windows-azure-certificado
---
Uma outra forma de realizar o [deploy de aplicações Windows Azure](http://viniciusquaiato.com/blog/deploy-no-windows-azure-portal/) é fazendo tudo diretamente de dentro do Visual Studio 2010.Este post não é, ou não deveria ser, uma cópia do [post do Lucas Romão](http://laromao.wordpress.com/2010/11/23/publicando-sua-app-no-azure-direto-do-visual-studio-2010/), estou apenas compartilhando minhas experiências na plataforma.Precisamos de alguns passos simples para realizar o deploy no Windows Azure diretamente do Visual Studio._É importante notar que isso só precisa ser feito uma única vez, e somente caso você não possua um certificado digital. Depois de configurado basta apertar "Publish" e pronto._

## Criando um certificado digital


O primeiro passo é [criar um certificado digital](http://msdn.microsoft.com/en-us/library/ff683676.aspx). Este certificado funcionará para "selar" sua comunicação com o [portal do Azure](http://windows.azure.com). O que faremos aqui é criar um certificado em nossa máquina e depois informar este certificado no portal do Azure, assim conseguiremos fechar um elo entre os dois.Podemos criar nosso certificado utilizando o [makecert no Command Prompt do Visual Studio](http://msdn.microsoft.com/pt-br/library/bfsktky3(v=vs.80).aspx), mas podemos fazer isso através da interface do Visual Studio 2010 também, o que fica um pouco mais simples.Clique com o botão direito no projeto Azure e então Publish, a seguinte janela se abrirá:[![Criar novo certificado digital](http://viniciusquaiato.com/images_posts/Criar-novo-certificado-digital-300x282.png "Criar novo certificado digital")](http://viniciusquaiato.com/images_posts/Criar-novo-certificado-digital.png)



Selecione a opção "Add" como mostra a imagem e depois "Create":[![Criar novo certificado digital 2](http://viniciusquaiato.com/images_posts/Criar-novo-certificado-digital-2-300x202.png "Criar novo certificado digital 2")](http://viniciusquaiato.com/images_posts/Criar-novo-certificado-digital-2.png)



Será aberta uma janela e você deverá informar um nome para seu certificado(pode ser um nome qualquer):[![Criar novo certificado digital 3](http://viniciusquaiato.com/images_posts/Criar-novo-certificado-digital-3-300x116.png "Criar novo certificado digital 3")](http://viniciusquaiato.com/images_posts/Criar-novo-certificado-digital-3.png)

Com isso o certificado está criado em sua máquina, agora é preciso informá-lo no portal do Azure.

## Adicionando o certificado no portal do Azure


Copie o endereço local do certificado gerado através do Visual Studio clicando neste link:[![Criar novo certificado digital 4](http://viniciusquaiato.com/images_posts/Criar-novo-certificado-digital-4-300x202.png "Criar novo certificado digital 4")](http://viniciusquaiato.com/images_posts/Criar-novo-certificado-digital-4.png)



Isto já copiará para o clipboard o local do certificado digital.Vamos para o portal do [Windows Azure](http://windows.azure.com) (sim é preciso estar cadastrado no portal para realizar um deploy né.).No portal vamos para a área "Hosted SErvices, Storage Accounts & CDN" e depois para "Management Certificates" como mostra a figura abaixo:[![Adicionar certificado portal windows azure](http://viniciusquaiato.com/images_posts/Adicionar-certificado-portal-windows-azure-300x239.png "Adicionar certificado portal windows azure")](http://viniciusquaiato.com/images_posts/Adicionar-certificado-portal-windows-azure.png)



Clicando em "Add Certificate" como mostra o passo 3 da figura acima veremos uma janela para realizar o upload do nosso certificado. Isso é bem simples, como copiamos o path do certificado gerado basta colarmos na janela _após_ clicar em "Browse...":[![Adicionar certificado portal windows azure 2](http://viniciusquaiato.com/images_posts/Adicionar-certificado-portal-windows-azure-2-300x240.png "Adicionar certificado portal windows azure 2")](http://viniciusquaiato.com/images_posts/Adicionar-certificado-portal-windows-azure-2.png)



Feito isso teremos nosso certificado criado no portal do Windows Azure e pronto para uso. O último passo para a integração com o Visual Studio é copiar o Subscription ID. Para isso basta selecionar o certificado na lista de certificados e copiar o ID:[![Adicionar certificado portal windows azure 3](http://viniciusquaiato.com/images_posts/Adicionar-certificado-portal-windows-azure-31-300x239.png "Adicionar certificado portal windows azure 3")](http://viniciusquaiato.com/images_posts/Adicionar-certificado-portal-windows-azure-31.png)



## Adicionando a Subscription ID no Visual Studio


Para finalizar o processo é preciso informar a Subscription ID gerada no Visual Studio:[![Informar Subscription ID no Visual Studio](http://viniciusquaiato.com/images_posts/Informar-Subscription-ID-no-Visual-Studio-300x202.png "Informar Subscription ID no Visual Studio")](http://viniciusquaiato.com/images_posts/Informar-Subscription-ID-no-Visual-Studio.png)



## Configurando Storage Account


Este passo está fora do escopo deste post, mas é preciso ter uma Storage Account configurada e vinculada a estas informações do Visual Studio, mesmo que sua aplicação não esteja utilizando nenhum tipo de Storage.Isso não quer dizer que o deploy vai modificar alguma coisa de Storage, mas esta informação é necessária para concretizar a configuração.[![Finalizando configuração deploy Windows Azure VS2010](http://viniciusquaiato.com/images_posts/Finalizando-e-realizando-deploy-Windows-Azure-VS2010-300x282.png "Finalizando configuração deploy Windows Azure VS2010")](http://viniciusquaiato.com/images_posts/Finalizando-e-realizando-deploy-Windows-Azure-VS2010.png)



Agora nosso deploy está pronto para ser realizado diretamente de dentro do Visual Studio para o Windows Azure:[![Deploy do Windows Azure sendo feito pelo Visual Studio](http://viniciusquaiato.com/images_posts/Deploy-do-Windows-Azure-sendo-feito-pelo-Visual-Studio-300x101.png "Deploy do Windows Azure sendo feito pelo Visual Studio")](http://viniciusquaiato.com/images_posts/Deploy-do-Windows-Azure-sendo-feito-pelo-Visual-Studio.png)



[![Deploy do Windows Azure finalizado pelo Visual Studio](http://viniciusquaiato.com/images_posts/Deploy-do-Windows-Azure-finalizado-pelo-Visual-Studio-300x101.png "Deploy do Windows Azure finalizado pelo Visual Studio")](http://viniciusquaiato.com/images_posts/Deploy-do-Windows-Azure-finalizado-pelo-Visual-Studio.png)



## Resumo
Este pode ter parecido um processo complicado e doloroso, mas acreditem: não é. É tudo bastante simples e trivial, mesmo que você opte por utilizar o makecert é algo bastante tranquilo.Você não deve gastar mais de 3min. para realizar todas as configurações, ok uns 7 minutos se estiver lendo este post e realizando tudo passo-a-passo.Configurar o deploy direto do Visual Studio é algo bastante interessante pois vai melhorar e agilizar seu processo de publicação. Não é necessário logar no portal, fazer o upload de dois arquivos, etc. Tudo pode ser feito através do VS2010.Em um post futuro veremos como automatizar ainda mais esse processo realizando um deploy utilizando scripts automatizados.

Abraços,
Vinicius Quaiato.
