--- 
layout: post
title: "Windows Azure: configurando inst\xC3\xA2ncias e m\xC3\xA1quinas"
wordpress_id: 2744
wordpress_url: http://viniciusquaiato.com/blog/?p=2744
categories: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
- title: "Inst\xC3\xA2ncias"
  slug: instancias
  autoslug: "inst\xC3\xA2ncias"
- title: Instances
  slug: instances
  autoslug: instances
- title: VMsize
  slug: vmsize
  autoslug: vmsize
- title: role instances
  slug: role-instances
  autoslug: role-instances
---
Já vimos [como configurar nosso ambiente Windows Azure](http://viniciusquaiato.com/blog/windows-azure-preparando-o-ambiente-de-desenvolvimento/) e [como criar uma aplicações ASP.NET MVC 2](http://viniciusquaiato.com/blog/windows-azure-criando-a-primeira-aplicacao-asp-net-mvc/) e [ASP.NET MVC 3 no Windows Azure](http://viniciusquaiato.com/blog/windows-azure-rodando-asp-net-mvc-3/).Agora vamos entender um pouco como configurarmos instâncias e máquinas no Windows Azure o que nos dará um pouco de base para depois falarmos de [Fabric e Fabric Controller](http://msdn.microsoft.com/en-us/library/gg433095.aspx#F).

## Instâncias e Máquinas
Quando estamos falando de [Windows Azure](http://azure.com) e computação na nuvem não estamos simplesmente falando de máquinas virtuais rodando em um servidor em algum lugar fora da minha empresa.O Windows Azure é uma plataforma completa, e é também um sistema operacional criado para suportar e oferecer demanda e alta disponibilidade com simplicidade para escalar.O Windows Azure trabalha com o gerenciamento de recursos, balanceamento de carga e cuida do ciclo de vida dos serviços que está rodando.Quando falamos em nuvem não precisamos nos preocupar de antemão(up-front) com hardware, ambiente, e toda essa questão de infraestrutura. Não precisamos imaginar qual será todo o poder de processamento que precisaremos. Evitar isso quer dizer que podemos nos concentrar no negócio e no software e não nos detalhes de implementação(implantação).No Windows Azure conseguimos de forma muito simples configurar quantas instâncias de um role queremos executar, ou seja, quantas VMs queremos que executem uma determinada aplicação. Uma instância nada mais é do que uma máquina virtual a ser montada para nossa aplicação, única e exclusivamente para ela.Além disso configuramos de maneira muito simples qual será o hardware desta instância, ou como é dito: qual o tamanho da máquina virtual.

## Configurando instâncias e máquinas no Windows Azure no VS2010
Vamos utilizar nosso [projeto ASP.NET MVC 3](http://viniciusquaiato.com/blog/windows-azure-rodando-asp-net-mvc-3/) e ver como é feita a configuração de instâncias e máquinas no Windows Azure.[caption id="attachment_2747" align="aligncenter" width="239" caption="O projeto Windows Azure com mvc 3"][![O projeto Windows Azure com mvc 3](http://viniciusquaiato.com/images_posts/o-projeto-azure-com-mvc-3-239x300.png "O projeto Windows Azure com mvc 3")](http://viniciusquaiato.com/images_posts/o-projeto-azure-com-mvc-3.png)[/caption]Vamos então dar um duplo click no Role SiteMVC3 para que seja aberta a tela a segui:[caption id="attachment_2748" align="aligncenter" width="300" caption="Configuração do Role no Windows Azure"][![Configuração do Role no Windows Azure](http://viniciusquaiato.com/images_posts/instancia-padrao-300x245.png "Configuração do Role no Windows Azure")](http://viniciusquaiato.com/images_posts/instancia-padrao.png)[/caption]Reparem que temos uma área destinada a configuração das instâncias de nosso role. Por padrão o role é configurado com uma instância em uma VM de tamanho small.Abaixo você confere os tamanhos de máquinas disponíveis e suas configurações.<table>        <tbody><tr>          <th style="width:150px;
    text-align:left;
    ">Virtual Machine Size</th>          <th style="width:150px;
    text-align:left;
    ">CPU Cores</th>          <th style="width:150px;
    text-align:left;
    ">Memory</th>          <th style="width:150px;
    text-align:left;
    ">Disk Space</th>        </tr>        <tr>          <td>            
              **ExtraSmall**            
          </td>          <td>            
Shared
          </td>          <td>            
768 MB
          </td>          <td>            
20 GB
          </td>        </tr>        <tr>          <td>            
              **Small**            
          </td>          <td>            
1
          </td>          <td>            
1.75 GB
          </td>          <td>            
225 GB
          </td>        </tr>        <tr>          <td>            
              **Medium**            
          </td>          <td>            
2
          </td>          <td>            
3.5 GB
          </td>          <td>            
490 GB
          </td>        </tr>        <tr>          <td>            
              **Large**            
          </td>          <td>            
4
          </td>          <td>            
7 GB
          </td>          <td>            
1000 GB
          </td>        </tr>        <tr>          <td>            
              **ExtraLarge**            
          </td>          <td>            
8
          </td>          <td>            
14 GB
          </td>          <td>            
2040 GB
          </td>        </tr>      </tbody></table>Vamos alterar o valor de **_Instance count_** para 4 e executar nossa aplicação com **_Ctrl + F5_**. Isso fará com que nossa aplicação seja executada com 4 instâncias(quatro máquinas virtuais).Podemos acompanhar isso através do [Compute Emulator](http://msdn.microsoft.com/en-us/library/gg432968.aspx) que é um dos componentes instalados com o SDK do Windows Azure e que nos permite executar, testar e debugar aplicações Azure em nossa máquina local antes de realizar o deploy para produção. Clique com o botão direito no ícone no systray e escolha a opção Show Compute Emulator UI:[caption id="attachment_2759" align="aligncenter" width="165" caption="Windows Azure Compute Emulator"][![Windows Azure Compute Emulator](http://viniciusquaiato.com/images_posts/Compute-Emulator.png "Windows Azure Compute Emulator")](http://viniciusquaiato.com/images_posts/Compute-Emulator.png)[/caption][caption id="attachment_2760" align="aligncenter" width="300" caption="Exibindo Windows Azure Compute Emulator UI"][![Exibindo Windows Azure Compute Emulator UI](http://viniciusquaiato.com/images_posts/Exeibindo-Compute-Emulator-UI-300x155.png "Exibindo Windows Azure Compute Emulator UI")](http://viniciusquaiato.com/images_posts/Exeibindo-Compute-Emulator-UI.png)[/caption]Feito isso teremos uma tela parecida com esta onde são exibidas nossas instâncias(ou máquinas virtuais):[caption id="attachment_2762" align="aligncenter" width="300" caption="Windows Azure Compute Emulator UI"][![Windows Azure Compute Emulator UI](http://viniciusquaiato.com/images_posts/Windows-Azure-Compute-Emulator-UI-300x190.png "Windows Azure Compute Emulator UI")](http://viniciusquaiato.com/images_posts/Windows-Azure-Compute-Emulator-UI.png)[/caption]Com isso podemos acompanhar e monitorar as instâncias da nossa aplicação de forma local.

## Configurando instâncias e máquinas no Windows Azure via XML
A edição e configuração da quantidade de instâncias e o tamanho das máquinas também podem ser feitas através de XMLs para quem não trabalhar com Visual Studio.Na nossa solution temos dois arquivos no projeto Azure que contém estas informações: **_Serviceconfiguration.cscfg_** e **_ServiceDefinition.csdef_** (cs no nome dos arquivos não é de C# e sim de Cloud Service).No arquivo **_ServiceConfiguration.cscfg_** configuramos quantas instâncias do nosso role(aplicação) queremos, veja abaixo na **_linha 4_**:
{% highlight csharp %}
    <instances count="4" />    <configurationsettings>      <setting name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" value="UseDevelopmentStorage=true" />    </configurationsettings>  </role></serviceconfiguration>
{% endhighlight %}
E no arquivo **_ServiceDefinition.csdef_** configuramos entre outras informações o tamanho da máquina virtual, veja na **_linha 3_** o atributo vmsize.
{% highlight csharp %}
  <webrole name="SiteMVC3" vmsize="Small" /></servicedefinition>
{% endhighlight %}
(em outro post detalharemos mais estes arquivos e o Service Model do Windows Azure)

## Resumo
É bastante simples configurar quantas instâncias de nossa aplicação queremos executando e também qual o poder das máquinas que executarão estas instâncias.No próximo post entenderemos como o Windows Azure gerencia estas informações, como ele aloca e executa as aplicações e entenderemos um pouco mais de como a mágica é feita.Vamos caminhando aos poucos para não assustar ninguém, e para que eu mesmo possa aprofundar um pouco em alguns conceitos antes de passá-los.

Abraços,
Vinicius Quaiato.
