--- 
layout: post
title: MEF - Managed Extensibility Framework no .NET 4
wordpress_id: 905
wordpress_url: http://viniciusquaiato.com/blog/?p=905
categories: 
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
tags: 
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: MEF
  slug: mef
  autoslug: mef
- title: Plugins
  slug: plugins
  autoslug: plugins
- title: Managed Extensibility
  slug: managed-extensibility
  autoslug: managed-extensibility
---
Fala galera, hoje vou falar um pouco sobre o [MEF - Managed Extensibility Framework](http://mef.codeplex.com/), disponível no .NET 4 mas que funciona na versão 3.5 também.O MEF é um conjunto de bibliotecas que nos permite criar aplicações facilmente compostas, ou seja, trabalhar com o conceito de plugins, extensões e componentes de forma simples e natural.Já era possível fazer isso antes do MEF, no entanto, era necessário que cada empresa/projeto criasse seu próprio framework para trabalhar com estas funcionalidades, nada impossível, mas de certo custoso.O MEF provê uma maneira simples de uma aplicação expôr a si mesma como componente ou ainda importar componentes expostos por outras aplicações.Possui uma diferentes maneiras de encontrar e carregar os componentes para a aplicação, e esse conjunto de facilidades torna o MEF incrivelmente produtivo.![MEF Managed Extensibility Framework](http://i3.codeplex.com/Project/Download/FileDownload.aspx?ProjectName=MEF&DownloadId=50697 "MEF Architecture")Como pode ser visto na imagem acima, o MEF trabalha com o conceito de catálogo. Um catálogo conhece os componentes/plugins ou como ele chama Parts disponíveis. Atua como um repositório para estes plugins. O catálogo pode ser criado a partir de um assembly, o assembly em execução por exemplo, descobrindo todas as parts disponíveis, ou ainda a partir de um diretório específico na máquina, o que nos dá a possibilidade de criar uma pasta "plugins" e colocar ali dentro todos os plugins que a aplicação deve conhecer e pode utilizar.Um Container conhece um catálogo e então é capaz de compor as partes disponíveis na aplicação. É interessante notar que uma part pode depender de outras parts, e o container sabe compor todas de forma correta.É uma ferramenta bastante interessante o MEF, e pelos testes que fiz bastante simples de trabalhar. É claro que "_grandes poderes trazem grandes responsabilidades"_ já diria o profeta "Tio Ben". Mas eu vejo uma enorme variedade de projetos e situações que irão se beneficiar da utilização do MEF.No próximo post mostrarei de forma prática como utilizar algumas destas funcionalidades.Enquanto isso o [Programming Guide do MEF está aqui](http://mef.codeplex.com/wikipage?title=Guide&referringTitle=Home)./* LIFE RUNS ON CODE */Att,Vinicius Quaiato.
