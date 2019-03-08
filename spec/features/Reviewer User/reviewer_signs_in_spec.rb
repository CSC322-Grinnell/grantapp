require 'rails_helper.rb'
require 'spec_helper.rb'

# This file tests the ability of a User with a reviewer role to sign in with 
# valid credentials, and ensures sign-in page checks validity of email and 
# password. This test suite uses RSpec Capybara framework

feature 'Reviewer signs in' do
    
    # Create a user in the mock database to test signing in with valid credentials
    before do
        @user = User.create(first_name: "Reviewer", last_name: "Example", email: "reviewer@example.com", password: "password", organization: "test", phone_number: "1234567890", state: "IO", city: "Grinnell", zip_code: "50112", address: "test_address", role: "reviewer");
    end
    
    scenario 'with valid email and password' do
        visit "/users/sign_in"
        fill_in "Email", :with => "reviewer@example.com"
        fill_in "Password", :with => "password"
        click_button "Log in"
        # The only view difference between applicant and reviewer
        expect(page).to have_content "View Applications"
    end
    
    scenario 'with valid email but not matching passwords' do
        visit "/users/sign_in"
        fill_in "Email", :with => "reviewer@example.com"
        fill_in "Password", :with => "wrongpassword"
        click_button "Log in"
        expect(page).to have_text('Invalid email or password')
    end
    
    scenario 'with invalid email' do
        visit "/users/sign_in"
        fill_in "Email", :with => 'not an email'
        fill_in 'Password', :with => 'password'
        click_button "Log in"
        expect(page).to have_text('Invalid email or password')
    end
end
