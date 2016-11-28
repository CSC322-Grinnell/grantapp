require 'rails_helper.rb'
require 'spec_helper.rb'

# This file tests the ability of a User with a reviewer role to sort and download applications.
# This test suite uses RSpec Capybara framework

feature 'Reviewer applications' do
    
    # Create a user, a program, and an application in the mock database to test signing in with valid credentials
    before do
        @pdf = File.new(Rails.root + "spec/fixtures/test_program.pdf")
        @datetime = DateTime.new(1970, 1, 1)
        @program = Program.create(title:"TestProgram", short_description:"Short", long_description:"Long", deadline: @datetime, application_form: @pdf)
        @user = User.create(first_name: "Reviewer", last_name: "Example", email: "reviewer@example.com", password: "password", role: "reviewer")
        @applicant = User.create(first_name: "Applicant", last_name: "Example", email: "applicant@example.com", password: "password")
        @application = App.create(user: @applicant, program: @program, user_app: @pdf)  
        
    
    # Sign in user
        visit "/users/sign_in"
        fill_in "Email", :with => "reviewer@example.com"
        fill_in "Password", :with => "password"
        click_button "Log in"
    end
    
    scenario 'download' do
    visit "/apps"
    expect(page).to have_content "TestProgram"
    expect(page).to have_content "applicant@example.com"
    
    end
    
end
