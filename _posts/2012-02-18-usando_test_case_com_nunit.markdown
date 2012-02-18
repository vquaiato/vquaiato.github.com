--- 
layout: post
title: Usando TestCase com NUnit
tags: 
- title: TDD
  slug: tdd
  autoslug: tdd
---

Fala galera, beleza? Essa é uma dica rápida e eu nem me lembro se já falei sobre isso aqui no blog.

##TestCase com NUnit
Em algumas ocasiões queremos testar algo com diversos valores diferentes. Podemos escrver diversos testes diferentes ou então podemos usar (no caso do [NUnit][nunit]) o [TestCase][testcase].

TestCase é um atributo que é colocado sobre o método de testes com valores a serem passados para o método. Na verdade este atributo marca o método como sendo um método de testes.

Vamos a um exemplo simples de como isso pode ser utilizado:

{% highlight csharp %}
[Test]
public void email_invalido_deve_retornar_false(){
	var validador = new ValidadorDeEmails();
	validador.Validar("email invalido").Should().Be.False();
}
{% endhighlight %}

Vocês concordam que em um cenário assim eu posso ter uma massa muito grande de emails inválidos para testar? Ao invés de eu escrever um método de teste para cada opção inválida de email eu posso fazer isso:

{% highlight csharp %}
[TestCase("inválido")]
[TestCase("foo@bar")]
[TestCase("foo@")]
[TestCase("foo.bar.baz")]
[TestCase("foo bar@baz.com")]
public void email_invalido_deve_retornar_false(string email){
	var validador = new ValidadorDeEmails();
	validador.Validar(email).Should().Be.False();
}
{% endhighlight %}

Desta forma este meu método de teste será invocado uma vez para cada TestCase que eu colocar. 

É isso galera! Espero que a dica seja válida, é algo bem simples mas eficiente quando precisamos.

Abraços,

Vinicius Quaiato.

[testcase]:http://nunit.org/?p=testCase&r=2.5
[nunit]:http://nunit.org/index.php?p=home