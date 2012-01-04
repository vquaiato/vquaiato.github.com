--- 
layout: post
title: HttpWebRequest usando proxy
wordpress_id: 2363
wordpress_url: http://viniciusquaiato.com/blog/?p=2363
categories: 
- title: ASP.NET MVC
  slug: asp-net-mvc
  autoslug: asp.net-mvc
tags: 
- title: HttpWebRequest
  slug: httpwebrequest
  autoslug: httpwebrequest
- title: Proxy
  slug: proxy
  autoslug: proxy
- title: WebRequest
  slug: webrequest
  autoslug: webrequest
- title: WebProxy
  slug: webproxy
  autoslug: webproxy
- title: WebProxy C#
  slug: webproxy-c
  autoslug: webproxy-c#
---
Estes dias fiz uma pequena aplicação [ASP.NET MVC](http://viniciusquaiato.com/blog/category/dotnet/asp-net-dotnet/asp-net-mvc/) e uma das features era fazer um parser simples de uma página da Bovespa para obter o valor de uma cotação.A saída simples foi realizar um [HttpWebRequest](http://msdn.microsoft.com/pt-br/library/system.net.httpwebrequest.aspx) e tratar o resultado.O problema é que localmente tudo funcionava(cool ¬¬). Em um IIS local tudo funcionava. Mas no ambiente do cliente nada acontecia(novidade hein?!).Eu também estava sem acesso na máquina do cliente.Não entendia por que nada acontecia, o erro não era muito descritivo (claro que não deixei o erro estourar na página :P).E o cliente acessando a url da Bovespa diretamente conseguia acesso.Fazendo um brainstorm(estilo [House MD](http://pt.wikipedia.org/wiki/House,_M.D.)) com o [Juan Lopes](http://twitter.com/juanplopes) ele disse que talvez poderia ser o proxy impedindo o WebRequest.Dito e feito("We are Juan Lopes"). Ao consultar o cliente eles possuíam um proxy que eu não sabia. Resultado: configurar o proxy no HttpWebRequest.
{% highlight c# %}
HttpWebRequest req = (HttpWebRequest)WebRequest.Create("http://site.com.br");
    req.Proxy = new WebProxy("proxy.uri.com.br", "8080");
    
{% endhighlight %}
Simples não? Basta configurar a [propriedade Proxy](http://msdn.microsoft.com/pt-br/library/system.net.httpwebrequest.proxy.aspx) do objeto HttpWebRequest com um objeto [WebProxy](http://msdn.microsoft.com/en-us/library/system.net.webproxy.aspx).O WebProxy permite ainda configurar as credenciais que devem ser utilizadas, é bastante simples:
{% highlight c# %}
var webproxy = new WebProxy("proxy.uri.com.br", "8080");
    webProxy.Credentials = new NetworkCredential("usuario","senha","domain");
    
{% endhighlight %}
É isso, foi só liberar essa configuração e tudo funcionou perfeitamente.**Dica: **Eu não deixei as configurações de proxy chumbadas no código, criei uma interface de configuração de proxy, desta forma consigo testar tudo sem ficar dependendo de magic string ou web.config.

Abraços,
Vinicius Quaiato.
