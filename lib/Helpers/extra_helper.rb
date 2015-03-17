#encoding: utf-8

#if RUBY_VERSION =~ /1.9/ # assuming you're running Ruby ~1.9
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
#end
#module NavHelper
class ExtraHelper

	def self.get_external_links (links, search_text = "" )
		
		http = "http://"
		result = []
		
		links.each do |link|			
			result << [link["href"],search_text] if link["href"] 
		end
		result
	end

	

	def self.correct_title(title)
		return title.content if title
		return "NO Title"
	end

	def self.correct_text(text)

		return "No text" if !text

		st = ""
		text.children.search("p").each do |p|
			st = st + p.inner_text
		end
	 	#st = st.delete("\r")
		return st.strip#.delete("\n")
	end

end