require "spec_helper"
require 'capybara/rails'


feature "home page" , :js => true do

	before do
		
		Capybara.register_driver :selenium do |app|
		  Capybara::Selenium::Driver.new(app, :browser => :chrome)
		end

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
	
  end
end