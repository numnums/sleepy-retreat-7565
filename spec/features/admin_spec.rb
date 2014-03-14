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

	scenario "add new school, edit and delete" do
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

	scenario "add new parent, edit and delete" do
		page.visit("http://#{@basicauthname}:#{@basicauthpassword}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/parents")
		page.visit("/parents")
		click_on "new_parent"

		parent = {
		  :firstname => "Mr.",
		  :lastname => "Jones",
		  :email => "mrjones@gmail.com", 
		  :phonenumber => "1-415-111-2222", 
		  :address => "7110 Rock Valley Court",
		  :city => "San Diego", 
		  :state => "CA",
		  :zip => "92122"
		}
	
		fill_in "parent_firstname", :with => parent[:firstname]
		fill_in "parent_lastname", :with => parent[:lastname]
		fill_in "parent_email", :with => parent[:email]
		fill_in "parent_phone", :with => parent[:phonenumber]
		fill_in "parent_address", :with => parent[:address]
		fill_in "parent_city", :with => parent[:city]
		fill_in "parent_state", :with => parent[:state]
		fill_in "parent_zip", :with => parent[:zip]	

		click_on "save_parent"		

		expect(page).to have_text(parent[:firstname])

		page.visit("/parents")		
		click_on parent[:firstname]
		find(:xpath, "//*[@id='firstname']").should have_content(parent[:firstname])
		find(:xpath, "//*[@id='lastname']").should have_content(parent[:lastname])
		find(:xpath, "//*[@id='email']").should have_content(parent[:email])
		find(:xpath, "//*[@id='phone']").should have_content(parent[:phonenumber])
		find(:xpath, "//*[@id='address']").should have_content(parent[:address])
		find(:xpath, "//*[@id='city']").should have_content(parent[:city])
		find(:xpath, "//*[@id='state']").should have_content(parent[:state])
		find(:xpath, "//*[@id='zip']").should have_content(parent[:zip])

		# edit new parent
		click_on "edit_parent"

		parent_updated_properties = {
			:firstname => "Vong",
			:lastname => "Nguyen",
			:email => "vnguyen@gmail.com",
			:phonenumber => "1-915-222-3333", 
			:address => "2161 Allston Way",
			:city => "Berekely", 
			:state => "NV",
			:zip => "94545"			
		}

		fill_in "parent_firstname", :with => parent_updated_properties[:firstname]
		fill_in "parent_lastname", :with => parent_updated_properties[:lastname]
		fill_in "parent_email", :with => parent_updated_properties[:email]
		fill_in "parent_phone", :with => parent_updated_properties[:phonenumber]
		fill_in "parent_address", :with => parent_updated_properties[:address]
		fill_in "parent_city", :with => parent_updated_properties[:city]
		fill_in "parent_state", :with => parent_updated_properties[:state]
		fill_in "parent_zip", :with => parent_updated_properties[:zip]			
		click_on "save_parent"		

		# verify the old parent name doesn't show in index page
		expect(page).to have_text(parent_updated_properties[:firstname])
		expect(page).not_to have_text(parent[:firstname])

		# verify new properties of edited parent
		click_on parent_updated_properties[:firstname]		
		find(:xpath, "//*[@id='firstname']").should have_content(parent_updated_properties[:firstname])
		find(:xpath, "//*[@id='lastname']").should have_content(parent_updated_properties[:lastname])
		find(:xpath, "//*[@id='email']").should have_content(parent_updated_properties[:email])
		find(:xpath, "//*[@id='phone']").should have_content(parent_updated_properties[:phonenumber])
		find(:xpath, "//*[@id='address']").should have_content(parent_updated_properties[:address])
		find(:xpath, "//*[@id='city']").should have_content(parent_updated_properties[:city])
		find(:xpath, "//*[@id='state']").should have_content(parent_updated_properties[:state])
		find(:xpath, "//*[@id='zip']").should have_content(parent_updated_properties[:zip])

		# test delete
		click_on "delete_parent"		
		page.driver.browser.switch_to.alert.accept

		# verify delete
		expect(page).not_to have_text(parent_updated_properties[:firstname])
	end	

	scenario "add new parent. Then add new student, edit and delete" do
		page.visit("http://#{@basicauthname}:#{@basicauthpassword}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/parents")
		page.visit("/parents")
		click_on "new_parent"

		parent = {
		  :firstname => "Mr.",
		  :lastname => "Jones",
		  :email => "mrjones@gmail.com", 
		  :phonenumber => "1-415-111-2222", 
		  :address => "7110 Rock Valley Court",
		  :city => "San Diego", 
		  :state => "CA",
		  :zip => "92122"
		}
	
		fill_in "parent_firstname", :with => parent[:firstname]
		fill_in "parent_lastname", :with => parent[:lastname]
		fill_in "parent_email", :with => parent[:email]
		fill_in "parent_phone", :with => parent[:phonenumber]
		fill_in "parent_address", :with => parent[:address]
		fill_in "parent_city", :with => parent[:city]
		fill_in "parent_state", :with => parent[:state]
		fill_in "parent_zip", :with => parent[:zip]	

		click_on "save_parent"		

		expect(page).to have_text(parent[:firstname])

		page.visit("/parents")		
		click_on parent[:firstname]
		find(:xpath, "//*[@id='firstname']").should have_content(parent[:firstname])
		find(:xpath, "//*[@id='lastname']").should have_content(parent[:lastname])
		find(:xpath, "//*[@id='email']").should have_content(parent[:email])
		find(:xpath, "//*[@id='phone']").should have_content(parent[:phonenumber])
		find(:xpath, "//*[@id='address']").should have_content(parent[:address])
		find(:xpath, "//*[@id='city']").should have_content(parent[:city])
		find(:xpath, "//*[@id='state']").should have_content(parent[:state])
		find(:xpath, "//*[@id='zip']").should have_content(parent[:zip])

		## ADD: new student
		page.visit("/students")
		click_on "new_student"

		student = {
			:firstname => "Daniel",
			:lastname => "Vu",
			:classroomdescription => "2",
			:gender => "M",
			:wearsglasses => "N"
		}

		fill_in "student_firstname", :with => student[:firstname]
		fill_in "student_lastname", :with => student[:lastname]
		page.choose("student_gender_m")
		page.choose("student_wearsglasses_n")
		select(@school.name, :from => 'student[school_id]')
		fill_in "student_classroomdescription", :with => student[:classroomdescription]
		page.choose("student_classroomtime_am")		
		select(parent[:firstname], :from => 'student[parent_id]')
		click_on "save_student"

		expect(page).to have_text(student[:firstname])

		# verify new student
		page.visit("/students")		
		click_on student[:firstname]
		find(:xpath, "//*[@id='firstname']").should have_content(student[:firstname])
		find(:xpath, "//*[@id='lastname']").should have_content(student[:lastname])
		find(:xpath, "//*[@id='gender']").should have_content(student[:gender])
		find(:xpath, "//*[@id='schoolname']").should have_content(@school.name)
		find(:xpath, "//*[@id='classroomdescription']").should have_content(student[:classroomdescription])
		find(:xpath, "//*[@id='classroomtime']").should have_content("AM")
		find(:xpath, "//*[@id='parent_full_name']").should have_content(parent[:firstname])
		find(:xpath, "//*[@id='wearsglasses']").should have_content("N")
		# edit new student
		click_on "edit_student"

		student_updated_properties = {
			:firstname => "Nicole",
			:lastname => "Smith",
			:classroomdescription => "3",
			:gender => "F",
			:wearsglasses => "Y"
		}

		fill_in "student_firstname", :with => student_updated_properties[:firstname]
		fill_in "student_lastname", :with => student_updated_properties[:lastname]
		page.choose("student_gender_f")
		page.choose("student_wearsglasses_y")
		fill_in "student_classroomdescription", :with => student_updated_properties[:classroomdescription]
		page.choose("student_classroomtime_pm")
		click_on "save_student"

		# verify the old student name doesn't show in index page
		expect(page).to have_text(student_updated_properties[:firstname])		
		expect(page).not_to have_text(student[:firstname])

		# verify new properties of edited student
		click_on student_updated_properties[:firstname]
		find(:xpath, "//*[@id='firstname']").should have_content(student_updated_properties[:firstname])
		find(:xpath, "//*[@id='lastname']").should have_content(student_updated_properties[:lastname])
		find(:xpath, "//*[@id='gender']").should have_content(student_updated_properties[:gender])
		find(:xpath, "//*[@id='schoolname']").should have_content(@school.name)
		find(:xpath, "//*[@id='classroomdescription']").should have_content(student_updated_properties[:classroomdescription])
		find(:xpath, "//*[@id='classroomtime']").should have_content("PM")
		find(:xpath, "//*[@id='parent_full_name']").should have_content(parent[:firstname])
		find(:xpath, "//*[@id='wearsglasses']").should have_content("Y")

		# test delete
		click_on "delete_student"		
		page.driver.browser.switch_to.alert.accept

		# verify delete
		expect(page).not_to have_text(student_updated_properties[:firstname])
	end	

	
end	