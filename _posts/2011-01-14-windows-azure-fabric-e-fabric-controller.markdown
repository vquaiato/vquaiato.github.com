--- 
layout: post
title: "Windows Azure: Fabric e Fabric Controller"
wordpress_id: 2772
wordpress_url: http://viniciusquaiato.com/blog/?p=2772
categories: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
---


[![Windows Azure](http://viniciusquaiato.com/images_posts/microsoft-windows-azure-mspmentor-150x150.jpg "Windows Azure")](http://viniciusquaiato.com/images_posts/microsoft-windows-azure-mspmentor.jpg)

Para começar a entender um pouco de como a mágica do Windows Azure acontece precisamos compreender  dois elementos que estão "por detrá das cenas": O Fabric e o Fabric Controller.Apesar de não serem muito falados estes dois caras são bastante importantes em todo o processo, vamos entender um pouco o que são e o que fazem.

## O Fabric
**Fabric** pode ser dito como sendo o conjunto de todas as partes que compõem o Windows Azure. Não pense que fabric significa fábrica, você está enganado. Fabric é uma malha, e este é o perfeito nome para o que ele representa dentro do Windows Azure.Cada servidor, load balancer, switch, processadores, memória, máquinas virtuais, alimentação de energia e tudo o mais, junto, forma uma enorme malha. Ou seja um conjunto de componentes e partes que formam um todo, compondo esta malha que é o Windows Azure. É como se fosse a Matrix.O Fabric não é um software, não é um sistema operacional, um aplicativo, um script, um recurso, etc. o Fabric é a junção de todas as partes interconectas que formam a plataforma Windows Azure.

## Fabric Controller
**Fabric Controller** já é algo menos abstrato e mais palpável. O Fabric Controller é o coração/cérebro do Windows Azure(plataforma). Ele é o responsável por, digamos, tudo! É um sistema que faz o gerenciamento de tudo que acontece/deve acontecer no Windows Azure: monitora, mantém e provisiona as máquinas que irão servir como hosts das aplicações que criamos.O Fabric Controller é uma cara muito, mas muito esperto, e além disso ele é consciente de tudo, ou seja ele sabe quanto de espaço há em cada máquina física, ele sabe quando ele precisa para alocar sua aplicação, sabe separar as instâncias da aplicação de forma a garantir fault domain e update domains, gerencia operações de commit de forma a sempre disponibilizar os dados íntegros de forma satisfatória, sobe um serviço quando outro cair, enfim, é o cérebro e o coração do Azure.Uma das atividades mais importantes do Fabric Controller é cuidar as instâncias de nossos roles, ou seja, disponibilizar máquinas para que eles executem, executar os roles, e mantê-los sempre em execução.Isso pode parecer uma tarefa simples mas há diversos detalhes importantes que o Fabric Controller leva em consideração.Primeiro que esse provisionamento de máquinas só é possível em virtude do model service que nossos roles expõe. Isso quer dizer que há uma definição do que é o serviço/role que estamos criando, há informações sobre tamanho da máquina, quantidade de instância, espaço para armazenamento local, update domains, etc, e com estas informações o Fabric Controller é capaz de garantir em quais máquinas físicas devem ser criadas as instâncias de nossos roles, ou seja a máquina precisa ter memória e processador suficientes de acordo com o que foi definido no service model.Além disso é preciso disponibilizar a quantidade de disco requerida e se preocupar os os domains.Um pouco mais sobre o Fabric Controller você confere [aqui neste post do Elemar](http://azureservicesbr.ning.com/profiles/blogs/como-funciona-o-azure-o-1).

## O Development Fabric
Claro que toda esta estrutura é monstruosa, porém quando estamos trabalhando localmente para desenvolver nossos serviços temos à nossa disposição o Development Fabric que está disponível com o SDK do Azure.Com o Development Fabric podemos "emular" uma estrutura parecida com a que teríamos na nuvem para que possamos desenvolver nossas aplicações.É claro que quando trabalhamos localmente não temos redundância, alta disponibilidade, etc, mas é possível simular algumas coisas.O Development Fabric é iniciado quando executamos uma aplicação Azure local([veja mais aqui nesse post](http://azure.snagy.name/blog/?p=84)).E confira [aqui no MSDN](http://msdn.microsoft.com/en-us/library/dd179455.aspx) como usar o Development Fabric.

## Resumo
Então é isso galera, espero que tenha colaborado um pouco no entendimento destes termos que são frequentes em literatura Azure.

Abraços,
Vinicius Quaiato.
