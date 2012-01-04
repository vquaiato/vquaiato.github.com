--- 
layout: post
title: Deploy Windows Azure usando Powershell
wordpress_id: 3087
wordpress_url: http://viniciusquaiato.com/blog/?p=3087
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
- title: Azure powershell
  slug: azure-powershell
  autoslug: azure-powershell
- title: Azure deploy
  slug: azure-deploy
  autoslug: azure-deploy
- title: Azure deploy powershell
  slug: azure-deploy-powershell
  autoslug: azure-deploy-powershell
- title: deploy azure automatizado
  slug: deploy-azure-automatizado
  autoslug: deploy-azure-automatizado
---
Fala galera. Quando procuramos maior produtividade e redução de problemas em nosso ambiente e processo de trabalho vamos nos deparar inevitavelmente com automação de algumas coisas.O processo de deploy do [Windows Azure](http://viniciusquaiato.com/blog/category/windows-azure/) pode ser feito de três maneiras, a saber:- Via Windows Azure portal
- [Via Visual Studio](http://viniciusquaiato.com/blog/deploy-no-windows-azure-usando-visual-studio/)
- [Via cmdlets Powershell](http://viniciusquaiato.com/blog/deploy-windows-azure-usando-powershell/)
O processo via [Powershell](http://pt-br.wordpress.com/tag/powershell/) pode ser utilizado para automatização de builds e deploys de uma solução, por exemplo em um ambiente de integração contínua e deploy contínuo.([Confira aqui como baixar e usar os cmdlets Powershell para Windows Azure](http://viniciusquaiato.com/blog/windows-azure-service-management-cmdlets/))São necessários alguns passos para realizar um deploy completo. É um processo bastante verboso por enquanto, mas não se assustem pois apesar de tudo é simples.Vou imaginar que você já possui o Powershell em sua máquina. Vou utilizar o Powershell ISE.

## Criando um novo deploy Windows Azure no Powershell
Como ainda não estamos automatizando nosso build vamos compilar uma solution [Azure](http://azure.com) no Visual Studio que será utilizada para o deploy.Para todos os scripts que executaremos precisaremos de algumas informações repetidamente. Para isso vamos criar variáveis no Powershell e armazenar alguns valores:
{% highlight c# %}
$nome_servico = "meu_servico"$subs_id = "a123bc12a-a123-1234-1234-a12b123c1234"$cert = Get-Item cert:\CurrentUser\My\<thumbprint />
{% endhighlight %}
(os dados acima são fictícios hein! :P)Após definirmos estes dados vamos então começar a criar o deploy. Para isso vou definir mais três variáveis uma para o label da nossa publicação, uma para o caminho do pacote e uma para o caminho do arquivo de configuração.
{% highlight c# %}
$label = "deploy via powershell"$pacote = "C:\Publish\MVCSummitCloudApp.cspkg"$config = "C:\Publish\ServiceConfiguration.cscfg"
{% endhighlight %}
No meu caso eu gerei estes arquivo no C: para facilitar o exemplo no blog.Vamos agora criar o script de deploy de fato:
{% highlight c# %}
New-Deployment -ServiceName $nome_servico -SubscriptionId $subs_id -Certificate $cert -Slot staging -Package $pacote -Configuration $config -Label $label | Get-OperationStatus -WaitToComplete
{% endhighlight %}
Após enviarmos o deploy precisamos colocá-lo para rodar, e para isso utilizaremos o script abaixo:
{% highlight c# %}
Get-HostedService -ServiceName $service_name -SubscriptionId $subscription_id -Certificate $certificate | Get-Deployment -Slot staging |Set-DeploymentStatus running |Get-OperationStatus -WaitToComplete
{% endhighlight %}
Depois que colocamos o serviço para rodar podemos testá-lo. Após os testes podemos então mover o deploy de staging para produção, e para isso vamos nos utilizar de mais um script:
{% highlight c# %}
Get-HostedService -ServiceName $service_name -SubscriptionId $subscription_id -Certificate $certificate |Get-Deployment -Slot staging |Move-Deployment |Get-OperationStatus -WaitToComplete
{% endhighlight %}
Quando promovemos um deploy para produção, acabamos ficando com uma instância de staging ativa. Se mantivermos a mesma seremos cobrados por essa alocação. Para que não sejamos cobrados precisamos parar o serviço em staging e então deletá-lo. Para isso utilizaremos os dois scripts abaixo em conjunto:
{% highlight c# %}
Get-HostedService -ServiceName $service_name -SubscriptionId $subscription_id -Certificate $certificate | Get-Deployment -Slot staging |Set-DeploymentStatus suspended |Get-OperationStatus -WaitToCompleteGet-HostedService -ServiceName $service_name -SubscriptionId $subscription_id -Certificate $certificate | Get-Deployment -Slot staging |Remove-Deployment |Get-OperationStatus -WaitToComplete
{% endhighlight %}
Pronto! Isso é tudo que você precisa fazer para "automatizar" seu deploy com o Windows Azure.Eu criei um script powershell que já faz tudo isso e é possível chamá-lo com passagem de parâmetros, isso deve facilitar um pouco as coisas.[O script completo está no gist](https://gist.github.com/817052)(github) e aqui:
{% highlight c# %}
Param($S,$I,$Cert,$L,$P,$Cfg)$start = Get-Date$service_name = $S$subscription_id = $I$certificate = $Cert$label = $L$package = $P$config_file = $Cfgif(-not(Get-PSSnapin AzureManagementToolsSnapIn)){    Add-PSSnapin AzureManagementToolsSnapIn}
New-Deployment -ServiceName $service_name -SubscriptionId $subscription_id -Certificate $certificate -Slot staging -Package $package -Configuration $config_file -Label $label |Get-OperationStatus -WaitToCompleteGet-HostedService -ServiceName $service_name -SubscriptionId $subscription_id -Certificate $certificate | Get-Deployment -Slot staging |Set-DeploymentStatus running |Get-OperationStatus -WaitToCompleteGet-HostedService -ServiceName $service_name -SubscriptionId $subscription_id -Certificate $certificate |Get-Deployment -Slot staging |Move-Deployment |Get-OperationStatus -WaitToCompleteGet-HostedService -ServiceName $service_name -SubscriptionId $subscription_id -Certificate $certificate | Get-Deployment -Slot staging |Set-DeploymentStatus suspended |Get-OperationStatus -WaitToCompleteGet-HostedService -ServiceName $service_name -SubscriptionId $subscription_id -Certificate $certificate | Get-Deployment -Slot staging |Remove-Deployment |Get-OperationStatus -WaitToComplete$end = Get-Date"Deploy finished in " + ($end-$start).TotalSeconds + " secs."
{% endhighlight %}
O uso deste script é algo mais ou menos assim:
{% highlight c# %}
.'.\push.ps1' -S "service_name" -I "your_subscription_id" -Cert (Get-Item cert:\CurrentUser\My\<thumb_print>) -L "label_name" -P ".cspkg local" -Cfg ".cscfg local"</thumb_print>
{% endhighlight %}
A idéia é transformar isso em cmdlets do powershell para facilitar um pouco as coisas e depois disso criar build tasks para o [MS-Build](http://viniciusquaiato.com/blog/msbuild-nuget/).

Abraços,
Vinicius Quaiato.
