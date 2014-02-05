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

    
    click_link "Register Now"

    expect(page).to have_text("REGISTER YOUR CHILD")

    #Register the student
    fill_in "student[firstname]", :with => "Emma"
    fill_in "student[lastname]", :with => "Johnson"
    page.choose("student_gender_f")
    page.choose("student_wearsglasses_1")
    select(@school.name, :from => 'student[school_id]')
    fill_in "student[classroomdescription]",  :with => "123"
    page.choose("student_classroomtime_am")
    page.choose("buy_one_get_one_no")

    click_on "next"

    page.visit("http://#{name}:#{password}@#{Capybara.current_session.server.host}:#{Capybara.current_session.server.port}/students")
	# binding.pry
    click_on "Emma"

  end
end