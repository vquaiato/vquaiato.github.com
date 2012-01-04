--- 
layout: post
title: Tell don't ask!
wordpress_id: 2576
wordpress_url: http://viniciusquaiato.com/blog/?p=2576
categories: 
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: Design
  slug: design
  autoslug: design
- title: "Orienta\xC3\xA7\xC3\xA3o a Objetos"
  slug: orientacao-a-objetos
  autoslug: "orienta\xC3\xA7\xC3\xA3o-a-objetos"
- title: Tell don't ask
  slug: tell-dont-ask
  autoslug: tell-don't-ask
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/Kids-Whisper-150x150.jpg "Kids-Whisper")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/12/Kids-Whisper.jpg)Este não é para ser um daqueles posts teóricos e cheios de referências para outros artigos: vamos ser práticos e diretos(lembrando que isso nem sempre quer dizer toneladas de código).

## Diga, não peça!
É isso mesmo. Este é o título do post e é tido também como um bom princípio de design para aplicações orientadas a objetos.É algo como **dizer a um objeto o que deve ser feito** e não pedir por partes dele.O "ask" acaba sendo tentador às vezes, mas no geral(nem sempre) é sinal de um design frágil, e por frágil podemos entender algo que pode ser quebrado com facilidade.

### Caindo em código procedural
Quando falamos em Orientação a Objetos e Objetos estamos nos referindo a: estado, comportamento, encapsulamento(e outros itens menos importantes nesse momento).Sendo assim quando você expõe propriedades e estados de um objeto você:1. Viola seu encapsulamento
2. Acaba tendo uma abordagem procedural, pois ignora seu comportamento


### Objetos se comunicam
Objetos falam(ou deveriam) falar uns com os outros através de métodos. Quando eles começam a se comunicar por meio de suas propriedades é um sinal(na maioria das vezes) de que as coisas estão indo mal: encapsulamento violado, criação de dependências e código procedural, afinal estamos tratando um objeto apenas como dados.Vi este código no twitter essa semana e vou usar como exemplo:
{% highlight csharp %}
Me.Connection.Close();
    
{% endhighlight %}
Ha! Tenho certeza que vocês já identificaram qual o problema não?!Pois bem o que acontece neste código é que o mundo precisa conhecer a estrutura interna do objeto "Me" e além disso precisa saber como modificar seu estado. Estamos **pedindo** informações para ele ao invés de **dizer** o que precisamos.O problema com isso é que criamos dependências a este objeto. Se algo precisar ser alterado em sua estrutura interna isto está exposto ao mundo. Seria melhor termos algo como:
{% highlight csharp %}
Me.FecharConexao();
    
{% endhighlight %}
Desta forma não interessa para o mundo o que FecharConexao faz com o estado interno. Não importa quantos outros objetos precisam ser manipulados. O que importa é que estou **dizendo** a este objeto que eu quero que ele feche sua conexão e não **pedindo** sua conexão e então fechando-a.

### Efeitos colaterais
Permitir que o estado de um objeto seja manipulado desta forma pode ter efeitos colaterais muito ruins. Imaginando que a conexão do exemplo anterior só pode ser fechada se não houver nenhuma atividade sendo executada, permitir que um objeto externo feche-a diretamente sem garantir essas condições pode levar nosso objeto a um estado completamente inválido, desencadeando uma série de erros e bugs em nosso código.Na maioria dos casos somente o próprio objeto deveria saber manipular seu estado.

### Pequena metáfora para finalizar
Imagina que seu vizinho/a precise de açúcar. O correto seria ele bater em nossa porta, dizer que precisa de um pouco de açúcar, aguardar enquanto vamos até nossa cozinha, pegar o açúcar que lhe damos e então ir embora.Por que razão então permitimos ao vizinho entrar em nossa casa sem bater à porta, dirigir-se até a cozinha, abrir os armários e pegar o açúcar sem nem ao menos dizer obrigado?Pense nisso.

Abraços,
Vinicius Quaiato.
