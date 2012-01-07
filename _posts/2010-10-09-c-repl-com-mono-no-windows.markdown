--- 
layout: post
title: C# REPL com Mono no Windows
wordpress_id: 1746
wordpress_url: http://viniciusquaiato.com/blog/?p=1746
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
tags: 
- title: REPL
  slug: repl
  autoslug: repl
- title: Projeto Mono
  slug: projeto-mono
  autoslug: projeto-mono
- title: CSharpREPL
  slug: csharprepl
  autoslug: csharprepl
- title: CSharp REPL
  slug: csharp-repl
  autoslug: csharp-repl
- title: Mono Console
  slug: mono-console
  autoslug: mono-console
---


[![REPL Feedback](http://viniciusquaiato.com/images_posts/feedback_repl-e1286637912523.png "feedback_repl")](http://viniciusquaiato.com/images_posts/feedback_repl-e1286637912523.png)

Uma das coisas que me fascinaram logo no VB6 foi o Immediate. Foi bem legal descobrir que poderia executar alguns comandos, criar e inspecionar valores, executar operações, etc, em uma janela de comando.No .NET isso continuou, e temos o Immediate Windows no Visual Studio. Uma das coisas que mais me frustraram foi a incapacidade de utilizar o Immediate sem estar em debug de uma aplicação(acho que hoje isso já é possível). Ainda assim o Immediate possui algumas limitações, não avalia query expression por exemplo:
{% highlight csharp %}
var pares = from num in new[]{
,2,3,4,5}
    where num%2==0    select num;
    
{% endhighlight %}
Isso não é possível.O [Projeto Mono](http://www.mono-project.com/) tornou possível a realização dessa tarefa com um console para a execução de comandos C# sem a necessidade de uma aplicação estar em debug, e sem a necessidade do Visual Studio estar aberto: agora temos o [CSharpREPL](http://www.mono-project.com/CsharpRepl).[REPL](http://en.wikipedia.org/wiki/Read-eval-print_loop) é algo muito comum em linguagens dinâmicas. [REPL](http://en.wikipedia.org/wiki/Read-eval-print_loop) significa: Read-Eval-Print-Loop.É um ambiente onde podemos executar nossos códigos, sem compilação, e sem complicação. Temos um feedback muito rápido sobre alguma operação que queremos executar em nosso código.

### Instalando o Mono
Para utilizarmos o CSharpREPL precisamos instalar o Mono. Faça o [download do Mono aqui](http://www.go-mono.com/mono-downloads/download.html).Selecione a plataforma Windows e a opção "_**Mono for Windows, Gtk#, and XSP**_".Após o download o setup é ao melhor estilo Windows: NNF.

### Abrindo o Console Mono


Execute então o console do Mono:[![Mono-Console CSharpREPL](http://viniciusquaiato.com/images_posts/Mono-Console-259x300.png "Mono-Console CSharpREPL")](http://viniciusquaiato.com/images_posts/Mono-Console.png)



A seguinte tela será exibida:[![Mono CSharpREPL](http://viniciusquaiato.com/images_posts/CSharpREPL-300x173.png "Mono CSharpREPL")](http://viniciusquaiato.com/images_posts/CSharpREPL.png)



Digite então "csharp", e o REPL será aberto:[![Executando CSharpREPL](http://viniciusquaiato.com/images_posts/Executando-CSharpREPL-300x173.png "Executando CSharpREPL")](http://viniciusquaiato.com/images_posts/Executando-CSharpREPL.png)



### Executando comando C# no REPL


Agora podemos executar comando C# diretamente no console.Executando Linq no REPL do C#:[![Linq no CSharpREPL](http://viniciusquaiato.com/images_posts/pares-300x178.png "Linq no CSharpREPL")](http://viniciusquaiato.com/images_posts/pares.png)



Usando variáveis no REPL C#:[![Variáveis no CSharpREPL](http://viniciusquaiato.com/images_posts/variavel-300x178.png "Variáveis no CSharpREPL")](http://viniciusquaiato.com/images_posts/variavel.png)



Executando operações com System.IO no REPL C#:[![DirectoryGetFiles no CSharpREPL](http://viniciusquaiato.com/images_posts/DirectoryGetFiles-300x86.png "DirectoryGetFiles no CSharpREPL")](http://viniciusquaiato.com/images_posts/DirectoryGetFiles.png)



### Conclusão
É isso galera. O projeto Mono possui coisas bastante interessante e tem gente muito boa trabalhando nele. Vale muito a pena conferir como ele pode nos ajudar, ainda que trabalhemos com .NET no Windows e utilizando o Visual Studio.Espero que o REPL ajude vocês assim como tem ajudado uma série de outras pessoas.

Abraços,
 e não deixem de conferir o site do [Projeto Mono que lançou sua versão 2.8 esta semana](http://www.mono-project.com/news/archive/2010/Oct-06.html).Vinicius Quaiato.
