--- 
layout: post
title: Windows Phone 7 - Criando um leitor de RSS
wordpress_id: 773
wordpress_url: http://viniciusquaiato.com/blog/?p=773
categories: 
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: Silverlight
  slug: silverlight
  autoslug: silverlight
- title: Windows Phone 7
  slug: windows-phone-7
  autoslug: windows-phone-7
tags: 
- title: C#
  slug: c
  autoslug: c#
- title: Novidades
  slug: novidades
  autoslug: novidades
- title: Silverlight 4
  slug: silverlight-4
  autoslug: silverlight-4
- title: Windows Phone 7
  slug: windows-phone-7
  autoslug: windows-phone-7
- title: WP7
  slug: wp7
  autoslug: wp7
---
Fala galera! Vamos criar agora nossa primeira aplicação em [Windows Phone 7](http://www.windowsphone7series.com/).Faremos um simples leitor de RSS exibindo as novidades no emulador do Windows Phone 7.Se você ainda não instalou o que é necessário, veja este post: [Preparando o ambiente para desenvolver para Windows Phone 7](http://viniciusquaiato.com/blog/windows-phone-7-preparando-ambiente-para-desenvolver/).Vamos lá o resultado final do nosso aplicativo será este:[caption id="attachment_782" align="aligncenter" width="155" caption="Windows Phone 7 - Feed Reader"][![Windows Phone 7 - Feed Reader](http://viniciusquaiato.com/blog/wp-content/uploads/2010/03/Final-155x300.jpg "Windows Phone 7 - Feed Reader")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/03/Final.jpg)[/caption]Vamos começar criando uma aplicação para Windows Phone 7 no [Visual Studio 2010 Express](http://developer.windowsphone.com/windows-phone-7-series/):[caption id="attachment_778" align="aligncenter" width="300" caption="Criando projeto para Windows Phone 7"][![Criando projeto para Windows Phone 7](http://viniciusquaiato.com/blog/wp-content/uploads/2010/03/Criando-projeto-300x190.jpg "Criando projeto para Windows Phone 7")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/03/Criando-projeto.jpg)[/caption]Nossa tela será a tela do Windows Phone 7. Vamos então abrir o código XAML e substituir todo código por este:
{% highlight csharp %}
<phonenavigation:phoneapplicationpage x:class="PrimeiroWP7App.MainPage" xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation" xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml" xmlns:phonenavigation="clr-namespace:Microsoft.Phone.Controls;
    assembly=Microsoft.Phone.Controls.Navigation" xmlns:d="http://schemas.microsoft.com/expression/blend/2008" xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" mc:ignorable="d" d:designwidth="480" d:designheight="800" fontfamily="{
taticResource PhoneFontFamilyNormal}
" fontsize="{
taticResource PhoneFontSizeNormal}
" foreground="{
taticResource PhoneForegroundBrush}
">    <grid x:name="LayoutRoot" background="{
taticResource PhoneBackgroundBrush}
">        <grid.rowdefinitions>            <rowdefinition height="Auto" />            <rowdefinition height="*" />        </grid.rowdefinitions>        <grid x:name="TitleGrid" grid.row="0">            <stackpanel>                <border background="#ffcc00">                    <textblock foreground="Black" margin="5" text="Vinicius Quaiato Feed Reader" x:name="textBlockPageTitle" style="{
taticResource PhoneTextPageTitle1Style}
" fontfamily="Verdana" />                </border>                <textblock margin="0,-10" text="Feed for:" x:name="textBlockListTitle" style="{
taticResource PhoneTextPageTitle2Style}
" fontsize="60" fontfamily="Calibri" />                <border margin="0 0 0 10" cornerradius="10" background="#ffcc00">                    <stackpanel orientation="Horizontal">                        <textbox x:name="txtUrl" width="360" background="#fff" foreground="#000" fontsize="22"></textbox>                        </stackpanel></border></stackpanel></grid></grid></phonenavigation:phoneapplicationpage><button content="Read" foreground="Black" click="Button_Click" borderthickness="1" borderbrush="Black"></button>                                                                <grid x:name="Feeds" grid.row="2">            <stackpanel horizontalalignment="Left">                <textblock fontsize="30" foreground="Chartreuse">Items</textblock>                <listbox height="521" margin="0,10,0,0" name="listBox1" verticalalignment="Top" width="476">                    <listbox.itemtemplate>                        <datatemplate>                            <stackpanel orientation="Vertical" height="150" width="476">                                <textblock text="{
inding Title}
" textwrapping="Wrap" foreground="#FFC8AB14" fontsize="22" />                                <textblock text="{
inding Resumo}
" textwrapping="Wrap" fontsize="18" />                            </stackpanel>                        </datatemplate>                    </listbox.itemtemplate>                </listbox>            </stackpanel>        </grid>    
{% endhighlight %}
Eu não sou especialista em XAML, nem de longe, então talvez eu esteja cometendo alguns erros e algumas "gafes", sintam-se à vontade para me corrigir.O código acima não tem nada específico. Não vou detalhar pois não é o escopo deste post explicar como trabalhar com XAML. Talvez a única diferença esteja na **_linha 1_** onde é criada uma phoneNavigation:PhoneApplicationPage. Como o Visual Studio cria isso automaticamente, não vamos nos preocupar.Agora vamos para o código C#, presisone F7 para ir para o codebehinde, e então digite o seguinte código:
{% highlight csharp %}

public partial class MainPage : PhoneApplicationPage{    

public MainPage()    {        InitializeComponent();
    SupportedOrientations = SupportedPageOrientation.Portrait | SupportedPageOrientation.Landscape;
    }
    
private void Button_Click(object sender, RoutedEventArgs e)    {
var uri = new Uri(                            this.txtUrl.Text == string.Empty ?                            @"http://viniciusquaiato.com/blog/rss" :                            this.txtUrl.Text);
    WebClient client = new WebClient();
    client.DownloadStringCompleted += new DownloadStringCompletedEventHandler(client_DownloadStringCompleted);
    client.DownloadStringAsync(uri);
    }
void client_DownloadStringCompleted(object sender, DownloadStringCompletedEventArgs e)    {        if (e.Error == null)        {
var xml = XElement.Parse(e.Result);
var feedItems = from item in xml.Descendants("channel").Descendants("item")                            select new FeedItem { Title = item.Element("title").Value, Resumo = item.Element("description").Value }
;
    this.listBox1.ItemsSource = feedItems.ToList();
    }
    }
}


public class FeedItem{    

public string Title { get;
    set;
    }
    
public string Resumo { get;
    set;
    }
}

{% endhighlight %}
Na listagem acima também não existe nenhum código específico do Windows Phone 7. É exatamente o mesmo código que você usaria para qualquer outra aplicação Silverlight. Tudo que fazemos é uma requisição para a url informada e então utilizando o LinqToXml selecionamos os itens do feed e fazemos o bind no nosso listbox.Criei uma classe auxiliar para trabalhar com essas informações, contendo apenas 2 propriedades.É isso! É realmente simples trabalhar com o Windows Phone 7. Exatamente o mesmo Silverlight que você executa no browser é o Silverlight que você executa no dispositivo.Agora basta pressionar F5 e aguardar o emulador do dispositivo inicializar.digite uma URL válida que retorne um RSS e então os dados serão exibidos.Se você possuir uma tela touchscreen poderá tocar na tela do emulador, como se estivesse realmente utilizando o dispositivo. É um nível de experiência bem rica e interativa.A solução completa pode ser baixada [aqui](http://viniciusquaiato.com/files/codesamples/WindowsPhone7/RSSWindowsPhone7.zip).Qualquer dúvida estou às ordens pessoal. Já estou montando mais projetos e posts sobre o Windows Phone 7 e possivelmente montarei um screencast para mostrar alguma coisa.

Att,
Vinicius Quaiato.
