--- 
layout: post
title: MSBuild + Nuget
wordpress_id: 3027
wordpress_url: http://viniciusquaiato.com/blog/?p=3027
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: NuGet
  slug: nuget
  autoslug: nuget
- title: MSBuild
  slug: msbuild
  autoslug: msbuild
---
Já vimos que [criar pacotes para o NuGet](http://viniciusquaiato.com/blog/criar-pacote-nuget/) é algo bastante simples.Fato é que devemos ser preguiçosos, devemos buscar isso. E ser preguiçoso na nossa área significa automaizar, dinamizar e tornar tarefas braçais o menos braçais possível. Isso não só está relacionado com uma economia direta de tempo, mas também uma economia de certa forma indireta. Indireta pois você acaba ganhando tempo evitando erros que seriam cometidos em um processo manual.Dito isso vamos incluir a criação de nosso pacote [NuGet](http://viniciusquaiato.com/blog/tag/nuget/) no nosso processo de build da aplicação, ou seja, quando gerarmos o build da aplicação um dos procedimentos que irá compor o build será gerar um pacote do NuGet.

## Criando script de build para MSBuild
Um dos primeiros passos para automatizar o processo de build é a criação de um arquivo de build. Para este exemplo vamos utilizar um arquivo para o [MSBuild](http://msdn.microsoft.com/en-us/library/ms171452(v=vs.90).aspx) que é o utilitário de build que acompanha o .NET Framework.Com o MSBuild temos independência do Visual Studio, ou seja não precisamos do Visual Studio para "buildar" nossa aplicação. Com isso temos a possibilidade de criar um servidor de build (assunto para um próximo post).O arquivo de build que vamos utilizar pode ser visto abaixo:
{% highlight csharp %}
Release</configuration>      <basedir>$(MSBuildProjectDirectory)</basedir>        <builddir>$(BaseDir)\build</builddir>    <builddirbin>$(BaseDir)\build\bin</builddirbin>    <nugetspecdir>$(BaseDir)</nugetspecdir>    <packagedir>$(BuildDir)\Packages</packagedir>    <nugetspectempdir>$(PackageDir)\temp\MVCTestsEx\</nugetspectempdir>    <solutionfile>$(BaseDir)\src\mvctestsex\MVCTestsExSolution.sln</solutionfile>    <msbuildextensions>$(BaseDir)\lib\MSBuildCommunityTasks\msbuild.community.tasks.dll</msbuildextensions>  </propertygroup>   <usingtask assemblyfile="$(MSBuildExtensions)" taskname="MSBuild.Community.Tasks.XmlUpdate" />   <target name="default" dependsontargets="Compile;
    Copy;
    Package;
    Clean" />   <target name="Compile">    <msbuild projects="$(SolutionFile)" properties="Configuration=$(Configuration)" />  </target>    <target name="Copy">    <itemgroup>      <mainbinaries include="$(BaseDir)\src\MVCTestsEx\MVCTestsEx\bin\$(Configuration)\**\*.*" />    </itemgroup>     <copy sourcefiles="@(MainBinaries)" destinationfolder="$(BuildDirBin)" />    <copy sourcefiles="@(MainBinaries)" destinationfolder="$(NuGetSpecTempDir)\bin" />    <copy sourcefiles="$(NuGetSpecDir)\MVCTestsEx.nuspec" destinationfolder="$(NuGetSpecTempDir)" />  </target>   <target name="Package">     <getassemblyidentity assemblyfiles="$(BuildDirBin)\MVCTestsEx.dll">      <output taskparameter="Assemblies" itemname="AsmInfo" />    </getassemblyidentity>     <xmlupdate namespace="http://schemas.microsoft.com/packaging/2010/07/nuspec.xsd" xmlfilename="$(PackageDir)\temp\MVCTestsEx\MVCTestsEx.nuspec" xpath="/package/metadata/version" value="%(AsmInfo.Version)" />     <message text="Creating the package" />    <nuget packagedir="$(PackageDir)" specfile="$(NuGetSpecTempDir)\MVCTestsEx.nuspec" />  </target>    <target name="Clean">    <removedir directories="$(NuGetSpecTempDir)..\" />  </target></project>
{% endhighlight %}
Resumidamente o que este script faz é:- Compilar uma solution **_linhas 20 a 22_**
- Copiar as dlls geradas e o arquivo .nuspec para uma pasta temporária **_linhas 24 a 31_**
- Automatizar a modificação do arquivo .nuspec para colocar a versão do pacote **_linhas 34 a 41_**
- Criação do pacote do NuGet **_linha 44_**
- Apagar o diretório temporário criado **_linha 48_**
Se você não entende nada de arquivos de build pode começar dando uma lidas [nestes posts aqui](http://pt-br.wordpress.com/tag/msbuild/).

## NuGet Build Task
Se vocês repararem a geração do pacote NuGet não é feita com o [NuGet.exe](http://nuget.codeplex.com/releases/view/57303) e uma chamada exec durante o build. Ao invés disso na **_linha 44_** utilizamos uma [build task](http://msdn.microsoft.com/en-us/library/microsoft.build.utilities.task.aspx) do NuGet.Esta build task eu encontrei no servidor de builds(ou de integração contínua para alguns) do NuGet: [http://ci.nuget.org:8080/viewType.html?buildTypeId=bt14&tab=buildTypeStatusDiv](http://ci.nuget.org:8080/viewType.html?buildTypeId=bt14&tab=buildTypeStatusDiv). Faça o login como guest, e baixe o arquivo MSBuild.NuGet.dll encontrado em "Artifacts".Esta build task nos permite com facilidade gerar um pacote NuGet diretamente do nosso build.

## Executando o build
Para executarmos este script de build e então obtermos a solução compilada e o pacote do NuGet gerado precisamos executar o seguinte comando no terminal:
{% highlight csharp %}
msbuild build.proj
{% endhighlight %}
Onde estou na pasta contendo o msbuild e o script de build chama-se build.proj.Teremos um output como este:[![Build gerando pacote NuGet](http://viniciusquaiato.com/images_posts/Build-gerando-pacote-NuGet-300x176.png "Build gerando pacote NuGet")](http://viniciusquaiato.com/images_posts/Build-gerando-pacote-NuGet.png)


## Resumo
Esta é uma maneira muito simples de incluir a criação do pacote diretamente no build do nosso projeto. Também é possível fazer isso de dentro do Visual Studio, mas chega de fazer tudo da maneira mais chata né? Hehehe.Em um próximo post vou mostrar como além de gerar o pacote faremos o processo de build enviar o pacote gerado para a galeria online do NuGet, tudo de forma automática.Esta solução completa, com os códigos fontes, o arquivo de build e tudo o mais pode ser encontrado no github: [http://github.com/vquaiato/mvctestsex](http://github.com/vquaiato/mvctestsex).

Abraços,
Vinicius Quaiato.
