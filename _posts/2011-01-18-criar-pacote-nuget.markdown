--- 
layout: post
title: Criar pacote NuGet
wordpress_id: 2860
wordpress_url: http://viniciusquaiato.com/blog/?p=2860
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: NuGet
  slug: nuget
  autoslug: nuget
- title: Package
  slug: package
  autoslug: package
- title: nuspec
  slug: nuspec
  autoslug: nuspec
- title: nupkg
  slug: nupkg
  autoslug: nupkg
- title: nuget pack
  slug: nuget-pack
  autoslug: nuget-pack
- title: pacote NuGet
  slug: pacote-nuget
  autoslug: pacote-nuget
---
Ok eu [falei bastante sobre o NuGet](http://viniciusquaiato.com/blog/tag/nuget/), [sobre seus comandos](http://viniciusquaiato.com/blog/aprenda-os-comandos-para-adicionar-pacotes-com-nupack/), sobre a [NuGet Gallery](http://viniciusquaiato.com/blog/nuget-gallery/) e dei até uma [palestra sobre ele(NuGet)](http://viniciusquaiato.com/blog/videos-pelestra-sobre-nuget-do-dnad-2010/). Mas como é que criamos um pacote para ele?

## Criando pacotes para o NuGet
Criar pacotes para o NuGet é realmente bastante simples, tudo que precisamos é criar um XML(Oh Deus, um XML?).Este XML é um descritivo do pacote, informa a versão, quais arquivos formam o pacote, descrição, dependências etc. É um XML bastante simples, e não é preciso ficar modificando constantemente, então é tranquilo.Este arquivo deve ser salvo com a extensão .nuspec, ou seja, é uma especificação do pacote que será criado.Vamos dar uma olhada em um XML destes:
{% highlight csharp %}
<?xml version="1.0"?><package>  <metadata>    <id>...project name here...</id>    <version>...version here...</version>    <authors>...your name here...</authors>    <licenseurl>...license url here...</licenseurl>    <projecturl>...project url here...</projecturl>    <requirelicenseacceptance>false</requirelicenseacceptance>    <description>...description here...</description>    <summary>...summary here...</summary>    <language>...language here...</language>  </metadata></package>
{% endhighlight %}
Este é o arquivo mais simples que podemos criar. Não preciso comentar muito sobre cada um dos campos, acho que estão bem explicados. Caso exista alguma dúvida, confira aqui o que é, para que serve e quais campos são obrigatórios: [http://nuget.codeplex.com/documentation?title=Nuspec%20Format](http://nuget.codeplex.com/documentation?title=Nuspec%20Format).

## Criando o arquivo de especificação para o projeto MVCTestsEx
Para demonstrar a criação de um pacote, vou utilizar um projeto open source que estou desenvolvendo chamado MVCTestsEx. Este projeto consiste em uma biblioteca com alguns helpers que facilitam a criação de testes de unidade para ASP.NET MVC. O fonte da biblioteca está aqui: [http://github.com/vquaiato/MVCTestsEx](http://github.com/vquaiato/MVCTestsEx).O arquivo ficou assim:
{% highlight csharp %}
<?xml version="1.0"?><package>  <metadata>    <id>MVCTestsEx</id>    <version></version>    <authors>Vinicius Quaiato</authors>    <licenseurl>http://github.com/vquaiato/MVCTestsEx</licenseurl>    <projecturl>http://github.com/vquaiato/MVCTestsEx</projecturl>    <requirelicenseacceptance>false</requirelicenseacceptance>    <description>The MVCTestsEx library consists in a set of helpers that let you easily write ASP.NET MVC unit tests.</description>    <summary>They help you in ViewName assertions, model assertions, and so on.</summary>    <language>en-US</language>    <dependencies><dependency id="nunit" />    </dependencies>  </metadata>  <files>      <file src="\bin\MVCTestsEx.dll" target="lib" />  </files></package>
{% endhighlight %}
Meu projeto possui uma dependência do projeto NUnit, então informamos isso no arquivo de especificação do pacote **_linhas 13 a 15_**. Desta forma quando nosso pacote for instalado o NuGet perceberá que precisa realizar a instalação do NUnit também.A seção files **_linhas 17 a 19_** indicam quais os arquivo que fazem parte do nosso pacote. Neste caso estão informando que é para empacotar o arquivo MVCTestsEx.dll que se encontra na pasta bin e informamos que deve ser colocado em lib.Se quiséssemos que este arquivo ficasse em algum diretório na aplicação client poderíamos especificar isso, veja aqui: [http://nuget.codeplex.com/wikipage?title=File%20Element%20Specification](http://nuget.codeplex.com/wikipage?title=File%20Element%20Specification).

## Gerando o pacote para o NuGet
Para gerarmos o pacote batsa executar um comando apontando para o arquivo .nuspec. Este comando é executado através do NuGet Command Line, que deve ser baixado aqui: [http://nuget.codeplex.com/releases/view/57303](http://nuget.codeplex.com/releases/view/57303).Feito isso basta executar o comando da seguinte forma:
{% highlight csharp %}
nuget pack arquivo.nuspec
{% endhighlight %}
Este comando irá gerar um arquivo .nupkg que é o pacote do NuGet. Simples não é?

## Resumo
Criar pacotes para o NuGet é algo bastante simples. Levamos alguns minutos para preparar o arquivo .nuspec mas depois disso a coisa fica bastante automática.Em um próximo post mostrarem como integrei a geração do .nupkg ao meu processo de build automatizado para o projeto, ou seja, cópia dos arquivos, atribuição da versão ao arquivo .nuspec e geração do pacote, tudo automatizado dentro do meu script de build.Ontem eu comentei que, se você possui um projeto open source na plataforma .NET e não disponibiliza o mesmo no NuGet você está privando a comunidade de uma facilidade. Pense nisso.

Abraços,
Vinicius Quaiato.
