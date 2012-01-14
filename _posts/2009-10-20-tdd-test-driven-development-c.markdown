--- 
layout: post
title: TDD - Test-driven Development - Parte I
wordpress_id: 10
wordpress_url: http://viniciusquaiato.com/blog/?p=10
categories: 
- title: TDD
  slug: tdd
  autoslug: tdd
tags: 
- title: Tests
  slug: tests
  autoslug: tests
  - title: TDD
  slug: tdd
  autoslug: tdd
---
Bom, estive pensando sobre como começar este novo espaço e decidi que nada melhor do que a prática que mais vem me fascinando nos últimos tempos TDD - Test-Driven Development.TDD - Test-driven Development - Parte II[http://viniciusquaiato.com/blog/tdd-test-driven-development-c-parte-ii/](http://viniciusquaiato.com/blog/tdd-test-driven-development-c-parte-ii/)TDD - Test-driven Development - Parte III[http://viniciusquaiato.com/blog/tdd-test-driven-development-c-parte-iii/](http://viniciusquaiato.com/blog/tdd-test-driven-development-c-parte-iii/)TDD - Test-driven Development - Parte IV[http://viniciusquaiato.com/blog/tdd-test-driven-development-c-parte-iv/](http://viniciusquaiato.com/blog/tdd-test-driven-development-c-parte-iv/)TDD não é algo novo, e nem específico para uma tecnologia. Podemos dizer que o mesmo surgiu, ou ficou conhecido, em meados de 2002, com a publicação do livro de [Kent Beck](http://www.threeriversinstitute.org/Kent%20Beck.htm "Kent Beck"), chamado [Test-driven Development by Example](http://www.amazon.com/Test-Driven-Development-Kent-Beck/dp/0321146530 "TDD - Kent Beck").Basicamente o TDD significa:1. **Escreva um teste**, antes mesmo de escrever o código que este teste consome;
    2. **Faça o teste funcionar**, escrevendo o código do qual o teste depende, mesmo que seja um código ruim;
    3. **Refatore**, eliminando duplicações de código, tanto nos testes quanto nas implementações.
Basicamente isto é TDD, simples, não?!Você deve estar se perguntando:<blockquote>Que tipo de loucura é essa de escrever testes, ainda mais antes do código?</blockquote>Bem, existe uma série de fatores que podem levá-lo a querer escrever testes de unidade antes de escrever o código, vou citar aqui alguns que me fizeram repensar a forma de desenvolver:1. Testes asseguram que o que existe funciona, o que existia continua funcionando, e o que virá a existir funcionará;
    2. Testes de unidade nos dão confiança no código;
    3. Escrever os testes antes do código nos faz pensar em como realmente escrever aquele código do ponto de vista de quem irá utilizá-lo (ainda que sejamos nós mesmos);
    4. "Testes são documentação executável" ([Giovanni Bassi](http://unplugged.giggio.net/unplugged/default.aspx) [aqui](http://www.slideshare.net/giovanni.bassi/prticas-de-um-engenheiro-de-software-eficiente));
    5. Teste escrito antes do código é especificação (Giovanni Bassi [aqui](http://unplugged.giggio.net/unplugged/post/TDD-nao-existe.aspx));
    6. TDD foca em software que SEMPRE funciona;
    TDD nos leva a buscar e implementar boas práticas de programação. Para se realizar um bom teste de unidade, e antes do código estar escrito, é necessário que nossas classes sejam realmente coesas, que elas tenham um baixo acoplamento, que seus métodos sejam também coesos, com apenas uma responsabilidade. Nos faz pensar seriamente em [Inversão de Controle](http://en.wikipedia.org/wiki/Inversion_of_control) e [Injeção de Dependência](http://martinfowler.com/articles/injection.html).Estes itens já nos levam a considerar com muito carinho o uso de TDD.Com TDD, sem dúvida teremos software que funciona, software fácil de testar, software fácil de alterar, e o melhor de tudo, software feito por profissionais!Sim! Testar e garantir que funciona é obrigação de todo desenvolvedor de software.Imagine você comprar um carro e só quando for dirigir descobrir que a primeira marcha anda de ré!? Ou então comprar uma geladeira e quando colocar água para gelar descobrir que ela na verdade ferve a água?!Somos pagos, e muito bem pagos, para entregar software de qualidade, e quem deve garantir isso somos nós mesmos. Devemos ser profissionais. Mais do que isso, devemos ser bons profissionais!Para finalizar esta primeira parte, encerro com uma frase do [UncleBob](http://blog.objectmentor.com/):<blockquote>"Desenvolvedor que não testa é como um médico que não lava as mãos antes de fazer uma cirurgia."</blockquote>No próximo post mostrarei como fazermos algo bem simples usando TDD + C# + Visual Studio.Abraços galera.
