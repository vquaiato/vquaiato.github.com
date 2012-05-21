---
layout: post
title: 'Primeiro projeto iOS: Single View Application'
description: 'Veja como criar sua primeira aplicação iOS para iPhone e comece a entender os principais conceitos no desenvolvimento para a pltaforma da Apple'
keywords:
- iPhone
- Single View Application
- AppDelegate
- ViewController
- UIViewController
tags:
- title: iOS
  slug: iOS
  autoslug: iOS
---
Vamos começar e criar nossa primeira aplicação, como sempre um ***Hello World***. O bom é que conseguiremos ver diversas coisas novas com este *simples* exemplo e com isso vamos começar a nos acostumar/aprofundar no iOS.
*[(confira todos os posts sobre iOS)][tag-ios]*

##Criando o projeto
Assumo que você já instalou o XCode (no momento estou usando o 4.3.2). Abra o mesmo e crie um novo projeto. Para iniciarmos vamos começar um um dos templates que o XCode já fornece, neste caso o *Single View Application* para iOS.

<img src="/images_posts/criar-projeto-xcode.png" class="post_img"/>

<img src="/images_posts/criando-single-view-application.png" class="post_img"/>

<img src="/images_posts/dando-nome-ao-projeto.png" class="post_img"/>

Após termos o projeto criado vamos nos deparar com uma tela como esta:

<img src="/images_posts/projeto-criado.png" class="post_img"/>

Não se desespere. Nesta tela temos algumas informações sobre o projeto como por exemplo: *Supported Device Orientations* e outras. Futuramente investigaremos isso melhor.

Do lado esquerdo temos os arquivos que fazem parte do nosso projeto e aqui já podemos perceber uma coisa: *para toda classe teremos 2 arquivos: um .h e um .m*

+ .h são Header Files. Eles contém classes, tipos, funções e constantes.
+ .m são Source Files. Nestes arquivos temos a maioria do nosso código objective-c ou mesmo c.

Esse é um conceito bastante simples: a interface de uma classe é separada de sua implementação. A interface da classe (no arquivo .h) contém as variáveis e métodos que essa classe possui. A implementação da classe, o corpo dos métodos, etc, está contido nos arquivos .m

Vejamos um simples exemplo de declaração de uma classe em um arquivo .h que a Apple disponibiliza [aqui][apple-hfile]:

<img src="/images_posts/class-declaration.jpg" class="post_img"/>

##AppDelegate
Voltando para o nosso projeto vamos primeiro ver os arquivos *AppDelegate.h* e *AppDelegate.m*

Este AppDelegate servirá para a função *main* da nossa aplicação. Um objeto deste tipo será utilizado para controlar algumas coisas do ciclo de vida da nossa aplicação.

Este delegare é informado sobre eventos de inicialização, término (e outros) dentro da nossa aplicação. [Confira a referência completa de UIApplicationDelegate][app-delegate-ref]

O ponto principal aqui é o método abaixo (dentro de AppDelegate.m):

{% highlight objc linenos %}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Override point for customization after application launch.
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];

    return YES;
}
{% endhighlight %}
Este método na ***linha 3*** está criando uma *window* para nossa aplicação. Na ***linha 6*** está criando um ViewController (que está na nossa lista de arquivos) e informando que a view deste ViewController é uma view com o mesmo nome.
Na ***linha 7*** é informado que o rootViewController é o ViewController que acabou de ser criado. E na ***linha 8*** tudo é exibido :D
Este código todo foi gerado pelo template do XCode e com o tempo vamos compreender melhor cada um dos pontos aí.

##UIViewController
UIViewController é o tipo base que a classe ViewController (.h e .m) implementa. UIViewController fornece um mecanismo base para a manipulação de views no iOS.
Uma classe que herda de UIViewController manipulará uma ou mais views e estas views irão compor a interface da sua aplicação iOS. Desta forma essas classes ViewController manipulam views, models e se comunicam também com outros view controllers.
([Veja a referência completa para UIViewController][uiview-controller-ref])

Na nossa aplicação temos um view controller chamado ViewController (nos arquivos ViewController.h e ViewController.m).

##Arquivos nib(.xib)
O arquivo ViewController.xib é a nossa view. Ela poderia ter qualquer outro nome, como por exemplo "TelaInicial".
Estes arquivos é que contém nossa interface gráfica. Se você clicar sobre ele, verá algo parecido com isso:

<img src="/images_posts/editando-views-no-xcode.png" class="post_img"/>

Se observarmos lá do lado direito, na parte inferior temos uma lista com os controles que podemos colocar na nossa view. Vamos então começar a brincar e fazer nosso hello world. Vamos adicionar um label e um botão, como abaixo:

<img src="/images_posts/adicionando-componentes-na-view.jpg" class="post_img"/>

[Mais sobre Nib/.xib files veja aqui][nib-ref]

##Executando a aplicação
Já podemos executar nossa aplicação, clique no botão ***Play/Run*** ou ⌘+R. O simulador do iOS iniciará e veremos nossa primeira app rodando:

<img src="/images_posts/hello-world-ios.png" class="post_img"/>

Se você reparou clicar no botão não faz nada, então vamos exibir um alerta quando o botão for tocado (lembre que não são cliques e sim toques).

##Exibindo um alert no toque do botão
Para isso vamos adicionar um método no nosso ViewController.h que ficará como abaixo:
{% highlight objc linenos %}
#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

-(IBAction)showMessage:(id)sender;
@end
{% endhighlight %}

Adicionamos a ***linha 5*** (não se preocupe com tudo neste momento, falaremos sobre Actions e Outlets futuramente). Apenas precisamos entender que nossa view controller agora possui um método. Vamos então implementar este método no ViewController.m:

{% highlight objc linenos %}
-(IBAction)showMessage:(id)sender{
    UIAlertView *alert = [[UIAlertView alloc]
								initWithTitle: @"Hi iOS folks!"
								message: @"oh... Hello World!"
								delegate:nil
								cancelButtonTitle: @"Bye!"
								otherButtonTitles:nil];

    [alert show];
}
{% endhighlight %}

Bem tranquilo esse código né? Criamos um objeto do tipo [UIAlertView][ui-alert-ref], iniciamos o objeto com seus valores e depois enviamos a mensagem *show* para ele.

Agora precisamos vincular esse método com o botão. Isso é um pouco estranho a princípio, mas começaremos fazendo desta forma: clique no botão, segure a tecla control e arraste até o File's Owner como mostra a imagem abaixo:

<img src="/images_posts/vinculando-botao-com-action.png" class="post_img"/>

Feito isso uma lista com as actions disponíveis aparecerá, clique na nossa action *showMessage*.

<img src="/images_posts/selecionando-action-para-botao.png" class="post_img"/>

Pronto! Rode a aplicação novamente e teremos nosso botão exibindo um alerta:

<img src="/images_posts/hello-world-ios-usando-alert.png" class="post_img"/>

Bacana hein?

##Resumo
Há um monte de coisas novas que precisamos estudar mais e nos aprofundar, mas sem dúvida fizemos algo bacana (ainda que simples) com praticamente nenhum esforço.

Tudo que precisamos nesse momento é manter a calma e entender cada um dos passos que estamos dando. Alguns conceitos eu deixei para explicar depois pois acredito que se eu despejar mais um monte de informações aqui mais vou atrapalhar do que ajudar.

Tente criar uma outra applicação, simples como essa, mas do zero, sem seguir o blog. Veja o quão longe você consegue ir e vá se acostumando :)

O código completo deste exemplo você encontra aqui: [https://github.com/vquaiato/ios-blog-samples/tree/master/HelloWorld][hello-world-repo]

Abraços e até o próximo.

Vinicius Quaiato.

[tag-ios]:http://viniciusquaiato.com/tags/ios/
[app-delegate-ref]:https://developer.apple.com/library/ios/#documentation/UIKit/Reference/UIApplicationDelegate_Protocol/Reference/Reference.html
[uiview-controller-ref]:http://developer.apple.com/library/ios/#DOCUMENTATION/UIKit/Reference/UIViewController_Class/Reference/Reference.html
[ui-alert-ref]:http://developer.apple.com/library/ios/#documentation/uikit/reference/UIAlertView_Class/UIAlertView/UIAlertView.html
[nib-ref]:https://developer.apple.com/library/mac/#documentation/Cocoa/Conceptual/LoadingResources/CocoaNibs/CocoaNibs.html
[apple-hfile]:https://developer.apple.com/library/mac/#referencelibrary/GettingStarted/Learning_Objective-C_A_Primer/_index.html
[hello-world-repo]:https://github.com/vquaiato/ios-blog-samples/tree/master/HelloWorld
