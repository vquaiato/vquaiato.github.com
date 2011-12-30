--- 
layout: post
title: "QuickTip: juntando duas listas"
wordpress_id: 1602
wordpress_url: http://viniciusquaiato.com/blog/?p=1602
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: List
  slug: list
  autoslug: list
- title: listas
  slug: listas
  autoslug: listas
- title: juntar listas
  slug: juntar-listas
  autoslug: juntar-listas
- title: Union
  slug: union
  autoslug: union
- title: Concat
  slug: concat
  autoslug: concat
- title: AddRange
  slug: addrange
  autoslug: addrange
---
Uma amiga ([@lekaverta](http://twitter.com/lekaverta)) me perguntou se havia uma maneira simples, em C#, de juntar o conteúdo de duas List<t> sem ficar fazendo foreach.Existem pelo menos umas três formas de fazer isso com pouco código, vamos ver alguns desses exemplos simples.

### Juntando duas List com AddRange
<pre lang="csharp" line="1">[TestMethod]public void Deve_Juntar_Duas_Listas_Com_AddRange(){    var lista1 = new List<string> { "a", "b", "c" };    var lista2 = new List<string> { "e", "d", "f" };    lista1.AddRange(lista2);    CollectionAssert.IsSubsetOf(lista2, lista1);}</string></string></pre>Acima adicionamos a lista2 inteira dentro da lista1. Nos certificamos disso na linha 9, verificando que a lista2 é um subset da lista1, ou seja, a lista1 contém a lista2.Notem que AddRange é um membro da classe List<t> e não da interface IList<t>.

### Juntando duas List com Union
<pre lang="csharp" line="1">[TestMethod]public void Deve_Juntar_Duas_Listas_Com_Union(){    var lista1 = new List<string> { "a", "b", "c" };    var lista2 = new List<string> { "e", "d", "f" };    var merged = lista1.Union(lista2).ToList();    CollectionAssert.IsSubsetOf(lista2, merged);    CollectionAssert.IsSubsetOf(lista1, merged);}</string></string></pre>Union, do Linq, nos permite fazer a união de duas listas, resultando em um novo IEnumerable. Desta vez eu verifico que as duas listas são um subset desta nova lista gerada.É importante ressaltar que o Union não duplica elementos iguais presentes nas duas listas, como vemos abaixo:<pre lang="csharp" line="1">[TestMethod]public void Deve_Juntar_Duas_Listas_Com_Union(){    var lista1 = new List<string> { "a", "b", "c" };    var lista2 = new List<string> { "e", "b", "f" };    var merged = lista1.Union(lista2).ToList();    CollectionAssert.IsSubsetOf(lista2, merged);    CollectionAssert.IsSubsetOf(lista1, merged);    CollectionAssert.AllItemsAreUnique(merged);}</string></string></pre>No código acima o elemento "b" está presente nas duas listas, mas na linha 12 garantimos que todos os itens da nova lista são únicos.

### Juntando duas List com Concat
<pre lang="csharp" line="1">[TestMethod]public void Deve_Juntar_Duas_Listas_Com_Concat(){    var lista1 = new List<string> { "a", "b", "c" };    var lista2 = new List<string> { "e", "b", "f" };    var merged = lista1.Concat(lista2).ToList();    CollectionAssert.IsSubsetOf(lista2, merged);    CollectionAssert.IsSubsetOf(lista1, merged);}</string></string></pre>Aqui novamente uma nova lista é gerada, no entanto itens iguais são mantidos. O Concat também faz parte do Linq.

### Resumo da ópera
Temos então 3 formas simples de juntar duas listas de dados:[AddRange](http://msdn.microsoft.com/en-us/library/z883w3dc.aspx)[Union](http://msdn.microsoft.com/en-us/library/bb341731.aspx)e[Concat](http://msdn.microsoft.com/en-us/library/bb302894.aspx)Agora vocês podem juntar suas listas sem fazer tantos foreach, deixando o código um pouco mais legível e limpo.</t></t></t>
