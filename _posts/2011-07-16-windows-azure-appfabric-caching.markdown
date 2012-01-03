--- 
layout: post
title: Windows Azure AppFabric Caching
wordpress_id: 3776
wordpress_url: http://viniciusquaiato.com/blog/?p=3776
categories: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
- title: Azure
  slug: azure
  autoslug: azure
- title: Windows Azure AppFabric
  slug: windows-azure-appfabric
  autoslug: windows-azure-appfabric
- title: Windows Azure AppFabric Caching
  slug: windows-azure-appfabric-caching
  autoslug: windows-azure-appfabric-caching
- title: Azure Caching
  slug: azure-caching
  autoslug: azure-caching
- title: Azure AppFabric
  slug: azure-appfabric
  autoslug: azure-appfabric
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2011/07/diag-caching-sm.gif "Windows Azure AppFabric Caching")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/07/diag-caching-sm.gif)Fala galera, beleza? Falando mais um pouco sobre o [Windows Azure](http://viniciusquaiato.com/blog/category/windows-azure/ "Windows Azure") vamos configurar o Windows Azure AppFabric Caching para utilizarmos o mesmo em nossas aplicações na nuvem.

## Windows Azure AppFabric
[Windows Azure AppFabric](http://www.microsoft.com/windowsazure/appfabric/overview/#top) é um middleware no Azure que oferece algumas soluções já na nuvem para nós. Dentre os serviços e features do [Azure AppFabric](http://www.microsoft.com/windowsazure/appfabric/overview/) temos: Service Bus, Caching, Access Control e Integration.Não vamos nos prender nos detalhes de todos os recursos do Windows Azure AppFabric e vamos focar na configuração do Windows Azure AppFabric Caching.

## Windows Azure AppFabric Caching
Uma das soluções oferecidas pelo Windows Azure AppFabric é o [Windows Azure AppFabric Caching](http://msdn.microsoft.com/en-us/library/gg278356.aspx). Um serviço de cache distribuído, em memória e já disponível no Windows Azure e pronto para uso sem nenhuma instalação adicional.Utilizar um serviço de caching é algo muito interessante pois pode acelerar o tempo de resposta de nossas aplicações no que diz respeito ao acesso a dados, permite trabalhar com sessões distribuídas (que é exatamente o cenário do Windows Azure), entre outros fatores.

## Habilitando o Windows Azure AppFabric Caching
Acesse o painel de controle de sua conta do Windows Azure:[caption id="attachment_3780" align="aligncenter" width="300" caption="Windows Azure Portal - AppFabric"][![Windows Azure Portal - AppFabric](http://viniciusquaiato.com/blog/wp-content/uploads/2011/07/Program-Manager_2011-07-14_20-02-47-300x162.png "Windows Azure Portal - AppFabric")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/07/Program-Manager_2011-07-14_20-02-47.png)[/caption]Após selecionar a opção "Acces Control, Service Bus & Caching", selecione o item "caching" e depois "new":[caption id="attachment_3781" align="aligncenter" width="300" caption="Windows Azure Portal - AppFabric Caching"][![Windows Azure Portal - AppFabric Caching](http://viniciusquaiato.com/blog/wp-content/uploads/2011/07/Greenshot_2011-07-14_20-04-04-300x162.png "Windows Azure Portal - AppFabric Caching")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/07/Greenshot_2011-07-14_20-04-04.png)[/caption]Após escolhermos o nome para nosso "namespace" de caching o mesmo será criado de acordo com nossas configurações (é possível alterar o tamanho do caching depois, não se preocupe).[caption id="attachment_3782" align="aligncenter" width="300" caption="Windows Azure Portal - AppFabric Caching"][![Windows Azure Portal - AppFabric Caching](http://viniciusquaiato.com/blog/wp-content/uploads/2011/07/Greenshot_2011-07-14_20-05-20-300x162.png "Windows Azure Portal - AppFabric Caching")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/07/Greenshot_2011-07-14_20-05-20.png)[/caption][caption id="attachment_3785" align="aligncenter" width="300" caption="Windows Azure Portal - AppFabric Caching"][![Windows Azure Portal - AppFabric Caching](http://viniciusquaiato.com/blog/wp-content/uploads/2011/07/Greenshot_2011-07-14_20-08-48-300x162.png "Windows Azure Portal - AppFabric Caching")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/07/Greenshot_2011-07-14_20-08-48.png)[/caption]Pronto! Nosso Windows Azure AppFabric Caching está criado e pronto para ser utilizado. No próximo post veremos como utilizar o Windows Azure AppFabric Caching para ser nosso provider de SessionState para aplicacões ASP.NET no Windows Azure.

Abraços,
Vinicius Quaiato.
