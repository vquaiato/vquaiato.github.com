--- 
layout: post
title: "Like a Raquer: Blogando com Jekyll e Github Pages"
categories: 
- title: Blog
  slug: blog
tags:
- title: Jekyll
  slug: jekyll
  autoslug: jekyll
---

Fala galera! Ano novo, vida velha e **blog novo!**

##Saí do Wordpress
Desde que comecei com o meu blog eu estive usando o Wordpress em um servidor meu. 
O Wordpress é uma ferramenta incrível: fácil de usar, zillions of buzzions of plugins, temas pra dar e (literalmente) vender, etc, etc, isso que todo mundo já sabe. 

Não vou dizer que a ferramenta é ruim pois ela não é. Simplesmente já não servia bem ao meu estilo de trabalho :P

##Como eu gosto de trabalhar
Um dos motivos pelos quais há algum tempo eu vinha pensando em largar o Wordpress é que eu gosto de escrever: formatar, colocar código fonte, quotes, listas, etc, e eu sempre fiz(e preferi) isso na mão, ou seja, como HTML mesmo. 
Eu gosto bastante de estar no editor de textos mas o editor do Wordpress é meio complicado: se eu usasse o editor visual o HTML ficava horrível, se eu usasse o editor HTML… bem… eu tinha que escrever em HTML (que é quase tão sacal quanto XML né…)
Eu nunca gostei de ferramentas de publicação exatamente pelo mesmo motivo.

##Estendendo, adptando, modificando
Quem conhece o Wordpress e já precisou customizar algo sabe que isto não é o melhor dos mundos. Ainda que as coisas estejam documentadas isso se torna meio complexo, afinal é um sistema grande e para ter certeza sobre o que se está fazendo leva tempo: não é divertido e nem fácil.
Existem muitos plugins sim, mas quando você começa a usar vários deles eles começam a conflitar e é um Deus nos acuda. Mas ainda assim a ferramenta é muito boa para quem precisa disso.

##Jekyll
Pensando nisso tudo foi que aceitei a sugestão do [Juan Lopes][juanlopes] e [Rafael Felix][rafaelfelix] que recomendaram o [Jekyll][jekyll]. A grosso modo o Jekyll é um gerador de site estático. Isso mesmo: um gerador de site estático.

Pequeno e facilmente customizável ele gera arquivos HTML a partir de arquivos markdown e/ou textile. 
Com isso eu consigo agora escrever todos os meus posts utilizando [markdown][markdown] que é algo bem mais simples e amigável do que HTML (e sim ele gera HTML válido!)

O Jekyll é escrito em Ruby e trabalha com um sistema de layouts para os arquivos. É possível customizar cada um dos posts para usar um layout diferente. A coisa toda fica muito simples de usar, configurar e estender.

##Github
O [Github][github] como todos sabem é algo muito bacana. Já está muito além de um simples repositório de código: é uma plataforma social para developers e projetos.
O Github possui um serviço chamado [Github Pages][githubpages] que nos permite publicar conteúdo na web a partir de um repositório de código.
E quem já conhece o [Github sabe que ele se dá muito bem com markdown][github_flavored_markdown] e além de se dar bem com markdown o Github Pages consegue subir um site usando Jekyll.

Somando tudo isso então quer dizer que eu posso escrever meu blog praticamente em texto puro, utilizando um repositório Git (isto é meu blog está versionado de forma simples, eficiente e aberto), publicando com um simples _git push_.

No próximo post eu darei os detalhes técnicos de como é criar, subir e customizar a app Jekyll no Github, como migrar os posts do Wordpress, os problemas que encontrei, regex que utilizei para limpar os posts vindos do Wordpress, dicas e algo mais.

##Resumindo
Estou contente por poder escolher novas tecnologias, olhar para coisas que não são consideradas _mainstream_, poder experimentar tecnologias novas sem medo de que não são as mais usadas, ou as melhores, etc.
Minha escolha foi por algo que me desafiasse, que me desse conforto na forma como estou trabalhando. 
Quero que fique bem claro que não quero convencer ninguém a largar o Wordpress. Estou apenas apresentando uma alternativa (dentre muitas) e que tem me satisfeito :)

Todo o código deste blog, posts, layout, imagens estão no github e podem ser forkados, fuçados, comentados, etc, neste repositório: [http://github.com/vquaiato/vquaiato.github.com][repositorio] 

Abraços,

Vinicius Quaiato.

[juanlopes]:http://github.com/juanplopes
[rafaelfelix]:http://twitter.com/rs_felix
[jekyll]:https://github.com/mojombo/jekyll
[markdown]:http://pt.wikipedia.org/wiki/Markdown
[github]:http://github.com
[github_flavored_markdown]:http://github.github.com/github-flavored-markdown/
[githubpages]:http://pages.github.com/
[repositorio]:http://github.com/vquaiato/vquaiato.github.com
