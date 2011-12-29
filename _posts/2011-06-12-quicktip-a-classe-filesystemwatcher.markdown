--- 
layout: post
title: "QuickTip: a classe FileSystemWatcher"
wordpress_id: 3685
wordpress_url: http://viniciusquaiato.com/blog/?p=3685
categories: 
- title: .NET
  slug: dotnet
  autoslug: .net
- title: Mono
  slug: mono
  autoslug: mono
tags: 
- title: quick tip
  slug: quick-tip
  autoslug: quick-tip
- title: FileSystemWatcher
  slug: filesystemwatcher
  autoslug: filesystemwatcher
- title: monitorar arquivos
  slug: monitorar-arquivos
  autoslug: monitorar-arquivos
- title: "monitorar diret\xC3\xB3rios"
  slug: monitorar-diretorios
  autoslug: "monitorar-diret\xC3\xB3rios"
---
Fala galera, estava eu um dia destes sem nada para fazer e comecei a brincar com a classe [FileSystemWatcher](http://msdn.microsoft.com/en-US/library/system.io.filesystemwatcher.aspx).Basicamente o que esta classe faz é ficar escutando por alterações em uma pasta ou arquivos em uma pasta.Com a classe FileSystemWatcher é possível monitorar mudanças de nome em arquivos e pastas, adição ou criação de arquivos, deleções, etc.A classe possui eventos que podem ser assinados e então serão disparados de acordo com as alterações/ações que ocorrerem ao diretório monitorado, vejamos abaixo:<pre lang="csharp" line="1">using System.IO;public static void Main (string[] args){var watcher = new FileSystemWatcher();watcher.Path = "/Users/vquaiato/Desktop/moniorar/";watcher.Created += Changed;watcher.Changed += Changed;watcher.Deleted += Changed;watcher.Renamed += Renamed;watcher.EnableRaisingEvents = true;Console.ReadKey();}</pre>O que fazemos acima é criar um objeto do tipo FileSystemWatcher na **_linha 5_** e setamos um path para ele monitorar na **_linha 6_**. Este é o path do diretório que iremos fazer o monitoramento.Após, assinamos alguns eventos que irão notificar sobre as mudanças e alterações que ocorrerem.Os eventos [Created](http://msdn.microsoft.com/en-US/library/system.io.filesystemwatcher.created.aspx), [Changed](http://msdn.microsoft.com/en-US/library/system.io.filesystemwatcher.changed.aspx) e [Deleted](http://msdn.microsoft.com/en-US/library/system.io.filesystemwatcher.deleted.aspx) possuem a mesma assinatura que apenas difere do evento [Renamed](http://msdn.microsoft.com/en-US/library/system.io.filesystemwatcher.renamed.aspx).Por fim, na **_linha 13_** habilitamos para que o objeto monitore aos eventos, sem marcar esta propriedade para true o monitoramento não será feito.Abaixo estão os métodos para os eventos:<pre lang="csharp">static void Renamed (object sender, RenamedEventArgs e){Console.WriteLine("\nArquivo renomeado: {0} para {1}\n\n",e.OldName,e.Name);}static void Changed(object sender, FileSystemEventArgs e) {Console.WriteLine("\nTipo: {0} \nArquivo: {1}, Nome: {2}",e.ChangeType, e.FullPath, e.Name);}</pre>Agora vamos brincar um pouco criando, alterando e deletando um arquivo no nosso diretório enquanto a aplicação estiver executando:[caption id="attachment_3686" align="aligncenter" width="300" caption="FileSystemWatcher em ação"][![FileSystemWatcher em ação](http://viniciusquaiato.com/blog/wp-content/uploads/2011/06/Screen-shot-2011-06-12-at-10.05.42-PM-300x195.png "FileSystemWatcher em ação")](http://viniciusquaiato.com/blog/wp-content/uploads/2011/06/Screen-shot-2011-06-12-at-10.05.42-PM.png)[/caption](reparem que estou rodando no Mono :D)[Apenas a ação de Raname que não funcionou como o esperado. Na verdade um evento de deleção e um de criação foram disparados. Talvez isso seja particularidade do unix. Alguém sabe se no Windows o comportamento é o mesmo?]É isso galera, espero que seja útil.Abraços,Vinicius Quaiato.
