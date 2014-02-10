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

		school = {
			:name => "Marie Curie",
			:description => "dan's elementary school"
		}

		# add new school
		fill_in "school_name", :with => school[:name]
		fill_in "school_description", :with => school[:description]
		click_on "save_school"		

		expect(page).to have_text(school[:name])

		# verify new school
		page.visit("/schools")		
		click_on school[:name]
		find(:xpath, "//*[@id='myModalLabel']").should have_content(school[:name])
		find(:xpath, "//*[@id='school_description']").should have_content(school[:description])

		# edit new school
		click_on "edit_school"

		school_updated_properties = {
			:name => "Stanley Jr. High",
			:description => "dan's junior high"
		}

		fill_in "school_name", :with => school_updated_properties[:name]
		fill_in "school_description", :with => school_updated_properties[:description]
		click_on "save_school"

		# verify the old school name doesn't show in index page
		expect(page).to have_text(school_updated_properties[:name])
		expect(page).not_to have_text(school[:name])

		# verify new properties of edited school
		click_on school_updated_properties[:name]
		find(:xpath, "//*[@id='myModalLabel']").should have_content(school_updated_properties[:name])
		find(:xpath, "//*[@id='school_description']").should have_content(school_updated_properties[:description])

		# test delete
		click_on "delete_school"		
		page.driver.browser.switch_to.alert.accept

		# verify delete
		expect(page).not_to have_text(school_updated_properties[:name])

	end
end	