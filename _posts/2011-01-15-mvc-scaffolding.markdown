--- 
layout: post
title: MVC Scaffolding
wordpress_id: 2807
wordpress_url: http://viniciusquaiato.com/blog/?p=2807
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: MVCScaffolding
  slug: mvcscaffolding
  autoslug: mvcscaffolding
- title: Scaffolding
  slug: scaffolding
  autoslug: scaffolding
- title: MVC Scaffold
  slug: mvc-scaffold
  autoslug: mvc-scaffold
---


[![Scaffold](http://viniciusquaiato.com/images_posts/scaffold-221x300.jpg "Scaffold")](http://viniciusquaiato.com/images_posts/scaffold.jpg)

Scaffolding é a prática de criar, rapidamente, alguns pedaços de nossas aplicações.O termo ficou bastante popularizado após o "boom" do Ruby on Rails.O processo de Scaffolding, ou de contrução de pequenas partes da aplicação de forma automatizada, nos permite aliviar a carga que teríamos em processos repetitivos e, de certa forma, braçais.Estas partes, no geral, constituem: criação de controllers, criação de views com um layout padrão, criação de um mecanismo de acesso a dados e a codificação padrão dos métodos comuns de CRUD(Create, Read, Update e Delete).

## MVC Scaffolding
MVC Scaffolding é o projeto de scaffolding coordenado por Scott Hanselman e Steven Sanderson, fontes podem ser baixados na página do [MVC Scaffolding no codeplex](http://mvcscaffolding.codeplex.com/).O projeto é algo bastante interessante pois nos permite trabalhar com ASP.NET MVC e as facilidades de uma ferramenta de scaffolding o que dá ainda mais poder e agilidade para projetos MVC.A instalação não poderia ser mais simples, via NuGet é claro.**Nota:** Se você ainda não conhece NuGet você precisa se informar. É algo que está cada vez mais presente na comunidade .NET.

### Instalando o MVC Scaffolding


A instalação é simples, basta utilizarmos o comando abaixo no console do NuGet:
{% highlight csharp %}
Install-Package MvcScaffolding
{% endhighlight %}
[![Instalando MVCScaffolding](http://viniciusquaiato.com/images_posts/instalando-mvc-scaffolding-300x145.png "Instalando MVCScaffolding")](http://viniciusquaiato.com/images_posts/instalando-mvc-scaffolding.png)



## Criando nosso primeiro Scaffold
Agora já temos o MVCScaffolding instalado vamos criar uma classe para realizarmos o Scaffolding da mesma. Neste caso, aproveitando o gancho do MVC Summit vou criar uma classe palestra:
{% highlight csharp %}

public class Palestra{    

public int PalestraId { get;
    set;
    }
    
public string Titulo { get;
    set;
    }
    
public string Resumo { get;
    set;
    }
    
public DateTime Data { get;
    set;
    }
}



{% endhighlight %}
Criamos esta classe pois é ela que será utilizada para o Scaffolding, ou seja, vamos pedir para que o MVCScaffolding crie o controller, as views, e um contexto do Entity Framework para esta classe. É importante lembrar que antes de executar o comando de scaffolding é preciso compilar o projeto.Para executarmos o Scaffolding precisamos apenas do comando abaixo:
{% highlight csharp %}
Scaffold Controller Palestra
{% endhighlight %}
[![Comando de Scaffolding executado](http://viniciusquaiato.com/images_posts/Comando-de-Scaffolding-executado-300x113.png "Comando de Scaffolding executado")](http://viniciusquaiato.com/images_posts/Comando-de-Scaffolding-executado.png)



Podemos reparar que como resultado do comando temos os arquivos criados e adicionados ao nosso projeto:[![Arquivos gerados pelos MVCScaffolding](http://viniciusquaiato.com/images_posts/Arquivos-gerados-pelos-MVCScaffolding-181x300.png "Arquivos gerados pelos MVCScaffolding")](http://viniciusquaiato.com/images_posts/Arquivos-gerados-pelos-MVCScaffolding.png)



O controller já é criado com todas as actions de CRUD preparadas, inclusive já contendo uma referência para um container do EF 4. O contexto do EF que é criado utiliza as novas feastures de Code First, ou seja, não é preciso criar um arquivo EDMX nem nada do tipo.E pasmem que o banco de dados também será criado!Por padrão o DbContext criado irá utilizar uma instância padrão do SqlExpress que esteja instalada na máquina. Em um próximo post mostrarei como mudar isso.Agora já podemos executar nossa aplicação e teremos as actions no nosso controller, as views e a persistência já criados e implementados, sem nenhum esforço adicional.Abaixo podemos ver algumas imagens das views que foram geradas. Reparem que estas views possuem comportamentos, mesmo aqueles que são comportamentos de banco de dados.[![View Index gerada pelo MVCScaffolding](http://viniciusquaiato.com/images_posts/View-Index-gerada-pelo-MVCScaffolding-300x222.png "View Index gerada pelo MVCScaffolding")](http://viniciusquaiato.com/images_posts/View-Index-gerada-pelo-MVCScaffolding.png)



[![View Create gerada pelo MVCScaffolding](http://viniciusquaiato.com/images_posts/View-Create-gerada-pelo-MVCScaffolding-300x222.png "View Create gerada pelo MVCScaffolding")](http://viniciusquaiato.com/images_posts/View-Create-gerada-pelo-MVCScaffolding.png)



[![Index com conteudo persistido no banco pelo MVCScaffolding](http://viniciusquaiato.com/images_posts/Index-com-conteudo-persistido-no-banco-pelo-MVCScaffolding-300x222.png "Index com conteudo persistido no banco pelo MVCScaffolding")](http://viniciusquaiato.com/images_posts/Index-com-conteudo-persistido-no-banco-pelo-MVCScaffolding.png)



[![View de Detalhes gerada pelo MVCScaffolding](http://viniciusquaiato.com/images_posts/View-de-Detalhes-gerada-pelo-MVCScaffolding-300x222.png "View de Detalhes gerada pelo MVCScaffolding")](http://viniciusquaiato.com/images_posts/View-de-Detalhes-gerada-pelo-MVCScaffolding.png)



[![View de Exclusao gerada pelo MVCScaffolding](http://viniciusquaiato.com/images_posts/View-de-Exclusao-gerada-pelo-MVCScaffolding-300x222.png "View de Exclusao gerada pelo MVCScaffolding")](http://viniciusquaiato.com/images_posts/View-de-Exclusao-gerada-pelo-MVCScaffolding.png)



E se você não acredita que o banco já está criado e os dados foram persistidos:[![Banco de Dados gerado pelo MVCScaffolding](http://viniciusquaiato.com/images_posts/Bando-de-Dados-gerado-pelo-MVCScaffolding-300x205.png "Banco de Dados gerado pelo MVCScaffolding")](http://viniciusquaiato.com/images_posts/Bando-de-Dados-gerado-pelo-MVCScaffolding.png)



## Resumo
Bom, por enquanto é isso galera. Há muito mais coisas no MVCScaffolding do que pude mostrar nesse primeiro post. Mas como vocês podem imaginar, não vou parar por aqui. Em breve publicarei mais algumas informações sobre como trabalhar e tirar o melhor proveito do MVCScaffolding.Enquanto isso podem conferir o código fonte todo desta pequena aplicação gerada aqui no github.

Abraços,
Vinicius Quaiato.
