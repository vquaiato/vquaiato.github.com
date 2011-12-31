--- 
layout: post
title: Aprenda os comandos de listagem do NuPack
wordpress_id: 1836
wordpress_url: http://viniciusquaiato.com/blog/?p=1836
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: NuPack
  slug: nupack
  autoslug: nupack
- title: Gerenciador Pacotes
  slug: gerenciador-pacotes
  autoslug: gerenciador-pacotes
- title: Comandos NuPack
  slug: comandos-nupack
  autoslug: comandos-nupack
- title: NuGet
  slug: nuget
  autoslug: nuget
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Nupack-logo.png "Nupack-logo")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Nupack-logo.png)[Neste post aqui](http://viniciusquaiato.com/blog/nupack-uma-das-melhores-invencoes-da-microsoft/) aprendemos como instalar o [NuPack](http://nupack.codeplex.com/) e vimos seus comandos básico e eu funcionamento básico.Agora veremos com mais detalhes os comandos disponíveis e como poderemos melhorar a utilização do NuPack Package Manager com eles. Se você ainda não possui o [NuPack](http://nupack.codeplex.com/) instalado ou não sabe do que se trata, veja este post [aqui](http://viniciusquaiato.com/blog/nupack-uma-das-melhores-invencoes-da-microsoft/), ou este [aqui](http://weblogs.asp.net/scottgu/archive/2010/10/06/announcing-nupack-asp-net-mvc-3-beta-and-webmatrix-beta-2.aspx), ou este [aqui](http://unplugged.giggio.net/unplugged/post/NuPack-porque-voce-deveria-se-importar.aspx).### Comandos para listagem de pacotes do NuPack
Listar os pacotes disponíveis no NuPack é algo simples, o comando é:
{% highlight csharp %}
List-Package
{% endhighlight %}
Apesar de termos este comando, podemos "brincar" com ele utilizando parâmetros ou trabalhando com sua saída. #### Listando pacotes instalados no projeto
Para listarmos os pacotes instalados/inclusos no projeto basta fazermos:
{% highlight csharp %}
List-Package -Installed
{% endhighlight %}
#### Listando pacotes de um local específico
Para listarmos pacotes presentes em um local específico, um repositório local por exemplo, podemos fazer:
{% highlight csharp %}
List-Package -Source c:\repositorio-pacotes
{% endhighlight %}
Importante notar que Source deve ser uma URI, podendo serum diretório com pacotes ou um Atom Feed contendo a descrição dos pacotes.#### Verificando se existem updates disponíveis para um pacote
Para verificarmos se há atualizações disponíveis para um pacote que temos adicionado ao nosso projeto basta utilizarmos o comando:
{% highlight csharp %}
List-Package -Update
{% endhighlight %}
Este comando **não** irá instalar astualizações, mas sim mostrará se há ou não uma atualização disponível.#### Filtrando a listagem de pacotes
Para filtrarmos a listagem dos pacotes podemos brincar com os comandos abaixo:
{% highlight csharp %}
List-Package | select idList-Package | select version
{% endhighlight %}
Ou ainda podemos mesclar estes comandos:
{% highlight csharp %}
List-Package -Update | select id,UpdateAvailable
{% endhighlight %}
Ou seja estou pedindo a listagem de pacotes para saber se há atualizações, mas não quero visualizar todos os campos, quero ver apenas o Id(nome do pacote) e a informação dizendo se há atualização ou não.Bom, estes são os comandos de listagem para utilização no console Powershell do NuPack. Ok Vinicius, mas de onde saíram estes comandos? Simples: [da documentação](http://nupack.codeplex.com/documentation?title=Package%20Manager%20Console%20Command%20Reference)!É bastante importante, e interessante até, lermos a documentação dos projetos que utilizamos. Principalmente as novidades, afinal é a forma de obtermos conhecimento sobre elas.Continuarei "traduzindo" estas informações aqui, até cobrir todo "set" de comandos disponíveis.Abraços, e até a próxima.Vinicius Quaiato.
