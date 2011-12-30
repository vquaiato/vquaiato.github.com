--- 
layout: post
title: "Responsabilidade \xC3\x9Anica - Uma hist\xC3\xB3ria bem contada"
wordpress_id: 2596
wordpress_url: http://viniciusquaiato.com/blog/?p=2596
categories: 
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: SOLID
  slug: solid
  autoslug: solid
- title: SRP
  slug: srp
  autoslug: srp
- title: Single Responsibility
  slug: single-responsibility
  autoslug: single-responsibility
- title: "Responsabilidade \xC3\x9Anica"
  slug: responsabilidade-unica
  autoslug: "responsabilidade-\xC3\x9Anica"
---
Responsabilidade única também é algo que parece ser simples mas que é negligenciado pela maioria dos desenvolveldores(eu estou incluso).Existem razões pelas quais as "boas práticas" são tidas como boas: elas ajudam!

## A Responsabilidade Única
O Princípio da Responsabilidade Única([Single Responsibility Principle](http://www.objectmentor.com/resources/articles/srp.pdf)) resume-se basicamente em:<blockquote>THERE SHOULD NEVER BE MORE THAN ONE REASON FOR A CLASS TO CHANGE.</blockquote>Eu já falei um pouco sobre esse princípio [aqui](http://viniciusquaiato.com/blog/srp-single-responsibility-principle/).Bem, a frase acima diz: **_"Não deve haver mais de um motivo para uma classe mudar"_**. E isto é uma responsabilidade: um motivo/razão para mudar.Mas o que é "uma razão para mudar"?

### A razão para mudar
Uma classe deve possuir um conjunto coeso de propriedades e métodos, que em um objeto será traduzido em estado e comportamentos.Coesão significa que existe harmonia entre as partes desta classe. Elas estão relacionadas umas com as outras de forma a comporem um "texto bem escrito".A razão para mudar deve ser a razão de existir desta classe. É esta razão que dita e diz se há coesão ou não.Desta forma fica muito claro que podem existir N métodos e N propriedades desde que eles sejam coesos e façam parte de uma mesma narrativa: a classe em questão.

### Pequena metáfora para ilustrar
Imagine ler um texto assim:<blockquote>Era uma linda manhã de domingo. O trânsito estava muito ruim em São Paulo. Era um sábado bastante tranquilo apesar de chuvoso. Enquanto tomava banho.</blockquote>Não há coesão alguma!Vamos ver um exemplo de código(utilizado com permissão de um sistema do Juan Lopes[não foi ele quem produziu este código!]):<pre lang="csharp">public BalancaResponse GetWeight(){    BalancaResponse response = new BalancaResponse();    response.Peso = -1d;    Double peso = this.AbrePorta();    if (peso == 0d)        response.Message = "Não foi possível abri a porta " + Enum.GetName(typeof(Balanca.Port), _port);    else    {        peso = this.LePeso();        if (peso == -9999)            response.Message = "Erro generico de comunicacao - caracteres nao numericos recebidos.";        else if (peso == -9997)            response.Message = "Nao conseguiu abrir a comunicacao com a porta serial.";        else if (peso == -9996)            response.Message = "Tempo de 2 segundos esgotado (time out).";        else            response.Peso = peso;        this.FechaPorta();    }    return response;}</pre>Bom, não temos o código completo da classe, mas este método vai bastar para nossa explicação pois os problemas deste método podem ser extrapolados para a classe.Primeiro: Qual a razão deste método existir?Resposta: Algo relacionado com obter o peso de alguma coisa(pelo menos é isso que o nome dele diz).Parece bastante óbvio que este método está realizando mais do que uma operação e nitidamente possui mais de uma razão para mudar. Vamos listar algumas:1. Esta classe pode mudar caso a forma de obter um peso mude(abrir porta)
2. Esta classe pode mudar caso os valores de peso mudem
3. Esta classe pode mudar caso as mensagens de resposta mudem
4. Esta classe pode mudar caso a forma como uma porta é fechada mude
São responsabilidade demais! É uma história mal contada. Uma forma bastante simples é perguntar para a classe/método o que ele/ela faz:<blockquote>Hey, o que você faz?</blockquote>Se como resposta você tiver algo parecido com: "Eu faço isso, e aquilo, e aquilo mais" algo está claramente errado.Se você faz uso de [conjunções](http://pt.wikipedia.org/wiki/Conjun%C3%A7%C3%A3o) para explicar uma classe/método ela claramente tem mais de uma responsabilidade.Então lembre-se que não é a quantidade de métodos que diz quantas responsabilidades uma classe possui, mas sim a coesão entre estes métodos.Uma classe deve mudar apenas se sua razão de existir solicitar uma mudança.Abraços,Vinicius Quaiato.
