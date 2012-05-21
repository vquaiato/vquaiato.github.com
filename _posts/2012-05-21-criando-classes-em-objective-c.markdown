---
layout: post
title: 'Criando classes e usando models em Objective-C e iOS'
description: 'Vamos começar a criar nossas próprias classes com Objective-C usando-as como models nas nossas aplicações iOS. Vamos começar a desenvolver uma aplicação para gastos de rua.'
keywords:
- Model
- Classes
- NSDecimalNumber
- NSMutableArray
- Collection operators
tags:
- title: iOS
  slug: iOS
  autoslug: iOS
---
Antes de irmos para o próximo passo dentro do desenvolvimento iOS vamos começar a trabalhar um pouco o objective-c.
*[(confira todos os posts sobre iOS)][tag-ios]*

Vamos criar uma classe para servir como model para nossa aplicação.

##Criando nossas classes em Objective-c
Criar uma classe em objective-c não é nada diferente do que já vimos aqui nos outros projetos. Vamos criar os nossos dois arquivos .h e .m assim como nos outros projetos.

Para efeito de estudos vamos criar uma aplicação para computar os gastos que fazemos na rua (o cafezinho, o almoço, o jornal, etc, etc).

Depois de criar um projeto(Single View Application mesmo), vamos adicionar um novo arquivo ao projeto, uma classe objective-c:
<img src="/images_posts/objc-class.jpg" class="post_img" />

Essa nossa classe vai ser algo parecido com:
{% highlight objc linenos %}
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Gastos : NSObject
{
    NSMutableArray* gastos;
}

-(void)addGastoFromString: (NSString*) valorGasto;
-(int)totalDeGastos;
-(NSDecimalNumber*) somaDosGastos;
@end
{% endhighlight %}

O que essa classe vai fazer? Ela possui um array que nada mais é que um array dos valores dos gastos. Repare que este é um [NSMutableArray][nsmutable], ou seja conseguiremos adicionar valores independente do tamanho do array.

Reparem que assim como em .NET tudo "herda" de Object aqui nossa classe herda de [NSObject][nsobj]. Por ser a classe base da maioria das classes em objective-c ela provê uma série de comportamentos aos objetos (muito além do ToString, GetType e GetHashCode no .NET). [Confira a documentação de NSObject aqui][nsobj]. É de NSObject por exemplo que vem o método [alloc que utilizamos na maioria das nossas classes][alloc].

Temos 3 métodos um que iremos implementar:
Na ***linha 9*** é um método que irá adicionar um gasto a partir de uma string. Na ***linha 10*** é apenas um método para obtermos quantos gastos foram realizados e na ***linha 11*** uma soma dos gastos realizados.

A implementação da nossa classe é bastante simples também:
{% highlight objc linenos %}
#import "Gastos.h"

@implementation Gastos

-(id)init{
    gastos = [[NSMutableArray alloc] init];

    return self;
}
-(void)addGastoFromString:(NSString *)valorGasto{
    NSDecimalNumber* valor = [[NSDecimalNumber alloc] initWithFloat: [valorGasto floatValue]];

    [gastos addObject:valor];
}
-(int)totalDeGastos{
    return gastos.count;
}
-(NSDecimalNumber*) somaDosGastos{
    NSDecimalNumber *sum = [gastos valueForKeyPath:@"@sum.floatValue"];

    return sum;
}
@end
{% endhighlight %}

Vamos lá: nas ***linhas 5 até 9*** temos o "construtor" da nossa classe. O que fazemos é alocar e iniciar nosso [NSMutableArray][nsmutable]. Retornamos o próprio objeto no "construtor".
Nas linhas 10 a 14 temos o método que recebe uma string (vinda da interface gráfica) e criamos um [NSDecimalNumber][nsdecimal], iniciando com o valor como float.

*(confesso que eu fiz algumas pesquisas e não encontrei uma forma muito canônica de manipular valores decimais e monetários, então estou usando assim a princípio)*

Nas ***linhas 18 até 22*** temos o método que faz a soma dos nossos gastos. Esse método é bastante curioso e interessante. Ele faz uso de um recurso chamado [Collection operators][collection]. Basicamente usa-se um operador: @sum, @avg, @max, @min, @count [e outros(veja todos)][operators].
O que fazemos então é somar o floatValue de cada um dos elementos e retornamos isso em um [NSDecimalNumber][nsdecimal].

##Criando nossa interface
A interface desta nossa app será bastante simples (iremos evoluí-la em posts futuros). Vamos criar algo parecido com isso:

<img src="/images_posts/interface-gastos-ios-app.png" class="post_img" />

Para que o botão fique parecido com isso selecione a propriedade *type* do nosso UIButton:

<img src="/images_posts/add-contact-button-ios.jpg" class="post_img" />

A implementação disso é bastante tranquila também, já que a lógica toda está na classe Gastos. Veja o .h do nosso ViewController como ficou:

{% highlight objc linenos %}
#import <UIKit/UIKit.h>
#import "Gastos.h"

@interface ViewController : UIViewController
{
    Gastos* gastos;
}

-(IBAction)addGasto:(id)sender;

@property (nonatomic,retain) IBOutlet UILabel* totalDosGastos;
@property (nonatomic,retain) IBOutlet UILabel* numeroDeGastos;
@property (nonatomic,retain) IBOutlet UITextField* valorDoGasto;
@end
{% endhighlight %}

Tranquilo né? Uma action que será disparada pelo botão e três outlets que serão ligados aos elementos da nossa ui: UITextfield e os dois UILabel.

E a implementação do nosso ViewController fica assim:
{% highlight objc linenos %}
#import "ViewController.h"
#import "Gastos.h"

@interface ViewController ()
@end

@implementation ViewController

@synthesize valorDoGasto;
@synthesize numeroDeGastos;
@synthesize totalDosGastos;

- (void)viewDidLoad{
    [super viewDidLoad];

    gastos = [[Gastos alloc]init];
}

-(void)addGasto:(id)sender{
    [gastos addGastoFromString: valorDoGasto.text];
    valorDoGasto.text = @"";

    numeroDeGastos.text = [NSString stringWithFormat:@"%i", [gastos totalDeGastos]];

    totalDosGastos.text = [[gastos somaDosGastos]stringValue];
}

//MÉTODOS GERADOS
- (void)viewDidUnload{
    [super viewDidUnload];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
@end
{% endhighlight %}

Nas ***linhas 9 até 11*** sintetizamos nossas propriedades, ou seja, os outlets que declaramos.
Na ***linha 16*** nós iniciamos nosso variável gastos. Fazemos isso da maneira padrão com alloc e init.
Nas ***linhas 19 até 26*** temos nosso addConta onde realizamos toda lógica do nosso controller: ***linha 20*** adicionamos o valor do campo de texto aos gastos, ***linha 21*** limpamos o nosso campo texto. obtemos o número de gastos que já adicionamos para exibir no label. ***Linha 23*** formatamos a string com o total de gastos. E na ***linha 25*** obtemos o somatório dos gastos e colocamos no label da interface.

Rodando nossa app teremos:

<img src="/images_posts/controle-gastos-rua-ios-app.png" class="post_img" />

<img src="/images_posts/controle-gastos-rua-ios-app-2.png" class="post_img" />

##Resumo
Estamos avançando a bons passos no conhecimento do iOS. Com essa nossa classe já podemos imaginar implementar algum tipo de persistência para estes dados(Core Data, alguma API de serviço externo, etc) e com isso tornar nossa aplicação mais usável.
Também abrimos uma brecha para a necessidade de começar a criar navegações, formatações e até internacionalização de nossas aplicações.

Começamos a ver coisas interessantes que é a manipulação de valores financeiros (e percebemos que temos muito mais para explorar nesse sentido).

A idéia é começar a avançar em nevegação nos próximos posts, mas pode ser que façamos uma pausa para internacionalizar, formatar e tratar erros e detalhes de interface :D

Não sei se alguém que lê isso aqui está de fato brincando com iOS, mas a cada momento fico mais confortável com a plataforma com o um todo (e olhem que não estou fazendo nada além do que um estagiário faria :P)

O código deste projeto já está no github também: [https://github.com/vquaiato/ios-blog-samples/tree/master/somatorioDeContas][repo]

Abração,
Vinicius Quaiato.

[tag-ios]:http://viniciusquaiato.com/tags/ios/
[nsobj]:https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/nsobject_Class/Reference/Reference.html
[alloc]:https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/nsobject_Class/Reference/Reference.html#//apple_ref/doc/uid/20000050-alloc
[nsmutable]:https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSMutableArray_Class/Reference/Reference.html
[nsdecimal]:https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSDecimalNumber_Class/Reference/Reference.html
[collection]:http://developer.apple.com/library/ios/#documentation/cocoa/conceptual/KeyValueCoding/Articles/CollectionOperators.html
[operators]:http://developer.apple.com/library/ios/documentation/cocoa/conceptual/KeyValueCoding/Articles/CollectionOperators.html#//apple_ref/doc/uid/20002176-SW6
[repo]:https://github.com/vquaiato/ios-blog-samples/tree/master/somatorioDeContas
