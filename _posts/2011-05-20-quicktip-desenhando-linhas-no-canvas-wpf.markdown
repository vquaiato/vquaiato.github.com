--- 
layout: post
title: "QuickTip: Desenhando linhas no Canvas WPF"
wordpress_id: 3466
wordpress_url: http://viniciusquaiato.com/blog/?p=3466
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: Wpf
  slug: wpf
  autoslug: wpf
- title: Grid lines
  slug: grid-lines
  autoslug: grid-lines
- title: Canvas Grid Lines
  slug: canvas-grid-lines
  autoslug: canvas-grid-lines
- title: WPF Canvas tilling
  slug: wpf-canvas-tilling
  autoslug: wpf-canvas-tilling
- title: Desenhar linhas canvas wpf
  slug: desenhar-linhas-canvas-wpf
  autoslug: desenhar-linhas-canvas-wpf
---


Fala galera estou trabalhando em um projeto bem diferente do comum, e usando WPF.Neste momento estou precisando desenhar linhas em um [Canvas](http://msdn.microsoft.com/en-us/library/system.windows.controls.canvas.aspx), para gerar um grid(não um grid de dados, mas um tilling ou grid lines). Sabem aqueles papéis quadriculados? Pois bem, quase o mesmo.Estava imaginando que teria que executar fors e desenhar linhas, ou uma porção de quadrados. Que nada! O WPF resolve isso com os pés nas costas.Basta definirmos a propriedade Background do nosso [Canvas](http://msdn.microsoft.com/en-us/library/system.windows.controls.canvas.aspx) para usar um [VisualBrush](http://msdn.microsoft.com/en-us/library/system.windows.media.visualbrush.aspx) com alguma "gambetagem"(retirada do [stackoverflow](http://stackoverflow.com/questions/4209853/canvas-with-transforms-whats-the-best-way-to-draw-a-grid)):
{% highlight csharp %}
            <visualbrush.visual>                <grid>                    <rectangle width="1" height="0.02" fill="Black" horizontalalignment="Left" verticalalignment="Top" />                    <rectangle height="1" width="0.02" fill="Black" horizontalalignment="Left" verticalalignment="Top" />                </grid>            </visualbrush.visual>        </visualbrush>    </canvas.background></canvas>
{% endhighlight %}
O resultado será um canvas mais ou menos assim:[![WPF Canvas](http://viniciusquaiato.com/images_posts/WPF-Canvas-300x182.png "WPF Canvas")](http://viniciusquaiato.com/images_posts/WPF-Canvas.png)

Ou se preferirem usar um DrawingBrush:
{% highlight csharp %}
                <drawingbrush.drawing>                    <geometrydrawing geometry="M0,0 L0,1 0.03,1 0.03,0.03 1,0.03 1,0 Z" brush="Black" />                </drawingbrush.drawing>            </drawingbrush>        </canvas.background>    </canvas>
{% endhighlight %}
Se o Canvas for redimensionado, as linhas serão redesenhadas. Muito fácil!

Abraços,
Vinicius Quaiato.
