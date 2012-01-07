Dir.foreach("../_posts_wordpress/") do |file|
	p "started #{file}"
	begin
		content  = File.read("../_posts_wordpress/#{file}")
		images_found = content.scan /http\S*\.[jpg|gif|png]+/i #/http\S*\.jpg|gif|png/i

		images_found.each do |img|
			new_file = File.open("imagens", "a+"){|f| f.puts img}
			system "curl #{img} -O"
			p "image saved: #{img}"
		end

		p "ended #{file}"
	rescue
		p "shit #{file}"
	end
end