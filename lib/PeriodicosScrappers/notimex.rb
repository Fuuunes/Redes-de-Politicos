

class Notimex
	require 'mechanize'
	require 'nokogiri'
	require 'notice'
	require 'nav_helper'
	require 'extra_helper'

	JOURNAL_URL = #DEFINE EL URL por ejemplo "http://www.eluniversal.com.mx/noticias.html"

	def self.get_data_from_links(external_links)

		#mechanize_agent2 = Mechanize.new()
		arr = []

		external_links.each do |link_search_text|
			link        = link_search_text[0]
			search_text = link_search_text[1]

			begin

				page,mech_agent = NavHelper.get_page_and_agent_from(link)


				#*************************************************************************************************
				#DEFINE EL TEXTO  (Nokogiri Node) ejemplo "texto  = page.search("//div[@class='noteText']").first"
				#DEFINE EL TITULO  (Nokogiri Node) "titulo = page.search("//h1[@id='titleNote']").first"
				#*************************************************************************************************
				

				notice = Notice.new(link,ExtraHelper.correct_title(titulo),ExtraHelper.correct_text(texto),search_text)
				
				arr << notice.to_hash
			rescue
				puts "ERRoR"
				puts $!, $@
			end

		end

		return arr.to_json

	end
	
	


	def self.suggestions_for(cand_nicknames,key_words,ally_nick_names) 

		#*************************************************************************************************
		#COMENTA ESTA PARTE
		return  Notice.new("google.com","Titulo Fake","bla bla"," busqueda")
		#*************************************************************************************************


		external_links = []
		buscando = ""

		begin

			cand_nicknames.each do |nickname|
				key_words.each do |key_word|
					ally_nick_names.each do |ally_nick|

						sleep(2)

						search_text = "#{nickname.nick} #{ally_nick.nick} #{key_word.word}"
						buscando    = search_text
						puts "SERACHING: #{search_text}"
						
						journal_page,mechanize_agent = NavHelper.get_page_and_agent_from(JOURNAL_URL)

						#*************************************************************************************************
						#****DEBEMOS de terminar un un NODeSEt que es una serie de links Ejemplo "linkspage.search("a")"
						#*********************************************************************************************

						external_links = external_links.concat(ExtraHelper.get_external_links(links,search_text) )

						puts "si obtuve los #{external_links.count}"
					end
					
				end
			end 

			
		rescue
			puts "ERROR CON #{buscando}"
			puts $!, $@
		end

		txt = get_data_from_links(external_links)
		puts txt
		return txt

	end




end

