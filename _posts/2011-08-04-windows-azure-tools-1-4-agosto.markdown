--- 
layout: post
title: Windows Azure Tools 1.4 Agosto
wordpress_id: 3944
wordpress_url: http://viniciusquaiato.com/blog/?p=3944
categories: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
---


Fala galera, acaba de sair mais um update das ferramentas do [Windows Azure](http://viniciusquaiato.com/blog/category/windows-azure/) para Visual Studio.Diretamente ao ponto, a instalação pode ser feita via Web Platform Installer:[![Windows Azure Tools Agosto](http://viniciusquaiato.com/images_posts/Windows-AZure-Tools-Agosto-300x207.png "Windows Azure Tools Agosto")](http://viniciusquaiato.com/images_posts/Windows-AZure-Tools-Agosto.png)



## ASP.NET MVC 3 no Windows Azure


Com este update temos um web role ASP.NET MVC 3 de forma antiva, já não precisamos mais fazer nenhum workaroud para isso. Este tipo de web role já fará o deploy de todos os assemblies necessários sem nenhuma tarefa adicional: [![Windows Azure ASP NET MVC 3 Web Role](http://viniciusquaiato.com/images_posts/Windows-Azure-ASP-NET-MVC-3-Web-Role-300x190.png "Windows Azure ASP NET MVC 3 Web Role")](http://viniciusquaiato.com/images_posts/Windows-Azure-ASP-NET-MVC-3-Web-Role.png)



## Múltiplas configurações para o mesmo serviço


Esta novidade nos permite ter mais de uma configuração para um mesmo serviço e então escolher qual utilizar. Por exemplo uma configuração para utilizar o Azure Tables local e outra para utilziar o de produção, e quando estiver em desenvolvimento utiliza-se a configuração local.[![Windows Azure Multiplas Configuracoes de Servico](http://viniciusquaiato.com/images_posts/Windows-Azure-Multiplas-Configuracoes-de-Servico-300x177.png "Windows Azure Multiplas Configuracoes de Servico")](http://viniciusquaiato.com/images_posts/Windows-Azure-Multiplas-Configuracoes-de-Servico.png)



E temos uma pequena tela para gerenciar isso, onde é possível realizar uma cópia de uma configuração já existente:[![Windows Azure Multiplas Configuracoes de Servico 2](http://viniciusquaiato.com/images_posts/Windows-Azure-Multiplas-Configuracoes-de-Servico-2.png "Windows Azure Multiplas Configuracoes de Servico 2")](http://viniciusquaiato.com/images_posts/Windows-Azure-Multiplas-Configuracoes-de-Servico-2.png)



## Windows Azure Profiling


Agora é possível habilitar alguns tipo de profiling durante o deploy de nossas aplicações, com isso conseguiremos ter algum relatório sobre como nossa aplicação está se comportando. Tudo isso agora vem integrado com o Visual Studio, bastando 3 cliques para habilitar:[![Windows Azure Profiling](http://viniciusquaiato.com/images_posts/Windows-Azure-Profiling-246x300.png "Windows Azure Profiling")](http://viniciusquaiato.com/images_posts/Windows-Azure-Profiling.png)



[![Windows Azure Profiling types](http://viniciusquaiato.com/images_posts/Windows-Azure-Profiling-types-300x232.png "Windows Azure Profiling types")](http://viniciusquaiato.com/images_posts/Windows-Azure-Profiling-types.png)

Para [informações detalhadas sobre cada um dos tipos veja aqui no MSDN](http://msdn.microsoft.com/en-us/library/hh369930.aspx).

## Windows Azure Package Validation
Agora você obterá mensagens de erro e alertas ao gerar seu pacote quando ele não puder ser publicado. Por exemplo se você esquecer de adicionar um assembly ao deploy que será necessário você receberá esta informação e ecnomizará bastante tempo, já que poderá corrigir isso antes do deploy ser realizado para o Windows Azure.Outro tipo de alerta é se você gerar o pacote com as configurações para o Local Storage Emulator. Agora o Visual Studio irá alertá-lo para incluir credenciais válidas para o Windows Azure Storage.[Mais informações sobre Package Validation você encontra aqui](http://msdn.microsoft.com/en-us/library/hh369932.aspx).

## Resumão
É isso galera. As ferramentas para o Windows Azure estão avançando e melhorando em um ritmo bastante confortável. O painel web está bem bacana com menus de contexto agora, o que facilita bastante o trabalho. E agora o Visual Studio com essas novas funcionalidades começa a ficar ainda mais maneiro.Para mais informações e detalhes: [confira aqui no MSDN](http://msdn.microsoft.com/en-us/library/ff683673.aspx).
