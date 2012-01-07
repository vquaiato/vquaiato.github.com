--- 
layout: post
title: OCP - Open Closed Principle
wordpress_id: 1155
wordpress_url: http://viniciusquaiato.com/blog/?p=1155
categories: 
- title: Patterns
  slug: patterns
  autoslug: patterns
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: SOLID
  slug: solid
  autoslug: solid
- title: Single Responsibility
  slug: single-responsibility
  autoslug: single-responsibility
- title: "Princ\xC3\xADpios SOLID"
  slug: principios-solid
  autoslug: "princ\xC3\xADpios-solid"
- title: Open Closed Principle
  slug: open-closed-principle
  autoslug: open-closed-principle
- title: OCP
  slug: ocp
  autoslug: ocp
---
[![Open Closed Principle](http://viniciusquaiato.com/images_posts/open-closed-jpg-300x225.jpg "Open Closed Principle")](http://viniciusquaiato.com/images_posts/open-closed-jpg.jpeg)Sem dúvida o princípioo [SOLID](http://butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod) mais "controverso" e polêmico. [OCP - Open Closed Principle](http://www.objectmentor.com/resources/articles/ocp.pdf) ou "Princípio do Aberto Fechado" é com certeza um dos menos utilizados, desconhecidos e "assustadores" princípios de design de aplicações orientadas a objetos.(escute aqui um [podcast do .NET Architects sobre princípios SOLID](http://viniciusquaiato.com/blog/podcast-principios-solid-net-architects/))Software, como todos sabemos, é evolutivo. É muito difícil, eu até arriscaria dizer impossível, encontrar um software que não mude, que não evolua, e que não precise ser alterado, modificado, melhorado. O grande problema é que eles(os softwares) são construídos de tal maneira que alterar/modificar passa a ser sinônimo de destruir. Em 1988 [Bertrand Meyer](http://en.wikipedia.org/wiki/Bertrand_Meyer) "nos deu" o OCP:<blockquote>SOFTWARE ENTITIES (CLASSES, MODULES, FUNCTIONS, ETC.) SHOULD BE OPEN FOR EXTENSION, BUT CLOSED FOR MODIFICATION.</blockquote>Ou seja: _**"Entidades de software(classes, módulos, funções, etc) devem estar abertas para extensão, mas fechadas para modificação"**_.

### A idéia
A motivação por detrás do OCP é justamente prover software reutilizável, robusto, que possa evoluir e que funcione. A idéia de **"Hey! Estamos fechados para modificações!"** pode parecer estranha. Afinal, como posso evoluir meu software sem modificá-lo? Aí entra o **"Opa.. estamos abertos para extensões."**, que é a chave da orientação a objetos. Oras, devemos extender os comportamentos ao invés de apenas modificá-los.Quando queremos adicionar um novo comportamento, uma nova funcionalidade, devemos extender as funcionalidades existentes e não alterá-las. Com isso evitamos destruir o que já existia, criamos softwares com designs mais duradouros, afinal, eles são extensíveis.

### O exemplo
Confuso? Vamos ver um pequeno exemplo:
{% highlight csharp %}
enum TipoDePagamento { A_VISTA, PARCELADO }
class ItemDeCompra{    

public string Produto { get;
    set;
    }
    
public int Quantidade { get;
    set;
    }
    
public decimal ValorUnitario { get;
    set;
    }
}
class Compra{    

private TipoDePagamento tipoDePagamento;
    
private IList<itemdecompra> itensDeCompra { get;
    set;
    }
    
public IEnumerable<itemdecompra> Itens    {        get {
return this.itensDeCompra;
    }
    }
    
public bool AdicionarItemNaCompra(ItemDeCompra novoItem)    {        this.itensDeCompra.Add(novoItem);
    }
    
public decimal ValorDoDesconto()    {
decimal valorDoDesconto = 0;
    switch (tipoDePagamento)        {            case TipoDePagamento.A_VISTA:                valorDoDesconto = 0.15m * this.itensDeCompra.Sum(i => i.Quantidade * i.ValorUnitario);
    break;
    case TipoDePagamento.PARCELADO:                break;
    }
return valorDoDesconto;
    }
}
</itemdecompra></itemdecompra>
{% endhighlight %}
O código acima retrata uma classe Compra, em um sistema qualquer de compras. O código até parece bem feito, os nomes bem definidos e claros. Simples de entender. O problema mora no método _ValorDoDesconto_, na _**linha 22**_. Esse método não só não está de acordo com OCP como faz a classe Compra não estar de acordo com OCP. O que acontece é que quando um tipo de pagamento novo estiver disponível, talvez um "financiamento" ou então "débito em conta", sei lá qualquer coisa do tipo, esta classe terá que mudar. E a verdade é que esta classe não parece nem estar de acordo com o [SRP](http://viniciusquaiato.com/blog/srp-single-responsibility-principle/).Vamos tentar adequar esta classe ao OCP.

### Adequando ao OCP
Observando um pouco nossas classes e as necessidades de negócio, e o modelo que fizemos e temos em mãos, podemos chegar a um desenho de classes parecido com este:
{% highlight csharp %}
abstract class CompraBase{    

protected IList<itemdecompra> itensDeCompra { get;
    set;
    }
    
public IEnumerable<itemdecompra> Itens    {        get {
return this.itensDeCompra;
    }
    }
    
public void AdicionarItemNaCompra(ItemDeCompra novoItem)    {        this.itensDeCompra.Add(novoItem);
    }
    
public abstract decimal ValorDoDesconto();
    }
class CompraParcelada : CompraBase{    

public override decimal ValorDoDesconto()    {
return 0;
    }
}
class CompraAVista : CompraBase{    

public override decimal ValorDoDesconto()    {
return 0.15m * this.itensDeCompra.Sum(item => item.Quantidade*item.ValorUnitario);
    }
}
</itemdecompra></itemdecompra>
{% endhighlight %}
 

### Abstração
Não é possível continuarmos a falar de OCP sem que se mencione [abstração](http://pt.wikipedia.org/wiki/Abstra%C3%A7%C3%A3o_(programa%C3%A7%C3%A3o)). É ela quem irá permitir que tudo isso funcione. É o conceito chave por detrás dessa mágica.Abstração é um dos pilares da orientação a objetos, no entanto muitos desenvolvedores acabam se esquecendo do poder que temos em mãos com isto. Talvez por falta de experiência, ou simplesmente por falta de reflexão e entendimento do problema e dos contextos envolvidos. Vamos pensar um pouco. Se eu tenho abstrações e _dependo_ destas abstrações, eu possuo um código que está teoricamente fechado para modificações, afinal ele depende de abstrações que estão **bem definidas**, e assim está aberto para extensões, afinal, o comportamento destas abstrações não está definido, ele será implementado de diferentes maneiras.O que fazemos nesta segunda listagem é criar uma classe CompraBase abstrata. Esta classe encapsula todo comportamento padrão e comum a uma compra no nosso domínio. Então identificamos o comportamento que pode sofrer alterações e é mais suscetível a isso, neste caso o método _ValorDoDesconto_ e o tornamos abstrato.Desta forma criamos classes especializadas _CompraAVista_ e _CompraParcelada_ e cada uma delas define este método da forma que lhes for melhor, de acordo com as regras de cada uma.

### Padrões
Podemos notar que caberia neste caso utilizar uma Estratégia ([Strategy Pattern do GoF](http://en.wikipedia.org/wiki/Strategy_pattern)) e ter um tipo de "estratégia de desconto". Isso também estaria de acordo com o OCP, eu só não quis tornar o código mais extenso.Uma outra forma de obtermos uma boa extensibilidade e mantermos o OCP seria com a utilização de Decoradores ([Decorator Pattern do GoF](http://en.wikipedia.org/wiki/Decorator_pattern)). Desta forma poderíamos adicionar mais e mais comportamentos novos e específicos a classes e entidades já existentes sem ter de alterá-las. O ponto aqui não era extamente aplicar estes padrões, mas sim mostrar como o simples uso de abstrações podem nos fazer atingir um design mais coeso e evolutivo em nossas aplicações orientadas a objetos.Lembrando também que os padrões estão para serem utilizados quando necessário, se identificarmos essa necessidade.Talvez o OCP não seja o princípio mais fácil de atingir e/ou perseguir. Confesso que em muitos casos eu me vejo perdido e sem conseguir atingir este objetivo. Mas ter conhecimento do mesmo, e saber da importância de alcançá-lo já é um importante passo no caminho de construir software com qualidade.Para alguns desenvolvedores experientes é mais simples identificar estes pontos de alteração e extensão em uma primeira análise, para outros estas coisas tornam-se claras apenas após algum tempo trabalhando com o mesmo sistema/código. Talvez não seja possível para muitos de nós utilizar OCP logo de início, mas nem por isso vamos desistir e abrir mão de boas práticas e de um bom código.

Abraços,
 espero que tenha ajudado de alguma forma, e mandem seu feedback.Vinicius Quaiato
