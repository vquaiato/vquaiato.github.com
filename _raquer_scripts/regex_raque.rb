#encoding: UTF-8
Dir.foreach("../_posts/") do |file|
  begin
    p "started #{file}"
    file_path = "../_posts/#{file}"
    content = File.read(file_path)

    #quebra de linha para headings
    replace = content.gsub /###/, "\n\n###"
    replace = content.gsub /##/, "\n\n##"

    #code format
    replace.gsub! /}/, "}\n"
    replace.gsub! /{[^\s?\.]/, "{\n"
    replace.gsub! /;(\s*)/, ";\n    "
    replace.gsub! /(\s\s+)(var|double|string|decimal|int|bool|void|List<.*>|IEnumerable<.*>)\s/, "\n\\2\s"
    replace.gsub! /^(public|private|protected|internal|static)\s/, "\n\\1\s"
    replace.gsub! /\s+(if|for|foreach|do|while)\s?({|\()/, "\n\\1\\2"
    replace.gsub! /\s+(return)(\s.*);/, "\n\\1\\2;"
    replace.gsub! /({\s*)(public|private|protected|internal|static)\s/, "\\1\n\\2\s"
    replace.gsub! /(\w*)(public|private|protected|internal|static)\s/, "\\1\n\\2\s"

    #image replace
    replace.gsub! /quaiato\.com\/blog\/wp-content\/\w+\/\d+\/\d+\//, "quaiato.com/images_posts/"

    #syntax highlight
    replace.gsub! /<\/pre>/, "\n{% endhighlight %}\n"
    replace.gsub! /<pre (.*)">/, "\n{% highlight csharp %}\n"

    #assinatura
    replace.gsub! /(\.|\?|\!|\\)(Abraços|Att),/, "\\1\n\n\\2,\n"

    File.open(file_path, "w") {|f| f.puts replace}
    p "ended #{file}"
  rescue
    p "shit #{file}"
  end
end
