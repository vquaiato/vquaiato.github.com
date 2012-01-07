--- 
layout: post
title: SessionState Provider com Windows Azure AppFabric Caching
wordpress_id: 3802
wordpress_url: http://viniciusquaiato.com/blog/?p=3802
categories: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
- title: Windows Azure AppFabric
  slug: windows-azure-appfabric
  autoslug: windows-azure-appfabric
- title: Windows Azure AppFabric Caching
  slug: windows-azure-appfabric-caching
  autoslug: windows-azure-appfabric-caching
- title: Windows Azure AppFabric Caching SessionState Provider
  slug: windows-azure-appfabric-caching-sessionstate-provider
  autoslug: windows-azure-appfabric-caching-sessionstate-provider
---
Fala galera, depois de explicar como [habilitar o Windows Azure AppFabric Caching no portal do Windows Azure](http://viniciusquaiato.com/blog/windows-azure-appfabric-caching/) vamos tirar proveito dele para armazenar o estado de nossas sessões em aplicações ASP.NET no Windows Azure.

## Por que usar o Windows Azure AppFabric Caching para Sessions?


Quando estamos em um ambiente como o Windows Azure onde normalmente trabalharemos com mais de uma máquina(instância) para nossas aplicações os requests que fizermos aos nossos sites poderão ser encaminhados para qualquer uma destas máquinas.Quem faz este trabalho é um Load Balancer já configurado no Windows Azure. Veja a ilustração abaixo para entender como isso funciona:[![Windows Azure Load Balancer](http://viniciusquaiato.com/images_posts/Windows-Azure-Load-Balancer.png "Windows Azure Load Balancer")](http://viniciusquaiato.com/images_posts/Windows-Azure-Load-Balancer.png)

Isto quer dizer que nosso request pode retornar da máquina 1. Quando pressionarmos um botão ele pode retornar para a máquina 2, e quando puxarmos um relatório ele pode vir da máquina N. Com isso precisamos mudar o mecanismo de sessões do ASP.NET.A solução para estes cenários é utilizar um mecanismo de armazenamento de sessões que seja persistente e independente de máquina. Um cache distribuído ou um banco de dados são soluções comuns. E é aqui que usarmos o Windows Azure AppFabric Caching pois por ser um mecanismo de caching distribuído qualquer uma de nossas instâncias(ou máquinas) fará acesso ao mesmo cache, assim se cairmos na máquina 1 ou na máquina N teremos acesso aos objetos de Session.

## Habilitando o Windows Azure AppFabric Caching no projeto ASP.NET


A primeira coisa que precisamos fazer é referenciar 3 DLLs do SDK do Windows Azure AppFabric. [Se você ainda não instalou faça o download aqui e instale](http://www.microsoft.com/download/en/details.aspx?displaylang=en&id=19925).As 3 DLLs que precisaremos são: **Microsoft.ApplicationServer.Caching.Core**, **Microsoft.ApplicationServer.Caching.Client** e **Microsoft.Web.DistributedCache** que podem ser encontradas em: _Program Files\Windows Azure AppFabric SDK\V1.0\Assemblies\NET4.0\Cache_. Após adicionar estas DLLs altere sua propriedade "Copy Local" para true.[![adicionando referencias Windows Azure AppFabric Caching](http://viniciusquaiato.com/images_posts/adicionando-referencias-Windows-Azure-AppFabric-Caching-228x300.png "adicionando referencias Windows Azure AppFabric Caching")](http://viniciusquaiato.com/images_posts/adicionando-referencias-Windows-Azure-AppFabric-Caching.png)



Após adicionarmos as DLLs precisamos colocar algumas informações no web.config da nossa aplicação. Estas informações para o web.config dirão para a aplicação que estamos utilizando o Windows Azure AppFabric Caching e que estamos utilizando-o como Provider para o SessionState.O próprio portal do Windows Azure te fornece estar informações:[![Informacoes client para o Windows Azure AppFabric Caching](http://viniciusquaiato.com/images_posts/Informacoes-client-para-o-Windows-Azure-AppFabric-Caching-300x181.png "Informacoes client para o Windows Azure AppFabric Caching")](http://viniciusquaiato.com/images_posts/Informacoes-client-para-o-Windows-Azure-AppFabric-Caching.png)

Agora vamos configurar tudo. Primeiro adicione as linhas abaixo logo após a tag &lt;
    configuration&gt;
    no seu web.config:
{% highlight csharp %}
<configsections>  <section name="dataCacheClients" type="Microsoft.ApplicationServer.Caching.DataCacheClientsSection, Microsoft.ApplicationServer.Caching.Core" allowlocation="true" allowdefinition="Everywhere" /></configsections>
{% endhighlight %}
Se você já tiver uma área &lt;
    configSections&gt;
    apenas adicione a linha &lt;
    section&gt;
    :
{% highlight csharp %}
  <section name="dataCacheClients" type="Microsoft.ApplicationServer.Caching.DataCacheClientsSection, Microsoft.ApplicationServer.Caching.Core" allowlocation="true" allowdefinition="Everywhere" />
{% endhighlight %}
Isto apenas cria uma section para preenchermos informações do Windows Azure AppFabric Caching. É uma forma de estender as configurações do web.config.Agora adicione o seguinte trecho dentro de &lt;
    system.web&gt;
    :
{% highlight csharp %}
  <providers>    <add name="AppFabricCacheSessionStoreProvider" type="Microsoft.Web.DistributedCache.DistributedCacheSessionStateStoreProvider, Microsoft.Web.DistributedCache" cachename="default" useblobmode="true" datacacheclientname="default" />  </providers></sessionstate>
{% endhighlight %}
Este trecho diz pra o ASP.NET que deve utilziar o **_AppFabricCacheSessionStoreProvider_** que está no assembly _Microsoft.Web.DistributedCache_.E agora vamos inserir as informações da nossa conta no Windows Azure AppFabric Caching. Este trecho pode ser adicionado logo antes de &lt;
    /configuration&gt;


    :
{% highlight csharp %}
      </messagesecurity>    </securityproperties>  </datacacheclient></datacacheclients>
{% endhighlight %}
O Token pode ser obtido nas informações de Configuração de Cliente da imagem acima ou também através do botão:[![Token do Windows Azure AppFabric Caching](http://viniciusquaiato.com/images_posts/Token-do-Windows-Azure-AppFabric-Caching-300x162.png "Token do Windows Azure AppFabric Caching")](http://viniciusquaiato.com/images_posts/Token-do-Windows-Azure-AppFabric-Caching.png)

Pronto! Agora tudo está configurado e funcionando. Nada precisa ser alterado no seu código continue acessando o objeto Session da mesma forma:
{% highlight csharp %}

protected void Page_Load(object sender, EventArgs e){    Session["AppFabricCaching"] = "Windows Azure AppFabric Caching para SessionState Provider";
    }


protected void ExibirSession_Click(object sender, EventArgs e){    this.SessionContent.Text = Session["AppFabricCaching"].ToString();
    }

{% endhighlight %}


## Resumo
Não pense que isso não é algo importante: é! Se você subir qualquer site no Windows Azure que vá ser executado em mais de uma instância você precisará de um mecanismo de session persistente e que possa atender qualquer uma das instâncias de forma transparente. Caso você não faça isso suas sessions se perderão e você terá comportamentos estranhos e indesejados no seus sistema.Esta não é a única forma de fazer isso mas é uma das mais simples por já haver um provider disponibilizados pela Microsoft executando no ambiente do Windows Azure.

## Detalhe Importante
É preciso que você crie um mecanismo para apagar as sessions que já estiverem expiradas, caso contrário elas permanecerão no cache ocupando espaço. Mas isso é assunto para outro post.

Abraços,
Vinicius Quaiato.
