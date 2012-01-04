--- 
layout: post
title: Zip&lt;
    TFirst, TSecond, TResult&gt;
    novo extension do LINQ
wordpress_id: 795
wordpress_url: http://viniciusquaiato.com/blog/?p=795
categories: 
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
tags: 
- title: Novidades
  slug: novidades
  autoslug: novidades
- title: c# 4
  slug: c-4
  autoslug: c#-4
- title: LINQ
  slug: linq
  autoslug: linq
---
Salve galera do mal!
O Linq no .NET 4 traz uma nova extension: Zip. Ao contrário do que possa parecer Zip não é dos arquivos .zip compactados. Este extension method aplicado a qualquer IEnumerable<T> faz o merge de dois IEnumerable em um terceiro IEnumerable, e o resultado pode ser de um tipo diferente dos outros dois. A assinatura desta extension é:

{% highlight c# %}



public 
static IEnumerable<tresult> Zip<TFirst, TSecond, TResult>(this IEnumerable<tfirst> first,IEnumerable<tsecond> second,Func<TFirst, TSecond, TResult> resultSelector)

{% endhighlight %}

# Usando o Zip
Imaginem o seguinte caso:

{% highlight c# %}

string[] times = { "Santos", "Santo André", "Grêmio Prudente", "São Paulo", "Corinthians" }
;
    int[] classifica = { 1, 2, 3, 4 }
;
    
{% endhighlight %}

Queremos que os 4 primeiros times se classifiquem, e queremos obter a posição de cada um deles. Com o Zip podemos fazer algo assim:

{% highlight c# %}

string[] times = { "Santos", "Santo André", "Grêmio Prudente", "São Paulo", "Corinthians" }
;
    int[] classifica = { 1, 2, 3, 4 }
;
var timesClassificados = times.Zip(classifica, (t, c) => Tuple.Create(t, c));
    
{% endhighlight %}

Na **_linha 3_** o que fizemos é chamar a extension Zip. Passamos então o IEnumerable classifica (1,2,3,4). O segundo argumento é uma Func que recebe 2 parâmetros. O primeiro deles vindo da coleção times, e o segundo vindo de classifica. Então o que fazemos é criar uma Tuple com eses dois valores.O objeto timesClassificados contém 4 items, como pode ser visto abaixo:[caption id="attachment_797" align="aligncenter" width="445" caption="Resultado da utilização do Zip"][![Resultado da utilização do Zip](http://viniciusquaiato.com/blog/wp-content/uploads/2010/03/Resultado1.jpg "Resultado da utilização do Zip")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/03/Resultado1.jpg)[/caption]Eu poderia não criar uma Tuple, poderia criar uma string simplesmente:

{% highlight c# %}

var timesClassificados = times.Zip(classifica, (t, c) => string.Format("{
}
 - {
}
", c, t));
    
{% endhighlight %}

E teríamos o mesmo resultado.Ainda poderia usar Linq ao invés de extensions:

{% highlight c# %}

string[] times = { "Santos", "Santo André", "Grêmio Prudente", "São Paulo", "Corinthians", "Portuguesa" }
;
    int[] classifica = { 1, 2, 3, 4, 5, 6 }
;
var timesClassificados = from item in times.Zip(classifica, (t, c) => new { Time = t, Posicao = c }
)                         where item.Posicao <= 4                         select item;
    
{% endhighlight %}

No exemplo acima, criamos 6 times e 6 posições. Chamamos a extension Zip na _**linha 4**_ e então criamos um tipo anônimo. Na _**linha 5**_ dizemos que queremos apenas os 4 primeiros times. E então temos o mesmo resultado anterior.Dá pra brincar bastante com o Zip. Não é nada sensacional, mas pra quem precisa fazer uns merges meio malucos com coleções, pode tirar proveito desta novidade.Mais informações podem ser obtidas [aqui no MSDN](http://msdn.microsoft.com/en-us/library/dd267698(VS.100).aspx), [aqui neste blog](http://bartdesmet.net/blogs/bart/archive/2008/11/03/c-4-0-feature-focus-part-3-intermezzo-linq-s-new-zip-operator.aspx) e [aqui neste outro blog](http://weblogs.thinktecture.com/cnagel/2010/02/linq-with-net-4-zip.html).É isso, abraços e se divirtam!

Att,
Vinicius Quaiato.
