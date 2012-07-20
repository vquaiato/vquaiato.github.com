---
layout: post
title: "Rodando Nuget no Mono"
description: "Vamos ver neste post como é 'simples' utilizar o NuGet com o Mono"
keywords:
- Mono
- Monodevelop
- Nuget
tags:
- title: Mono
  slug: mono
  autoslug: mono
- title: Nuget
  slug: nuget
  autoslug: nuget
---
Fala galera, beleza? Esses dias eu quis experimentar o [Nuget][nuget](com [Mono][mono]) no meu Mac. Aparentemente não temos um console pro Nuget no [Monodevelop][monodev], mas isso não é o que nos impediria de tentar já que o Nuget possui uma command-line tool certo?

##Baixando o Nuget
A primeira coisa que fiz foi baixar a command-line tool do Nuget no codeplex [http://nuget.codeplex.com/releases](http://nuget.codeplex.com/releases) *(sim vamos baixar um .exe mesmo)*

##Rodando o Nuget
Suponho que você já possui o [Mono][mono] instalado em seu ambiente. Vamos abrir o terminal e digitar:

{% highlight bash %}
mono NuGet.exe
{% endhighlight %}

Feito isso vamos receber um erro como esse:

> vquaiato [nuget_testes] $ mono NuGet.exe

> WARNING: The runtime version supported by this application is unavailable.
Using default runtime: v2.0.50727

> Unhandled Exception: System.TypeLoadException: Could not load type 'NuGet.Program' from assembly 'NuGet, Version=2.0.30619.9000, Culture=neutral, PublicKeyToken=null'.
[ERROR] FATAL UNHANDLED EXCEPTION: System.TypeLoadException: Could not load type 'NuGet.Program' from assembly 'NuGet, Version=2.0.30619.9000, Culture=neutral, PublicKeyToken=null'.

Isso acontece pois o [Nuget][nuget] roda com a runtime 4.0 do .NET e o default do [Mono][mono] é a runtime 2.0, mas isso é facilmente contornável:

{% highlight bash %}
mono --runtime=v4.0.30319 NuGet.exe
{% endhighlight %}

E o resultado disso deve ser parecido com isso:
<img src="/images_posts/rodando-nuget-com-mono.jpg" class="post_img" />

##Compilando o Mono
Até aí tudo perfeito, se quisermos por exemplo procurar um pacote podemos digitar:

{% highlight bash %}
mono --runtime=v4.0.30319 NuGet.exe list nunit
{% endhighlight %}

E com isso teremos uma listagem de pacotes com o termo "nunit":
<img src="/images_posts/listando-pacotes-nuget-com-mono.png" class="post_img" />

O problema acontece quando tentamos instalar algum pacote:
{% highlight bash %}
mono --runtime=v4.0.30319 NuGet.exe install nunit
{% endhighlight %}

Obteremos um erro parecido com isso:
> vquaiato [nuget_testes] $ mono --runtime=v4.0.30319 NuGet.exe install nunit

> Missing method System.Security.Cryptography.CryptoConfig::get_AllowOnlyFipsAlgorithms() in assembly /Library/Frameworks/Mono.framework/Versions/2.10.9/lib/mono/4.0/mscorlib.dll, referenced in assembly /Users/vquaiato/Projects/nuget_testes/NuGet.exe

> Method not found: 'System.Security.Cryptography.CryptoConfig.get_AllowOnlyFipsAlgorithms'.

O motivo é muito simples: este método não está implementado na versão de ***release*** atual do Mono!
Para *nossa alegria* este método já está implementado no [github do Mono][mono-github] há bastante tempo, então basta compilarmos o [Mono usando o repositório do github][mono-github].

Eu assumo que você já possui uma versão do Mono(e do Git) instalada. Então vá ao terminal e digite:
{% highlight bash %}
git clone git://github.com/mono/mono.git
cd mono
./autogen.sh --prefix=/local-para-instalar-sua-versao-do-mono
make
{% endhighlight %}

O comando make pode demorar ***um pouco***. Quando ele terminar:
{% highlight bash %}
make install
{% endhighlight %}

Isso também pode ***demorar***. Mas quando terminarmos poderemos finalmente baixar nossos pacotes utilizando o Nuget:
{% highlight bash %}
/./local-onde-instalou-o-novo-mono/bin/mono NuGet.exe install MvcScaffolding
{% endhighlight %}

Neste caso estamos instalando o MVCScaffolding, veja que realmente ele baixa todas as dependências:
<img src="/images_posts/instalando-pacote-nuget-com-mono.jpg" class="post_img" />

##Deixando mais elegante
Para deixarmos tudo mais elegante crie um script chamado ***nuget*** em um local que esteja no seu PATH:
{% highlight bash %}
#!/bin/sh
exec /local-onde-instalou-o-novo-mono/bin/mono --gc=sgen /local-onde-colocou-o-nuget/NuGet.exe "$@"
{% endhighlight %}

Dê permissão de execução para esse script:
{% highlight bash %}
chmod +x /local-onde-criou-o-script/nuget
{% endhighlight %}

Agora podemos digitar:
{% highlight bash %}
nuget install nome-do-pacote
{% endhighlight %}

##Resumindo
Bastante simples hein? A princípio pode assustar um pouco mas garanto que é tudo tranquilo.
Se você tiver alguma dúvida ou problema para compilar o Mono o README deles no github vai ajudar.
Bom é isso. Pra quem quiser (assim como eu) usar um pouco de .NET no Mac e usar as facilidades do Nuget.

[mono]:http://www.mono-project.com/Main_Page
[monodev]:http://monodevelop.com/
[nuget]:http://nuget.org/
[nuget-download]:http://nuget.codeplex.com/releases
[mono-github]:https://github.com/mono/mono
