--- 
layout: post
title: "Windows Azure: usando o Local Storage"
wordpress_id: 2872
wordpress_url: http://viniciusquaiato.com/blog/?p=2872
categories: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
- title: Local Storage
  slug: local-storage
  autoslug: local-storage
- title: Storage
  slug: storage
  autoslug: storage
- title: Azure Storage
  slug: azure-storage
  autoslug: azure-storage
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2011/01/Cumulus_clouds_in_fair_weather-150x150.jpg "Cumulus_clouds_in_fair_weather")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/01/Cumulus_clouds_in_fair_weather.jpeg)Armazenamento de informações é algo bastante comum na maioria das aplicações.O [Windows Azure](http://viniciusquaiato.com/blog/category/windows-azure/) fornece algumas formas de armazenamento de dados(Tables, Queues e Blobs, conhecidos como Azure Storage Services, que abordaremos mais pra frente) e um Local Storage que veremos agora.

## Windows Azure Local Storage
Local Storage é uma área de armazenamento temporária. É um local de armazenamento temporário no filesystem.É muito importante que não armazenemos informações que sejam/necessite ser permanentes no Local Storage, pois elas não serão mantidas permanentemente.

## Configurando Local Storage no Windows Azure
Cada role instance pode ter diversos Local Storages configurados. O tamanho limite depende do tamanho da máquina virtual associada a cada role.O tamanho mínimo para um Local Storage que seja definido é de 1MB.O Local Storage é configurado no arquivo de definição do serviço (um próximo post falará sobre o service model). Há duas maneiras de fazer isso: uma delas é pela interface integrada ao Visual Studio e a outra é através de arquivo .csdef.Veremos as duas maneiras para fazermos isso pois ambas são bastante simples.

### Definindo Local Storage via XML 
Para definir o Local Storage através do arquivo ServiceDefinition.csdef basta incluirmos o código abaixo dentro de webrole:<pre lang="xml"><localresources>  <localstorage name="LocalFiles" cleanonrolerecycle="false" sizeinmb="10" /></localresources></pre>É um código bastante simples. Definimos neste exemplo que teremos uma Local Storage, chamado LocalFiles. Que possui um tamanho de 10MB. O outro atributo, cleanOnRoleRecycle diz respeito a limpar o storage quando o role é reciclado, e isso pode ocorrer em caso de uma falha, um upgrade ou ainda quando você mesmo faça um recicle do role.Se quiséssemos definir mais de um stora bastaria adicionar uma outra linha com a definição, veja:<pre lang="xml"><localresources>  <localstorage name="LocalFiles" cleanonrolerecycle="false" sizeinmb="10" />  <localstorage name="LocalTextFiles" cleanonrolerecycle="false" sizeinmb="5" /></localresources></pre>Bem simples, não?

### Definindo Local Storage via interface Visual Studio
Para realizarmos esta definição diretamente dentro do Visual Studio basta um duplo click sobre o role no projeto Azure, uma tela como a seguinte será aberta:[caption id="attachment_2876" align="aligncenter" width="300" caption="Windows Azure Local Storage Visual Studio"][![Windows Azure Local Storage Visual Studio](http://viniciusquaiato.com/blog/wp-content/uploads/2011/01/Windows-Azure-Local-Storage-Visual-Studio-300x175.png "Windows Azure Local Storage Visual Studio")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/01/Windows-Azure-Local-Storage-Visual-Studio.png)[/caption]Nesta aba podemos configurar os Local Storage que queremos. Podemos adicionar ou remover, e estas alterações serão refletidas no xml do arquivo ServiceDefinition.csdef.[caption id="attachment_2877" align="aligncenter" width="300" caption="Definindo Windows Azure Local Storage Visual Studio"][![Definindo Windows Azure Local Storage Visual Studio](http://viniciusquaiato.com/blog/wp-content/uploads/2011/01/Definindo-Windows-Azure-Local-Storage-Visual-Studio-300x175.png "Definindo Windows Azure Local Storage Visual Studio")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/01/Definindo-Windows-Azure-Local-Storage-Visual-Studio.png)[/caption]

## Acessando o Local Storage no Windows Azure
Acessar o Local Storage do Windows Azure é bastante simples. Precisamos apenas obter uma referência para o Storage e depois podemos utilizar normalmente as classes do System.IO, vejamos um simples exemplo abaixo:<pre lang="csharp" line="1">public ActionResult Index(){    var storage = RoleEnvironment.GetLocalResource("LocalFiles");    var file = storage.RootPath + "fileText.txt";    if (!System.IO.File.Exists(file))    {        System.IO.File.WriteAllText(file, "Olá Azure Local Storage!" + DateTime.Now.Ticks);    }    ViewBag.FileContent = System.IO.File.ReadAllText(file);    return View();}</pre>O único código diferente nesta listagem está na **_linha 3_** onde chamamos o método [GetLocalResource](http://msdn.microsoft.com/en-us/library/microsoft.windowsazure.serviceruntime.roleenvironment.getlocalresource.aspx) da classe [RoleEnvironment](http://msdn.microsoft.com/en-us/library/ee773173.aspx) informando o nome do Local Storage que definimos.Depois disso tudo que fazemos é verificar se um arquivo existe, e caso não exista criamos e depois exebimos seu conteúdo na View.Executei a aplicação em mais de um role, e como podemos ver abaixo apenas 2 arquivos são criados, um para cada role, e o load balancer decide qual role iremos acessar em cada request.Se ficarmos atualizando a página veremos os 2 valores dos arquivos se alternando.[caption id="attachment_2880" align="aligncenter" width="300" caption="Acessando Windows Azure Local Storage"][![Acessando Windows Azure Local Storage](http://viniciusquaiato.com/blog/wp-content/uploads/2011/01/Acessando-Windows-Azure-Local-Storage-300x184.png "Acessando Windows Azure Local Storage")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/01/Acessando-Windows-Azure-Local-Storage.png)[/caption][caption id="attachment_2881" align="aligncenter" width="300" caption="Acessando Windows Azure Local Storage2"][![Acessando Windows Azure Local Storage2](http://viniciusquaiato.com/blog/wp-content/uploads/2011/01/Acessando-Windows-Azure-Local-Storage2-300x184.png "Acessando Windows Azure Local Storage2")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/01/Acessando-Windows-Azure-Local-Storage2.png)[/caption]

## Resumo
O Local Storage do Windows Azure pode ser um recurso muito útil para manter acesso rápido a alguns recurso, uma forma interessante de fazer um cache local por exemplo.**Atenção!** O Local Storage só pode ser acessado por uma única instância do Role, ou seja, cada role terá acesso ao seu Local Storage, não podendo compartilhar estas informações cross roles, desta forma não mantenha uma informação que precisa ser disponibilizada de forma compartilhada.Espero que tenham gostado.Abraços,Vinicius Quaiato.
