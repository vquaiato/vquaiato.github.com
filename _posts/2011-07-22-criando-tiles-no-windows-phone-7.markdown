--- 
layout: post
title: Criando Tiles no Windows Phone 7
wordpress_id: 3831
wordpress_url: http://viniciusquaiato.com/blog/?p=3831
categories: 
- title: Windows Phone 7
  slug: windows-phone-7
  autoslug: windows-phone-7
tags: 
- title: Windows Phone 7
  slug: windows-phone-7
  autoslug: windows-phone-7
- title: Windows Phone
  slug: windows-phone
  autoslug: windows-phone
- title: Tiles
  slug: tiles
  autoslug: tiles
- title: Live Tiles
  slug: live-tiles
  autoslug: live-tiles
---
[![](http://viniciusquaiato.com/images_posts/Tile-criado-no-Windows-Phone-71-165x300.png "Tile criado no Windows Phone 7")](http://viniciusquaiato.com/images_posts/Tile-criado-no-Windows-Phone-71.png)Fala galera, beleza? Uma das coisas bacanas do [Windows Phone 7 é a idéia de "Live Tiles"](http://www.microsoft.com/windowsphone/en-gb/features/default.aspx#start-screen-live-tiles) que nada mais são do que informações sobre nossas apps na home do aparelho. O conceito de live/vivo vem da idéia de que podemos manter os Tiles atualizados, exibindo informações, mesmo se nossa app estiver fechada. Cool hã?(se você ainda não sabe nada do [Windows Phone 7 leia estes posts](http://viniciusquaiato.com/blog/category/windows-phone-7/), e [visite esta página no MSDN](http://msdn.microsoft.com/en-us/library/hh202948(v=VS.92).aspx))

## Criando Tiles no Windows Phone 7
Criar Tiles no Windows Phone 7 é muito, mas muito simples mesmo (o modelo de desenvolvimento do WP7 é sensacional).

### Criando o background para seu tile do Windows Phone 7
Primeiro vamos criar uma imagem para o nosso tile. As imagens para [tiles devem seguir alguns padrões, confira aqui.](http://msdn.microsoft.com/en-us/library/hh202884(v=VS.92).aspx)Como eu sou bem preguiçoso eu apenas criei uma imagem 173x173 pixels no paint mesmo(salve como png).

### Criando Tiles via C#
Agora vamos criar uma app para Windows Phone 7 no Visual Studio.Primeiro adicione sua imagem ao projeto e marque suas propriedades como abaixo:[caption id="attachment_3836" align="aligncenter" width="300" caption="Configurando background tile no projeto WP7"][![Configurando background tile no projeto WP7](http://viniciusquaiato.com/images_posts/Configurando-background-tile-no-projeto-300x264.png "Configurando background tile no projeto WP7")](http://viniciusquaiato.com/images_posts/Configurando-background-tile-no-projeto.png)[/caption]Feito isso só nos resta criar o código para configurar nosso tile. Insira o código abaixo no construtor da sua MainPage por exemplo:
{% highlight csharp %}

public void CreateApplicationTile() {
var meuTile= ShellTile.ActiveTiles.First();
if(meuTile!= null)    {
var standardTile = new StandardTileData                                {                                    Title = "Título Tile",                                    BackgroundImage = new Uri("arroba.png", UriKind.Relative),                                    Count = 7        }
;
    meuTile.Update(standardTile);
    }
}

{% endhighlight %}
Explicando: na **_linha 2_** obtemos um objeto do tipo [ShellTile](http://msdn.microsoft.com/en-us/library/microsoft.phone.shell.shelltile_members(v=VS.92).aspx). Sempre existirá um tile para nossa aplicação, por isso podemos pegar o first neste caso.Na **_linha 5_** criamos um objeto do tipo [StandardTileData](http://msdn.microsoft.com/en-us/library/microsoft.phone.shell.standardtiledata_members(v=VS.92).aspx) que é responsável por armazenar as informações de um Tile, ou seja é o ViewModel do tile.Neste caso estamos configurando 3 propriedades do nosso tile: Title, BackgroundImage e Count.[caption id="attachment_3837" align="aligncenter" width="384" caption="Propriedades de um tile no Windows Phone 7"][![Propriedades de um tile no Windows Phone 7](http://viniciusquaiato.com/images_posts/Propriedades-de-um-tile-no-Windows-Phone-7.png "Propriedades de um tile no Windows Phone 7")](http://viniciusquaiato.com/images_posts/Propriedades-de-um-tile-no-Windows-Phone-7.png)[/caption]Se sua aplicação não faz uso de informações como Count basta deixar seu valor como 0 e então esta informação não será exibida.

### Pin to Start
Como nós não somos intrusos, o tile está definido mas falta fixá-lo na home do nosso device. Para fazer isso basta pressionarmos o ícone da nossa app no Windows Phone e escolher a opção "pin to start":[caption id="attachment_3839" align="aligncenter" width="165" caption="Pin tile do start page Windows Phone 7"][![Pin tile do start page Windows Phone 7](http://viniciusquaiato.com/images_posts/Pin-tile-do-start-page-Windows-Phone-7-165x300.png "Pin tile do start page Windows Phone 7")](http://viniciusquaiato.com/images_posts/Pin-tile-do-start-page-Windows-Phone-7.png)[/caption]E lá está nosso tile criado e na start page do Windows Phone 7:[caption id="attachment_3840" align="aligncenter" width="305" caption="Tile criado no Windows Phone 7"][![Tile criado no Windows Phone 7](http://viniciusquaiato.com/images_posts/Tile-criado-no-Windows-Phone-7.png "Tile criado no Windows Phone 7")](http://viniciusquaiato.com/images_posts/Tile-criado-no-Windows-Phone-7.png)[/caption]

## Resumo
Tile é um recurso bastante interessante do Windows Phone 7. Preste bastante atenção ao guia sobre as cores e padrões para a criação dos tiles pois eles devem funcionar perfeitamente com qualquer esquema de cores que esteja sendo utilizado no phone.Nos próximos posts veremos como criar backtiles e como atualizar as informações do nosso tile utilizando Tile Push Notifications.Estas informações iniciais do seu tile como Title e BakcgoundImage podem ser definidas sem a necessidade de código, [veja aqui no MSDN](http://msdn.microsoft.com/en-us/library/ff462080(VS.92).aspx).

Abraços,
Vinicius Quaiato.
