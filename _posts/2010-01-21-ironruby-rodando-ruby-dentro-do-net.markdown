--- 
layout: post
title: "IronRuby: Rodando Ruby dentro do .NET"
wordpress_id: 374
wordpress_url: http://viniciusquaiato.com/blog/?p=374
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
tags: 
- title: Novidades
  slug: novidades
  autoslug: novidades
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
- title: Wpf
  slug: wpf
  autoslug: wpf
---
O [IronRuby](http://www.ironruby.net/) é um port da linguagem [Ruby](http://www.ruby-lang.org/pt/) para ser executada juntamente com o .Net Framework.Atualmente o IronRuby está em release candidate(versão 1.0 - RC1), e em algum tempo devemos ter a versão oficial.A idéia aqui não é descrever em pormenores os detalhes da linguagem Ruby, pois inúmeras referências podem ser encontradas na web: [Ruby on Br](http://rubyonbr.org/) é uma delas.Vou demonstrar como começar a utilizar o IronRuby juntamente com as bibliotecas do .Net e como produzir algum código.Vamos iniciar instalando o IronRuby, e para isso faça o download no [site oficial do Ironruby no CodePlex aqui](http://ironruby.codeplex.com/Release/ProjectReleases.aspx?ReleaseId=35312#ReleaseFiles). Eu utilizei a versão _Windows Installer_. Execute este instalador após o download, ele irá extrair os arquivos para uma pasta especificada.Assim como a maioria das linguagens dinâmicas o IronRuby possui um console interativo, onde podemos escrever código e testar seu uso. E é desta forma que trabalharemos neste primeiro momento.Execute o console do IronRuby, que deve ser encontrado na _**[pasta de instalação]\bin\ir.exe**_.Você deverá ver uma tela semelhante a esta:[caption id="attachment_380" align="aligncenter" width="677" caption="IronRuby Console"]![IronRuby Console](http://viniciusquaiato.com/blog/wp-content/uploads/2010/01/IronRuby-Console.jpg "IronRuby Console")[/caption]Agora já podemos começar a escrever nosso código Ruby/IronRuby.Como nosso primeiro código, vamos criar uma classe que terá apenas um método, um famoso Olá Mundo:
{% highlight csharp %}
class OlaIronRuby    def DigaOiputs "Olá Mundo IronRuby!"    endend
{% endhighlight %}
Quando digitarmos esse código no console do IronRuby esta classe estará disponível para uso, e a utilizaremos assim:
{% highlight csharp %}
instancia = OlaIronRuby.new
{% endhighlight %}
E fazemos a chamada para o método assim:
{% highlight csharp %}
instancia.DigaOi
{% endhighlight %}
Abaixo vocês conferem todo o código no console do IronRuby:[caption id="attachment_388" align="aligncenter" width="677" caption="Criando instancia de classe no IronRuby"]![Criando instancia de classe no IronRuby](http://viniciusquaiato.com/blog/wp-content/uploads/2010/01/Criando-instancia-de-classe-no-IronRuby1.jpg "Criando instancia de classe no IronRuby")[/caption]Agora vamos criar uma nova classe que irá trabalhar com bibliotecas do framework. Para referenciarmos um assembly no console, vamos utilizar o require 'nome do assembly', como pode ser visto no código abaixo, onde utilizamos o WindowsForms.MessageBox para exibir uma mensagem usando o IronRuby:
{% highlight csharp %}
require 'System.Windows.Forms'System::Windows::Forms::MessageBox.show "Olá MessageBox!"
{% endhighlight %}
E o resultado podemos ver aqui:[caption id="attachment_392" align="aligncenter" width="680" caption="Usando MessageBox com IronRuby"]![Usando MessageBox com IronRuby](http://viniciusquaiato.com/blog/wp-content/uploads/2010/01/Usando-MessageBox-com-IronRuby.jpg "Usando MessageBox com IronRuby")[/caption]Podemos ainda criar aplicações WPF por exemplo. Para isso vamos digitar nosso código em um arquivo e salvá-lo como _WpfIronRuby.rb_, o código pode ser visto abaixo:
{% highlight csharp %}
require 'wpf'include Wpfjanela = Wpf::Window.newjanela.Title = 'WPF com IronRuby'janela.content = Wpf::TextBlock.newjanela.content.text = "Janela WPF usando IronRuby!"janela.content.font_size = 60app = Application.newapp.run janela
{% endhighlight %}
Para este código funcionar eu copiei o arquivo wpf.rb da pasta _**[instalação do ironruby]\Samples\Tutorial\app\wpf.rb**_ para _**[instalação do ironruby]\Lib\ironruby**_Para executar a aplicação eu abri o command do windows e naveguei a até a pasta onde salvei o arquivo, no meu caso o Desktop e digitei: ir.exe WpfIronRuby.rb como pode ser visto na imagem abaixo:[caption id="attachment_395" align="aligncenter" width="400" caption="Rodando aplicação Wpf com IronRuby"][![Rodando aplicação Wpf com IronRuby](http://viniciusquaiato.com/blog/wp-content/uploads/2010/01/Rodando-app-Wpf-com-IronRuby.jpg "Rodando aplicação Wpf com IronRuby")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/01/Rodando-app-Wpf-com-IronRuby.jpg)[/caption]Bom galera, é isso.O ironRuby ainda está saindo do forno, e com certeza será(e já é) uma grande soma para o .Net Framework.Qualquer dúvida, mail-me ou comentem.

Abraços,
Vinicius Quaiato.
