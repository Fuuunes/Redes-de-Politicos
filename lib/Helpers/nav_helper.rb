#encoding: utf-8

#if RUBY_VERSION =~ /1.9/ # assuming you're running Ruby ~1.9
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
#end
#module NavHelper
	class NavHelper

		def self.find_form_with_field(field_name,page)
			return nil if page.nil?
			puts "1clase #{page.class}"
			return nil if page.class == Mechanize::File

			page.forms.each do |form|
				return form if form.has_field?(field_name)
			end
			return nil

		end


		def self.find_form_with_name(name,page)
			return page.form_with(name: name)
		end

		def self.find_form_with_id(name,page)
			return page.form_with(id: name)
		end

		def self.get_page_and_agent_from(url)

			begin

				agent = Mechanize.new()
				agent.user_agent_alias = 'Mac Safari'

				page  = agent.get url
	 
			rescue
				page = nil
				
				puts $!.message
				puts $!.backtrace
			ensure
				
				return page,agent
			end

		end

		def self.page_go_to_link(page,a)
			
			return nil if a.nil? || page.nil?

			begin
				page2 = page.click(a)	
				
			rescue Exception => e 

	            puts "handler ERROR #{e}"
	            puts e.inspect
	            puts e.backtrace
	             
	            puts a.content
				page2 = nil
			ensure
				return	page2
			end	

		end

		def self.submit_form_with(agent,form,values)
				
				return nil if form.nil?
				return nil if agent.nil?
				
				values.each do |key,value|
					form[key.to_s] = value.to_s if form.has_field?(key.to_s)
				end

				#un = Time.now
				begin
					
					page  = agent.submit form 
				rescue Exception => e 
					puts "EROOOORRR #{e}"
					page = nil
				ensure
					return page
				end

		end

	end
#end