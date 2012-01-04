--- 
layout: post
title: Domain Repository pattern
wordpress_id: 2468
wordpress_url: http://viniciusquaiato.com/blog/?p=2468
categories: 
- title: "Boas Pr\xC3\xA1ticas"
  slug: boas-praticas
  autoslug: "boas-pr\xC3\xA1ticas"
tags: 
- title: Domain Repository
  slug: domain-repository
  autoslug: domain-repository
- title: Domain Driven Design
  slug: domain-driven-design
  autoslug: domain-driven-design
- title: DDD
  slug: ddd
  autoslug: ddd
- title: Repository
  slug: repository
  autoslug: repository
- title: Domain
  slug: domain
  autoslug: domain
---
(Este texto é um esboço para mim mesmo. Sinta-se livre para criticar, questionar, discordar e contribuir)Domain Driven Design não é algo que você conseguirá aprender lendo um post em um blog como este, então eu não vou tentar ensinar ou explicar DDD.

## O modelo rico
Para contextualizar: Um dos pontos chave do DDD é que façamos um modelo rico do nosso domínio. Isto quer dizer que precisamos ter um profundo conhecimento do domínio ao qual estamos tentando atender, pois somente um conhecimento profundo do domínio que nos permitirá criar um modelo rico.

## Um conhecimento profundo do domínio
Obter um conhecimento aprofundado do domínio não é uma tarefa simples. É preciso <del datetime="2010-12-21T03:53:16+00:00">alguma</del> muita dedicação. É necessária uma interação muito boa entre o especialista do domínio e o <del datetime="2010-12-21T03:53:16+00:00">time</del> desenvolvedor. Cada informação, por mais simples que possa parecer, quando vinda do especialista de domínio, pode ser um pedaço fundamental no entendimento de conceitos importantes, pertinentes e particulares ao domínio.

## A linguagem ubíqua(onipresente)
Captar e mapear os conceitos mais íntimos e importantes do domínio só é possível quando tudo o que fazemos está relacionado e relacionando estes conceitos. Cada <del datetime="2010-12-21T03:53:16+00:00">palavra</del> termo que é utilizado pelo especialista do domínio é um termo que deve estar presente também no vocabulário do desenvolvedor. Estes termos são conceitos do domínio. Isso deve estar refletido, sem dúvida alguma, no modelo que fazemos do domínio. Muito mais importante do que estes termos estarem presentes nas reuniões e conversas com o especialista do domínio é estes termos e conceitos estarem presentes e intimamente ligados e bem mapeados no código que criamos. O código é a única verdade em um projeto de software. Se o código não fala a língua do especialista do domínio, o código está falando qualquer coisa, menos o que deveria falar, independente do software que saia deste código.

## O repositório
Um dos padrões técnicos que visam dar suporte para o Domain Driven Design é o pattern Repository (não vou abrir meus livros agora mas darei uma definição simples).O pattern Repository é um pattern que visa abstrair o acesso a dados dando a ilusão de uma coleção de objetos. Ou seja: é um local onde você pode colocar e solicitar objetos, não importando aonde de fato eles sejam colocados. No Domain Driven Design o Repository pattern tem um papel fundamental na manutenção do ciclo de vida dos objetos.

## O repositório como parte do domínio
Pensando então em um modelo rico, em um entendimento profundo do domíno e principalmente na linguagem ubíqua comecei a me questionar: "O repositório não faz parte do domínio?".Bem, o repositório não faz. Ponto. Porém (quem me conhece sabe como sou chato) meus questionamentos não cessaram: "A interface do repositório não faz parte do domínio?".Hum. Isso já pareceu mais razoável. Se estamos falando em um domínio rico e em linguagem onipresente faz todo sentido que a interface(a forma como um objeto/conceito se apresenta para o mundo) faça parte do meu domínio. Esta afirmação me rendeu umas boas 4 horas discussões.Possuímos repositórios como domain concepts, é muito nítido isso e me recuso(ao menos por enquanto) a acreditar que a interface desses repositórios seja algo meramente de infraestrutura. Vamos ver(este foi meu primeiro argumento em defesa desta idéia): Se você é um vendedor é mais razoável que sua coleção de clientes esteja na sua "carteira de clientes" ou em seu "repositório de clientes"? Para mim soa mais simples e correta a idéia de ter uma "carteira de clientes". Você jamais vai ouvir um vendedor dizendo "repositório de clientes". Não faz parte da linguagem.Continuando.Você cria um novo contato em seu celular. Ele será armazenado na "agenda de contatos" ou no "repositório de contatos"? Nem preciso responder não é? Agora um exemplo bastante interessante: Qual o repositório de um usuário no twitter? A timeline ou o "repositório de tweets"? Oras é claro que é a timeline do cidadão.

## Repositório é um padrão técnico e não possui conceitos de domínio
Em uma destas discussões sobre este assunto o [Felipe Rodrigues](http://blog.lambda3.com.br/L3/felipero/)(que é um cara que conhece muito sobre DDD) disse que se o que eu chamo de repositório possui conceitos e operações de domínio então eu devo chamar de qualquer outra coisa que não seja repositório. No começo isso me pareceu estranho. Primeiro pelo fato de que esses repositório não possuem operações de domínio, mas sim sua interface fala a linguagem ubíqua e está presente nela, mantendo assim explícitos importantes **conceitos** do domínio. Mas me pareceu bastante justo <del datetime="2010-12-21T03:53:16+00:00">distinguir</del> diferenciar estes dois tipos de repositório pois de fato podem existir repositórios que não fazem parte do domínio, e isso não me parece ser algo ruim. Vamos pensar mais um pouco: se estamos trabalhando em uma aplicação cujo domínio é a venda de ingressos de futebol, possívelmente os usuários que tem acesso administrativo nesta aplicação terão um repositório, mas não necessariamente este repositório representa um conceito do domínio.

## Domain Repository
Pensando então que um repositório pode representar importantes conceitos dentro do domínio e ter sua interface diretamente ligada a linguagem ubíqua mas que repositório é um padrão técnico resolvi apelidar essa minha idéia estranha de **Domain Repository**.Como eu disse, este é apenas um rabisco de algumas idéias e conclusões que tenho/cheguei atualmente. Pode ser que eu esteja bastante enganado, ou pode ser que eu esteja bastante certo. Isso vai depender do tempo, da experiência e de uma mellhor análise e formatação desse padrão/conceito.O fato é que não posso negar a existência deste tipo de "objeto" dentro de um domínio rico.É bastante claro para mim que existe um repositório que não é uma entidade, não é um serviço, não é um objeto de valor e que zela por importantes informações do domínio. Também não estamos falando de um agregado nem nada do tipo: é um repositório que possui sua interface no domínio, simples assim.

## A implementação do Domain Repository
Quando eu falo "a interface pertence ao domínio" isso não tem nada a ver com "dentro do assembly Projeto. Domain eu possuo uma 
public interface IAlgumaCoisa". Quando falo interface quero dizer o contrato de um determinado tipo. Se isso será implementado como uma interface(keyword), uma classe abstrata, uma classe concreta, se estará no assembly A ou no assembly Z isso não faz a menor diferença desde que o contrato deste tipo possua domain concepts. Isto quer dizer também que, em um Domain Repository você não possui coisas do tipo "ObterPorId" ou "Where(Func<T,Y>)" a não ser que Id ou Where sejam também conceitos de domínio. Caso Id seja apenas um identificador do banco de dados relacional, então este método está sobrando aí(ou não deveria ser público pelo menos).<del datetime="2010-12-21T04:55:30+00:00">Muitas vezes</del> <del datetime="2010-12-21T04:55:30+00:00">Na maioria das vezes</del> Quase sempre os desenvolvedores acabam se prendendo aos padrões técnicos quando estudam DDD e se esquecem do domínio, da ubiquitous language, do design flexível, etc. Geralmente acabam com repositórios completamente técnicos e genéricos então muitos conceitos acabam sendo perdidos e deixados de lado. Neste ponto fica bastante claro que para identificar o Domain Repository é preciso entender o domínio e querer, de fato, manter uma linguagem onipresente. O nome do Domain Repository é um conceito de domínio que precisa ser identificado. Independente de como ele será implementado, o tipo é um conceito de domínio que para a maioria dos desenvolvedores não é algo claro, ao menos não em um primeiro momento.É necessária dedicação e inspeção constantes para identificar conceitos faltantes e "conceitos excedentes"(ou que não fazem parte do domínio) em nosso modelo. Para isso preciso dizer também que é preciso ter um pouco de coragem para refatorar ou simplesmente jogar algum código fora(me desculpe se você é desses que sacrifica o projeto por conta do medo de refatorar ou jogar algum código fora).

## Resumindo
Domain Repository representa a idéia de uma coleção de objetos de domínio através de uma interface pertencente ao domínio e presente na linguagem ubíqua.É possível que este tipo especial de repositório exista junto com repositórios que só possuem conceitos técnicos. Pode ser que eu esteja viajando demais.

Abraços,
Vinicius Quaiato.P.S.: Não coloquei links para posts e artigos sobre DDD pois acho que todos devem começar pelo [livro do Eric Evans](http://www.amazon.com/Domain-Driven-Design-Tackling-Complexity-Software/dp/0321125215), mesmo que seja um livro massante, sem ilustração, com poucas linhas de código.
