--- 
layout: post
title: Output Cache para child actions no ASP.NET MVC 3 RC
wordpress_id: 2116
wordpress_url: http://viniciusquaiato.com/blog/?p=2116
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: ASP.NET MVC 3
  slug: asp-net-mvc-3
  autoslug: asp.net-mvc-3
- title: MVC 3 Release Candidate
  slug: mvc-3-release-candidate
  autoslug: mvc-3-release-candidate
- title: ASP.NET MVC 3 Release Candidate
  slug: asp-net-mvc-3-release-candidate
  autoslug: asp.net-mvc-3-release-candidate
- title: Output Cache
  slug: output-cache
  autoslug: output-cache
- title: output Cache child action
  slug: output-cache-child-action
  autoslug: output-cache-child-action
---
Hello there! Seguindo com as novidades do ASP.NET MVC 3 e do Release Candidate lançado dia 09/11, neste post mostrarei o output cache para pedaços de uma página, ou child actions.## Output cache no ASP.NET MVC
O ASP.NET MVC já possuía output cache em suas versões anteriores, mas o cache era feito do output inteiro. Agora é possível especificar que o resultado de uma action deverá ser mantido em um cache de retorno, e quando esta action for renderizada utilizando Html.RenderAction ou Html.Action esse resultado poderá vir do cache.## Output cache no ASP.NET MVC 3 Release Candidate
Agora no Release Candidate do ASP.NET MVC 3 foi disponibilizado um atributo para ser colocado nas actions que define se ela deve ser mantida no output cache.Vamos ver um exemplo:<pre lang="csharp" line="1">[OutputCache(Duration = 30, VaryByParam = "none")]public DateTime ActionComCache(){    return DateTime.Now;}</pre>O que estamos fazendo, primeiro, é marcando a action com o atributo OutputCache. Configuramos a duração do cache em segundo, usando o parâmetro Duration. Neste caso, 30 segundos.O parâmetro VaryByParam serve para dizer quais oa parâmetros influenciam na composição do cache, neste caso estamos dizendo que o cache não vai variar de acordo com parâmetros, até por que a action não recebe nada.Na minha view eu tenho:<pre lang="xml">@using System.Threading;<!DOCTYPE html SYSTEM><html><head>    <title>ActionComCache</title></head><body>    <div>        @for(int i=0;i<10;i++){            Thread.Sleep(4000);                        <text>E a hora de geração é: @Html.Action("ActionComCache")</text><br />        }    </div></body></html></pre>O que fazemos é renderizar o resultado da action ActionComCache. Veja que estou dando um Sleep na thread para que possamo ver o cache em ação:[caption id="attachment_2117" align="aligncenter" width="300" caption="Usando Ouptput Cache no ASP.NET MVC 3 release candidate"][![Usando Ouptput Cache no ASP.NET MVC 3 release candidate](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/usando-ouptput-cache-300x271.png "Usando Ouptput Cache no ASP.NET MVC 3 release candidate")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/11/usando-ouptput-cache.png)[/caption]Reparem que na parte azul da imagem temos o resultado da nossa action utilizando um primeiro momento no cache. Ou seja, não foi executada a action várias vezes, mas sim foi pego o resultado do output desta action que estava no cache. Quando os 30 segundos configurados expiraram, a action foi novamente executada e seu output colocado no cache, como pode ser visto na parte vermelha.É isso galera, depois escreverei mais sobre o Output cache, sobre a variação por parâmetros, etc.Este é um recurso interessante se usado de maneira correta. Não precisamos cair na idéia de colocar tudo no cache para "melhorar o desempenho". Analise cada caso com cuidado.Abraços,Vinicius Quaiato.
