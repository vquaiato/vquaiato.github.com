--- 
layout: post
title: Trabalhando com valores via POST no Nancy
wordpress_id: 3287
wordpress_url: http://viniciusquaiato.com/blog/?p=3287
categories: 
- title: ASP. NET   slug: asp-net-dotnet
  autoslug: asp. net tags: 
- title: Nancy
  slug: nancy
  autoslug: nancy
- title: Nancy framework
  slug: nancy-framework
  autoslug: nancy-framework
- title: projeto Nancy
  slug: projeto-nancy
  autoslug: projeto-nancy
- title: POST com Nancy
  slug: post-com-nancy
  autoslug: post-com-nancy
---
[![](http://viniciusquaiato.com/images_posts/Nancy_Sinatra2-150x150.jpg "Nancy_Sinatra2")](http://viniciusquaiato.com/images_posts/Nancy_Sinatra2.jpg)[Mostrei um pouco o que é o framework Nancy](http://viniciusquaiato.com/blog/nancy-um-framework-web-leve-para-net/) e como começar a trabalhar com ele. No primeiro post mostrei apenas como trabalhar com requisições GET. Vamos então entender como trabalhar com valores via requisições POST.# Valores POST no framework Nancy
Espero que vocês já tenham configurado sua aplicação para Nancy (se não viram [confiram aqui](http://viniciusquaiato.com/blog/nancy-um-framework-web-leve-para-net/)).Vamos criar um módulo Nancy, como abaixo:
{% highlight csharp %}
namespace NancyModulePost{    using Nancy;
    
public class MainModule : NancyModule    {        

public MainModule()        {            Get["/"] = p =>            {
return View["formulario.cshtml"];
    }
;
    Post["/postar"] = p =>            {
var nome = Request.Form["Nome"];
var sobrenome = Request.Form.Sobrenome;
return View["postado.cshtml", new Dados(nome, sobrenome)];
    }
;
    }
    }
}

{% endhighlight %}
Simples não? Vejam que na **_linha 14_** estamos definindo uma "rota" para requisições do tipo POST para _"/postar"_. Para recuperar os valores enviados do formulário precisamos acessar o dicinário Form do objeto Request. Por enquanto não existem nenhum model binder no Nancy (existe um spike que pode ser visto aqui ([https://github.com/grumpydev/Nancy/tree/ModelBindersSpike](https://github.com/grumpydev/Nancy/tree/ModelBindersSpike)).Desta forma podemos acessar os valores tanto através da sintaxe index-based usando _Form["chave"]_ ou a sintaxe dynamic com _Form.Chave_.A nossa view não contém mais do que um simples formulário html:
{% highlight csharp %}
Sobrenome: </label>        <input type="text" name="Sobrenome" /><br />        <input type="submit" value="Postar" />    </form></body>
{% endhighlight %}
Repare que a action do form é _"/postar"_ ou seja, vai cair no mapeamento que fizemos no nosso módulo do [Nancy](https://github.com/thecodejunkie/Nancy).Criei também uma view para exibir os dados postados:
{% highlight csharp %}
<body>    Nome postado: @Model</body>
{% endhighlight %}
Pronto! Isso é tudo. Agora temos os dados postados e estamos exibindo-os. Claro poderíamos manipulá-los de algumas maneiras, inserir no banco, etc (falarei sobre banco de dados em post futuro).Confira abaixo o resultado:[caption id="attachment_3289" align="aligncenter" width="300" caption="Exibindo view com formulario POST em Nancy"][![Exibindo view com formulario POST em Nancy](http://viniciusquaiato.com/images_posts/Exibindo-view-com-formulario-POST-em-Nancy-300x166.png "Exibindo view com formulario POST em Nancy")](http://viniciusquaiato.com/images_posts/Exibindo-view-com-formulario-POST-em-Nancy.png)[/caption][caption id="attachment_3290" align="aligncenter" width="300" caption="Exibindo dados enviados via POST com Nancy"][![Exibindo dados enviados via POST com Nancy](http://viniciusquaiato.com/images_posts/Exibindo-dados-enviados-via-POST-com-Nancy-300x166.png "Exibindo dados enviados via POST com Nancy")](http://viniciusquaiato.com/images_posts/Exibindo-dados-enviados-via-POST-com-Nancy.png)[/caption]É isso aê galera. Em breve posto mais coisas sobre este framework: Nancy. enquanto isso baixem o fonte, brinquem, olhem os testes, etc.

Abraços,
Vinicius Quaiato.
