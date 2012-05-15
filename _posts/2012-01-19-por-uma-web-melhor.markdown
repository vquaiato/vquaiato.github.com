---
layout: post
title: "Por uma web melhor"
categories:
- title: Jekyll
  slug: jekyll
tags:
- title: Estudos
  slug: estudos
  autoslug: estudos
- title: HTML
  slug: html
  autoslug: html
- title: CSS
  slug: css
  autoslug: css
---
Fala galera, beleza?

Há algum tempo eu tenho parado de ler posts e blogs técnicos. Não por que eu ache que eu já sei tudo sobre muita coisa, justamente pelo contrário.

##Uma boa web
Eu tenho estudado e lido bastante sobre markup, semântica, HTML, CSS, web performance, layout, cores, tipografia, e coisas relacionadas.

Tenho estudado isso pois entendo que é algo fundamental no nosso dia-a-dia enquanto ***desenvolvedores de produtos pra web*** e é algo que eu ainda preciso melhorar muito.

Nesses, sei lá, 5 anos de atividade eu dediquei pouquíssimo tempo a isso. Com sorte e alguma mágica eu consegui aproveitar bastante do pouco que estudei e decidi que chegou o momento de aprofundar, melhorar, e ser mais responsável com estas questões.

**DISCLAIMER:** *se você não trabalha com produtos web, ou possui profissionais que façam toda interface em seus sistemas, ou por algum motivo você só tenha que ser bom em código server side talvez este texto não lhe faça sentido. Ainda assim recomendo que leia.*

##Não somos designers
Criar um bom markup: leve, semântico, agradável de ler e fazer este markup ter uma boa aparência quando renderizado não é uma simples tarefa de designer. É claro que criar um layout é algo difícil para nós, não estamos acostumados com isso e julgamos não ter o talento.

O mais interessante é que quando passamos a estudar e observar o design de sites/produtos com um olhar mais crítico/interessado passamos a ver que nem tudo é tão complexo de ser feito/criado. Não estou dizendo que vamos nos tornar designers (embora isso não seja impossível), estou apenas dizendo que nem tudo é tão complexo quanto imaginamos.

É preciso bastante estudo para conseguir criar coisas boas. Seguem alguns links introdutórios sobre o assunto:

[W3C Semantic Web Activity][semantic-web]

[Semantic Markup][semantic-markup]

[Plain Old Semantic HTML][posh]

##Entendendo CSS
É bem comum vermos ótimos devs que não conhecem nada de CSS e HTML. Acho que isso não é vergonha: temos tanto para estudar que acabamos deixando isso com uma prioridade menor (*assim como deixamos outras coisas/linguagens/técnicas com prioridade menor também*).

O ponto é que talvez já seja hora de dedicar um pouco mais de tempo para isso. Quantas vezes você já não quis fazer algo *bacana* em uma página e passou várias horas *"hackeando"* html e css para tentar (e não conseguiu)? Isso é fruto de desconhecimento e falta de prática.

CSS não é simplesmente uma forma de atribuir cores e tamanho de fonte para elementos. Existe uma série de regras, padrões e detalhes (assim como em uma linguagem de programação) que precisamos conhecer e entender para tirar o melhor proveito (isso sem falar da guerra dos browsers!). E convenhamos que comparado com uma linguagem de programação é bem simples aprender CSS.

Eu diria que 90% do tempo que perdemos com HTML se dá pelo desperdício decorrente da falta de conhecimento em CSS. Então a nossa meta tem que ser transoformar esses 90% em tempo produtivo (abraços aos [Leandro Daniel][leandronet] que adora as minhas estatísticas).

Como eu não quero ensinar CSS para ninguém aqui seguem alguns links e sites que tenho visto para me inspirar e estudar:

[CSS Tricks][css-tricks]

[Smashing Magazine][smashing]

[Peep Code][peepcode]

[CSS3 Info][css3info]

[W3C CSS][w3c-css]

##Entendendo o HTML
Final de semana passado eu decidi abrir meu novo blog em diferentes browsers (até então tinha feito tudo no Chrome/Canary). Para minha surpresa tudo funcionou bem no Safari, Opera e Firefox… mas claro que não funcionou no Internet Explorer.

Tentando validar o site no W3C encontrei algumas inconsistências que de fato eram culpa minha: não bastava culpar o IE.

Depois de corrigir os problemas as coisas magicamente passaram a funcionar nos IE 7, 8 e 9. E na real foram coisas bem simples, pequenos detalhes mesmo.
É claro que algumas coisas de não funcionam ainda no IE mas isso é detalhe, não quebra o layout (mas é importante saber o que o IE renderiza e o que não renderiza também).

[W3C Validator][validator]

[Yahoo - Best Practices for Speeding Up Your Web Site][yahoo]

##Tipografia
É normal ver sites por aí com alguns textos em formatos de imagem, ou então utilizando as *boas e velhas Verdana e Arial* em toda sua composição.

O ponto é que estudar um pouco de tipografia e usar algumas fonts externas não é algo tão ruim. O Google oferece um serviço com ótimas fonts (algumas bem leves) e que podem fazer uma grande diferença na leitura e visualização do seu conteúdo (às vezes uma boa fonte é tudo que você precisa).

Trabalhar com algum espaçamento nos textos é algo que pode fazer diferença também: margens nos headings, altura das linhas nos parágrafos, espaçamento entre as letras. Tudo isso pode fazer uma enorme diferença se bem aplicado e coeso, bem como entender as diferenças entre Serif, Sans-Serif, Monospace, etc. Estes são aspectos muito importantes e deveras negligenciados por uma enorme massa de desenvolvedores web (eu também ignorava isso).

Vale dar uma olhada em alguns materiais sobre o assunto pois isso pode mudar completamente a experiência em seu produto:

[Smashing Magazine Typography][smashing-typography]

[55 Typography samples][55-samples]

[Web Typography 101][101]

[Serif vs Sans-Serif][serif-sans]

[Google Web Fonts][google-web-fonts]

##Resumindo
Essa não é uma aula sobre web semântica, HTML, CSS, design, nem nada do tipo. É só um breve relato de como eu tenho enxergado as coisas e absorvido essa experiência. Um pouco do que eu tenho lido e estudado.

Acho que a grande dica é começar a acompanhar quem faz coisas boas nesse sentido, entender como elas são feitas, comparar com outras coisas que julgamos boas também. Aproveitar que na web é possível ficar vasculhando o css e html dos sites e usar isso como forma de compreender mais e mais sobre o tema.

É isso galera.

Abraços,

Vinicius Quaiato.

[semantic-web]:http://www.w3.org/2001/sw/
[semantic-markup]:http://blogs.msdn.com/b/jennifer/archive/2011/08/01/html5-part-1-semantic-markup-and-page-layout.aspx
[posh]:http://microformats.org/wiki/posh
[leandronet]:http://twitter.com/leandronet
[css-tricks]:http://css-tricks.com/
[smashing]:http://www.smashingmagazine.com/
[peepcode]:http://peepcode.com/blog
[css3info]:http://www.css3.info/
[w3c-css]:http://www.w3.org/Style/CSS/
[validator]:http://validator.w3.org/
[yahoo]:http://developer.yahoo.com/performance/rules.html
[smashing-typography]:www.smashingmagazine.com/tag/typography/
[55-samples]:http://webdesignledger.com/inspiration/55-examples-of-huge-typography-in-web-design
[101]:http://mashable.com/2011/11/03/web-typography-101/
[google-web-fonts]:http://www.google.com/webfonts#ChoosePlace:select
[serif-sans]:http://www.designzzz.com/typography-basics-serif-vs-sans-serif/
