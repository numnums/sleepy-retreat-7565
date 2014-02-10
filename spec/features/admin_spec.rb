require "spec_helper"
require 'capybara/rails'


feature "admin pages" , :js => true do

	# TODO : these before: blocks are copied from homepage_spec.rb.  We should find
	# a way to not cut and paste this code

	#TARGETBROWSER=chrome rake spec : runs tests in chrome
	#rake spec TARGETBROWSER=chrome : runs tests in chrome
	#rake spec : runs tests in FF.
	before :each do
		if ENV['TARGETBROWSER'] == "chrome"
			Capybara.register_driver :selenium do |app|
		  	Capybara::Selenium::Driver.new(app, :browser => :chrome)
		end
	end
	end

	before :each do
		@school = School.create!(:name => "UC High")
		@school.save	
	  	@basicauthname = "PBAdmin"
	  	@basicauthpassword = "preventblindness!!" 
	end

	scenario "add new school" do
		page.visit("http://#{@basicauthname}:#{@basicauthpassword}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/schools")
		page.visit("/schools")

		click_on "new_school" # id of button



	end
end	