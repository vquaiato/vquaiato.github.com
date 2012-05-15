---
layout: post
title: 'iOS desenvolvimento para iPhone: primeiros passos'
tags:
- title: iOS
  slug: iOS
  autoslug: iOS
---
Parte da minha [motivação em mudar meu mundo para OSX][nao-troquei] é a possibilidade de desenvolver para iOS (iPhone e também iPad). Apenas uma motivação curiosa: conhecer uma nova plataforma, nova linguagem, novo framework, etc, etc…

Há um ano eu comecei a brincar e estudar mas parei. E há uma semana retomei os estudos. Como eu acredito que escrevendo/compartilhando eu consigo absorver melhor as idéias cá estou.

##Um mundo totalmente novo
###Objective-C
Não dá para dizer que [objective-c][objc] é algo lindo, mas hoje eu também não o acho feio. Acabamos nos acostumando e entendendo as coisas. Nem vou comparar objective-c com C#, ou Ruby, nem nada: é apenas mais uma linguagem e pronto.

Assim como toda linguagem nova que vamos aprender demoramos um pouco para entender alguns conceitos, práticas, sintaxe, etc. Mas [objective-c][objc] não é nada de outro mundo.

{% highlight objc %}
//instanciando um objeto
NSString *hello = [NSString stringWithString:@"iOS World!"];
{% endhighlight %}
(o código acima não é importante, é apenas para vocês verem o conceito de *mensagens*  presente no objective-c)

Para mim agora é necessário estudar mais essa linguagem. Eu poderia simplesmente desenvolver usando [Monotouch][monotouch]? Sim poderia, mas eu tenho vontade de aprender coisas novas. Me sentirei muito mais seguro para usar Monotouch quando eu dominar [objective-c][objc] e [Cocoa Touch][cocoa].

###Cocoa Touch
[Cocoa Touch][cocoa] é o framework sobre o qual criamos nossas aplicações iOS. Ele é a aplicação de vários padrões utilizados no desenvolvimento para Mac com este "apelativo" de interfaces touch.

Desenvolvido utilizando Objective-C é possível trabalhar nele também com C ou até mesmo C++ (tudo depende do seu grau de loucura).

É nele que estão contidas as principais bibliotecas e frameworks que utilizaremos ao criar aplicações iOS:

+ [Core Data][core-data]
+ [Core Animation][core-animation]
+ [Core Audio/Video][core-video]

(não vamos aprofundar nisso agora, é muito material. Conforme eu for fazendo algo que toque nesses pontos tentarei compartilhar minhas impressões sobre eles)

###XCode
[XCode][xcode] é a IDE da Apple para o desenvolvimento para iOS e OSX. No XCode temos os SDKs necessário tanto para iOS quando para OSX.
Tem simulador para iPad e iPhone e confesso que é uma IDE tão completa quanto as outras que existem por aí. No começo a gente estranha muita coisa, mas com o tempo vai se acostumando.

Para ser sincero é bem agradável ver os erros conforme vamos escrevendo o código, é uma IDE até que de bom gosto :P

Para instalar o [XCode][xcode] basta entrar na App Store no seu mac:

<img src="images_posts/xcode-appstore.png" class="post_img" />

##Começando a estudar

A Apple disponibiliza uma série de materiais e documentação acerca destes tópicos, e podemos conferir tudo aqui: [https://developer.apple.com/devcenter/ios/index.action][apple-docs].

Lá podemos encontrar artigos, códigos de exemplo, vídeos, guias, etc. Vale a pena dar uma conferida lá antes de iniciar suas aventuras.

Confira alguns links:

+ [Tools and Languages Documentation(iOS)][lang-docs]
+ [XCode basics][xcode-basics]
+ [Xcode 4 user guide][xcode-user-guide]
+ [iOS app programming guide][ios-guide]
+ [Tools workflow guide for iOS][workflow]

##Resumindo
Bom estou começando a brincadeira e cá estarei compartilhando com vocês. Amanhã já começo a colocar os básicos para criar uma app.

Uma série de amigos oriundos do mundo Microsoft/.NET está usando Mac agora (ao menos como uma segunda plataforma) então acho que vai ser bem útil para muita gente.

Bora trocar figurinhas então.

Abraços,

Vinicius Quaiato.

[nao-troquei]:http://viniciusquaiato.com/blog/por-que-nao-troquei-o-net-pelo-ruby/
[objc]:http://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/ObjectiveC/Introduction/introObjectiveC.html
[monotouch]:http://xamarin.com/monotouch
[cocoa]:https://developer.apple.com/technologies/ios/cocoa-touch.html
[xcode]:https://developer.apple.com/xcode/
[core-animation]:https://developer.apple.com/technologies/ios/graphics-and-animation.html
[core-data]:https://developer.apple.com/technologies/ios/data-management.html
[core-video]:https://developer.apple.com/technologies/ios/audio-and-video.html
[apple-docs]:https://developer.apple.com/devcenter/ios/index.action
[lang-docs]:https://developer.apple.com/library/ios/navigation/index.html#section=Topics&topic=Tools%20%26amp%3B%20Languages
[xcode-basics]:https://developer.apple.com/library/mac/#recipes/xcode_help-general/
[xcode-user-guide]:https://developer.apple.com/library/ios/#documentation/ToolsLanguages/Conceptual/Xcode4UserGuide/Introduction/Introduction.html
[ios-guide]:https://developer.apple.com/library/ios/#documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/Introduction/Introduction.html
[workflow]:https://developer.apple.com/library/ios/#documentation/Xcode/Conceptual/ios_development_workflow/00-About_the_iOS_Application_Development_Workflow/introduction.html
