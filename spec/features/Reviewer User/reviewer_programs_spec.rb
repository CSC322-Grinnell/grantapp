require 'rails_helper.rb'
require 'spec_helper.rb'
require 'date'

# This file tests the ability of a User with a reviewer role to view, sort, 
# and download applications and rubrics. 
# This test suite uses RSpec Capybara framework

feature 'Reviewer programs' do
    
    # Create a user in the mock database to test signing in with valid credentials
    before do
        #Create program
        @pdf = File.new(Rails.root + "spec/fixtures/test_program.pdf")
        @datetime = DateTime.new(1970, 1, 1)
        @program = Program.create(title:"TestProgram", short_description:"Short", long_description:"Long", deadline: @datetime, application_form: @pdf)
        
        #Create user
        @user = User.create(first_name: "Reviewer", last_name: "Example", email: "reviewer@example.com", password: "password", role: "reviewer")
        
        #Sign in user
        visit "/users/sign_in"
        fill_in "Email", :with => "reviewer@example.com"
        fill_in "Password", :with => "password"
        click_button "Log in"
    end
    
    scenario 'view programs' do
        expect(page).to have_content "Programs"
    end
    
    scenario 'sort programs' do 
        #find(@).click
    end
    
    scenario 'view long description' do
        click_on(@program.title)
        expect(page).to have_content "Long"
    end
    
    scenario 'download application' do 
        
    end
    
    scenario 'download rubric' do 
        
    end
    
end
