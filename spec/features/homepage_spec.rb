require "spec_helper"
require 'capybara/rails'

feature "home page" , :js => true do
  scenario "User visits the home page" do
    visit "/"

    
    click_link "Register Now"

    expect(page).to have_text("REGISTER YOUR CHILD")
  end
end