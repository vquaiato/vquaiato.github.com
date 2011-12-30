--- 
layout: post
title: "Windows Azure: Entendendo Worker Roles"
wordpress_id: 3133
wordpress_url: http://viniciusquaiato.com/blog/?p=3133
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
- title: Worker Roles
  slug: worker-roles
  autoslug: worker-roles
- title: Azure Worker Roles
  slug: azure-worker-roles
  autoslug: azure-worker-roles
---
[![gears](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/gears-150x150.jpg "gears")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/02/gears.jpg)Muito falamos sobre sites e aplicações na nuvem com [Windows Azure](http://viniciusquaiato.com/blog/category/windows-azure/). No entanto não se fala muito sobre Worker Roles. Talvez isso ocorra pois é "difícil" mostrar o que são e para que servem(em virtude de não terem interface gráfica :P).# Worker Roles
Para começarmos a falar de Worker Roles precisamos entender primeiro o problema/situação ao qual eles são destinados. Neste início então vamos entender um pouco das razões e usos dos Worker Roles para depois entendermos como implementar e conhecer os detalhes técnicos.

### Processamento em background
Alguns pontos de nossas aplicações podem(na verdade devem) ser executados em background. Isso quer dizer que nem tudo que nossas aplicações fazem precisa ser executada no momento em que a ação é disparada. Exemplo: Se nossa aplicação realiza vendas com pagamentos via cartão de crédito não precisamos efetivamente processar o pagamento no momento em que a compra é realizada. Esta confirmação pode ser enfileirada para processamento posterior.Isso quer dizer que a aplicação web não fica sobrecarregada com esta tarefa, a resposta para o usuário é mais rápida.

### Mas por que processar em background?
Vamos imaginar que essa comunicação com a operadora de cartão de crédito demore de 30segundos a 180segundos em situações mais críticas. Dependendo do volume de compras do seu sistema você terá um enorme gargalo na sua aplicação web.Delegar este processamento para uma tarefa a ser realizada por um processo em background, quando falamos em cloud isto quer dizer que podemos escalar este processo de background quando e da forma que for preciso para atender a demanda.O processamento em background, aliviar a interface da nossa aplicação, etc, não deve ser um padrão apenas em aplicação na nuvem. É uma boa prática que também pode ser utilizada em aplicações on-premise.

### Por que separar este processamento?
Ter o processamento separado da aplicação web nos dá o benefício de manter nossos web servers(web roles) com máquinas mais simples. Por exigirem um processamentos menos intenso o hardware não precisa ser dos mais fortes, significando uma economia de recursos(a.k.a. dinheiro). Quando for preciso escalar os servidores web podemos facilmente escalar horizontalmente(e com hardware menor).Dependendo do tipo de processamento que vamos executar em background precisaremos de um hardware mais forte. Desta maneira temos bem separadas as necessidades da nossa aplicação e podemos realizar o provisionamento de máquinas de maneira mais eficiente e consciente.

### Quebrar um grande processamento em partes menores
Todos conhecem a máxima "dividar para conquistar", e muitas vezes é disso que precisamos em desenvolvimento de sistemas. O que eu quero dizer com isso é que em alguns momentos nossas aplicações precisam desempenhar um processamento grande/pesado/intenso. A maneira como pensamos em fazer isso, normalmente é: de uma vez.Este padrão muitas vezes não é algo tão interessante(e nem proveitoso).  Na maioria das vezes é possível quebrarmos este processamento pesado em diversos processamentos menores e mais "simples".Com o uso de worker roles e filas é possível criar implementações de [map/reduce](http://en.wikipedia.org/wiki/MapReduce) utilizando o Windows Azure.

### Executar códigos não gerenciados e/ou não .NET
Quando estamos trabalhando com Worker Roles temos a possibilidade de executar e "hostear" código que não seja escrito em .NET.O Worker Role é o tipo de serviço correto para executarmos um arquivo .exe. Por exemplo um serviço que aplique um codec específico em vídeos. Podemos utilizar um worker role para realizar esta tarefa. Podemos ainda realizar indexações e processamento de textos e uma série de outra atividades que não necessitem de uma interface. 

### manter uma separação lógicas e física
Não podemos deixar de mencionar que com isso criamos uma espécie de separação lógica e até mesmo física de entre algumas partes de nossa aplicação. Deixando as coisas mais simples e evidenciadas, cada uma com sua responsabilidade mais bem delineada.

## Resumo
Entendemos aqui algumas das motivações por detrás do uso de Worker Roles no Windows Azure. Vimos quando e por que é interessante fazer uso deste recurso ao invés de simplesmente criar aplicações web repletas de instâncias.Entender a motivação e os usos é muitas vezes mais importante do que simplesmente entendermos como criar: isso é muito fácil.Em posts que virão mostrarei como criar Worker Roles e trabalhar com eles em diferentes aspectos.Para mais informações consultem o MSDN para um ["Overview of Worker Roles"](http://msdn.microsoft.com/en-us/library/gg433065.aspx).Deixem suas dúvidas, feedbacks e considerações/críticas.Abraços,Vinicius Quaiato.
