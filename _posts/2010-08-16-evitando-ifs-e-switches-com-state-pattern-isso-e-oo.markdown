--- 
layout: post
title: "Evitando IFs e Switches com State Pattern: Isso \xC3\xA9 OO"
wordpress_id: 1468
wordpress_url: http://viniciusquaiato.com/blog/?p=1468
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
- title: Patterns
  slug: patterns
  autoslug: patterns
- title: Design Patterns
  slug: design-patterns
  autoslug: design-patterns
- title: State Pattern
  slug: state-pattern
  autoslug: state-pattern
- title: "Orienta\xC3\xA7\xC3\xA3o a Objetos"
  slug: orientacao-a-objetos
  autoslug: "orienta\xC3\xA7\xC3\xA3o-a-objetos"
---
[![](http://viniciusquaiato.com/images_posts/decisoes-150x150.jpg "decisoes")](http://viniciusquaiato.com/images_posts/decisoes.jpg)É normal que o código de um software tenha que tomar algumas decisões e fazer uso de condicionais. O problema é que muitas vezes o uso destas condicionais acaba ferindo alguns princípios da Orientação a Objetos. E não falo apenas de princípios SOLID, falo de coisas simples como encapsulamento por exemplo. Quando estamos falando de objetos estamos falando de estado + comportamento. Pode até parecer um clichê, um chavão, mas é a grande "sacada" da OO, e precisamos entender, aceitar e praticar isso. Quero ilustrar alguns casos onde a utilização do State Pattern pode nos ajudar a encapsulasr o código, tornando-o mais OO (lembrem: Estado + Comportamento) e evitando emaranhados de IF's e Switches malucos.

### Um exemplo simples
<blockquote>Uma compra pode estar em um de três estados diferentes. Cada um destes estados dá uma informação diferente sobre a situação da compra.</blockquote>Inicialmente temos isso:
{% highlight csharp %}

public enum StatusDaCompra{    AguardandoConfirmacaoPagamento,    Enviada,    Entregue}


public class Compra{    

public StatusDaCompra Status { get;
    set;
    }
    
public List<itemcompra> Itens { get;
    set;
    }
    
public string ObterInformacoes()    {        switch (Status)        {            case StatusDaCompra.AguardandoConfirmacaoPagamento:                {
return "Estamos aguarando a confirmacao de pagamento da instituição financeira";
    }
                break;
    case StatusDaCompra.Enviada:                {
return                        "O pagamento da compra já foi confirmado, e a mesma foi enviada para o endereço de entrega na data X";
    }
                break;
    case StatusDaCompra.Entregue:                {
return "Sua compra foi enviada e entregue no endereço informado.";
    }
                break;
    default:                throw new InvalidEnumArgumentException();
    }
    }
}
</itemcompra>
{% endhighlight %}
(Reparem que em um sistema real teríamos vários outros estados no enum)Bastante simples e em um primeiro momento até parece correto e bonito. Mas... se estamos trabalhando com OO por que estamos programando de maneira procedural? Esse switch é uma "linguiça de código" a ser executado. E o mais feio é esse default, é bizarro. Outro detalhe, como gerenciar os estados da classe Compra?

### O State Pattern
Bom, a solução simples para evitar esse switch e seguir boas práticas OO é usar o [State Pattern](http://en.wikipedia.org/wiki/State_pattern).O [State Pattern](http://en.wikipedia.org/wiki/State_pattern) basicamente serve para "mudar" o comportamento de um objeto no momento de sua execução, baseado em seu estado. Oras, é tudo o que precisamos. Definir um estado que gerará um comportamento, e saberá se encaixar na cadeia de estados possíveis. Nosso enum StatusDaCompra não nos ajuda muito com isso. Em [Java o enum pode ter comportamento](http://download.oracle.com/javase/tutorial/java/javaOO/enum.html), o que nos permitiria facilmente implementar o [State Pattern](http://www.dofactory.com/Patterns/PatternState.aspx#_self2) diretamente no enum. No .NET não temos isso, então vamos mudar nosso código para algo assim:
{% highlight csharp %}

public abstract class StatusDaCompra{    

public abstract string Informacao(Compra compra);
    
public abstract void ProximoStatus(Compra compra);
    }


public class AguardandoConfirmacaoPagamento : StatusDaCompra{    

public override string Informacao(Compra compra)    {
return "Estamos aguarando a confirmacao de pagamento da instituição financeira";
    }
    
public override void ProximoStatus(Compra compra)    {        compra. Status = new Enviada();
    }
}


public class Enviada : StatusDaCompra{    

public override string Informacao(Compra compra)    {
return "O pagamento da compra já foi confirmado, e a mesma foi enviada para o endereço de entrega na data X";
    }
    
public override void ProximoStatus(Compra compra)    {        compra. Status = new Entregue();
    }
}


public class Entregue : StatusDaCompra{    

public override string Informacao(Compra compra)    {
return "Sua compra foi enviada e entregue no endereço informado.";
    }
    
public override void ProximoStatus(Compra compra)    {    }
}

{% endhighlight %}
A primeira coisa que fiz foi criar uma classe, um Value, que representa o Status da compra.(poderia ser uma interface)Reparem que agora a cadeia dos possíveis status é que sabe se alterar. Cada um dos status sabe para onde ir, e sabe o que ele significa, ou seja, ele representa um status com o comportamento pertinente a ele. Nossa classe Compra ficou assim:
{% highlight csharp %}

public class Compra{    

public StatusDaCompra Status { get;
    
internal set;
    }
    
public List<itemcompra> Itens { get;
    set;
    }
    
public string ObterInformacoesDaCompra()    {
return Status.Informacao(this);
    }
}
</itemcompra>
{% endhighlight %}


### Os benefícios
Com isso recuperamos o encapsulamento das informações do status da compra, afinal a compra em si tem um status e este status sabe gerar uma informação. Demos sentido ao status, que passa a ser mais do que um "label para um inteiro (a.k.a Enum)". Removemos a responsabilidade extra da classe Compra: ela não precisa mais saber como gerar informações sobre o status.É claro, este é um exemplo simples. A idéia aqui é dar o conhecimento de como, de maneira simples, deixamos nosso código mais coeso, claro e manutenível. Você pode dizer que adicionamos complexidade, agora temos mais classes, etc. Mas eu discordo. Essa complexidade já existia, mas ela estava no local errado. Primeiro, o cliente era responsável por setar a forma de status conhecendo toda sua estrutura e cadeia(que parecia simples por ser apenas um enum). A complexidade da informação já existia, porém estava no local errado. Agora está em um local que faz sentido e coerente.

### A troca de Status
Ainda não resolvemos o problema da troca de status. Uma forma de fazer isso seria com a utilização de eventos que sinalizam a Compra. A utilização de eventos faz sentido se a compra estiver em memória. Vamos então fornecer através da compra uma interface para atualizar seu status:
{% highlight csharp %}

public void MudarStatus(){    this.Status.ProximoStatus(this);
    }

{% endhighlight %}
Com isso o Status atual sabe para qual Status a Compra deve ir. Eliminamos o switch e as decisões que a classe de Compra deveria fazer. O Status também poderia retornar o próximo status no método ProximoStatus. Deixo para vocês analisarem as várias possibilidades que este pattern trás. E aí, o que vocês acham?

Abraços,
Vinicius Quaiato.
