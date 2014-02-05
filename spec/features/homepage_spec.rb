require "spec_helper"
require 'capybara/rails'


feature "home page" , :js => true do

	before do
		
		Capybara.register_driver :selenium do |app|
		  Capybara::Selenium::Driver.new(app, :browser => :chrome)
		end

	@school = School.create!(:name => "UC High")
	@school.save	
	end
  scenario "User visits the home page" do
    
  	#post schools_path, :school => {:name => "UC High"}
  	name = "PBAdmin"
  	password = "preventblindness!!" 

  	# page.visit("http://#{name}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/schools")
	# page.visit("http://#{name}:#{password}@localhost:3000/schools")
	
	# click_link "new_school"
	# save_and_open_page
	# fill_in "school_name", :with => "UC High"
	# fill_in "school_description", :with => "Dan's HS"
	# click_link "Save School"
	

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

    page.visit("http://#{name}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/students")
	# binding.pry
    click_on "Emma"
    expect(page).to have_content(student[:firstname])
    expect(page).to have_content(student[:lastname])
    expect(page).to have_content(student[:classroomdescription])
    
    find(:xpath, "//*[@id='firstname']").should have_content(student[:firstname])
    find(:xpath, "//*[@id='lastname']").should have_content(student[:lastname])
    find(:xpath, "//*[@id='classroomdescription']").should have_content(student[:classroomdescription])
    find(:xpath, "//*[@id='gender']").should have_content(student[:gender])
    find(:xpath, "//*[@id='gender']").should_not have_content("M")    
    find(:xpath, "//*[@id='wearsglasses']").should have_content(student[:wearsglasses])  #someone reason this is 1 instead of Y

  end
end