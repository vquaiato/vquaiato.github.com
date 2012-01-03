--- 
layout: post
title: "Nomeando bem os m\xC3\xA9todos"
wordpress_id: 1044
wordpress_url: http://viniciusquaiato.com/blog/?p=1044
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: nomes
  slug: nomes
  autoslug: nomes
- title: nomenclatura
  slug: nomenclatura
  autoslug: nomenclatura
- title: "m\xC3\xA9todos"
  slug: metodos
  autoslug: "m\xC3\xA9todos"
---
Continuando a falar sobre código claro, legível e compreensível, falarei um pouco sobre minhas percepções com relação aos nomes dos métodos.Precisamos entender que o método é uma ação. Realiza algum tipo de operação, por mais simples que seja. É o comportamento de um objeto. E ao meu ver, acima de tudo, é a descrição deste objeto. É sua própria documentação. Sendo assim, devemos tomar cuidado ao dar nome para os métodos. Não vou falar aqui sobre coesão e responsabilidade única, são assuntos para outros posts. Aqui estou apenas falando da nomenclatura.

### O nome que não diz nada...
Vejamos o seguinte exemplo:
{% highlight csharp %}

public bool Permite(int idEmp, string caminho){    //faz alguma coisa}

{% endhighlight %}
Ok! Tudo que eu consigo saber é que este método retorna um booleano. O que ele "permite"? E os parâmetros? Se ao menos isso estivesse bem escrito, facilitaria em algo.E se o método estivesse escrito assim:
{% highlight csharp %}

public bool VerificaEmpresaAcessaPasta(int idEmpresa, string caminhoPasta){    //faz alguma coisa}

{% endhighlight %}
Poxa, muito mais claro! Agora o método me diz tudo que eu preciso saber. Sim, o nome ficou um pouco mais extenso, mas qual o problema disso? Nenhum!

### O método 'faz tudo'...
É muito comum criarmos um método simples. Que recebe ali seu parametrozinho, e faz seu trabalho. No entanto com o passar do tempo, qualquer necessidade que surge e <i>parece</i> estar relacionada com o método, vamos jogando parâmetros nele. Resultado: bagunça, falta de clareza, falta de coesão.Nasce assim>
{% highlight csharp %}

public object[] FiltraEmpresa(int id){    //traz a empresa por id}

{% endhighlight %}
E morre assim:
{% highlight csharp %}

public object[] FiltraEmpresa(int? id, string nome, string cnpj, string uf, string cidade, bool ativa){    if(id.HasValue)        //faz algo com id    if(!string.IsNullOrWhiteSpace(nome))        //faz algo com nome    //etc etc}

{% endhighlight %}
Completamente bagunçado!Podemos tornar as coisas mais claras assim:
{% highlight csharp %}

public object ObterEmpresaPorId(int id){ }


public object ObterEmpresaPorCnpj(string cnpj){ }


public object[] ObterEmpresaPeloNome(string nome, bool ativa){ }


public object[] ObterEmpresaPorUf(string uf, bool ativa){ }


public object[] ObterEmpresaPorUfECidade(string uf, string cidade, bool ativa){ }

{% endhighlight %}
Você deve estar pensando "Mas agora eu escrevi muito mais código!". E eu respondo: "Mentira!".Esse código todo já estava dentro do método <i>FiltraEmpresa</i>, só que estava 'escondido' debaixo dos panos. Agora eles estão expostos de forma clara, coesa, e <b>documentada</b>.Agora estão claras as formas de obter uma empresa.

### As sobrecargas que não revelam nada...
Um outro caso, que é um pouco polêmico, é com relação a sobrecargas. Confesso que não sou muito fã delas.Calma. Calma. Explicarei.Sobrecargas, no geral, acabam extrapolando o limite do aceitável. Já vi situações onde mais de 13 sobrecargas existiam, e o problema é que o método já estava começando a realizar diferentes funções, baseado nos parâmetros que recebia.Por isso, na maioria dos casos, eu prefiro métodos com nomes bem definidos do que sobrecargas. Vamos utilizar o cenário anterior, mas ao invés dos nomes bem definidos, vamos utilizar assim:
{% highlight csharp %}

public object PesquisaEmpresa(int id){ }


public object PesquisaEmpresa(string cnpj){ }

{% endhighlight %}
Até aí tudo bem. O nome dos parâmetros, se estiverem claros, revelam a intenção do método.Mas e este caso aqui:
{% highlight csharp %}

public object[] PesquisaEmpresa(string nome, bool ativa){ }


public object[] PesquisaEmpresa(string uf, bool ativa) { }

{% endhighlight %}
Como fazemos? Já vi casos onde se coloca um parâmetro a mais, apenas para diferenciar. Absurdo!Mantenha as interfaces de seus objetos tão claras quanto possível. Deixe-os com nomes limpos e de fácil entendimento.Não tenha medo de escrever 5, 10, 15 caracteres a mais, isso não vai te prejudicar em nada, pelo contrário.Em alguns casos, as sobrecargas são bastante úteis, mas é preciso entender e analisar bastante, pois no geral podem causar muita confusão.É isso. Ficam aí mais algumas considerações sobre clareza de código. Lembrando que são apenas as minhas considerações. Mas acredito que estas pequenas considerações economizam tempo, esforço e nos permitem focar no software ao invés de decifrar o que os objetos podem ou não fazer.A recomendação da Microsoft para a capitalização dos métodos é o PascalCase: [http://msdn.microsoft.com/en-us/library/ms229043(v=VS.100).aspx](http://msdn.microsoft.com/en-us/library/ms229043(v=VS.100).aspx)Att,Vinicius Quaiato.
