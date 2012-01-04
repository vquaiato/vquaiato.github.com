--- 
layout: post
title: "PLINQ: Paralelismo no .Net 4 com Parallel LINQ"
wordpress_id: 516
wordpress_url: http://viniciusquaiato.com/blog/?p=516
categories: 
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
tags: 
- title: Novidades
  slug: novidades
  autoslug: novidades
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: Paralelismo
  slug: paralelismo
  autoslug: paralelismo
- title: PLINQ
  slug: plinq
  autoslug: plinq
---
Fala galera. Vou abordar um pouco do PLINQ neste post.Parallel LINQ, ou [PLINQ](http://msdn.microsoft.com/en-us/magazine/cc163329.aspx), é uma implementação do padrão [LINQ](http://msdn.microsoft.com/en-us/netframework/aa904594.aspx) que trabalha de forma paralela sobre qualquer fonte de dados em memória que implemente [IEnumerable](http://msdn.microsoft.com/en-us/library/system.collections.ienumerable.aspx) ou [IEnumerable&lt;
    T&gt;
    ](http://msdn.microsoft.com/en-us/library/9eekhta0.aspx), possuindo ainda a execução adiada até o momento em que a query é enumerada, ou seja, de fato utilizada.Umas das novidades é o extension [AsParallel](http://msdn.microsoft.com/en-us/library/system.linq.parallelenumerable.asparallel%28VS.100%29.aspx) que está disponível em IEnumerable e IEnumerable&lt;
    T&gt;
    . AsParallel diz que à partir daquele momento as operações realizadas sobre aquela fonte de dados serão executas de forma paralela, é bem simples. O código abaixo demonstra isso:
{% highlight csharp %}

static void Main(string[] args){
var numeros = Enumerable.Range(0, 10);
var dobrados = from n in numeros.AsParallel()                   select Dobro(n);
foreach(var dobro in dobrados)        Console.WriteLine(dobro);
    Console.ReadKey();
    }


private 
static int Dobro(int numero){    Thread.Sleep(500);
return numero * 2;
    }

{% endhighlight %}
Como vemos na **_linha 5_** estamos chamando o método AsParallel na nossa coleção de números. Então apenas chamamos um método passando o número como parâmetro. Este método apenas congela a thread por meio segundo para que possamos notar como os valores são executados de forma paralela. Na imagem abaixo temos o resultado:[caption id="attachment_543" align="aligncenter" width="205" caption="Enumerando com AsParallel do PLINQ"]![Enumerando com AsParallel do PLINQ](http://viniciusquaiato.com/images_posts/Enumerando-com-AsParallel.jpg "Enumerando com AsParallel do PLINQ")[/caption]O PLINQ também permite de forma simples e fácil especificar quantos processadores queremos utilizar para executar as operações paralelas. É possível especificar até um máximo de 64 processadores (ô loco meu!). Abaixo segue a alteraçãono código anterior especificando 2 processadores a serem utilizados (só tenho 2):
{% highlight csharp %}

var dobrados = from n in numeros.AsParallel().WithDegreeOfParallelism(2)                   select Dobro(n);
    
{% endhighlight %}
Na **_linha 5_** do nosso código adicionamos uma chamada para a extensão [WithDegreeOfParallelism](http://msdn.microsoft.com/en-us/library/dd383719%28VS.100%29.aspx) e passamos como parâmetro o total de processadores a ser utilizado. No mais o código permanece exatamente igual.Outro recurso bastante interessante é realizar o processamento paralelo e conseguir que o resultado seja ordenado. Isso é possível utilizando a extension [AsOrdered](http://msdn.microsoft.com/en-us/library/dd642142%28VS.100%29.aspx).No código anterior poderíamos utilziar AsParallel e continuar realizando o processamento de forma paralela mas mantendo a saída ordenada, como pode ser visto abaixo:
{% highlight csharp %}

var dobrados = from n in numeros.AsParallel().AsOrdered()                   select Dobro(n);
    
{% endhighlight %}
A saída pode ser vista na imagem abaixo:[caption id="attachment_546" align="aligncenter" width="245" caption="PLINQ usando AsParallel com AsOrdered"]![PLINQ usando AsParallel com AsOrdered](http://viniciusquaiato.com/images_posts/AsParallel-com-AsOrdered.jpg "PLINQ usando AsParallel com AsOrdered")[/caption]Existem ainda diversos recursos no PLINQ. Em breve abordarei mais sobre eles aqui.Uma boa documentação está disponível no MSDN [aqui](http://msdn.microsoft.com/en-us/library/dd997425%28VS.100%29.aspx), [aqui](http://msdn.microsoft.com/en-us/library/dd537608%28VS.100%29.aspx) e [aqui](http://msdn.microsoft.com/pt-br/vstudio/dd441784%28en-us%29.aspx#Parallel).Comentários, críticas e sugestões, basta escrever.

Att,
Vinicius Quaiato.
