require "spec_helper"
require 'capybara/rails'


feature "home page" , :js => true do

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

  scenario "User visits the home page and registers a female student" do
    
    visit "/"

	student = {
	  :firstname => "Emma",
	  :lastname => "Johnson",
	  :classroomdescription => "123",
	  :gender => "F",
	  :wearsglasses => "Y"
	}
    
    click_link "Register Now"

    expect(page).to have_text("REGISTER YOUR CHILD")

    #Register the student
    fill_in "student[firstname]", :with => student[:firstname]
    fill_in "student[lastname]", :with => student[:lastname]
    page.choose("student_gender_f")
    
    page.choose("student_wearsglasses_y")
    select(@school.name, :from => 'student[school_id]')
    fill_in "student[classroomdescription]",  :with => student[:classroomdescription]
    page.choose("student_classroomtime_am")
    page.choose("buy_one_get_one_no")

    click_on "next"

    page.visit("http://#{@basicauthname}:#{@basicauthpassword}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/students")
	# binding.pry
    click_on student[:firstname]
    expect(page).to have_content(student[:firstname])
    expect(page).to have_content(student[:lastname])
    expect(page).to have_content(student[:classroomdescription])
    
    find(:xpath, "//*[@id='firstname']").should have_content(student[:firstname])
    find(:xpath, "//*[@id='lastname']").should have_content(student[:lastname])
    find(:xpath, "//*[@id='classroomdescription']").should have_content(student[:classroomdescription])
    find(:xpath, "//*[@id='gender']").should have_content(student[:gender])
    find(:xpath, "//*[@id='gender']").should_not have_content("M")    
    find(:xpath, "//*[@id='wearsglasses']").should have_content(student[:wearsglasses]) 
    find(:xpath, "//*[@id='schoolname']").should have_content("UC High") 
    find(:xpath, "//*[@id='classroomtime']").should have_content("AM") 
  end

  scenario "user registers a male student, no glasses, school at night" do
  	visit "/"

  	student = {
	  :firstname => "Tom",
	  :lastname => "Jones",
	  :classroomdescription => "456",
	  :gender => "M",
	  :wearsglasses => "N"
	}

    click_link "Register Now"

    expect(page).to have_text("REGISTER YOUR CHILD")

    #Register the student
    fill_in "student[firstname]", :with => student[:firstname]
    fill_in "student[lastname]", :with => student[:lastname]
    page.choose("student_gender_m")
    
    page.choose("student_wearsglasses_n")
    select(@school.name, :from => 'student[school_id]')
    fill_in "student[classroomdescription]",  :with => student[:classroomdescription]
    page.choose("student_classroomtime_pm")
    page.choose("buy_one_get_one_no")

    click_on "next"

    page.visit("http://#{@basicauthname}:#{@basicauthpassword}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/students")

    click_on student[:firstname]
    
    find(:xpath, "//*[@id='firstname']").should have_content(student[:firstname])
    find(:xpath, "//*[@id='lastname']").should have_content(student[:lastname])
    find(:xpath, "//*[@id='classroomdescription']").should have_content(student[:classroomdescription])
    find(:xpath, "//*[@id='gender']").should have_content(student[:gender])
    find(:xpath, "//*[@id='gender']").should_not have_content("F")    
    find(:xpath, "//*[@id='wearsglasses']").should have_content(student[:wearsglasses]) 
    find(:xpath, "//*[@id='schoolname']").should have_content("UC High") 
    find(:xpath, "//*[@id='classroomtime']").should have_content("PM") 
  end

  scenario "registers a student and a parent" do
  	visit "/"

  	student = {
	  :firstname => "Tom",
	  :lastname => "Jones",
	  :classroomdescription => "456",
	  :gender => "M",
	  :wearsglasses => "N"
	}

    click_link "Register Now"

    expect(page).to have_text("REGISTER YOUR CHILD")

    #Register the student
    fill_in "student[firstname]", :with => student[:firstname]
    fill_in "student[lastname]", :with => student[:lastname]
    page.choose("student_gender_m")
    
    page.choose("student_wearsglasses_n")
    select(@school.name, :from => 'student[school_id]')
    fill_in "student[classroomdescription]",  :with => student[:classroomdescription]
    page.choose("student_classroomtime_pm")
    page.choose("buy_one_get_one_no")

    click_on "next"

    #Register the parent
    parent = {
	  :firstname => "Mr.",
	  :lastname => "Jones",
	  :email => "mrjones@gmail.com"
    }

	fill_in "parent_firstname", :with => parent[:firstname]
    fill_in "parent_lastname", :with => parent[:lastname]
    fill_in "parent_email", :with => parent[:email]
	
	click_on "next"

	#verify student creation
	page.visit("http://#{@basicauthname}:#{@basicauthpassword}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/students")

    click_on student[:firstname]
    
    find(:xpath, "//*[@id='firstname']").should have_content(student[:firstname])
    find(:xpath, "//*[@id='lastname']").should have_content(student[:lastname])
    find(:xpath, "//*[@id='classroomdescription']").should have_content(student[:classroomdescription])
    find(:xpath, "//*[@id='gender']").should have_content(student[:gender])
    find(:xpath, "//*[@id='gender']").should_not have_content("F")    
    find(:xpath, "//*[@id='wearsglasses']").should have_content(student[:wearsglasses]) 
    find(:xpath, "//*[@id='schoolname']").should have_content("UC High") 
    find(:xpath, "//*[@id='classroomtime']").should have_content("PM") 
    find(:xpath, "//*[@id='parent_full_name']").should have_content(parent[:firstname]) 
    find(:xpath, "//*[@id='parent_full_name']").should have_content(parent[:lastname]) 

    #verify parent creation    
    click_on "Back to students"
    click_on "manage parents"
    click_on parent[:firstname]

    find(:xpath, "//*[@id='firstname']").should have_content(parent[:firstname])
    find(:xpath, "//*[@id='lastname']").should have_content(parent[:lastname])
    find(:xpath, "//*[@id='email']").should have_content(parent[:email])

  end

  scenario "registers a student and a parent, pays" do
	Rails.configuration.stripe[:publishable_key] = "pk_test_QwZn8MgHhFeWmGEzqV2yIjYF"
	Stripe.api_key = "sk_test_mfiW5pBwJFSj9ohtkKKLG0u9"  

	Capybara.default_wait_time = 30
  	
  	visit "/"

  	student = {
	  :firstname => "Tom",
	  :lastname => "Jones",
	  :classroomdescription => "456",
	  :gender => "M",
	  :wearsglasses => "N"
	}

    click_link "Register Now"

    expect(page).to have_text("REGISTER YOUR CHILD")

    #Register the student
    fill_in "student[firstname]", :with => student[:firstname]
    fill_in "student[lastname]", :with => student[:lastname]
    page.choose("student_gender_m")
    
    page.choose("student_wearsglasses_n")
    select(@school.name, :from => 'student[school_id]')
    fill_in "student[classroomdescription]",  :with => student[:classroomdescription]
    page.choose("student_classroomtime_pm")
    page.choose("buy_one_get_one_no")

    click_on "next"

    #Register the parent
    parent = {
	  :firstname => "Mr.",
	  :lastname => "Jones",
	  :email => "mrjones@gmail.com"
    }

	fill_in "parent_firstname", :with => parent[:firstname]
    fill_in "parent_lastname", :with => parent[:lastname]
    fill_in "parent_email", :with => parent[:email]
	
	click_on "next"

	expect(page).to have_text("Review and submit payment")

	click_on "Pay with Card"
	# expect(page).to have_text("Card Number")
	within_frame 'stripe_checkout_app' do
		fill_in "card_number", :with => "4242424242424242"
		fill_in "cc-exp", :with => "1219"
		fill_in "cc-csc", :with => "123"		
		# binding.pry
		click_on "Pay"		
	end
	
	#verify the receipt's page
	find(:xpath, "//*[@id='your_receipt']").should have_content(student[:firstname])	
	# binding.pry    stripe sometimes throws api key errors if you jump away from the page too soon.

	#verify student creation
	page.visit("http://#{@basicauthname}:#{@basicauthpassword}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/students")

    click_on student[:firstname]
    
    find(:xpath, "//*[@id='firstname']").should have_content(student[:firstname])
    find(:xpath, "//*[@id='lastname']").should have_content(student[:lastname])
    find(:xpath, "//*[@id='classroomdescription']").should have_content(student[:classroomdescription])
    find(:xpath, "//*[@id='gender']").should have_content(student[:gender])
    find(:xpath, "//*[@id='gender']").should_not have_content("F")    
    find(:xpath, "//*[@id='wearsglasses']").should have_content(student[:wearsglasses]) 
    find(:xpath, "//*[@id='schoolname']").should have_content("UC High") 
    find(:xpath, "//*[@id='classroomtime']").should have_content("PM") 
    find(:xpath, "//*[@id='parent_full_name']").should have_content(parent[:firstname]) 
    find(:xpath, "//*[@id='parent_full_name']").should have_content(parent[:lastname]) 

    #verify parent creation    
    click_on "Back to students"
    click_on "manage parents"
    click_on parent[:firstname]

    find(:xpath, "//*[@id='firstname']").should have_content(parent[:firstname])
    find(:xpath, "//*[@id='lastname']").should have_content(parent[:lastname])
    find(:xpath, "//*[@id='email']").should have_content(parent[:email])

  end
end