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
        my_pdf = File.new(Rails.root + "spec/fixtures/test_pdf.pdf")
        my_datetime = DateTime.new(1970, 1, 1)
        #Create user
        my_user = User.create(first_name: "Reviewer", last_name: "Example", email: "reviewer@example.com", password: "password", organization: "test", phone_number: "1234567890", state: "IO", city: "Grinnell", zip_code: "50112", address: "test_address", role: "reviewer");
        my_program = Program.create(title: "newProgram", short_description: "Short", long_description: "Long",
                            deadline: my_datetime, application_form: my_pdf)
                            
        
        #Sign in user
        visit "/users/sign_in"
        fill_in "Email", :with => "reviewer@example.com"
        fill_in "Password", :with => "password"
        click_button "Log in"
    end
    
    scenario 'view programs' do
        expect(page).to have_content "Programs"
    end
    
    scenario 'edit programs' do 
        
    end
    
    scenario 'sort programs' do 
        #click_button("Title ")
        #click_on("Description")
    end
    
    scenario 'show long description' do
        click_button("newProgram")
        expect(page).to have_content "Long"
    end
    
    scenario 'download application' do 
        
    end
    
    scenario 'download rubric' do 
        
    end
    
end