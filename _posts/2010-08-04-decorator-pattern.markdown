--- 
layout: post
title: Decorator Pattern
wordpress_id: 1440
wordpress_url: http://viniciusquaiato.com/blog/?p=1440
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
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
- title: Open Closed Principle
  slug: open-closed-principle
  autoslug: open-closed-principle
- title: Decorator
  slug: decorator
  autoslug: decorator
---
[![](http://viniciusquaiato.com/blog/wp-content/uploads/2010/08/2_duplo_lego_bricks-150x150.jpg "Lego Bricks")](http://viniciusquaiato.com/blog/wp-content/uploads/2010/08/2_duplo_lego_bricks.jpg)O padrão Decorator é um dos padrões mais simples e ao mesmo tempo bastante interessante.Ele nos permite facilmente seguir e manter o [OCP - Open Closed Principle](http://viniciusquaiato.com/blog/ocp-open-closed-principle/).### O padrão Decorator
A idéia principal do [Pattern Decorator](http://en.wikipedia.org/wiki/Decorator_pattern) é prover comportamento adicional a um objeto específico e não a uma classe inteira. Desta forma decoramos um objeto com um comportamento novo, sem alterar as classes já existentes.A idéia aqui não é apenas mostrar um "[Design Pattern](http://www.amazon.com/Design-Patterns-Elements-Reusable-Object-Oriented/dp/0201633612)" mas deixar claro que o conhecimento de técnicas e padrões podem nos ajudar a obter design e software mais extensível, coeso e claro. Quero mostrar apenas uma forma simples de trabalhar com abstrações, patterns e manter princípios [SOLID](http://butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod) sem criar uma estrutura rebuscada e complicada de manter ou evoluir.### O exemplo
Como exemplo vamos imaginar que temos um editor de textos html qualquer. Precisamos implementar funcionalidades de exibir texto plano, negrito, itálico e sublinhado. Podemos ainda ter qualquer combinação destes textos. Ou seja: Só plano. Só Itálico. Itálico e Negrito. Negrito e Sublinhado, etc.Não vou detalhar o passo a passo que eu segui (sim, utilizei TDD), seguem os testes e abaixo a implementação:
{% highlight csharp %}
",                 new Sublinhado(new Italico(texto)).Exibir());        }    }
{% endhighlight %}
O comportamento do nosso código é bastante simples. Percebam como criamos um texto plano. E então decoramos este texto plano com qualquer uma das funcionalidades que queremos. Este é o intuito do padrão Decorator.A implementação disso é bastante simples, como vemos abaixo:
{% highlight csharp %}
";    }}
{% endhighlight %}
Acho que deu pra entender que a mágica toda está na interface ITexto não é? Graças a esta abstração conseguimos decorar nossos textos da maneira que quisermos.Se amanhã surgir a necessidade de criar um "FormatoBizarroDeTexto" será simples trabalhar com ele, visto que ele apenas decorará algum objeto.Stay SOLID guys. E não se esqueçam:## Um teste é melhor que nenhum teste
Abraços,Vinicius Quaiato.
