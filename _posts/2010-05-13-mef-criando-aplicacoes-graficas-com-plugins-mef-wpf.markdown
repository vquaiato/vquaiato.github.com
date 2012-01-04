--- 
layout: post
title: "MEF - Criando aplica\xC3\xA7\xC3\xB5es gr\xC3\xA1ficas com plugins MEF + WPF"
wordpress_id: 943
wordpress_url: http://viniciusquaiato.com/blog/?p=943
categories: 
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: .NET 4. 0   slug: net-4-0
  autoslug: .net-4.0
tags: 
- title: Wpf
  slug: wpf
  autoslug: wpf
- title: MEF
  slug: mef
  autoslug: mef
- title: Plugins
  slug: plugins
  autoslug: plugins
- title: Managed Extensibility
  slug: managed-extensibility
  autoslug: managed-extensibility
---
Mais [MEF](http://viniciusquaiato.com/blog/mef-managed-extensibility-framework-no-net-4/) galera! O assunto é polêmico e controverso, mas antes de entrar no debate "MEF é um container de DI? " vou continuar mostrando o poder do mesmo. No [segundo post sobre o MEF](http://viniciusquaiato.com/blog/mef-criando-aplicacoes-plugaveis-no-net-4/) mostrei como criar um plugin simples para um logger, apenas código. Poderia ser uma regra de negócio, algo assim. Hoje vamos compor uma interface gráfica com o MEF. É isso mesmo, vamos lá. Criarei uma aplicação WPF com apenas uma janela. Essa aplicação contém 3 [StackPanel](http://msdn.microsoft.com/en-us/library/system.windows.controls.stackpanel.aspx). O primeiro deles contém controles criados dentro da aplicação, controles padrão.O segundo contém UserControls carregados através do MEF. E o terceiro contém um [TabControl](http://msdn.microsoft.com/en-us/library/system.windows.forms.tabcontrol.aspx) com algumas tabs criadas dentro da aplicação e outra inserida com o MEF. O projeto WPF é este abaixo:[caption id="attachment_944" align="aligncenter" width="270" caption="Wpf com MEF solution"][![Wpf com MEF solution](http://viniciusquaiato.com/images_posts/wpf-solution.jpg "Wpf com MEF solution")](http://viniciusquaiato.com/images_posts/wpf-solution.jpg)[/caption]O código da nossa janela segue abaixo:
{% highlight csharp %}
</tabitem>            </tabcontrol>        </stackpanel>    
{% endhighlight %}
Não há nenhum mistério no código acima, e o resultado dele pode ser visto abaixo:[caption id="attachment_945" align="aligncenter" width="300" caption="Wpf com MEF window design"][![Wpf com MEF window design](http://viniciusquaiato.com/images_posts/wpf-solution-design-300x295.jpg "Wpf com MEF window design")](http://viniciusquaiato.com/images_posts/wpf-solution-design.jpg)[/caption]Como pode ser visto os plugins serão carregados pelo MEF. Então vamos criar uma nova solution que conterá nossos plugins. Serão basicamente 2 UserControls simples e um TabItem, a nova solution pode ser vista abaixo:[caption id="attachment_948" align="aligncenter" width="296" caption="plugins mef wpf"][![plugins mef wpf](http://viniciusquaiato.com/images_posts/plugins-mef-wpf.jpg "plugins mef wpf")](http://viniciusquaiato.com/images_posts/plugins-mef-wpf.jpg)[/caption]A imagem dos UserControls criados pode ser vista abaixo, e como são bem simples não vou colocar o código XAML aqui (estará disponível para download no final do post):[caption id="attachment_951" align="aligncenter" width="300" caption="user controls wpf mef"][![user controls wpf mef](http://viniciusquaiato.com/images_posts/user-controls-300x181.jpg "user controls wpf mef")](http://viniciusquaiato.com/images_posts/user-controls.jpg)[/caption]O código para os 3 plugins está abaixo:
{% highlight csharp %}
[Export(typeof(UserControl))]
public partial class UserControl1 : UserControl{    

public UserControl1()    {        InitializeComponent();
    }
}

{% endhighlight %}

{% highlight csharp %}
[Export(typeof(UserControl))]
public partial class UserControl2 : UserControl{    

public UserControl1()    {        InitializeComponent();
    }
}

{% endhighlight %}

{% highlight csharp %}
[Export(typeof(TabItem))]
public class TabPlugin1 : TabItem{    

public TabPlugin1()    {         this. Header = "Tab Plugin com MEF";
    this. Content = "Content da tab carregada com MEF";
    }
}

{% endhighlight %}
Notem na **_linha 1_** das 3 listagens acima que estamos utilizando o atributo Export, explicado [aqui neste post](http://viniciusquaiato.com/blog/mef-criando-aplicacoes-plugaveis-no-net-4/). As duas primeiras listagens criam UserControls que foram mostrados na figura acima. A terceira listagem cria um TabItem que é o tipo de objeto adicionado no TabControl, pois estamos criando uma tab em forma de plugin. Tudo muito simples. Agora para que tudo isso seja carregado na nossa aplicação, vamos compilar a solution dos plugins e copiar as DLLs para uma pasta na nossa aplicação WPF chamada plugins. Feito isso o código abaixo deve ser colocado no codebehinde da nossa janela wpf:
{% highlight csharp %}

public partial class MainWindow : Window{    [ImportMany]    
public List<usercontrol> pluginButtons;
    [ImportMany]    
public List<tabitem> tabPlugins;
    
public MainWindow()    {        InitializeComponent();
    Loaded += new RoutedEventHandler(MainWindow_Loaded);
    }
void MainWindow_Loaded(object sender, RoutedEventArgs e)    {
var catalog = new DirectoryCatalog("../../plugins");
    catalog.Refresh();
var container = new CompositionContainer(catalog);
    container.ComposeParts(this);
foreach(var b in this.pluginButtons)            this.stackPluginsContainer.Children.Add(b);
foreach(var t in this.tabPlugins)            this.tabComPlugins.Items.Add(t);
    }
}
</tabitem></usercontrol>
{% endhighlight %}
Nas **_linhas 4 e 6_** temos duas coleções, uma de UserControl e outra de TabItem. Estas coleções é que serão compostas pelo MEF. Ambas possuem o atributo Import explicado aqui neste post. Nas **_linhas 19 a 21_** estamos dizendo ao MEF para criar um catálogo de parts na pasta plugins e criando um container com este catálogo, então dizemos ao MEF para compôr nossa janela WPF, ou seja compôr as parts da nossa janela (as coleções de UserControl e TabItem).Por final apenas percorrermos as coleções e adicionamos cada coisa em seu lugar, os UserControls em seu StackPanel e os TabItems no TabControl. Para mais detalhes sobre cada o catálogo, o container e o processo de composição [veja este post aqui](http://viniciusquaiato.com/blog/mef-criando-aplicacoes-plugaveis-no-net-4/).O resultado da nossa aplicação, quando pressionamos F5 é este:[caption id="attachment_954" align="aligncenter" width="300" caption="App Wpf usando  MEF"][![app wpf mef](http://viniciusquaiato.com/images_posts/app-wpf-mef-300x252.jpg "app wpf mef")](http://viniciusquaiato.com/images_posts/app-wpf-mef.jpg)[/caption]Reparem nos nossos 3 plugins adicionados perfeitamente.É isso pessoal, este é mais um exemplo de como o MEF pode nos ajudar a criar aplicações plugáveis e extensíveis. Poderíamos criar telas e módulos inteiros de um sistema utilizando o MEF. Podemos criar um sistema complexo apenas plugando diversas partes deste sistema, totalmente modularizado. Poderíamos ter features fixas do sistema, coisas padrão, e distribuir outras funcionalidades de forma isolada, para alguns usuários, clientes ou para quem comprasse estas features. Tudo de forma pluggable e simples. As possibilidades são muitas, mas vale muito ficar atento e entender em quais cenários utilizar e em quais cenários não utilizar. Os fontes todos podem ser [baixados aqui](http://viniciusquaiato.com/files/codesamples/mef/WPFMEFApp_Code.zip).Qualquer dúvida, comentário, crítica ou sugestão deixem comentários ou mandem e-mail que eu respondo =]Abraços,Vinicius Quaiato.
