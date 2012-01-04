--- 
layout: post
title: "Escrever c\xC3\xB3digo em ingl\xC3\xAAs ou portugu\xC3\xAAs?"
wordpress_id: 4119
wordpress_url: http://viniciusquaiato.com/blog/?p=4119
categories: 
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: Clean Code
  slug: clean-code
  autoslug: clean-code
- title: Domain Driven Design
  slug: domain-driven-design
  autoslug: domain-driven-design
- title: DDD
  slug: ddd
  autoslug: ddd
- title: "C\xC3\xB3digo"
  slug: codigo
  autoslug: "c\xC3\xB3digo"
- title: "C\xC3\xB3digo Ingl\xC3\xAAs ou Portugu\xC3\xAAs"
  slug: codigo-ingles-ou-portugues
  autoslug: "c\xC3\xB3digo-ingl\xC3\xAAs-ou-portugu\xC3\xAAs"
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2011/10/atrito-300x229.jpg "atrito")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/10/atrito.jpg)Fala galera, beleza? Essa semana tive uma discussão no twitter com alguns amigos ([@porcelli](http://twitter.com/porcelli), [@felipero](http://twitter.com/felipero), [@scaphe](http://twitter.com/scaphe), [@elemarjr](http://twitter.com/elemarjr), [@lucabastos](http://twitter.com/lucabastos) e mais um monte) onde discutimos **_a necessidade de escrever código em inglês ou em português_**.Eu defendi **a escrita do código de negócio na linguagem do cliente**, ou seja, na linguagem do próprio negócio. E pretendo explicar algumas razões desta minha preferência.

## O especialista no problema
Quando eu vou para uma reunião tentar compreender o problema que preciso resolver geralmente o cliente(quem nos pede para resolver um problema) possui uma série de termos específicos sobre seu negócio. Estes termos não podem ser diretamente mapeados para "classes" dentro do nosso sistema. Muitas vezes estes termos designam processos e operações que vão vir a ser escritos como um grupos de classes/objetos interagindo.Por mais que você ache que seu cliente "não sabe o que quer" ele é o especialista no assunto. Ele definitivamente não sabe e não precisa saber nada sobre software mas ele sabe tudo sobre o problema a ser resolvido. Então é importante ficar atento aos termos dele, mapear as interações, relações, especialidades, processos e atribuições de cada pedaço do negócio que ele nos conta.<blockquote>Quando um usuário finaliza um pedido então uma compra é gerada no sistema com todas as informações inclusive o pagamento</blockquote>

## Traduzir o problema
Dado que não somos os especialistas no problema por que motivos saímos de uma reunião onde acabamos de escutar um monte de coisas novas e complexas e traduzimos isso para uma língua que não é a nossa língua nativa?Temos dois pontos para observar aqui:1. Ainda não entendemos o problema por completo. Uma ou duas reuniões não são suficientes para isso.
2. Pegamos um problema que não entendemos e o colocamos em uma língua que não é nossa especialidade
Qual o problema de traduzir as coisas para o inglês? Sejamos simples: você já pegou um texto em português e traduziu para o inglês? Quando você é **muito bom** em inglês você até consegue fazer isso mesmo sabendo que não ficou 100% como você queria, afinal o português é mais rico, possui peculiaridades, etc. Mas ainda assim você fica relendo o texto e vendo se está de acordo com o texto em português original.O seu cérebro fica fazendo esse mapeamento e esse "de-para" constantemente.
{% highlight c# %}

public class User{    

public Shop Finish(Request aRequest){...}
}


public class Request{...}


public class Shop{...}

{% endhighlight %}
Acima fica bem nítido que Request será constantemente mapeado mentalmente para Pedido. O termo se perde em meio ao código. Request não me faz pensar em Pedido por mais que eu mesmo tenha escrito isso.

## As dificuldades de comunicação
Dado que agora você traduziu tudo isso, para o inglês por exemplo, as comunicações entre a equipe começam a ter [atrito](http://pt.wikipedia.org/wiki/Atrito). Todos no time vão começar a fazer um "de-para" dos termos de negócio para os termos do código. Quando ocorrem reuniões de entendimento com o especialista do problema a coisa é pior ainda. Pois o especialista entra em detalhes que você não domina e para tentar chegar até este ponto de entendimento você tenta mapear o que ele diz com o código mas o código está em outra língua, outros termos. O raciocínio começa a ficar prejudicado.<blockquote>Todas as compras possuem pelo menos um pedido e possuem pelo menos um pagamento. Quando o pagamento é à vista as compras só possuem um pagamento.</blockquote>Então o time fica pensando... :
{% highlight c# %}
//pagamento à vista
public class InvoicePayment : Payment{...}


public class CreditCardPayment : Payment{...}

{% endhighlight %}
É claro que o cerébro é poderoso e consegue fazer isso mas isso não quer dizer que ele não precise trabalhar muito para isso.

## Buscando uma melhor comunicação entre a equipe
Em geral não é um time inteiro que tem reuniões com o especialista de domínio (embora possamos achar que isso seria o ideal). Quando uma parte da equipe possui informações sobre o domínio e então traduz isso da forma como acha melhor isso vai gerar um enorme **ruído** no projeto.Para quem não está com o cenário todo desenhado na cabeça e está convivendo apenas com as traduções o entendimento do problema como um todo fica comprometido e parece que estas pessoas apenas escrevem código, por escrever. Se em algum momento estas pessoas precisarem questionar o especialista de domínio sobre algo provavelmente o farão de forma rasa e sem entendimento da resposta.
{% highlight c# %}

public class ShopService{    

private StockAvailability VerifyAvaialability(ShopItemCollection items){...}
    
private bool AcceptsMultiplePayments(Request aRequest){...}
    ...}

{% endhighlight %}


## Mescla de idiomas
Quando o domínio está traduzido e poucas pessoas do time de fato possuem uma visão geral do problema é normal que os outros membros do time comecem a implementar novas funcionalidades em português. Isso acontece pois eles sentem que a parte traduzida está complicada e não é de simples entendimento. O código metade inglês e metade português é uma tentativa de torná-lo mais expressivo.
{% highlight c# %}

public class ShopService{    

private StockAvailability VerifyAvaialability(ShopItemCollection items){...}
    
private bool AcceptsMultiplePayments(Request theRequest){...}
    
private bool PossuiPagamentoAVista(Request theRequest){...}
    ...}

{% endhighlight %}


## Mas a linguagem é inglês
Não há como comparar as instruções da linguagem (class, for, foreach, while, if, else, public, private, etc) com operações e conceitos de domínio. Eles representam apenas infraestrutura e suporte para todo o problema a ser resolvido. Não fazem parte do vocabulário cotidiano do software. Quando temos código claro esses detalhes de infra passam desapercebidos.
{% highlight c# %}

bool PERMITE = true;
bool NÃO_PERMITE = false;
    
private bool PermiteMultiplasFormasDePagamento(Pedido oPedido){        if(oPedido.PossuiPagamentoAVista)            return NÃO_PERMITE;
    return PERMITE;
    }

{% endhighlight %}


## Domain Driven Design
Na verdade eu <del datetime="2011-10-01T13:12:11+00:00">"estou me lixando" para o DDD neste caso</del> nem estou falando sobre DDD aqui. Não é por este motivo que eu tento escrever o código na linguagem do negócio. Isso pode me ajudar a ter uma "linguagem onipresente" em todo o projeto, mas essa não é a razão.

## Resumo
Todos os motivos que citei acima, em principal o **atrito na comunicação** são problemas que eu vivenciei em diversos projetos. Sempre que passei por estas situações, por melhor que seja meu inglês e de outros membros do time, a conversa diária com o cliente não é em inglês e isso sempre se mostrou um problema. É importante ressaltar, porém, que esse problema não é fatal ele apenas gera dificuldade e demora no entendimento(principalmente quando é preciso explicar o domínio usando código para outros membros do time).No entanto se tivermos um domínio simples, ou que não seja extenso, esse atrito é menor ou pode passar a não existir (mas eu me arrisco a dizer que são poucos os sistemas que possuem domínios simples).No final das contas vai de cada um também. Escrever código em inglês é estética afinal ele não agrega estando em inglês. E mais importante que isso: **escrever código em inglês não prova em nada que você sabe falar inglês ok?!**Não é vergonha nenhuma preferir escrever código de domínio na língua natal. Não pense que fazer isso mostrará aos outros que você não sabe inglês. Escrever meia dúzia de palavra sem outro idioma não prova nada.É importante frisar também que o código será trabalhado por diversas pessoas e todas precisam estar confortáveis com a forma como ele está escrito. Todos precisam estar com pleno entendimento do domínio e ler código e ter reuniões no mesmo idioma auxiliam em muito nesta tarefa.Essa é apenas a minha opinião e experiência. Não é uma verdade para todos. E vocês o que acham? Como preferem? Por quais motivos?

Abraços,
Vinicius Quaiato.
