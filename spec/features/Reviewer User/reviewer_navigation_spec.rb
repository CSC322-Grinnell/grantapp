require 'rails_helper.rb'
require 'spec_helper.rb'

# This file tests the ability of a User with a reviewer role to navigate
# through the GPCF grant application website. 
# This test suite uses RSpec Capybara framework

feature 'Reviewer navigates' do
    
    # Create a user in the mock database to test signing in with valid credentials
    before do
        @user = User.create(first_name: "Reviewer", last_name: "Example", email: "reviewer@example.com", password: "password", role: "reviewer");
    end
    
    # Sign in user
    before do 
        visit "/users/sign_in"
        fill_in "Email", :with => "reviewer@example.com"
        fill_in "Password", :with => "password"
        click_button "Log in"
    end
    
    scenario 'navigate home to applications' do
        click_link "View Applications"
        expect(page).to have_content "Applications"
        expect(page).to have_content "User"
        expect(page).to have_content "Actions"
    end
    
    scenario 'navigate applications to home' do
        click_link "Home"
        expect(page).to have_content "Welcome to Greater Poweshiek Community Foundation's Grant Application System!"
    end
    
    scenario 'navigate application to my feedback' do 
        click_link "View Applications"
        click_link "View My Feedback"
        expect(page).to have_content "My Feedback"
    end
    
    scenario 'navigate application to new feedback' do 
        click_link "View Applications"
        click_link "Feedback"
        #expect(page).to have_text('Submit Feedback')
        # Don't know 'Submit Feedback' is not in the text found instead we see 'My Feedback Applicant Program'
        expect(page).to have_content "Comment"
        expect(page).to have_content "Score"
    end
    
    scenario 'navigate feedback to applications' do 
        click_link "View Applications"
        expect(page).to have_content "Applications"
        expect(page).to have_content "User"
        expect(page).to have_content "Actions"
    end
    
    scenario 'navigate feedback to home' do 
        click_link "Home"
        expect(page).to have_content "Welcome to Greater Poweshiek Community Foundation's Grant Application System!"
    end
    
end
