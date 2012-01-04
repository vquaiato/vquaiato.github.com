--- 
layout: post
title: "Lazy<T> Novo tipo gen\xC3\xA9rico para lazy loading no .net 4"
wordpress_id: 964
wordpress_url: http://viniciusquaiato.com/blog/?p=964
categories: 
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: .NET 4. 0   slug: net-4-0
  autoslug: .net-4.0
tags: 
- title: Novidades
  slug: novidades
  autoslug: novidades
- title: .NET 4. 0   slug: net-4-0
  autoslug: .net-4.0
- title: Lazy Loading
  slug: lazy-loading
  autoslug: lazy-loading
---
Fala galera, lendo algumas coisas sobre MEF acabei conhecendo um novo tipo disponível no .NET 4: [Lazy&lt;
    T&gt;
    ](http://msdn.microsoft.com/en-us/library/dd642331(v=VS.100).aspx).Este novo tipo, Lazy&lt;
    T&gt;
    , nos possibilita adiar a inicialização do seu valor até o momento do uso. Imagine que o tipo T é um tipo complexo que demanda muito processamento para ser criado, utilizando o Lazy é possível que esta inicialização seja adiada o máximo possível, até o momento da chamada ao valor. Vejamos no exemplo abaixo:
{% highlight csharp %}
Lazy<string> lazy = new Lazy<string>(() =>{    Thread.Sleep(3000);
return "Conteúdo";
    }
);
    Console.WriteLine("Criado: {
}
\n", lazy.IsValueCreated);
    Stopwatch sw = new Stopwatch();
    sw.Start();
    Console.WriteLine("Valor: {
}
", lazy.Value);
    sw.Stop();
    Console.WriteLine("Tempo 1ª chamada: {
}
\n", sw.Elapsed);
    Console.WriteLine("Criado: {
}
\n", lazy.IsValueCreated);
    sw = new Stopwatch();
    sw.Start();
    Console.WriteLine("Valor: {
}
", lazy.Value);
    sw.Stop();
    Console.WriteLine("Tempo 2ª chamada: {
}
\n", sw.Elapsed);
    </string></string>
{% endhighlight %}
Nas _**linhas 1 a 5**_ estamos criando um Lazy&lt;
    string&gt;
    . Ok, isso não é um cenário real, mas estamos dizendo que para a criação deste tipo a Thread deverá dormir por 3 segundos. Estou utilizando o Lazy pois não quero que a Thread congele no momento da instanciação deste objeto, mas sim no momento da utilização do mesmo. O Lazy&lt;
    T&gt;
    possui 2 propriedades públicas: _[IsValueCreated](http://msdn.microsoft.com/en-us/library/dd642334(v=VS.100).aspx)_ que é um booleano indicando se o valor já foi inicializado ou não. E também _[Value](http://msdn.microsoft.com/en-us/library/dd642177(v=VS.100).aspx)_, que retorna o valor armazenado. O restante do código é bem simples, na_ **linha 7**_ apenas verificamos se o valor já está criado, que deve ser falso. Na _**linha 11**_ fazemos a chamada para a propriedade Value, e isto fará com que a Thread congele por 3 segundos e nossa string seja de fato criada. Na _**linha 13**_ escrevo no console o tempo que demorou a invocação da propriedade Value, que deve ser de cerca de 3 segundos. Depois repito este processo para verificar o tempo gasto, que será muito menor do que 3 segundos, pois nosso valor já foi inicializado anteriormente. Confira abaixo a saída do programa:[caption id="attachment_965" align="aligncenter" width="389" caption="Lazy<t> resultado no console"][![Lazy<t> resultado no console](http://viniciusquaiato.com/images_posts/lazy_t_.png "Lazy<t> resultado no console")</t></t>](http://viniciusquaiato.com/images_posts/lazy_t_.png)[/caption]É isso galera, fica aí mais uma dica e novidade do .net 4.

Abraços,
Vinicius Quaiato.</t>
