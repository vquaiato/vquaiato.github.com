---
layout: post
title: 'Formatação de valores em Reais(R$) no iOS'
description: 'Vamos formatar nossos valores financeiros em Reais(R$) utilizando NSNumberFormatter e NSLocale no iOS'
keywords:
- NSLocale
- locales
- reais
- NSNumberFormatter
tags:
- title: iOS
  slug: iOS
  autoslug: iOS
---
Já que começamos a criar uma app que lida com valores monetários precisamos garantir que a nossa aplicação exiba corretamente os dados.
*[(confira todos os posts sobre iOS)][tag-ios]*

##Formatando valores em Reais R$
Vamos formatar nosso valor de acordo com uma cultura específica, no nosso caso pt-BR, para deixarmos nosso valores monetário em Reais. Modificando um pouco nosso método addGasto ([do projeto anterior][anterior]) teremos isso:

{% highlight objc linenos %}
-(void)addGasto:(id)sender{
    [gastos addGastoFromString: valorDoGasto.text];
    valorDoGasto.text = @"";

    numeroDeGastos.text = [NSString stringWithFormat:@"%i", [gastos totalDeGastos]];

    id somatorioGastos = [gastos somaDosGastos];

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"pt_BR"];
    [formatter setLocale: locale];

    totalDosGastos.text = [formatter stringFromNumber:somatorioGastos];
}
{% endhighlight %}
A novidade aí está na ***linha 9*** onde criamos um objeto [NSNumberFormatter][formatter]. Esta classe fornece uma séria de configurações para formatarmos números: separadores decimais, separadores de milhar, porcentagem, códigos monetários, formatos, etc.

Na ***linha 10*** configuramos este formatador como um formatador monetário.
Nas ***linhas 11 e 12*** é que está nosso segredo: criamos um objeto [NSLocale][locale] utilizando um locale identifier, no nosso caso pt-BR. Depois de criado nosso objeto nós configuramos o locale no nosso formatter.

Feito isso na ***linha 14*** apenas obtemos o número formatado passando a mensagem *stringFromNumber* para nosso formatador e colocamos o mesmo em nosso label, como vemos abaixo:

<img src="/images_posts/exibindo-valor-formatado-em-reais-ios.png" class="post_img" />

##Resumo
A formatação de valores é algo que sempre consome um pouco, mas não é nenhum bicho de set cabeças nesse caso. Se encapsularmos isso em um método que recebe um valor e retorna uma string formatada fica tudo bastante simples (no código completo do github isso está em um método separado).

Como internacionalização é um assunto mais abrangente preferi deixar para o futuro :P

Como sempre o código do projeto está no github: [https://github.com/vquaiato/ios-blog-samples/tree/master/somatorioDeContasLocale][codigo]

[tag-ios]:http://viniciusquaiato.com/tags/ios/
[anterior]:http://viniciusquaiato.com/blog/criando-classes-em-objective-c
[formatter]:https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSNumberFormatter_Class/Reference/Reference.html
[locale]:https://developer.apple.com/library/mac/#documentation/Cocoa/Reference/Foundation/Classes/NSLocale_Class/Reference/Reference.html
[codigo]:https://github.com/vquaiato/ios-blog-samples/tree/master/somatorioDeContasLocale
