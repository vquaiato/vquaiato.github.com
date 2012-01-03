--- 
layout: post
title: Testar envio de email .NET
wordpress_id: 2307
wordpress_url: http://viniciusquaiato.com/blog/?p=2307
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: testes
  slug: testes
  autoslug: testes
- title: Mail
  slug: mail
  autoslug: mail
- title: Testar email
  slug: testar-email
  autoslug: testar-email
---
Sabemos que devemos manter nossos testes isolados. Sabemos que os testes não devem depender de nenhuma infraestrutura pois assim eles serão rápidos de executar, serão confiáveis e verificáveis.Mas como testar o envio de email?Eu mesmo sempre digo: Você precisa testar que o envio será feito, confie no SMTP pois alguém já testou ele demais.Recentemente precisei testar o envio de emails. Meus testes estavam perfeitos: mocks, stubs, tudo verde.Mas eu ainda não estava confortável. Não sabia se a mensagem seria enviada corretamente. Não sabia se o corpo estava bem formatado.Para minha surpresa o Windows 7 não possui um servidor SMTP instalado. Então tive que arrumar um outro jeito de fazer isso.

## Enviando e-mails para um diretório
Zapeando na internet descobri que há uma configuração no .NET que faz com que os e-mails sejam enviados para um diretório. É isso mesmo: ao invés de enviar via SMTP os emails são salvos em um diretório previamente configurado. Cool!Basta para isso informar esta opção no arquivo de configuração (App.config ou Web.config).No caso do meu projeto de testes o App.config:
{% highlight csharp %}
        <specifiedpickupdirectory pickupdirectorylocation="c:\users\vquaiato\desktop\" />      </smtp>    </mailsettings>  </system.net></configuration>
{% endhighlight %}
Precisamos apenas utilizar a opção deliveryMethod das configurações SMTP utilizando a opção "SpecifiedPickupDirectory". Especificando assim um diretório para onde serão enviados os emails.Minha idéia era poder criar testes que não fossem de unidade mas que ainda assim fossem automatizados.Se eu só estivesse utilizando SMTP não conseguiria automatizar meus testes, mas enviando os emails para um diretório posso começar a brincar com isso. 

## Automatizando testes de envio de e-mail
A idéia é que eu pudesse chegar a escrever um código parecido com esse:
{% highlight csharp %}
[Test]
public void Send_Email(){
var somesender = new SomeSender();
    somesender.SendSomeMail();
    Mail.Sent();
    }
[Test]
public void Send_Email_Com_Subject(){
var somesender = new SomeSender();
    somesender.SendSomeMail();
    Mail        .Sent()        .With(m => m.Contains("Subject: Some subject"));
    }

{% endhighlight %}
Brincando nada mais do que 20min. cheguei em 2 classes simples que me permitiram escrever esse código.Uma delas é uma classe estática que desencadeia as chamadas de verificação e atende o primeiro dos testes:
{% highlight csharp %}

public 
static class Mail{    

private 
static bool cleanup;
    
private 
static string[] files;
    
public 
static MailVerifier Sent()    {        Verify();
var error = files == null || files.Length == 0;
    if (error)            throw new Exception("Nenhum email enviado");
    return new MailVerifier(files);
    }
    //outros métodos}

{% endhighlight %}
Vou omitir algum código aqui pois na verdade não quero mostrar a criação de uma API de testes.A outra classe é a MailVerifier que é responsável por fornecer um método bacana que aceita lambdas:
{% highlight csharp %}

public class MailVerifier{    

private Dictionary<string, string> mailFiles = new Dictionary<string, string>();
    
public void With(Func<string, bool> func)    {
var ret = false;
    foreach (var mailFile in mailFiles)        {            ret = ret || func(mailFile.Value);
    }
        if (!ret)            throw new Exception("Nenhum email encontrado");
    }
}

{% endhighlight %}
É isso. Agora posso testar minha classe que faz uso do SmtpClient concreto e verificar se os emails estão sendo enviados corretamente mandando os mesmos para um diretório.Não é algo muito útil, e talvez você não queira fazer isso. Mas está aí.[caption id="attachment_2412" align="aligncenter" width="300" caption="Emails enviados para diretório"][![Emails enviados para diretório](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/emails-enviados-diretorio-300x210.png "Emails enviados para diretório")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/emails-enviados-diretorio.png)[/caption]Quem quiser ver o código completo dessa "viajada noturna": [![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/icon-github.png "icon-github")https://github.com/vquaiato/MailTestsEx](https://github.com/vquaiato/MailTestsEx )Abraços,Vinicius Quaiato.
