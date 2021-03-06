--- 
layout: post
title: "Node.js no Windows Azure - simples e f\xC3\xA1cil!"
wordpress_id: 3815
wordpress_url: http://viniciusquaiato.com/blog/?p=3815
categories: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
- title: Node.js
  slug: node-js
  autoslug: node.js
---


[![Node.js no Windows Azure](http://viniciusquaiato.com/images_posts/7217.Windows-Azure-logo-v_6556EF52-300x212.png "Node.js no Windows Azure")](http://viniciusquaiato.com/images_posts/7217.Windows-Azure-logo-v_6556EF52.png)

Fala galera, beleza? Acabei de fazer o [Node.js](http://nodejs.org) rodar no [Windows Azure](http://viniciusquaiato.com/blog/category/windows-azure/) e quero compartilhar isso com vocês.Antes de mais nada eu não fiz nada "sozinho". Cheguei a este resultando consultando uma série de fontes, dentre elas: [http://pofallon.blogspot.com/2010/11/javascript-in-cloud-with-nodejs-and_30.html](http://pofallon.blogspot.com/2010/11/javascript-in-cloud-with-nodejs-and_30.html) e [http://channel9.msdn.com/events/MIX/MIX11/SVC04](http://channel9.msdn.com/events/MIX/MIX11/SVC04).Mudei algumas coisas e achei esta forma bastante simples. Vamos lá!

## O que é o Node.js?
Para quem não sabe [Node.js](http://nodejs.org) é uma maneira simples de escrever código server side com JavaScript. Simples e bonito. :DEle usa um modelo assíncrono orientado a eventos o que o torna bastante performático e robusto.[Esta semana saiu o primeiro node.exe](http://viniciusquaiato.com/blog/nodejs-no-windows-agora-e-possivel/) pelo próprio pessoal do Node para ser executado de forma nativa no Windows.

## Rodando o Node.js no Windows Azure
Executar o Node.js no [Windows Azure](http://www.microsoft.com/windowsazure/) é algo simples. Eu tentei fazer isso de diversas formas e essa foi a mais interessante que encontrei até o momento. O código é muito enxuto e não há quase nenhum trabalho de setup (diferente das outras opções).

### Criar um Blob Container no Windows Azure
Vamos utilizar um [Blob Container](http://channel9.msdn.com/Blogs/smarx/Windows-Azure-Blob-Storage) no [Storage do Windows Azure](http://www.microsoft.com/windowsazure/storage/) para armazenar nosso _node.exe_ e os arquivos .js que serão executados por ele. Faça isso utilizando o Storage Explorer([que eu mostrei aqui](http://viniciusquaiato.com/blog/azure-storage-explorer-e-cerebrata-cloud-storage-studio/)). Eu criei um container chamado "nodestuff" e mandei os arquivos _node.exe_ e _nodeazure.js_:
{% highlight csharp %}
﻿var http = require('http');
    http.createServer(function (request, response) {    response.writeHead(200, { 'Content-Type': 'text/plain' }
);
    response.end('Hello Windows Azure from Node.js!\nBy @vquaiato');
    }
).listen(process.argv[2], process.argv[3]);
    console.log('Loaded ' + process.argv[1] + ', server running at ' + process.argv[3] + ':' + process.argv[2]);


    
{% endhighlight %}
Reparem que não estamos fixando nem o ip e nem a porta nos quais o Node será executado(_**linha 6**_), isto por que não sabemos o IP da nossa máquina no Windows Azure, então vamos deixar isso como parâmetros a serem enviados para o Node.[![Azure Storage Explorer com arquivos Nodejs](http://viniciusquaiato.com/images_posts/Azure-Storage-Explorer-com-arquivos-Nodejs-300x214.png "Azure Storage Explorer com arquivos Nodejs")](http://viniciusquaiato.com/images_posts/Azure-Storage-Explorer-com-arquivos-Nodejs.png)

Colocar os arquivos em um blob é uma estratégia interessante em diversos cenários pois isso nos permite trocar estes arquivos sem necessariamente realizar um novo deploy. 

### Copiando o node.exe para a instância do Windows Azure


Vamos fazer com que nosso worker role copie o _node.exe_ e o _nodeazure.js_ para o [Local Storage](http://viniciusquaiato.com/blog/windows-azure-usando-local-storage/) da nossa instância. Isso nos dará mais velocidade e facilidade no start do processo do node. Vamos configurar um Local Storage de 10MB:[![Local Storage para arquivos do nodejs](http://viniciusquaiato.com/images_posts/Local-Storage-para-arquivos-do-nodejs-300x164.png "Local Storage para arquivos do nodejs")](http://viniciusquaiato.com/images_posts/Local-Storage-para-arquivos-do-nodejs.png)

Agora vamos copiar os arquivos do blob para o Local Storage:
{% highlight csharp %}
var blobContainer = GetBlobContainer();
var localStorage = RoleEnvironment.GetLocalResource("nodestuff");
    CopyFromBlobToLocal(blobContainer, localStorage, "node.exe");
    CopyFromBlobToLocal(blobContainer, localStorage, "nodeazure.js");
    
private CloudBlobContainer GetBlobContainer() {    CloudStorageAccount objStorage = CloudStorageAccount.FromConfigurationSetting("BlobConnectionString");
    CloudBlobClient objClient = new CloudBlobClient(objStorage.BlobEndpoint, objStorage.Credentials);
    CloudBlobContainer objContainer = objClient.GetContainerReference("nodestuff");
    objContainer.CreateIfNotExist();
return objContainer;
    }


private void CopyFromBlobToLocal(CloudBlobContainer blobContainer, LocalResource localStorage, string blobName) {    CloudBlob node = blobContainer.GetBlobReference(blobName);
    using (BlobStream nodestream = node.OpenRead())    {
var nodefile = Path.Combine(localStorage.RootPath, blobName);
if(!System.IO.File.Exists(nodefile))        {            using (var fileStream = new FileStream(nodefile, FileMode.CreateNew))            {                nodestream.CopyTo(fileStream);
    fileStream.Flush();
    fileStream.Close();
    }
        }
    }
}

{% endhighlight %}
Bastante simples hein? (Não se preocupe que no final do post está um link para o fonte completo)

### Executando o Node.js no Windows Azure
Tudo que precisamos agora é executar o Node.js de dentro do nosso Worker Role. Isso poderia ser feito através de uma [startup task](http://msdn.microsoft.com/en-us/library/gg456327.aspx) + powershell scripts? Poderia, mas acho que não é a melhor solução. Uma startup task não executará novamente caso o processo do Node morra, e aí? Desta forma podemos fazer tratamentos dentro do código e dar um restart no Node caso algo aconteça :D
{% highlight csharp %}

private string roleIP = RoleEnvironment.CurrentRoleInstance.InstanceEndpoints["NodeEndpoint"].IPEndpoint.Address.ToString();
    
private string rolePort = RoleEnvironment.CurrentRoleInstance.InstanceEndpoints["NodeEndpoint"].IPEndpoint.Port.ToString();
while(true) {
var nodeProcess = new Process();
    try {        nodeProcess.StartInfo.UseShellExecute = false;
    nodeProcess.StartInfo.RedirectStandardOutput = false;
    nodeProcess.StartInfo.FileName = Path.Combine(localStorageRootPath, "node.exe");
    nodeProcess.StartInfo.WorkingDirectory = localStorageRootPath;
    nodeProcess.StartInfo.Arguments = String.Format("nodeazure.js {
}
 {
}
", rolePort, roleIP);
    nodeProcess.EnableRaisingEvents = false;
    nodeProcess.Start();
    nodeProcess.WaitForExit();
    }
    catch (Exception e) {        Trace.WriteLine(string.Format("Error: {
}
", e.Message), "Error");
    }
    Thread.Sleep(10000);
    Trace.WriteLine("Working", "Information");
    }

{% endhighlight %}
Easy! Basicamente o que este código faz é criar um processo com o node.exe passando como argumentos o arquivo js a ser executado, o ip e a porta do servidor no Windows Azure. Reparem que eu coloquei isso dentro do laço


while(true) do worker role e desta maneira sempre que o processo do node morrer ele será iniciado novamente :PE o resultado já rodando no Azure:[![Nodejs running on Windows Azure](http://viniciusquaiato.com/images_posts/Nodejs-running-on-Windows-Azure-300x58.png "Nodejs running on Windows Azure")](http://viniciusquaiato.com/images_posts/Nodejs-running-on-Windows-Azure.png)



## Resumo
Bom galera e assim rodamos o Node.js no Windows Azure. Esse é o resumo de algumas pesquisas misturando os resultado do Steve Marx com o resultado do Paul OFallon e mais algumas pesquisas sobre Startup Tasks no Windows Azure.Este não é um exemplo complexo, mas isso mostra como é simples realizar o deploy. Tendo feito isso uma vez você está pronto para rodar isso em 1.000.000 de máquinas no Azure caso precise :DAgora basta você incrementar seu código JavaScript e tudo estará pronto <o/Outra dica é coletar melhor as informações sobre cada um dos passos sendo executados e também trabalhar com performance counters para monitorar a saúde da aplicação.Confira o código fonte completo aqui: [https://github.com/vquaiato/nodeonazure](https://github.com/vquaiato/nodeonazure) (Se você não usa git tem um botão de download onde você pode baixar um .zip com o projeto).
