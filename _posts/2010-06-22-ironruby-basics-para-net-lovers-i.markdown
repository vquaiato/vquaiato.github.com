--- 
layout: post
title: ":IronRuby Basics para .Net Lovers => I"
wordpress_id: 1070
wordpress_url: http://viniciusquaiato.com/blog/?p=1070
categories: 
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
tags: 
- title: IronRuby
  slug: ironruby
  autoslug: ironruby
- title: ruby
  slug: ruby
  autoslug: ruby
- title: Ruby Basics
  slug: ruby-basics
  autoslug: ruby-basics
---
[![](http://viniciusquaiato.com/images_posts/ruby.png "ruby")](http://viniciusquaiato.com/images_posts/ruby.png)Há algum tempo decidi deixar o preconceito de lado e resolvi me aventurar no mundo Ruby, principalmente motivado pelo [IronRuby](http://ironruby.codeplex.com).Eu sou apaixonado por C#, e não nego isso. Acho a sintaxe atraente, ele é elegante, tem um quê de beleza. No entanto qualquer código Ruby que você veja é também muito elegante, bonito e ainda mais: é sucinto! Minha intenção aqui não é comparar o C# com o Ruby, não farei isso, mas mostrarei como fazer algumas coisas que frequentemente utilizamos em C# mas no [Ruby](http://ruby-br.org/) /[IronRuby](http://viniciusquaiato.com/blog/category/ironruby/).Não abordarei tudo de uma só vez, pois seria muito extenso. Vamos lá.**Para executar estes códigos, veja este post: [aqui](http://viniciusquaiato.com/blog/ironruby-rodando-ruby-dentro-do-net/)**

### :Tipagem
Uma das primeiras coisas que iremos notar no Ruby é que não temos que tipar as coisas.
{% highlight csharp %}
inteiro = 10texto = "Vinicius"objeto = Object.new
{% endhighlight %}
Poderíamos fazer isso também:
{% highlight csharp %}
valor = 10valor = "Vinicius"valor = Object.new
{% endhighlight %}
Provavelmente muitos amantes de C#, Java e Vb. Net dirão que isso é um absurdo, que perdemos a segurança, que isso é suscetível a erros, etc. Bom, sinceramente eu não acredito nisso, não mesmo. Temos vários sistemas sendo desenvolvidos em linguagens dinâmicas e com tipagem dinâmica, então vejo e acredito que isso não é risco. (Posso falar sobre isso depois, em outro post)Como pudemos verificar acima para instanciarmos um novo objeto utilizamos uma chamada ao método _**new**_.Reparem que a chamada ao método pode ser feita sem parênteses. Isso torna o código mais claro, no meu ponto de vista. Menos ruído. Gosto disso.

### :Classes
Com o código abaixo definimos uma classe no Ruby:
{% highlight csharp %}
class MinhaClasseendobjeto = MinhaClasse.new
{% endhighlight %}
Simples.

### :Métodos
Agora vamos criar um método:
{% highlight csharp %}
class MinhaClasse    def meu_metodo        puts "Este é o retorno do método"    endendobjeto = MinhaClasse.newobjeto.meu_metodo
{% endhighlight %}
Para criarmos um método utilizados a keyword **_def_**. A convenção de nomes de métodos em Ruby é a que foi utilizada, com underscore. O comando puts é um comando básico para printar um valor. É uma abreviação de "put string". Reparem que não definimos tipo de retorno no nosso método, não definimos parâmetros e não utilizamos ponto-e-vírgula. Na _**linha 8**_ fazemos uma chamada para o nosso método. Se quisermos receber parâmetros:
{% highlight csharp %}
class MinhaClasse    def meu_metodo(nome)        puts "Este é seu nome: '#{
ome}
'? "    endendobjeto = MinhaClasse.newvar.meu_metodo "Vinicius"var.meu_metodo("Vinicius")
{% endhighlight %}
Na **_linha 2_** deifnimos o método para receber um parâmetro. Notem novamente que não há tipagem, eu apenas informo que será um parâmetro e nada mais. Na **_linha 3_** eu utilizo esse parâmetro montando uma string para ser exibida. Nas linhas 8 e 9 realizamos chamadas para o método passando um parâmetro. Podemos chamar o método com ou sem os parênteses, o resultado é o mesmo. Se não passarmos o parâmetro, no entanto, teremos erro. Se quisermos definir um retorno para o nosso método podemos fazer isso das formas abaixo:
{% highlight csharp %}
class MinhaClasse    def metodo_com_return        return 1+1    end    def metodo_sem_return        1+1    endendobj = MinhaClasse. newputs obj.metodo_com_returnputs obj.metodo_sem_return
{% endhighlight %}
Definimos 2 métodos, ambos fazem a mesma coisa. Podemos omitir a palavra _**return**_ como fizemos na _**linha 7**_, isto por que todos os métodos retornam algo em Ruby, e a última linha é sempre o retorno do método. 

### :ToString
Geralmente no C# utilizamos o método ToString. No Ruby isso funciona assim:
{% highlight csharp %}
objeto = MinhaClasse.newobjeto.to_sobjeto.ToString
{% endhighlight %}
Na **_linha 2_** fazemos uma chamada para o método _**to_s**_ do Ruby. E na **_linha 3_** fazemos uma chamada para o método _**ToString**_ do .Net. 

### :Comentários
E para finalizar os comentários em Ruby podem ser feitos destas duas maneiras:
{% highlight csharp %}
# comentário de linha=beginIsto é um comentário de blocoposso ter várias linhas aquietc=endputs "Um valor" #isto é um comentário após o comando
{% endhighlight %}
Nem há necessidade de explicar mais não é? Para executar estes códigos, façam a instalação do IronRuby: [http://ironruby.codeplex.com/](http://ironruby.codeplex.com/)Abram a pasta da instalação/bin e executem o ir.exe.[Veja mais informações aqui.](http://viniciusquaiato.com/blog/ironruby-rodando-ruby-dentro-do-net/)Qualquer dúvida, estou às ordens.

Att,
Vinicius Quaiato.
