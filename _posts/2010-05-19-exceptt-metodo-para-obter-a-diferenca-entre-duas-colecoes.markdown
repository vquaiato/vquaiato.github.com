--- 
layout: post
title: "Except&lt;
    T&gt;
    () m\xC3\xA9todo para obter a diferen\xC3\xA7a entre duas cole\xC3\xA7\xC3\xB5es"
wordpress_id: 969
wordpress_url: http://viniciusquaiato.com/blog/?p=969
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: Dicas
  slug: dicas
  autoslug: dicas
- title: "Cole\xC3\xA7\xC3\xB5es"
  slug: colecoes
  autoslug: "cole\xC3\xA7\xC3\xB5es"
---
Fala galera, dando umas umas fuçadas no .NET achei o método [Except&lt;
    T&gt;
    ](http://msdn.microsoft.com/en-us/library/bb300779.aspx). Não é novidade do .NET 4, está presente no 3.5 SP1 se não me engano.Basicamente este método produz um novo set com as diferenças entre duas collections (dois IEnumerables).Imagine que você tem uma lista com valores, e uma outra lista com valores que você não quer. Para tirar estes valores da primeira, basta usar o Except. Confuso? Veja abaixo:
{% highlight csharp %}
var cores = new List<string> { "azul", "amarelo", "verde", "rosa"}
;
var coresNaoOk = new List<string> { "rosa" }
;
var coresFinal = cores.Except(coresNaoOk).ToList();
    coresFinal.ForEach(c => Console.WriteLine(c));
    //azul//amarelo//verde</string></string>
{% endhighlight %}
Simples! Na **_linha 1_** criamos uma lista com nomes de cores. Na_ **linha 2**_ temos uma lista com as cores que não queremos. Na _**linha 4**_ removemos da lista de cores todas as cores não ok passando esta lista para o método Except na lista de cores.E na _**linha 6**_ estamos exibindo o resultado que pode ser conferido na figura abaixo:[caption id="attachment_970" align="aligncenter" width="245" caption="Resultado método Except"][![Resultado método Except](http://viniciusquaiato.com/blog/wp-content/uploads/2010/05/Except.jpg "Resultado método Except")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/05/Except.jpg)[/caption]O método Except usa o [Default EqualityComparer](http://msdn.microsoft.com/en-us/library/ms224763.aspx) para fazer a comparação dos itens, no entanto você pode informar para o método um EqualityComparer para ser utilizado. Você pode fazer isso criando uma classe que implemente [IEqualityComparer&lt;
    T&gt;
    ](http://msdn.microsoft.com/pt-br/library/system.collections.iequalitycomparer(VS.90).aspx) ou implementando [IEquatable&lt;
    T&gt;
    ](http://msdn.microsoft.com/pt-br/library/ms131187(VS.90).aspx) na sua classe.Tá aí a dica.

Att,
Vinicius Quaiato.
