--- 
layout: post
title: "Code Contracts: criando software verific\xC3\xA1vel em .Net"
wordpress_id: 1043
wordpress_url: http://viniciusquaiato.com/blog/?p=1043
categories: 
- title: Visual Studio 2010
  slug: visual-studio-2010
  autoslug: visual-studio-2010
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
- title: .NET 4. 0   slug: net-4-0
  autoslug: .net-4.0
tags: 
- title: Code Contracts
  slug: code-contracts
  autoslug: code-contracts
- title: DbC
  slug: dbc
  autoslug: dbc
- title: Design by Contract
  slug: design-by-contract
  autoslug: design-by-contract
- title: postconditions
  slug: postconditions
  autoslug: postconditions
- title: preconditions
  slug: preconditions
  autoslug: preconditions
---
![Code Contracts](http://viniciusquaiato.com/images_posts/dd491992.codecontracts_projecten-us-150x150.png "Code Contracts")
[Code Contracts](http://msdn.microsoft.com/en-us/devlabs/dd491992.aspx) é o equivalente no .NET a [Design by Contract](http://en.wikipedia.org/wiki/Design_by_contract). Infelizmente o termo Design by Contract é uma marca registrada.

Estes contratos nos permitem escrever software de uma forma verificável, onde podemos garantir pré-condições, pós-condições e invariantes.
Me agrada a idéia também de que o código se torna mais claro e limpo. Ficam claramente expressas as inteções do código, as regras se tornam explícitas ao invés de estarem escondidas em emaranhados de condicionais. Vamos entender então um pouco de Contratos.<br /><blockquote>  
Pré-condição é uma condição que deve ser satisfeita, sempre, no início da execução do método
</blockquote>
Geralmente as pré-condições dizem respeito a verificação e garantia de valores para os parâmetros de um método. No entanto podem existir outras utilizações.
<blockquote>  
Pós-condição é uma condição que deve ser garantida ao término da execução do método
</blockquote>
As pós-condições podem ser utilizadas para garantir que um determinado resultado seja retornado pelo método ou ainda que um determinado estado na classe tenha sido contemplado.
<blockquote>  
Invariante é uma condição que deve ser verdadeira ao longo de toda a vida de um objeto.
</blockquote>
Invariante diz respeito a um estado que deve ser mantido durante toda a vida de um objeto, podendo por exemplo definir que o valor de um atributo da classe que não pode ter determinado valor nunca.

Vamos iniciar um novo projeto de testes. 

Após criar a solution, clique com o botão direito no projeto, e vá em properties. Na tela que abrirá, selecione a aba Code Contracts e habilite os campos conforme abaixo:
[caption id="attachment_1129" align="aligncenter" width="300" caption="Habilitando Code Contracts no projeto"][![Habilitando Code Contracts no projeto](http://viniciusquaiato.com/images_posts/Habilitando-300x237.jpg "Habilitando Code Contracts no projeto")](http://viniciusquaiato.com/images_posts/Habilitando.jpg)[/caption]
Caso você não possua essa opção, faça o download e instale a ferramenta [neste link](http://msdn.microsoft.com/en-us/devlabs/dd491992.aspx) (utilize a versão premium).
Após estar com o Code Contracts habilitado, vamos para a classe de testes e vamos escrever um método:
{% highlight csharp %}
[TestMethod]
public void Deve_Realizar_Uma_Divisao(){    Dividir(10, 0);
    }
float Dividir(float valor, float divisor){
return valor / divisor;
    }

{% endhighlight %}
Como sabemos, não podemos dividir um número por zero, desta forma vamos usar o Code Contracts para garantir isso:
{% highlight csharp %}
float Dividir(float valor, float divisor){    Contract.Requires(divisor > 0);
return valor / divisor;
    }

{% endhighlight %}
Podemos ver na **_linha 3_** que estamos realizando uma chamada para o método estático _[Requires](http://msdn.microsoft.com/en-us/library/system.diagnostics.contracts.contract.requires.aspx)_. É com este método que garantimos pré-condições. Ou seja, neste caso é uma pré-condição que o parâmetro divisor seja maior que 0. Agora, qual a diferença com relação a um _if(divisor < 0) throw new ArgumentExceptio_n? Repare na imagem abaixo:[caption id="attachment_1132" align="aligncenter" width="300" caption="Verificações esdtáticas com Code Contracts"][![Verificações esdtáticas com Code Contracts](http://viniciusquaiato.com/images_posts/Code-Contracts-cheking-300x94.jpg "Verificações esdtáticas com Code Contracts")](http://viniciusquaiato.com/images_posts/Code-Contracts-cheking.jpg)[/caption] Veja que o compilador nos alerta que um contrato foi violado. Isto não pode ser feito com ifs. Vamos criar um método para ver como funciona a pós-condição.Verificamos uma pós-condição utilizando o método [Ensures](http://msdn.microsoft.com/en-us/library/system.diagnostics.contracts.contract.ensures.aspx). Para isso vou utilizar o seguinte código:
{% highlight csharp %}
class Compra{    

public List<Tuple<int, float>> QuantidadeValorProdutos = new List<Tuple<int, float>>();
    
public float TotalComDesconto { get;
    set;
    }
    
public void CalcularTotalComDesconto()    {        Contract.Requires(QuantidadeValorProdutos.Count > 0);
    Contract.Ensures(this.TotalComDesconto > 0);
    }
}

{% endhighlight %}
E o método de teste:
{% highlight csharp %}
[TestMethod]
public void Deve_Calcular_Total_Da_Compra_Com_Descontos(){
var compra = new Compra();
    compra.QuantidadeValorProdutos.Add(new Tuple<int, float>(1,10));
    compra.CalcularTotalComDesconto();
    }

{% endhighlight %}
E o resultado será o seguinte:[caption id="attachment_1134" align="aligncenter" width="300" caption="Pós-condição falhando com Code Contracts"][![Pós-condição falhando com Code Contracts](http://viniciusquaiato.com/images_posts/poscondition-failed-300x139.jpg "Pós-condição falhando com Code Contracts")](http://viniciusquaiato.com/images_posts/poscondition-failed.jpg)[/caption]Haverá uma falha pois dissemos que quando o método terminasse de executar a propriedade _TotalComDesconto _deveria ser maior que 0. Vamos alterar o método de cálculo para que satisfaça a pós-condição:
{% highlight csharp %}

public void CalcularTotalComDesconto(){    Contract.Requires(QuantidadeValorProdutos.Count > 0);
    Contract.Ensures(this.TotalComDesconto > 0);
    this. TotalComDesconto = this.QuantidadeValorProdutos.Sum(p => p. Item1 * p.Item2);
    }

{% endhighlight %}
Isso faz com que a propriedade _TotalComDesconto _receba um valor. Ainda assim essa pós-condição pode falhar. Portanto é muito importante termos consciência de como definir nossas classes e regras de negócios. Entendendo muito bem como elas devem se comportar. E para finalizar, vamos dar uma olhada em como funcionam as invariantes.
{% highlight csharp %}
class Usuario{    

public string Login { get;
    set;
    }
    
public string Senha { get;
    set;
    }
    
public void AlterarSenhaAtual(string novaSenha)    {        this. Senha = novaSenha;
    }
    [ContractInvariantMethod]    
private void ObjectInvariant()    {        Contract.Invariant(this.Senha != null);
    }
}

{% endhighlight %}
Uma invariante é uma condição que deve ser satisfeita ao longo de toda a vida de um objeto. Desta forma Marcamos o método com um atributo _[ContractInvariantMethod](http://msdn.microsoft.com/en-us/library/system.diagnostics.contracts.contractinvariantmethodattribute.aspx)_ e dentro deste método definimos o contrato chamando o método [Invariant](http://msdn.microsoft.com/en-us/library/system.diagnostics.contracts.contract.invariant.aspx). No exemplo acima está definido que um objeto do tipo Usuario nunca poderá ter uma senha nula. Se executarmos o teste abaixo teremos um erro:
{% highlight csharp %}
[TestMethod]
public void Deve_alterar_Senha(){
var usuario = new Ususario();
    usuario.AlterarSenhaAtual(null);
    }

{% endhighlight %}
E o resultado:[caption id="attachment_1136" align="aligncenter" width="300" caption="Invariante falhando com Code Contracts"][![Invariante falhando com Code Contracts](http://viniciusquaiato.com/images_posts/invariant-300x139.jpg "Invariante falhando com Code Contracts")](http://viniciusquaiato.com/images_posts/invariant.jpg)[/caption]Existem outras funcionalidades presentes no Code Contracts ([veja manual do usuário](http://research.microsoft.com/en-us/projects/contracts/userdoc.pdf)), e vale bastante estudá-las e entender como podem nos auxiliar. Particularmente a clareza que temos no código, deixando bem separado o que são condicionais e o que são regras, é muito atraente pra mim. Há a possibilidade de gerar documentação com as informações dos contratos por exemplo. A possibilidade de checagem estática é muito válida, pois nos possibilita encontrar chamadas inválidas muito antes de que elas possam causar sérios problemas. Enfim, é uma ferramenta e tecnologia que devemos olhar com bastante atenção.

Abraços,
Vinicius Quaiato.
