--- 
layout: post
title: "Como funciona o Jekyll"
categories: 
- title: Jekyll
  slug: jekyll
tags:
- title: Jekyll
  slug: jekyll
  autoslug: jekyll
---
Fala galera, jóia? 

Estou devendo um pouco de explicação sobre o funcionamento do [Jekyll][jekyll] (que é o novo blog engine que estou utilizando). Então de uma maneira bem simples vamos lá.

##O que é o Jekyll
Jekyll nada mais é do que um transformador de textos para blogs. Simples assim. Ele é capaz de transformar texto em um incrível post de blog. 

##Como o Jekyll funciona
O Jekyll trabalha com textos em formato [Markdown][markdown] ou [Textile][textile]. Além disso usa [Liquid][liquid] para quando é necessário algum tipo de código para templating.

Escrever com Markdown nos dá a possibilidade de escrever posts quase que puramente em formato texto. Uma vez que nossos layouts estão prontos o Jekyll se encarrega de transformar o texto em HTML com o devido layout.

O Jekyll trabalha com um mecanismo muito simples: Você informa qual o layout o post utilizará e ponto ele transforma seu texto em um HTML com o layout especificado. Isso é tão bacana que é possível ter diferentes layouts por posts. Com o mínimo de esforço. É realmente muito bom.

Um layout nada mais é do que um arquivo HTML que fica na pasta *_layouts* do Jekyll.

Todos os posts ficam na pasta *_posts* e então quando o Jekyll começa a executar ele transforma tudo da pasta *_posts* e joga para uma pasta chamada *_site*.

Como ele faz isso? Bem simples:
	jekyll --server --auto

Com isso o Jekyll começa a executar e então faz a geração de qualquer arquivo novo/alterado automaticamente.

*Veja a estrutura do Jekyll [aqui no fonte do meu blog][blog]*

##Jekyll é só para rubistas?
Eu diria que Jekyll é muito menos sobre Ruby e muito mais sobre o prazer de ter um blog simples, leve e com foco no conteúdo. 

É mais sobre gostar de escrever e fazer isso de uma forma simples e prática do que sobre uma linguagem ou plataforma.

Existem alguns ports do Jekyll para outras linguagens/plataformas: [Hakyll em Haskell][hakyll], [Hekyll em Notch/Node.js][hekyll], etc. É mais para quem curte escrever textos de maneira simples e direta mesmo. Mas o mais incrível disso tudo é que é simples trabalhar com ele. Você não sente em nenhum momento o **peso** de estar usando o Jekyll.

Não ter/precisar de uma interface de adminsitração é incrível. Eu controlo tudo via repositório Git e isso é sensacional. É exatamente o que precisamos quando estamos escrevendo textos/códigos/documentos. E esse é o mais incrível modo de fazer versionamento. Sem a complicação de versionar tudo em um banco de dados *blergh*.

##Resumindo
O Jekyll é uma forma simples de transformar texto em blog. O blog será tão simples quanto sua criatividade e vontade. Hoje eu não preciso mais lidar com chatos uploads de imagens: eu trabalho tudo na pasta *imagens_posts* e pronto um simples *git add . && git commit -m* resolvem tudo pra mim.

É claro que há quem prefira criar e manter um blog de outras formas, e isso é absolutamente normal. Mas é muito bom saber se novas formas. Mas eu fico feliz em dizer que agora não preciso mais me preocupar com atualizações do engine constantes, atualizações de plugins, configurações de bancos de dados, servidor, etc. Apenas escrevo :D


Abraços,

Vinicius Quaiato.

[hakyll]:https://github.com/jaspervdj/hakyll
[hekyll]:https://github.com/christiansmith/hekyll
[liquid]:http://liquidmarkup.org/
[blog]:https://github.com/vquaiato/vquaiato.github.com
[markdown]:http://pt.wikipedia.org/wiki/Markdown
[textile]:http://en.wikipedia.org/wiki/Textile_(markup_language)
[jekyll]:https://github.com/mojombo/jekyll/wiki