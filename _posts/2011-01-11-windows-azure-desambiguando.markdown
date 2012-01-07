--- 
layout: post
title: "Windows Azure: desambiguando"
wordpress_id: 2776
wordpress_url: http://viniciusquaiato.com/blog/?p=2776
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
- title: Plataforma Azure
  slug: plataforma-azure
  autoslug: plataforma-azure
- title: Sistem Azure
  slug: sistem-azure
  autoslug: sistem-azure
---


[![Windows Azure](http://viniciusquaiato.com/images_posts/azure-150x150.png "Windows Azure")](http://viniciusquaiato.com/images_posts/azure.png)

Muito temos [falado sobre Windows Azure](http://viniciusquaiato.com/blog/category/windows-azure/). O ponto é que Windows Azure possui dois significados distintos que é importante termos conhecimento de ambos para que fique mais fácil compreender algumas coisas.Vamos então desambiguar um pouco o termo [Windows Azure](http://azure.com) para que depois possamos deixar mais claro o que é o Fabric e o Fabric Controller.De uma forma grosseira podemos dizer que existem dois significados para Windows Azure.

## Windows Azure - A plataforma na nuvem
O primeiro destes significados refere-se a toda a plataforma que a Microsoft está provendo para o desenvolvimento de aplicações na nuvem.Por "toda plataforma" podemos entender o sistema operacional, as soluções de storage([Tables](http://msdn.microsoft.com/en-us/library/dd179423.aspx), [Queues](http://msdn.microsoft.com/en-us/library/dd179363.aspx), [Blobs](http://msdn.microsoft.com/en-us/library/dd135733.aspx), [SQL Azure](http://msdn.microsoft.com/en-us/library/ff937661.aspx)), o portal, [AppFabric](http://msdn.microsoft.com/en-us/library/ee922714.aspx), etc, etc. Podemos ainda incluir o SDK, a forma de desenvolvimento, a forma de deploy, etc. Tudo isso vai formar o que chamamos de Windows Azure enquanto sendo uma plataforma de serviços para a nuvem.

## Windows Azure - O sistema operacional
O outro significado para Windows Azure é o próprio sistema operacional. Não é propriamente um SO como estamos acostumados a pensar em um. O Windows Azure nos dá a capacidade de executar aplicações em sua estrutura de maneira escalável e gerenciável.Podemos entender o Azure como um SO no sentido de que executamos aplicações. As complexidades com relação a hardware, memória, etc, são abstraídos. De fato quando desenvolvemos para o Azure estamos totalmente desligados de sistema operacional e detalhes de plataforma.Estamos realmente programando para a nuvem.Podemos dizer que o Azure possue um Kernel, o Fabric Controller, que abordarem no próximo post.

## A metáfora
No livro Azure in Action temos uma metáfora bem interessante para ilustrar esses significados. Não vou copiar aqui na íntegra mas vou descrever.A rede ESPN de canais possui uma variedade de canais (ESPN, ESPN2, ESPN News, etc). Quando falamos ESPN podemos nos referir a um destes canais como a toda a rede de canais.Desta forma é preciso se atentar ao contexto para saber exatamente de "qual" Windows Azure estamos falando.

## Resumo
Quando falamos em Windows Azure podemos nos referir a toda plataforma oferecida para execução de aplicativos na nuvem, como ao conjunto de operações/componentes que executam uma aplicação, o SO. A diferença às vezes é sutil mas pode ajudar bastante. Entender e tentar diferenciar os dois pode ser algo bastante importante (tem me ajudado).Tendo isso em mente podemos então continuar, e no próximo post iremos olhar para o Fabric e o Fabric Controller.

Abraços,
Vinicius Quaiato.
