--- 
layout: post
title: Entendendo as letrinhas do MVC
wordpress_id: 2787
wordpress_url: http://viniciusquaiato.com/blog/?p=2787
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: MVC
  slug: mvc
  autoslug: mvc
- title: View
  slug: view
  autoslug: view
- title: Model
  slug: model
  autoslug: model
- title: "Pap\xC3\xA9is MVC"
  slug: papeis-mvc
  autoslug: "pap\xC3\xA9is-mvc"
- title: Controller
  slug: controller
  autoslug: controller
---
[![](http://viniciusquaiato.com/images_posts/sopa-de-letras-150x150.jpg "sopa de letras")](http://viniciusquaiato.com/images_posts/sopa-de-letras.jpg)Eu não imaginava que existissem tantas dúvidas sobre o que cada uma das "letrinhas" do MVC significam e fazem. Mas essa pergunta apareceu na minha timeline semana passada e também na lista .NET Architects, e em ambos os locais eu vi respostas, digamos, estranhas.

## O padrão de arquitetura
O padrão MVC é um padrão de arquitetura pois está em um "patamar" acima de outros padrões de design. Quando digo acima não quero dizer melhor, mas sim que ele é aplicado em nível de aplicação e não em nível de classes.

## As letrinhas do MVC
São três os papéis considerados pelo MVC: Model, View e Controller.Cada um destes papéis possui suas responsabilidades bem definidas e delineadas. No entanto podemos observar na maioria dos projetos uma obesidade(quase mórbida) dos Controllers e uma confusão muito grande acerca do Model. Vamos entender "separadamente" cada uma das letras, ou papéis.

## M - o Modelo
O Model, ou Modelo, pode ser um objeto que representa conceitos de domínio. Geralmente ele vai se referir a um objeto do [Domain Model](http://en.wikipedia.org/wiki/Domain_model).Mas segundo o Martin Fowler no livro POEAA também podemos pensar no Model como sendo outra coisa que não um objeto do Domain Model desde que ele não tenha nenhuma informação relacionada com apresentação, ampliando assim a idéia do Modelo.Eu costumo dizer que o M do MVC é diferente do Model do DDD. Costumo dizer que no MVC o Model vai compor toda e qualquer classe que não seja apresentação e nem o Controller, em outras palavras dentro do M do MVC estão as entidades, serviços, infra, etc. Já vou explicar mais sobre isso quando falarmos em Views.

## V - as Views
A View no MVC nada mais é do que uma representação gráfica/visual do modelo em uma interface com o usuário.A View possui uma, e apenas uma missão: Exibir dados!Qualquer coisa que esteja além disso não é papel da View.Então se estamos dizendo que a View é uma representação gráfica do Modelo já eliminamos uma série de participantes do Modelo de serem passados para uma View. Serviços, repositórios, DAOs, etc, nada disso possui representação gráfica. Então eles estão no M mas não possuem representação visual.Quando qualquer informação do Modelo precisa ser alterada/manipulada isso não é feito <del datetime="2011-01-12T12:43:37+00:00">na</del> pela View: aí entra nosso amigo Controller.

## C - os Controladores
Os Controllers são responsáveis por receber as interações entre os usuários e o Modelo. Ele recebe os inputs faz as manipulações necessárias no Modelo e decide como a View deve ser atualizada.Isto não quer dizer que o Controller faz um monte de coisas: não!Quando algo precisa ser feito no Model o Controller deve simplesmente delegar isso ao Model, ou seja, delegar isso para os repositórios, entidades, serviços, etc. O Controller deve ser simples, claro e coeso. 

## Os diagramas
Vejo diversos diagramas sobre o padrão MVC na internet, em livros, etc. Confesso que não gosto da maioria deles. Eles dão a impressão de que a View conhece o Controller, que o Model conhece a View: é confuso!Acho que a representação que eu mais gosto é esta aqui obtida do [Patterns & Practices](http://msdn.microsoft.com/en-us/library/ff649643.aspx):[caption id="attachment_2788" align="aligncenter" width="318" caption="Representação MVC"][![Representação MVC](http://viniciusquaiato.com/images_posts/Diagrama.gif "Representação MVC")](http://viniciusquaiato.com/images_posts/Diagrama.gif)[/caption]Eu gosto deste diagrama pois:- A View só conhece o Model;
    - O Controller conhece a View e o Model;
    - O Model é totalmente ignorante da View e o Controller
Este desenho é apenas uma ilustração do padrão. Não é um diagrama de sequência, interação, etc. Pense nele como uma visualização(uma View) do Modelo(o padrão).

## Resumo
No MVC o M não é o mesmo Model que no DDD ou no Domain Model.A View de alguma forma observa o Model, mas no contexto da web isso não fica muito claro pela natureza stateless dos requests.O Controller manipula o Model e decide qual View deve ser usada para representá-lo.Não confie nos diagramas. Existem variações do padrão MVC, algumas delas você pode ver aqui no [Patterns & Practices](http://msdn.microsoft.com/en-us/library/ff649643.aspx).

## Dica de leitura
Eu gosto [deste livro do Fowler](http://www.amazon.com/Patterns-Enterprise-Application-Architecture-Martin/dp/0321127420), apesar de ter apenas 3 páginas falando o padrão MVC. Acho que não é necessário mais do que isso.É isso galera, abraços,Vinicius Quaiato.
