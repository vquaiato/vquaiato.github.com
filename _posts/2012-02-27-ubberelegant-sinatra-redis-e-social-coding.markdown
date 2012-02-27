--- 
layout: post
title: 'UbberElegant: Sinatra, Redis e Social Coding'
tags: 
- title: Ruby
  slug: ruby
  autoslug: ruby
---
Uma das coisas mais bacanas de trabalhar com software é que é possível compartilhar seu trabalho de forma muito simples com outros colegas de profissão.

Não sei se advogados, médicos, dentistas, construtores, etc, conseguem compartilhar seu trabalho da forma como fazemos. Nós não simplesmente comentamos sobre o que estamos fazendo: nós mostramos e temos ferramentas/meios para permitir que outros participem.

Eu entendo que essa facilidade de compartilhar código e ver código alheio é uma forma muito eficiente para o crescimento profissional. Afinal se você está isolado, não mostra o que faz e não vê o que os outros fazem, como é possível evoluir? Como é possível aprender? Fica difícil...

##Github
Desde minha entrada no mundo Ruby passei a utilizar mais o Github. Passei a utilizá-lo não apenas como um repositório de código para os meus posts e palestras, mas como ma ferramenta de ***social coding***: passei a ver e navegar por mais projetos, passei a colaborar (ainda que de forma bem discreta) com outros projetos, passei a publicar mais coisas sem medo de ser julgado e/ou criticado. 

E é somente deixando esse medo de lado que podemos evoluir. Não estou dizendo que todos precisem usar o Github, mas seria muito saudável que o fizessem.

***DISCLAIMER***: utilizar o Github não tem nada a ver com estar no mundo Microsoft. Não tem nada a ver com ser um fã do TFS ([http://bit.ly/9MLYg8][rly]), etc. 

##Rivalidade em código
Durante o carnaval o amigo [@leandronet][leandro] resolveu começar um pequeno projeto *de tiração de sarro* que ele chamou de ***[Elegant Code Maker][elegant-code-maker]***. Como ele é um arquiteto e está longe do código fonte acabou que eu ajudei a ele com este projeto utilizando ASP.NET MVC, Jquery, git, Github e App Harbor. ([post de <del>mimimi</del> motivação dele sobre o Elegant Code Maker][mimimi-leandro])

Após 1 dia no ar o *invejoso* [@juanplopes][juan] criou uma nova versão da mesma aplicação. Porém o que o Juan fez foi desenvolver uma aplicação semelhante usando apenas HTML + Javascript, sem nenhum código server side. E é aí que a brincadeira começa a ficar interessante: um projeto simples, de curtição, movimentando amigos em torno de código e colaboração.

Neste momento pensei em criar algo também. Pensei em criar uma aplicação rival das duas(não melhor, mas apenas alternativa) e me arrisquei utilizando Ruby. Como eu não estava afim de usar Rails resolvi desenvolver utilizando Sinatra[sinatra].

##UbberElegant
Já que a aplicação do Juan se chama [Elegant][elegant] resolvi chamar a minha de [UbberElegant][ubber].
O processo de construção da mesma foi bem trivial. Na verdade a aplicação não possui muitas linhas de código.
Para deixar a brincadeira um pouco mais interessante resolvi adicionar um esquema de *permalinks*. 

<img src="/images_posts/ubber_elegant_min.jpg" class="post_img" alt="ubber elegant"/>

Para fazer isso decidi usar o [Redis][redis] como storage para os meus permalinks (sim eu poderia não ter usado nada e simplesmente pego o id do gist e ir novamente ao github, mas eu entendi que se fizesse isso estaria deixando de conhecer algo novo).

Redis é um storage do tipo key-value e foi muito simples integrá-lo. Poderia ser um MySQL, Postgres, MongoDB? Sim, poderia, mas novamente deixaria de aprender algo.

##Resumo da ópera
Resumindo tudo - (**spoiler**) e aproveitando o que dissemos no VoidPodcast sobre esse assunto - se você é programador e não faz uso de social coding e ao invés disso está apenas usando facebook, orkut, etc: ***reveja suas crenças e sua profissão***.

Todo o código dessas 3 apps está no Github:

UbberElegant: [http://github.com/vquaiato/ubberelegant][ubber-repo]

Elegant: [http://github.com/juanplopes/elegant][elegant-repo]

Elegant Code Maker: [http://github.com/ldaniel/ElegantCodeMaker][maker-repo]


[rly]:http://bit.ly/9MLYg8
[ubber]:http://ubberelegant.heroku.com
[elegant]:http://juanlopes.net/elegant/
[leandro]:http://twitter.com/leandronet
[mimimi-leandro]:http://reverb.leandrodaniel.com/post/Como-assim-codigo-elegante.aspx
[juan]:http://twitter.com/juanplopes
[redis]:http://redis.io
[elegant-code-maker]:http://elegantcodemaker.apphb.com
[imagem]:/images_posts/ubber_elegant_min.jpg
[ubber-repo]:http://github.com/vquaiato/ubberelegant
[elegant-repo]:http://github.com/juanplopes/elegant
[maker-repo]:http://github.com/ldaniel/ElegantCodeMaker
[sinatra]:http://www.sinatrarb.com/
