--- 
layout: post
title: Windows Azure Diagnostics
wordpress_id: 4002
wordpress_url: http://viniciusquaiato.com/blog/?p=4002
categories: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
tags: 
- title: Windows Azure
  slug: windows-azure
  autoslug: windows-azure
- title: Windows Azure Diagnostics
  slug: windows-azure-diagnostics
  autoslug: windows-azure-diagnostics
---
Quando estamos trabalhando com [Windows Azure](http://viniciusquaiato.com/blog/category/windows-azure/) é muito comum(e muito útil) utilizarmos algum mecanismo de log de informações sobre diagnósticos para entender o que está acontecendo com a nossa aplicação.O Windows Azure possui uma infra e um mecanismo já preparado para isso.

## O Diagnostics no Windows Azure
O Windows Azure faz a coleta das informações e de tempos em tempos as envia para uma conta de Storage especificada. Com estas informações registradas pode-se observar o andamento e a saúde da sua aplicação.É possível trabalhar com performance counters para monitorar uma série de aspectos de nossas aplicacões, mas neste primeiro momento vamos nos ater ao Trace.Realizando uma consultoria de Windows Azure hoje eu me deparei com algumas diferenças na forma como o Diagnostics é configurado quando utilizando o Windows Azure SDK 1.3 e o 1.4.A configuração do 1.3 funciona no 1.4, mas o contrário não é válido.

## Configurando o Diagnostics no Windows Azure SDK 1.3
Tudo que precisamos fazer é adicionar o seguinte código no onStart de nossos roles:
{% highlight csharp %}
string diagnosticsConnectionString = "Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString";
var cloudStorageAccount = CloudStorageAccount.Parse(RoleEnvironment.GetConfigurationSettingValue(diagnosticsConnectionString));
var roleInstanceDiagnosticManager = cloudStorageAccount.CreateRoleInstanceDiagnosticManager(RoleEnvironment.DeploymentId, RoleEnvironment.CurrentRoleInstance.Role.Name, RoleEnvironment.CurrentRoleInstance.Id);
var diagnosticMonitorConfiguration = roleInstanceDiagnosticManager.GetCurrentConfiguration();
    diagnosticMonitorConfiguration.Logs.ScheduledTransferPeriod = TimeSpan.FromMinutes(1.0);
    DiagnosticMonitor.Start(cloudStorageAccount, diagnosticMonitorConfiguration);
    
{% endhighlight %}
Basicamente o que fazemos no código acima é definir uma variável com o nome da string de conexão padrão usada para o Diagnostics na **_linha 1_**. Esta string de conexão é criada juntamente com o seu role e aponta para o storage local.Na **_linha 2_** criamos uma CLoudStorageAccount utilizando a string de conexão. Na **_linha 4_** estamos obtendo uma instância de [RoleInstanceDiagnosticManager](http://msdn.microsoft.com/en-us/library/microsoft.windowsazure.diagnostics.management.roleinstancediagnosticmanager.aspx) que como o próprio nome diz é um gerenciador/monitorador de diagnósticos para uma instância de Role.Na **_linha 5_** obtemos um objeto de configuração do tipo [DiagnosticMonitorConfiguration](http://msdn.microsoft.com/en-us/library/ee773149.aspx) que contem uma série de informações sobre diagnósticos e logs.Na **_linha 6_** um detalhe bastante importante: é configurado o intervalo de transferência dos logs. Imagine que as informações estão sendo coletadas no seu Role mas estão em um buffer e de tempos em tempos estas informações são transferidas para uma Table do Azure Tables (por isso informamos uma string de conexão do Azure Storage). Isso é feito automáticamente dentro do intervalo especificado, no nosso caso a cada 1 minuto.Na **_linha 8_** finalmente iniciamos o processo de monitoramento com a conta do Azure Storage e a configuração.

## Configurando o Diagnostics no Windows Azure SDK 1.4
Mesmo que o código acima funcione no SDK 1.4 me parece que é mais simples a forma como as coisas podem ser feitas no SDK 1.4, vejamos:
{% highlight csharp %}
string diagnosticsConnectionString = "Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString";
var cloudStorageAccount = CloudStorageAccount.Parse(RoleEnvironment.GetConfigurationSettingValue(diagnosticsConnectionString));
var diagnosticMonitorConfiguration = DiagnosticMonitor.GetDefaultInitialConfiguration();
    diagnosticMonitorConfiguration.Logs.ScheduledTransferPeriod = TimeSpan.FromSeconds(15);
    DiagnosticMonitor.Start(cloudStorageAccount, diagnosticMonitorConfiguration);
    
{% endhighlight %}
Basicamente fazemos o mesmo que no SDK 1.3 com a diferença de que não criamos um [RoleInstanceDiagnosticManager](http://msdn.microsoft.com/en-us/library/microsoft.windowsazure.diagnostics.management.roleinstancediagnosticmanager.aspx).

## Registrando logs no Azure com Diagnostics
O processo para gravarmos os logs é bastante simples. Temos alguns métodos na classe [Trace](http://msdn.microsoft.com/pt-br/library/system.diagnostics.trace.aspx) que nos auxiliam, veja abaixo como fica o exemplo:
{% highlight csharp %}

protected void Page_Load(object sender, EventArgs e){    System.Diagnostics.Trace.TraceError("Erro/Exception ocorreu: " + DateTime.Now);
    System.Diagnostics.Trace.TraceInformation("Iniciando processamento: " + DateTime.Now);
    System.Diagnostics.Trace.TraceWarning("Algum aviso: " + DateTime.Now);
    }



{% endhighlight %}
No Page_Load dentro do meu WebRole eu faço 3 chamadas para os métodos da classe Trace passando informações a serem armazenadas de acordo com seu tipo.Para verificar os logs estou utilizando o [Azure Storage Explorer](http://viniciusquaiato.com/blog/azure-storage-explorer-e-cerebrata-cloud-storage-studio/)[![Logs Windows Azure Diagnostics](http://viniciusquaiato.com/images_posts/Log-Windows-Azure-Diagnostics-300x177.png "Logs Windows Azure Diagnostics")](http://viniciusquaiato.com/images_posts/Log-Windows-Azure-Diagnostics.png)

Como podemos ver a table para os logs é criada automaticamente bem como os dados são transferidos para ela no intervalo especificado.

## Resumindo...
É muito importante realizar corretamente o uso de Diagnostics e Logs no Windows Azure pois é uma maneira eficaz de saber como está sua aplicação e coletar algumas informações do ambiente do Azure(seja Staging ou Production).Além dos logs é possível monitorar a saúde da aplicação com performance counters, que é um assunto para um post futuro.

Abraços,
Vinicius Quaiato.
