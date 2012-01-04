--- 
layout: post
title: Windows Phone 7 LongListSelector / Jump List
wordpress_id: 3728
wordpress_url: http://viniciusquaiato.com/blog/?p=3728
categories: 
- title: Windows Phone 7
  slug: windows-phone-7
  autoslug: windows-phone-7
tags: 
- title: Windows Phone 7
  slug: windows-phone-7
  autoslug: windows-phone-7
- title: WP7
  slug: wp7
  autoslug: wp7
- title: Windows Phone
  slug: windows-phone
  autoslug: windows-phone
- title: Silverlight Toolkit
  slug: silverlight-toolkit
  autoslug: silverlight-toolkit
- title: LongListSelector
  slug: longlistselector
  autoslug: longlistselector
---
Fala galera, beleza? Recentemente [criei e apresentei uma aplicação](http://viniciusquaiato.com/blog/tdc2011-palestra-sobre-windows-phone-e-windows-azure/) para [Windows Phone 7](http://viniciusquaiato.com/blog/category/windows-phone-7/) que exibe a documentação do .NET Framework presente no MSDN.Imagine que o [.NET possui mais de 200 namespaces](http://msdn.microsoft.com/pt-br/library/ms229335.aspx): exibir tudo isso em uma lista fica complicado, principalmente se queremos encontrar algo facilmente.Aí entra o LongListSelector: um dos controles do [Silverlight Toolkit para Windows Phone 7](http://silverlight.codeplex.com/).Eu procurei bastante por algo nativo como um jump list mas não encontrei. Foi quando vi que no [Silverlight Toolkit para Windows Phone 7](http://silverlight.codeplex.com/) já há o LongListSelector. Neste primeiro post mostrarei como baixar, instalar e usar em um projeto. E em um próximo post mostrarei recursos como o agrupamento, que é o que de fato torna este controle interessante.

## Instalando o Silverlight Toolkit para Windows Phone 7
Primeiramente baixe o Silverlight Toolkit para Windows Phone 7 aqui: [http://silverlight.codeplex.com/releases](http://silverlight.codeplex.com/releases).Após instalar o mesmo ele estará disponível em:Program Files\Microsoft SDKs\Windows Phone\7.0\TookitMesmo que você use o 7.1 estará na pasta 7.0, ok?!

## Adicionando o LongListSelector ao Windows Phone 7
Após instalarmos o Silverlight Toolkit para Windows Phone 7 precisamos referenciar a dll no projeto e incluir seu namespace no arquivo XAML.Adicione uma referencia para Microsoft.Phone.Controls.Toolkit que encontra-se na pasta de instalação.Além disso adicione a seguinte linha ao seu arquivo XAML onde irá usar o LongListSelector:_**xmlns:toolkit="clr-namespace:Microsoft.Phone.Controls;
    assembly=Microsoft.Phone.Controls.Toolkit" **_

## Utilizando o LongListSelector no Windows Phone 7
Vamos criar uma aplicação Windows Phone 7 bem simples no Visual Studio que irá exibir uma coleção de items.No seu XAML principal adicione um LongListSelector conforme abaixo:
{% highlight c# %}
<toolkit:longlistselector x:name="longList" isflatlist="True" itemtemplate="{
taticResource itemTemplate}
"></toolkit:longlistselector>
{% endhighlight %}
Feito isso vamos criar o recurso para este template:
{% highlight c# %}
        <textblock text="{
inding}
" foreground="White" fontsize="30"></textblock>    </datatemplate>   </phone:phoneapplicationpage.resources>
{% endhighlight %}
Agora vamos apenas realizar o bind de uma lista ao nosso controle:
{% highlight c# %}
this.longList.ItemsSource = new List<string> { "Item1", "Item2", "Item3", "Item4", "Item5", "Item6", "Item7" }
;
    </string>
{% endhighlight %}
Com isso teremos um resultado bastante simples como visto abaixo:[caption id="attachment_3730" align="aligncenter" width="165" caption="Windows Phone LongListSelector"][![Windows Phone LongListSelector](http://viniciusquaiato.com/blog/wp-content/uploads/2011/07/Windows-Phone-LongListSelector-165x300.png "Windows Phone LongListSelector")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/07/Windows-Phone-LongListSelector.png)[/caption]Acima não há nada de espetacular: é o comportamento de um ListBox como outro qualquer. Mas isso nos ajudará nos próximos passos e te ajudará a familiarizar com o controle. Senão teríamos muita informação de uma só vez.Até a próxima,Vinicius Quaiato.
