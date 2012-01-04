--- 
layout: post
title: Entendendo o Service Model do Windows Azure
wordpress_id: 3063
wordpress_url: http://viniciusquaiato.com/blog/?p=3063
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
- title: Service Definition
  slug: service-definition
  autoslug: service-definition
- title: Service Configuration
  slug: service-configuration
  autoslug: service-configuration
---
[![](http://viniciusquaiato.com/images_posts/CloudPowerDark_3.png "Cloud Power")](http://viniciusquaiato.com/images_posts/CloudPowerDark_3.png)Já falamos batsante sobre alguns pontos e algumas caracteristicas do Windows Azure (configura aqui a lista completa de posts sobre Azure).Hoje vamos falar um pouco sobre o Service Model do Windows Azure.

## O que é o Service Model?
A grosso modo podemos entender que o service model do Windows Azure são as defnições sobre o serviço que será executado. O service model possui informações que descrevem instâncias, máquinas, disponibilidade, e algumas outras informações.Para o Fabric Controller o service model é de vital importância pois é ele quem informa como e o que deve ser feito pelo FC. O service model define também algumas coisas como [fault domains](http://social.msdn.microsoft.com/Forums/en/windowsazure/thread/74283295-16f4-4fd9-8126-06d6f804f6d9) e [update domains](http://blogs.msdn.com/b/gonzalorc/archive/2010/01/19/update-and-upgrade-domains.aspx)  (que abordaremos em outros posts).O service model do Windows Azure está composto de duas partes cada uma delas representada por um arquivo:- Arquivo de definição (ServiceDefinition.csdef)
- Arquivo de configuração (ServiceConfiguration.cscfg)


## O Arquivo de definição ServiceDefinition. csdef 
O arquivo de definição, ou a definição do serviço que é representada pelo arquivo, descreve alguns aspectos do serviço.Dentre as definições de um serviço encontramos:- Endpoints
- Tamanho da máquina do serviço (VM Size)
- Sites no caso de um serviço com webroles
- Worker roles no caso de um serviço com worker roles
- Espaço e local storages (não são Azure Storages)
- Update domains
- etc


### Os diferentes schemas
Dependendo do tipo de serviço que está sendo desenvolvido podem existir informações diferentes na definição do serviço. Isto quer dizer que existem schemas diferentes para o ServiceDefinition baseados no tipo de serviço.- WebRoles schema
- WordkerRole schema
- VirtualMachine schema
- NetwrokTraffic schema
Cada um destes schemas rendem material suficiente para seus próprios posts, podendo aprofundar e entender melhor cada um deles.É importante notar que as informações presentes na definição do serviço (ServiceDefinition.csdef) não podem ser alteradas enquanto o serviço está em execução, isto quer dizer que sempre que alguma alteração na definição do serviço precisar ser feita um novo deploy deve ser realizado. É por esta razão que o Service Model do Azure possui uma forma de distinguinr entre definição e configuração em seu Service Model.

## O Arquivo de configuração ServiceConfiguration. cscfg 
As configurações/informções que o serviço necessida no momento de sua execução são fornecidas ao FC através do arquivo de configuração ServiceConfiguration.cscfg.Algumas destas informações são:- Número de instâncias que o role possui
- Certificados digitais associados ao role
- Vínculo de certificado com binding
- Runtime settings(algo parecido com appSettings)
Estas informações todas podem ser alteradas sem sequer reiniciar o serviço, alterando o arquivo XML. Estas informações podem ser alteradas diretamente no portal do Windows Azure modificando o arquivo de configuração ou ainda realizando o upload de um outro arquivo. Os elements que podem ser utilizados neste arquivo serão também assunto para um post completo dedicado a eles.

## O Fabric Controller e o Service Model
Utilizando as informações do arquivo de definição o Fabric Controller é capaz de então provisionar máquinas que sejam capazes de suportar as necessidades do serviço, tanto em tamanho quando em fault domain, update domains, etc. O Fabric Controller precisa ter certeza de que tudo que foi solicitado está disponível para o serviço. A todo momento o FC faz uso do service model para decidir como deve se comportar com relação ao serviço. Em breve entenderemos em detalhes como e para que servem as diferentes informações contidas em cada parte do service model e seus arquivos e schemas. Por hora quem estiver curioso e com dúvidas pode consultar o MSDN: [Windows Azure SDK Schema Reference](http://msdn.microsoft.com/en-us/library/dd179398.aspx).

Abraços,
Vinicius Quaiato.
