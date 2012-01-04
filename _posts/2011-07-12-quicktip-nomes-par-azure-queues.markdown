--- 
layout: post
title: "QuickTip: Nomes para Azure Queues"
wordpress_id: 3724
wordpress_url: http://viniciusquaiato.com/blog/?p=3724
categories: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: quick tip
  slug: quick-tip
  autoslug: quick-tip
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
- title: Azure Storage
  slug: azure-storage
  autoslug: azure-storage
- title: Azure Queues
  slug: azure-queues
  autoslug: azure-queues
- title: Windows Azure Queues
  slug: windows-azure-queues
  autoslug: windows-azure-queues
---
Fala galera, beleza? Esta dica rápida vai para um "problema" que eu estava tendo ao criar Queues no Windows Azure. Vejam abaixo o código com problemas:
{% highlight c# %}
queueClient = storageAccount.CreateCloudQueueClient();
    this.namespacesQueue = this.queueClient.GetQueueReference("Namespaces");
    this.namespacesQueue.CreateIfNotExist();
    
{% endhighlight %}
Este código estava lançando uma Exception:<blockquote>One of the request inputs is out of range.</blockquote>Com o código de erro 400. Mas o código abaixo funciona:
{% highlight c# %}
queueClient = storageAccount.CreateCloudQueueClient();
    this.namespacesQueue = this.queueClient.GetQueueReference("namespaces");
    this.namespacesQueue.CreateIfNotExist();
    
{% endhighlight %}
Isto quer dizer que não se devem usar letras maiúsculas nos nomes das Queues. Aqui há uma documentação sobre os nomes permitidos: [http://msdn.microsoft.com/en-us/library/dd135715.aspx](http://msdn.microsoft.com/en-us/library/dd135715.aspx).O bacana é que a exception lançada não faz nenhuma menção ao erro que de fato estava acontecendo. É isso aew.

Abraços,
Vinicius Quaiato.
