---
layout: post
title: Silverlight 4 beta - Novas Features - Capturando Webcam
wordpress_id: 173
wordpress_url: http://viniciusquaiato.com/blog/?p=173
categories:
- title: .NET
  slug: dotnet
  autoslug: .net
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: Silverlight
  slug: silverlight
  autoslug: silverlight
tags:
- title: Silverlight
  slug: silverlight
  autoslug: silverlight
---


Fala galera, beleza?Dia 18 a Microsoft anunciou o Silverlight 4 beta, no [PDC09](http://microsoftpdc.com/). De fato existem muitas features novas nesta versão do [Silverlight ](http://silverlight.net/)e uma destas novas features é a captura de Webcam (todas as informações podem ser vistas [aqui](http://silverlight.net/getstarted/silverlight-4-beta/#tools)), e vamos realizar aqui um exemplo básico, baseado no vídeo do [Tim Heuer](http://timheuer.com/blog/) que pode ser visto [aqui](http://silverlight.net/learn/videos/all/access-web-camera-microphone/).Antes de começarmos vamos instalar as ferramentas necessárias:Visual Studio 2010 beta 2 -[ http://msdn.microsoft.com/en-us/vstudio/dd582936.aspx](http://msdn.microsoft.com/en-us/vstudio/dd582936.aspx)ouVisual Web Developer Express beta 2 - [http://go.microsoft.com/fwlink/?LinkID=167874](http://go.microsoft.com/fwlink/?LinkID=167874)Microsoft Expression Blend para .NET 4 - [http://go.microsoft.com/fwlink/?LinkId=169446](http://go.microsoft.com/fwlink/?LinkId=169446)Silverlight Beta Tools para Visual Studio 2010 - [http://go.microsoft.com/fwlink/?LinkID=177508](http://go.microsoft.com/fwlink/?LinkID=177508)Vamos lá pessoal, vamos começar.Primeiro vou abrir o Blend e então criar um novo projeto silverlight, como mostra a figura abaixo:[![Criando projeto Silverlight Blend 4](http://viniciusquaiato.com/images_posts/Criando-projeto-Silverlight-Blend-42.jpg "Criando projeto Silverlight Blend 4")](http://viniciusquaiato.com/images_posts/Criando-projeto-Silverlight-Blend-42.jpg)



Agora vamos criar uma página bem simples, o resultado pode ser visto na imagem abaixo e logo em seguida o código XAML necessário:[![Resultado da pagina XAML](http://viniciusquaiato.com/images_posts/Resultado-da-pagina-XAML1.jpg "Resultado da pagina XAML")](http://viniciusquaiato.com/images_posts/Resultado-da-pagina-XAML1.jpg)




{% highlight csharp %}
</button>
{% endhighlight %}
Agora podemos abrir o projeto silverlight no Visual Studio 2010 para que possamos editar o código, conforme mostra a figura abaixo:[![Abrir projeto Silverlight no Visual Studio](http://viniciusquaiato.com/images_posts/Abrir-projeto-Silverlight-no-Visual-Studio1.jpg "Abrir projeto Silverlight no Visual Studio")](http://viniciusquaiato.com/images_posts/Abrir-projeto-Silverlight-no-Visual-Studio1.jpg)

Agora vamos adicionar o código necessário para que nossa webcam seja capturada. Vamos abrir o arquivo MainPage.xaml.cs e então criar o seguinte código:
{% highlight csharp %}
CaptureSource captureSource = null;

private void Initialize(){
var videoDevice = CaptureDeviceConfiguration.GetAvailableVideoCaptureDevices()[0];
if(captureSource == null)        captureSource = new CaptureSource();
    captureSource.VideoCaptureDevice = videoDevice;
    }

{% endhighlight %}
Neste código estamos criando um objeto CaptureSource que será responsável por realizar a nossa captura da webcam.Na linha 4 pegamos o device de captura de vídeo disponível. Como eu só tenho uma webcam, eu vou pegar o primeiro device.Na linha 9 eu atribuo o meu device para a propriedade de video device do objeto CaptureSource.Agora precisamos "pintar" nossa webcam dentro da área onde ela será exibida, no nosso caso um simples retângulo no nosso XAML:
{% highlight csharp %}

private void FillCamera(){
var videoBrush = new VideoBrush();
    videoBrush.SetSource(captureSource);
    WebCam.Fill = videoBrush;
    }

{% endhighlight %}
O que fazemos no código acima é criar um VideoBrush que irá utilizar nosso CaptureSource. Então preenchemos nosso rectangle com o videoBrush. Bem simples.Até agora se rodarmos nosso código nada acontecerá, pois a mágica acontece neste método:
{% highlight csharp %}

private void StartCamera(){
if(CaptureDeviceConfiguration.AllowedDeviceAccess || CaptureDeviceConfiguration.RequestDeviceAccess())    {
if(captureSource.State != CaptureState.Started)            captureSource.Start();
    }
}

{% endhighlight %}
Tudo o que fazemos aqui é dizer ao Silverlight para pedir permissão para usar a câmera com o RequestDeviceAccess().Depois executamos o comando Start() dentro do nosso captureSource, e neste momento o Silverlight irá pedir permissão para o usuário do site e então irá iniciar a exibição do vídeo.Agora precisamos apenas fazer a chamada para os nossos métodos.Vamos criar um evento para nosso botão iniciar, para isso faremos uma alteração no contrutor da nossa página e criaremos um método para responder ao evento click do botão, conforme mostrado abaixo:
{% highlight csharp %}

public MainPage(){    InitializeComponent();
    btnStart.Click += new RoutedEventHandler(btnStart_Click);
    }
void btnStart_Click(object sender, RoutedEventArgs e){    Initialize();
    FillCamera();
    StartCamera();
    }



{% endhighlight %}
E podemos ver o resultado nas imagens abaixo:[![Silverlight pedindo permissao para usar webcam](http://viniciusquaiato.com/images_posts/Silverlight-pedindo-permissao-para-usar-wecam1.jpg "Silverlight pedindo permissao para usar webcam")](http://viniciusquaiato.com/images_posts/Silverlight-pedindo-permissao-para-usar-wecam1.jpg)



[![Resultado Webcam com silverlight 4](http://viniciusquaiato.com/images_posts/Resultado-Webcam-com-silverlight-41.jpg "Resultado Webcam com silverlight 4")](http://viniciusquaiato.com/images_posts/Resultado-Webcam-com-silverlight-41.jpg)

É isso aê pessoal, qualquer dúvida é só entrar em contato.Em breve postarei mais informações sobre a nova versão do silverlight.

Att,
Vinicius Quaiato.
