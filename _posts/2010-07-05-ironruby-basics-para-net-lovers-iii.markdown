--- 
layout: post
title: ":IronRuby Basics para .Net Lovers => III"
wordpress_id: 1151
wordpress_url: http://viniciusquaiato.com/blog/?p=1151
categories: 
- title: .NET 4.0
  slug: net-4-0
  autoslug: .net-4.0
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
tags: 
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
- title: Proc
  slug: proc
  autoslug: proc
- title: delegate
  slug: delegate
  autoslug: delegate
- title: blocks
  slug: blocks
  autoslug: blocks
---
[![Blocos e Procs](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/132243417_39300a8258_m.jpg "Blocos e Procs")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/07/132243417_39300a8258_m.jpg)Já falamos um pouco sobre métodos, ["tipagem"](http://viniciusquaiato.com/blog/ironruby-basics-para-net-lovers-i/), [arrays e hash](http://viniciusquaiato.com/blog/ironruby-basics-para-net-lovers-ii/) no Ruby/IronRuby.Em .Net estamos acostumados a trabalhar com [delegates](http://msdn.microsoft.com/en-us/library/ms173171(VS.80).aspx) e [lambdas](http://msdn.microsoft.com/en-us/library/bb397687.aspx). Isto nos permite passar trechos de códigos como parâmetros para métodos e então operar com estes trechos de código.Esse comportamento nos permite realizar abstrações interessantes e escrever códigos interessantes. Não vou entrar nos detalhes, há muita informação sobre isso no google.

### Usando delegates e lambdas no c#

{% highlight csharp %}
delegate string Impressor(string algo);
    Impressor impressorMaiusculo = delegate(String s){    return "Upper -> " + s.ToUpper();
    }
;
    Impressor impressorMinusculo = delegate(String s){    return "Lower -> " + s.ToLower();
    }
;
    Console.WriteLine(impressorMinusculo("VINICIUS"));
    Console.WriteLine(impressorMaiusculo("vinicius"));
    
{% endhighlight %}
Poderíamos ainda ter um método que recebe um delegate:
{% highlight csharp %}
void MetodoQueImprimeNoConsole(Impressor impressor, string imprimir){    Console.WriteLine(impressor(imprimir));
    }
MetodoQueImprimeNoConsole(    delegate(String s)    {
string reversed = string.Empty;
    s.Reverse().ToList().ForEach(c => reversed += c.ToString());
    return reversed;
    }
, "Vinicius");
    MetodoQueImprimeNoConsole(s => s.ToUpper(), "vinicius");
    
{% endhighlight %}
Agora as coisas começam a ficar um pouco mais interessantes. O Ruby trabalha muito com [blocks, Procs e lambdas](http://www.robertsosinski.com/2008/12/21/understanding-ruby-blocks-procs-and-lambdas/). Os conceitos são bastante semelhantes e a diferença está nos detalhes.

### |blocks|
Blocks nada mais são do que blocos de código. Sua sintaxe é bastante simples:
{% highlight csharp %}
letras = ["a","b","c"]#para quem gosta de do endletras.each do |letra|    puts letra.upcaseend#para quem gosta de bracketsletras.each {
letra| puts letra.upcase}

{% endhighlight %}
O que acontece no código acima é que o método _[each](http://ruby-doc.org/core/classes/Array.html#M002173)_ recebe um block como argumento, ou seja, para cada item dentro do array ele executará o bloco de código informado. No exemplo acima, apenas exibimos o item em upper case.O código é bastante simples de entender. O método each passará como parâmetro para nosso bloco cada item do array. E dentro do bloco o que fazemos é colocar este item (que chamei de letra) em caixa alta, chamando o método _[upcase](http://ruby-doc.org/core/classes/String.html#M000793)_.

### Proc.new
Os blocks são bastante interessantes, e são uma das coisas que chamam por aí de "rubismo", que oferece um jeito "rubista" de resolver as coisas. Sintaxe simples, elegante, etc.No entanto, não conseguimos reaproveitar os blocks em vários lugares, precisamos reescrever o block toda vez. E aí que surge a [Proc](http://ruby-doc.org/core/classes/Proc.html).Relacionando com C#, poderia dizer que a Proc é um objeto contendo um delegate. Uma referência para uma função a ser executada. Vejamos:
{% highlight csharp %}
nomes = ["vinicius","janynne"]caixa_alta = Proc.new do |texto|    texto.upcaseendnomes.each  do |nome|     puts caixa_alta.call nomeend
{% endhighlight %}
O código não ficou muito diferente do trabalho com block. Criamos uma Proc expecificando qual código ela executa. E no corpo do each fazemos a chamada do método _[call](http://ruby-doc.org/core/classes/Proc.html#M001553)_ da nossa Proc.Agora vamos fazer diferente:
{% highlight csharp %}
class Telefone  attr_accessor :ddd,:numero  def initialize(ddd,numero)    @ddd = ddd    @numero = numero  endendclass Agenda  @telefones  def initialize    @telefones = []  end  def add_telefone(ddd, numero)    @telefones.push Telefone.new ddd,numero  end  def listar(bloco)    @telefones.each do |telefone|      bloco.call telefone    end  endendseparado_por_virgula = Proc.new do |tel|  puts tel.ddd + "," + tel.numeroendseparado_por_hifen = Proc.new do |tel|  puts tel.ddd + "-" + tel.numeroendagenda = Agenda.newagenda.add_telefone '011','12345678'agenda.add_telefone '011','00001111'agenda.listar separado_por_hifenagenda.listar separado_por_virgula
{% endhighlight %}
Novidade nesse código podemos ver na _**linha 2**_ onde usamos o _[attr_accessor](http://ruby-doc.org/core/classes/Module.html#M001681)_ para criar getters e setters para nossas propriedades ddd e numero.Da _**linha 19**_ até a _**linha 24**_ defini um método listas que recebe um parametro, um bloco. A idéia é que passemos para ele um block, uma Proc, etc. Depois crio duas Procs uma que recebe um objeto Telefone e exibe ele separado por vírgula e outra que exibe separado por hifen. Então chamo o método listar da classe Agenda passando as Procs.Bem simples, como deve ser mesmo.Com as Procs podemos por exemplo passar mais de uma para um método:
{% highlight csharp %}
def listar(bloco1,bloco2)  @telefones.each do |telefone|    bloco1.call telefone    bloco2.call telefone  endendagenda.listar(separado_por_hifen, separado_por_virgula)agenda.listar(separado_por_virgula, separado_por_hifen)
{% endhighlight %}
Interessante não é?Bem, vou deixar a parte de lambdas para um post futuro, para não tornar esse muito mais extenso, pois farei as comparações entre as diferenças entre lambdas e Procs.E mostrarei também como criar os eventos por exemplo de botões em uma aplicação [Windows Forms](http://viniciusquaiato.com/blog/sharpdevelop-ide-para-trabalhar-com-ironruby/) e [WPF com IronRuby](http://viniciusquaiato.com/blog/ironruby-rodando-ruby-dentro-do-net/).Espero que tenham gostado, e aguardo feedbacks, dúvidas, etc.

Abraços,
Vinicius Quaiato.
