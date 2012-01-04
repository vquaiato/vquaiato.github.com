--- 
layout: post
title: "Asp.Net Ajax Library: Nova biblioteca do Asp.Net 4.0"
wordpress_id: 511
wordpress_url: http://viniciusquaiato.com/blog/?p=511
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
tags: 
- title: Novidades
  slug: novidades
  autoslug: novidades
- title: ASP.NET
  slug: asp-net
  autoslug: asp.net
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: Ajax
  slug: ajax
  autoslug: ajax
- title: Ajax Library
  slug: ajax-library
  autoslug: ajax-library
---
[Asp.Net Ajax Library](http://www.asp.net/ajaxlibrary/MainPage.ashx) é uma nova biblioteca JavaScript que nos permite criar aplicações orientadas a dados de forma simples e prática.Ela difere do Ajax Control Toolkit no sentido de que todos os seus controles e funcionalidades rodam inteiramente no client, ou seja, é possível utilizar o Ajax Library em páginas 100% html, nenhum code behind, nenhum arquivo .aspx e nenhum arquivo .cs (é possível trabalhar com .aspx e codebehind, só não é obrigatório).Para realizarmos este exemplo vamos fazer o download da biblioteca no CodePlex neste link: [http://ajax.codeplex.com/](http://ajax.codeplex.com/)Neste exemplo veremos como gerar uma tabela de dados contendo o nome de algumas bandas e suas respectivas fotos.Não utilizaremos ainda acesso a webservices, trabalharemos com dados locais.Para isso criaremos um projeto Asp.Net WebSite vazio, e adicionaremos um arquivo html, chamado Default.htm (Sim, nossa aplicação toda executará em um arquivo .htm).Vamos adicionar ao projeto os arquivos .js que fazem parte da biblioteca, como mostra a imagem abaixo:[[caption id="attachment_590" align="aligncenter" width="300" caption="Adicionando arquivos js Asp.Net Ajax Library 4.0"]![Adicionando arquivos js Asp.Net Ajax Library 4.0](http://viniciusquaiato.com/images_posts/Adicionando-arquivos-js1-300x229.jpg "Adicionando arquivos js Asp.Net Ajax Library 4.0")[/caption]](http://viniciusquaiato.com/images_posts/Adicionando-arquivos-js1.jpg)Feito isso adicionarei os trechos de código abaixo na página Default.html. Separei em dois blocos para mostrar primeiro o código JavaScript e depois o código HTML, no final colocarei o código completo da página.
{% highlight csharp %}
    Sys.require([Sys.components.dataView],        function () {
var bandas = [                { Nome: 'Metallica', Foto: 'metallica.jpg' }
,                { Nome: 'The Smiths', Foto: 'smiths.jpg' }
,                { Nome: 'Depeche Mode', Foto: 'depeche.jpg' }
,                { Nome: 'Los hermanos', Foto: 'hermanos.jpg' }
            ];
    Sys.create.dataView("#corpo",{
ata: bandas}
);
    }
);
    </script>
{% endhighlight %}
Como pode ser visto na **_linha 1_** estou adicionando uma referência para o arquivo Start.js, que faz parte do Asp.Net Ajax Library, e adicionamos no nosso projeto.Na **_linha 3_** começa a acontecer a "mágica". Chamamos o método require que recebe neste caso dois parâmetros. O primeiro é uma biblioteca a ser carregada, neste caso o _Sys.components.dataView_. o segundo parâmetro é uma função a ser executada depois que a biblioteca foi carregada, ou seja, seus recursos já estão disponíveis.Um dos principais recursos para a exibição de dados é o DataView. DataView é basicamente um template, criamos marcações HTML e então pedimos para o Ajax Library transformar em um dataview.Da **_linha 5_** até **_linha 10_** eu crio um objeto utilizando notação [JSON](http://www.json.org/), contendo o nome de uma banda, e o nome de um arquivo com a imagem da banda, bastante simples. Este objeto será nossa fonte de dados.Na **_linha 11_** ocorre o bind dos dados. Utilizando o _Sys.create.dataView_ passamos como primeiro parâmetro o id de um elemento HTML onde deve ser criado o dataview. E como segundo parâmetro dizemos que o objeto bandas deve ser usado como fonte de dados.Bastante simples.Abaixo está o código HTML, onde definimos o elemento que será o dataView:
{% highlight csharp %}
        <tr>            <td>                <span>{
Nome}
}
</span>            </td>            <td>                ![]()            </td>        </tr>    </tbody></table>
{% endhighlight %}
Apenas criamos uma table, simples. Na **_linha 8_** está um detalhe importante pois utilizamos uma class chamada _sys-template_. Esta class é necessária para que o Ajax Library reconheça este elemento como um template com o qual ele poderá trabalhar.Na **_linha 11_** criamos um span e como valor do span utilizamos a marcação {
Nome}
}
 que diz para o Ajax Library que ali deve ser colocado o campo Nome da fonte de dados que passamos para ele.Na **_linha 14_** fazemos quase a mesma coisa, a diferença é que ao invés de utilizarmos o atributo src do elemento img, utilizamos sys-src, pois o valor deste atributo {
Foto}
}
 está entre as aspas, e é com o _sys-src_ que o Ajax Library consegue fazer o bind corretamente.Pronto! Agora temos nossa aplicação funcionando, realizando o bind da nossa fonte de dados, e exibindo tudo da maneira desejada. Como mostra a figura abaixo:[[caption id="attachment_600" align="aligncenter" width="247" caption="Página usando Asp.Net Ajax Library"]![Página usando Asp.Net Ajax Library](http://viniciusquaiato.com/images_posts/Pagina-usando-Asp.Net-Ajax-Library-247x300.jpg "Página usando Asp.Net Ajax Library")](http://viniciusquaiato.com/images_posts/Pagina-usando-Asp.Net-Ajax-Library.jpg)[/caption]O código completo da página Default.html está aqui:
{% highlight csharp %}
            Sys.require([Sys.components.dataView],                function () {
var bandas = [                        { Nome: 'Metallica', Foto: 'metallica.jpg' }
,                        { Nome: 'The Smiths', Foto: 'smiths.jpg' }
,                        { Nome: 'Depeche Mode', Foto: 'depeche.jpg' }
,                        { Nome: 'Los hermanos', Foto: 'hermanos.jpg' }
                    ];
    Sys.create.dataView("#corpo",                     {                         data: bandas                     }
);
    }
);
    </script>    </head>    <body>        <table>            <thead>                <tr>                    <th>Banda</th>                    <th>Foto</th>                </tr>            </thead>            <tbody id="corpo" class="sys-template">                <tr>                    <td>                        <span>{
Nome}
}
</span>                    </td>                    <td>                        ![]()                    </td>                </tr>            </tbody>        </table>    </body></html>
{% endhighlight %}
Bom pessoal, por hoje é isso. O Asp.Net Ajax Library possui uma série de recursos e controles incríveis. São 3 tipos diferentes de bindings, e os bindings podem ser feitos de maneiras variadas.Pretendo ir dando mais detalhes e informações por aqui, na medida do possível.Alguns How To podem ser vistos [aqui](http://www.asp.net/ajaxlibrary/learn.ashx).Comentário, críticas e sugestões são bem vindos.

Att,
Vinicius Quaiato.
