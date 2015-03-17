

class ElUniversal
	require 'mechanize'
	require 'nokogiri'
	require 'notice'
	require 'nav_helper'
	require 'extra_helper'

	JOURNAL_URL = "http://www.eluniversal.com.mx/noticias.html"

	def self.get_data_from_links(external_links)

		#mechanize_agent2 = Mechanize.new()
		arr = []

		external_links.each do |link_search_text|
			link        = link_search_text[0]
			search_text = link_search_text[1]

			begin

				page,mech_agent = NavHelper.get_page_and_agent_from(link)

				titulo = page.search("//h1[@id='titleNote']").first
				titulo = page.search("//h2[@class='titleNote']").first  if titulo.nil?
				titulo = page.search("//h2[@class='noteTitle']").first  if titulo.nil?
				texto  = page.search("//div[@class='noteText']").first
				

				puts link
				puts ExtraHelper.correct_title(titulo)

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

						journal_form   = NavHelper.find_form_with_name("buscador_google",journal_page)
						next if journal_form.nil?
						
						query_result = NavHelper.submit_form_with(mechanize_agent,journal_form,{"q" => search_text })
						next if query_result.nil?

						column         = query_result.search("div[@id='IzqDisplayColumn']").first
						next if column.nil?

						links          = column.search("div[@class='HeadNota']").children.search("a")
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

