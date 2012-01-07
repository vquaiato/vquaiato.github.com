--- 
layout: post
title: "MEF - Criando aplica\xC3\xA7\xC3\xB5es plug\xC3\xA1veis no .NET 4"
wordpress_id: 913
wordpress_url: http://viniciusquaiato.com/blog/?p=913
categories: 
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
tags: 
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
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


No primeiro post sobre [MEF](http://viniciusquaiato.com/blog/mef-managed-extensibility-framework-no-net-4/) expliquei um pouco do conceito geral deste framework presente no .Net 4. Agora vamos criar uma aplicação, simples, para explorar estes conceitos de forma prática.Basicamente o que faremos é utilizar o MEF para criar um plugin de log para uma aplicação simples.A idéia é definirmos uma interface de log, ILogPlugin, e então nossa aplicação utilizar o MEF para utilizar um plugin, ou uma part, que exporte esta interface. Para isso vamos criar um projeto do tipo class library que conterá apenas nossa interface, este será um projeto compartilhado entre a aplicação e o projeto de plugin:[![projeto shared MEF](http://viniciusquaiato.com/images_posts/projeto-shared.jpg "projeto shared MEF")](http://viniciusquaiato.com/images_posts/projeto-shared.jpg)


{% highlight csharp %}

public interface ILogPlugin{
void Registrar(string mensagem);
    }



{% endhighlight %}
Criaremos agora uma outra solution, com o projeto que implementa um plugin. Adicione uma referência para System.ComponentModel.Composition neste projeto:[![referencia MEF](http://viniciusquaiato.com/images_posts/referencia-MEF-300x253.jpg "referencia MEF")](http://viniciusquaiato.com/images_posts/referencia-MEF.jpg)



[![projeto plugin MEF](http://viniciusquaiato.com/images_posts/projeto-plugin.jpg "projeto plugin MEF")](http://viniciusquaiato.com/images_posts/projeto-plugin.jpg)

Criaremos um primeiro plugin que faz log em arquivo texto:
{% highlight csharp %}
[Export(typeof(ILogPlugin))]
public class LogEmArquivoPlugin : ILogPlugin{    

public void Registrar(string mensagem)    {        File.AppendAllText("C:\\logTEXTO.txt",mensagem);
    }
}



{% endhighlight %}
Notem que na **_linha 1_** estamos utilizando o atributo [Export](http://msdn.microsoft.com/en-us/library/system.componentmodel.composition.exportattribute.aspx), que faz parte de System.ComponentModel.Composition, ou seja, do MEF. Este atributo é que faz com que esta classe seja reconhecida como uma part exportável, que depois será utilizada pelo MEF para comport uma outra parte que satisfaça um contrato, ou seja, colocar esta nossa classe como um plugin em alguma outra aplicação. Agora vou criar uma aplicação Windows WPF para demonstrar como utilizaremos o MEF para carregar nosso plugin. Este projeto contém apenas uma janela com um botão. Temos ainda uma classe que "simula" uma classe de negócios qualquer:[![projeto consome plugin MEF](http://viniciusquaiato.com/images_posts/projeto-consome-plugin.jpg "projeto consome plugin MEF")](http://viniciusquaiato.com/images_posts/projeto-consome-plugin.jpg)


{% highlight csharp %}

public class ClasseNegocio{    [Import]    
private ILogPlugin logger { get;
    set;
    }
    
public void FazAlgumaCoisa()    {        //faz alguma coisa        logger.Registrar("fiz alguma coisa");
    }
}

{% endhighlight %}
Aqui vemos na _**linha 3**_ que estamos utilizando o atributo [Import](http://msdn.microsoft.com/en-us/library/system.componentmodel.composition.importattribute.aspx). Este atributo define uma dependência nesta parte, ou seja, durante a composição desta parte o container irá preencher esta propriedade com um componente que satisfaça este contrato.No click do botão na nossa aplicação colocaremos o seguinte código:<prelang="csharp" line="1">
private void button1_Click(object sender, RoutedEventArgs e){
var objeto = new ClasseNegocio();
var catalog = new DirectoryCatalog("../../plugins");
    catalog.Refresh();
var container = new CompositionContainer(catalog);
    container.ComposeParts(objeto);
    objeto.FazAlgumaCoisa();
    }
Na **_linha 3_** apenas criamos uma instância do nosso objeto de negócios. Na _**linha 5**_ estamos criando um [DirectoryCatalog](http://msdn.microsoft.com/en-us/library/system.componentmodel.composition.hosting.directorycatalog.aspx) do namespace System.ComponentModel.Composition.Hosting, que fará a leitura de um diretório procurando por dlls que contenham partes exportáveis, no nosso caso teremos neste diretório a dll do projeto MEFPlugins que conterá a implementação da classe LogEmArquivoPlugin.na _**linha 6**_ chamamos o método [Refresh](http://msdn.microsoft.com/en-us/library/system.componentmodel.composition.hosting.directorycatalog.refresh(v=VS.100).aspx) no catálogo, este método fará a carga detodas as partes do diretório. Na linha 8 criamos um [CompositionContainer](http://msdn.microsoft.com/en-us/library/system.componentmodel.composition.hosting.compositioncontainer.aspx) passando para ele o catálogo que criamos. O container será responsável por compôr as partes ou seja, ele faz a leitura do catálogo, reconhece os plugins disponíveis, e coloca estes plugins onde for solicitado.Na _**linha 9**_ estamos chamando o método ComposeParts do container, passando como parâmetro nosso objeto de negócios, isto fará com que o container componha nosso objeto, ou seja, coloca o plugin de log na propriedade que marcamos como Import.Na _**linha 11**_ estamos chamando normalmente o método do nosso objeto de negócios, que deve fazer com que o log seja chamado, e um arquivo de log criado.Com isto quando executamos nossa aplicação e clicamos no botão teremos nosso arquivo sendo criado e gravado no local informado.Este é um primeiro contato com o MEF, nos próximos posts veremos mais funcionalidades e utilizações para este poderoso framework.Dúvidas, críticas e sugestões, mandem e-mail ou deixem comentários, que eu respondo.

Att,
Vinicius Quaiato.
