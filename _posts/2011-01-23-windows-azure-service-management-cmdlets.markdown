--- 
layout: post
title: Windows Azure Service management cmdlets
wordpress_id: 2985
wordpress_url: http://viniciusquaiato.com/blog/?p=2985
categories: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
- title: cmdlets
  slug: cmdlets
  autoslug: cmdlets
- title: Azure Management Tools
  slug: azure-management-tools
  autoslug: azure-management-tools
- title: Azure powershell
  slug: azure-powershell
  autoslug: azure-powershell
---
Estão disponíveis uma série de cmdlets do Powershell que auxiliam o gerenciamento e diagnósticos de serviços Windows Azure através do Powershell.Com esses cmdlets fica muito simples criar scripts de deploy, manutenção, upgrade, realização de tarefas como escalar, etc.

### Download Windows Azure Service management cmdlets
Você faz o download aqui: [http://code.msdn.microsoft.com/azurecmdlets](http://code.msdn.microsoft.com/azurecmdlets).A instalação é bastante simples, será extraída uma pasta para um local em seu computador e então você deve executar o arquivo **_startHere_**.

### O problema
Há um pequeno problema em executar o download e instalação a partir do link acima: o build é feito com a versão 1.0 do SDK do Windows Azure e se você tiver o SDK 1.3 instalado não funcionará.Para isso eu abri a solution, alterei a referência e recompilei o projeto. Para que você não precise fazer isso [faça o download do zip já na versão 1.3 do Windows Azure SDK aqui](http://viniciusquaiato.com/files/azure/cmdlets/AzureServiceManagementCmdlets.exe).

### Utilizando os cmdlets
Para utilizar os cmdlets basta digitar:<pre lang="powershell">Add-PSSnapIn AzureManagementToolsSnapIn</pre>Feito isso os cmdlets estarão disponíveis, confira com:<pre lang="powershell">Get-Command -PSSnapIn AzureManagementToolsSnapIn</pre>E assim veremos a listagem de comandos disponíveis:[caption id="attachment_2986" align="aligncenter" width="300" caption="Get-Command Azure Management Tools"][![Get-Command Azure Management Tools](http://viniciusquaiato.com/blog/wp-content/uploads/2011/01/get-command-300x157.png "Get-Command Azure Management Tools")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/01/get-command.png)[/caption]Em breve começarei a mostrar como fazer uso dos cmdlets para monitorar e manipular os serviços do Windows Azure.Abraços,Vinicius Quaiato. 
