--- 
layout: post
title: Timer para Dojo em C# + WPF
wordpress_id: 976
wordpress_url: http://viniciusquaiato.com/blog/?p=976
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: Projetos
  slug: projetos
  autoslug: projetos
tags: 
- title: .Net Architects
  slug: net-architects
  autoslug: .net-architects
- title: Wpf
  slug: wpf
  autoslug: wpf
- title: Coding Dojo
  slug: coding-dojo
  autoslug: coding-dojo
- title: Dojo
  slug: dojo
  autoslug: dojo
- title: Timer
  slug: timer
  autoslug: timer
- title: Codeplex
  slug: codeplex
  autoslug: codeplex
---
Fala galera, ontem o Rodrigo Vidal me pediu um timer para utilziar nos encontros de Dojo do [.Net Architects RJ](http://rj.dotnetarchitects.net/). Eu não tinha nenhum timer, estávamos usando meu celular nos [Dojos aqui em SP](http://dojo.dotnetarchitects.net).[caption id="attachment_977" align="aligncenter" width="381" caption="Timer para Dojo em C# e WPF"][![Timer para Dojo em C# e WPF](http://viniciusquaiato.com/blog/wp-content/uploads/2010/05/dojotimer.png "Timer para Dojo em C# e WPF")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/05/dojotimer.png)[/caption]Em 10min. acabei fazendo algo bem simples, e o código não é dos melhores, mas é o que deu pra fazer em 10min.O projeto está no Codeplex [http://dojotimer.codeplex.com/](http://dojotimer.codeplex.com/) , e podemos ir evoluindo conforme as necessidades. O XAML do timer está abaixo:
{% highlight csharp %}
            
{% endhighlight %}
O código C# está aqui:
{% highlight csharp %}
 60 ? tempoCorrido / 60 : 0), tempoCorrido % 60);        tempo.Text = string.Format("{0}:{1}", (4 - timeSpan.Minutes).ToString("00"), (59 - timeSpan.Seconds).ToString("00"));    }}
{% endhighlight %}
Quando o timer é iniciado, ele é minimizado. Após os 5 minutos, ele é maximizado sobre todas as janelas, e então um som é disparado.Tá aí, quem quiser brincar: [http://dojotimer.codeplex.com/](http://dojotimer.codeplex.com/)
