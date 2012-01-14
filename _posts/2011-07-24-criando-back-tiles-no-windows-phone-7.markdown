--- 
layout: post
title: Criando Back Tiles no Windows Phone 7
wordpress_id: 3865
wordpress_url: http://viniciusquaiato.com/blog/?p=3865
categories: 
- title: Windows Phone 7
  slug: windows-phone-7
  autoslug: windows-phone-7
tags: 
- title: Windows Phone 7
  slug: windows-phone-7
  autoslug: windows-phone-7
---
Fala galera, beleza? Aproveitando que mostrei como [Criar Tiles no Windows Phone 7](http://viniciusquaiato.com/blog/criando-tiles-no-windows-phone-7/) agora vou mostrar como criar "back tiles".Alguns tiles no [Windows Phone 7](http://viniciusquaiato.com/blog/category/windows-phone-7/) pode ficar "virando" e mostrando duas faces diferentes. É muito simples configurar seu tiles para comportar-se desta maneira.Primeiro configure seu tile como mostrado no artigo anterior. Agora precisamos setar mais 3 propriedades do objeto StandardTileData como mostrado abaixo:
{% highlight csharp %}
var standardTile = new StandardTileData                        {                            Title = "Título Tile",                            BackgroundImage = new Uri("arroba.png", UriKind.Relative),                            Count = 7,                            BackTitle = "Título Back",                            BackContent = "Conteúdo Back",                            BackBackgroundImage = new Uri("arroba_back.png", UriKind.Relative)}
;
    
{% endhighlight %}
Repare nas propriedades das linhas 7 a 9: BackTitle, BackContent e BackBackgroundImage. São estas propriedades que quando configuradas definem que existirá "um verso" para o  nosso tile.Veja abaixo que o mesmo tile agora possui uma frente e um verso.[gallery link="file" orderby="ID"]É isso :DEsta é uma maneira bastante simples de mostrar as informações que sua app possui e que sejam interessante e importantes para o consumidor dela.Lembre-se que se for para não mostrar nada é melhor não configurar o seu back tile, afinal de contas não servirá para muita coisa.E novamente lembramos que não é possível fixar um tile diretamente, o usuário do windows phone é quem precisa escolher por "pinar" ou não o aplicativo na home e então visualizar o tile.No próximo post sobre o Windows Phone 7 veremos um pouco de Tile Push Notifications e atualizações dos tiles.

Abraços,
Vinicius Quaiato.
