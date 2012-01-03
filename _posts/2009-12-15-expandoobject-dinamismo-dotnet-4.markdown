--- 
layout: post
title: "ExpandoObject: dinamismo no .NET 4.0"
wordpress_id: 268
wordpress_url: http://viniciusquaiato.com/blog/?p=268
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
tags: 
- title: VS2010
  slug: vs2010
  autoslug: vs2010
- title: dynamic
  slug: dynamic
  autoslug: dynamic
- title: ExpandoObject
  slug: expandoobject
  autoslug: expandoobject
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: c# 4
  slug: c-4
  autoslug: c#-4
---
Fala galera, hoje vamos falar um pouco sobre dynamic no [.NET 4.0](http://msdn.microsoft.com/pt-br/vstudio/dd582936.aspx).[Dynamic](http://msdn.microsoft.com/en-us/library/system.dynamic.dynamicobject%28VS.100%29.aspx) é um novo tipo introduzido no .net framework 4.0, é um tipo estático assim como os outros tipos do framework, no entanto ele ignora as verificações estáticas em tempo de compilação.Deve-se prestar atenção, então, aos erros que podem acontecer em runtime, pois um código que não existe e seja chamado gerará um erro em tempo de execução.Alguns podem achar que isso é um problema, esse papo todo de runtime e etc, eu já não enxergo desta maneira, vejo como uma oportunidade para novas criações.Diversas empresas e projetos que trabalham com .net se deparam em situações onde a equipe diz: "Ah se isso fosse diferente... Poderíamos fazer de forma mais simples ou legível...".Isso não é uma coisa ruim, é um sinal de que em algumas situações necessitamos de algo mais dinâmico do que o que o .net proporciona (proporcionava) até então.Bom vamos falar um pouco do [ExpandoObject](http://msdn.microsoft.com/en-us/library/system.dynamic.expandoobject%28VS.100%29.aspx).ExpandoObject é um objeto que pode ter membros adicionados ou removidos dinâmicamente. Com ele é possível definirmos métodos e propriedades em tempo de execução.Talvez muitos de nós não vejamos vantagens neste tipo de feature logo de início, mas para muitos será uma feature muito interessante e que proporcionará um grande avanço.Vamos imaginar o seguinte cenário para a utilização do ExpandoObject:Um sistema consome diversos webservices de empresas distintas de um mesmo segmento, porém, para cada usuário do sistema configuramos uma permissão diferente aos serviços oferecidos por estes webservices.Vejamos um código de exemplo (lembrando que você precisa do [Visual Studio 2010 beta 2](http://msdn.microsoft.com/pt-br/vstudio/dd582936.aspx)).
{% highlight csharp %}
using System;
    using System.Dynamic;
    namespace ExpandoObjectApplication{    class Program    {        

static void Main(string[] args)        {            dynamic objetoDinamico = new ExpandoObject();
    dynamic Sistema1 = new ExpandoObject();
    dynamic Sistema2 = new ExpandoObject();
    Sistema1.PodeAcessar = false;
    Sistema1.AlgumaAcao = (Func<string>)(() =>            {                if (Sistema1.PodeAcessar)                    return "AlgumaAcao no Sistema1";
    else                    return "Você não pode acessar este serviço";
    }
);
    objetoDinamico.Sistema1 = Sistema1;
    Sistema2.PodeAcessar = true;
    Sistema2.OutraAcao = (Func<int>)(() =>            {                if (Sistema2.PodeAcessar)                    return 1 + 1;
    else                    throw new Exception("Você não pode acessar este serviço");
    }
);
    objetoDinamico.Sistema2 = Sistema2;
    Console.WriteLine("objetoDinamico.Sistema1.AlgumaAcao: {
}
", objetoDinamico.Sistema1.AlgumaAcao());
    Console.WriteLine("objetoDinamico.Sistema2.OutraAcao: {
}
", objetoDinamico.Sistema2.OutraAcao());
    Console.ReadKey();
    }
    }
}
</int></string>
{% endhighlight %}
Na** linha 2** incluímos uma referência para System.Dynamic, necessário para utilizar o ExpandoObject.nas **linhas 10, 11 e 12** criamos 3 objetos dynamic do tipo ExpandoObject. O primeiro objeto será nosso objeto de permissões. Os objetos Sistema1 e Sistema2 serão cada um a permissão e o acesso ao serviço de terceiros. Na **linha 14** nós criamos uma propriedade em Sistema1 e setamos o seu valor para false.Nas** linhas 15 a 21** estamos definindo um método para o objeto Sistema1. Este método verifica se a propriedade PodeAcessar está com o valor true e então executa o corpo do método.Na** linha 22** dizemos que a propriedade Sistema1 do objeto objetoDinamico é do tipo ExpandoObject, e setamos o seu valor atribuindo a ela o objeto Sistema1.Nas **linhas 24 a 32** fazemos as mesmas coisas para o objeto Sistema2.O resultado pode ser conferido na imagem a seguir:[caption id="attachment_275" align="aligncenter" width="677" caption="Resultado ExpandoObject"]![Resultado ExpandoObject](http://viniciusquaiato.com/blog/wp-content/uploads/2009/12/Resultado-ExpandoObject-dotnet-4.jpg "Resultado ExpandoObject")[/caption]Uma das desvantagens para quem está acostumado com o Visual Studio é que os objetos dynamic não possuem intellisense. Talvez isso não seja algo ruim, ou talvez seja, depende bastante do cenário em que é utilizado.[caption id="attachment_278" align="aligncenter" width="472" caption="Dynamic object intellisense"]![Dynamic object intellisense](http://viniciusquaiato.com/blog/wp-content/uploads/2009/12/Dynamic-object-intellisense.jpg "Dynamic object intellisense")[/caption]É isso galera, um outro exemplo do uso de ExpandoObject pode ser visto [aqui](http://unplugged.giggio.net/unplugged/post/Criando-um-leitor-de-xml-com-as-novas-capacidades-dinamicas-de-C4.aspx).

Att,
Vinicius Quaiato.
