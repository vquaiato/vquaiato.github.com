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
[![REPL Feedback](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/feedback_repl-e1286637912523.png "feedback_repl")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/feedback_repl-e1286637912523.png)Uma das coisas que me fascinaram logo no VB6 foi o Immediate. Foi bem legal descobrir que poderia executar alguns comandos, criar e inspecionar valores, executar operações, etc, em uma janela de comando.No .NET isso continuou, e temos o Immediate Windows no Visual Studio. Uma das coisas que mais me frustraram foi a incapacidade de utilizar o Immediate sem estar em debug de uma aplicação(acho que hoje isso já é possível). Ainda assim o Immediate possui algumas limitações, não avalia query expression por exemplo:
{% highlight csharp %}
var pares = from num in new[]{
,2,3,4,5}
    where num%2==0    select num;
    
{% endhighlight %}
Isso não é possível.O [Projeto Mono](http://www.mono-project.com/) tornou possível a realização dessa tarefa com um console para a execução de comandos C# sem a necessidade de uma aplicação estar em debug, e sem a necessidade do Visual Studio estar aberto: agora temos o [CSharpREPL](http://www.mono-project.com/CsharpRepl).[REPL](http://en.wikipedia.org/wiki/Read-eval-print_loop) é algo muito comum em linguagens dinâmicas. [REPL](http://en.wikipedia.org/wiki/Read-eval-print_loop) significa: Read-Eval-Print-Loop.É um ambiente onde podemos executar nossos códigos, sem compilação, e sem complicação. Temos um feedback muito rápido sobre alguma operação que queremos executar em nosso código.

### Instalando o Mono
Para utilizarmos o CSharpREPL precisamos instalar o Mono. Faça o [download do Mono aqui](http://www.go-mono.com/mono-downloads/download.html).Selecione a plataforma Windows e a opção "_**Mono for Windows, Gtk#, and XSP**_".Após o download o setup é ao melhor estilo Windows: NNF.

### Abrindo o Console Mono
Execute então o console do Mono:[caption id="attachment_1753" align="aligncenter" width="259" caption="Mono-Console CSharpREPL"][![Mono-Console CSharpREPL](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Mono-Console-259x300.png "Mono-Console CSharpREPL")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Mono-Console.png)[/caption]A seguinte tela será exibida:[caption id="attachment_1755" align="aligncenter" width="300" caption="Mono CSharpREPL"][![Mono CSharpREPL](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/CSharpREPL-300x173.png "Mono CSharpREPL")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/CSharpREPL.png)[/caption]Digite então "csharp", e o REPL será aberto:[caption id="attachment_1757" align="aligncenter" width="300" caption="Executando CSharpREPL"][![Executando CSharpREPL](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Executando-CSharpREPL-300x173.png "Executando CSharpREPL")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/Executando-CSharpREPL.png)[/caption]

### Executando comando C# no REPL
Agora podemos executar comando C# diretamente no console.Executando Linq no REPL do C#:[caption id="attachment_1758" align="aligncenter" width="300" caption="Linq no CSharpREPL"][![Linq no CSharpREPL](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/pares-300x178.png "Linq no CSharpREPL")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/pares.png)[/caption]Usando variáveis no REPL C#:[caption id="attachment_1759" align="aligncenter" width="300" caption="Variáveis no CSharpREPL"][![Variáveis no CSharpREPL](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/variavel-300x178.png "Variáveis no CSharpREPL")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/variavel.png)[/caption]Executando operações com System.IO no REPL C#:[caption id="attachment_1761" align="aligncenter" width="300" caption="DirectoryGetFiles no CSharpREPL"][![DirectoryGetFiles no CSharpREPL](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/DirectoryGetFiles-300x86.png "DirectoryGetFiles no CSharpREPL")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/10/DirectoryGetFiles.png)[/caption]

### Conclusão
É isso galera. O projeto Mono possui coisas bastante interessante e tem gente muito boa trabalhando nele. Vale muito a pena conferir como ele pode nos ajudar, ainda que trabalhemos com .NET no Windows e utilizando o Visual Studio.Espero que o REPL ajude vocês assim como tem ajudado uma série de outras pessoas.

Abraços,
 e não deixem de conferir o site do [Projeto Mono que lançou sua versão 2.8 esta semana](http://www.mono-project.com/news/archive/2010/Oct-06.html).Vinicius Quaiato.
