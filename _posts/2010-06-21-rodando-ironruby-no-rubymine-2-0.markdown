--- 
layout: post
title: Rodando IronRuby no RubyMine 2.0
wordpress_id: 1058
wordpress_url: http://viniciusquaiato.com/blog/?p=1058
categories: 
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
tags: 
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
- title: ruby
  slug: ruby
  autoslug: ruby
- title: RubyMine
  slug: rubymine
  autoslug: rubymine
---


Bom, o [IronRuby](http://ironruby.codeplex.com/) é o [Ruby](http://www.ruby-lang.org/pt/) rodando sobre o .Net Framework. [Já falei um pouco sobre ele aqui](http://viniciusquaiato.com/blog/category/ironruby/).[RubyMine](http://www.jetbrains.com/ruby/) é uma IDE para trabalharmos com Ruby feita pela [JetBrains](http://www.jetbrains.com/index.html), a mesma empresa que desenvolve o ReSharper. Você pode baixar a IDE em versão de avaliação por 30 dias [aqui](http://www.jetbrains.com/ruby/download/index.html).A IDE RubyMine é bastante completa, e eu ainda não tive a oportunidade de explorá-la por completo, e hoje vou apenas mostrar como executar IronRuby no RubyMine.Após instalar o RubyMine, acesse o menu **_File -> Settings_**:[![Configurando RubyMine com IronRuby](http://viniciusquaiato.com/images_posts/settings-1-300x226.jpg "Configurando RubyMine com IronRuby")](http://viniciusquaiato.com/images_posts/settings-1.jpg)



Na janela que se abrirá precisamos apenas configurar o SDK do Ruby para a IDE utilizar, e faremos isso de que forma? Dizendo que o SDK Ruby é o IronRuby, ou o ir.exe, que é o interpretador IronRuby.[![Alterar o SDK Ruby no RubyMine](http://viniciusquaiato.com/images_posts/sdk-300x195.jpg "Alterar o SDK Ruby no RubyMine")](http://viniciusquaiato.com/images_posts/sdk.jpg)



[![Selecionando o Ir.exe](http://viniciusquaiato.com/images_posts/ir-300x195.jpg "Selecionando o Ir.exe")](http://viniciusquaiato.com/images_posts/ir.jpg)



Feito isso já podemos criar código IronRuby no RubyMine. Crie um novo arquivo e digite o seguinte código:
{% highlight csharp %}
require "System"require "System.Windows.Forms"require "System.Drawing"include System::Windows::Formsinclude System::Drawingform = Form.newform.text = "Sou um title IronRuby"label = System::Windows::Forms::Label.newlabel.text = "Eu sou IronRuby!"font = Font.new "Verdana",20label.font = fontlabel.width = 300label.height = 40form.controls.add labelform.show_dialog
{% endhighlight %}
Este código utiliza o Ruby para criar um Form WindowsForms e exibe-o na tela.Para executar o código pressiona shift + f10  ou clique no botão run.[![Executando WindowsForms IronRuby no RubyMine](http://viniciusquaiato.com/images_posts/run-300x179.jpg "Executando WindowsForms IronRuby no RubyMine")](http://viniciusquaiato.com/images_posts/run.jpg)

É isso galera. Em breve pretendo das seguinto nos posts que estou devendo sobre IronRuby: Regras de negócios dinâmicas, IronRuby no browser e IronRuby no WP7.

Abraços,
Vinicius Quaiato.
