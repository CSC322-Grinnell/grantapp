require 'rails_helper.rb'
require 'spec_helper.rb'
require 'date'

feature 'User navigates from home page' do
    
    before do

        @pdf = File.new(Rails.root + "spec/fixtures/test.pdf")
        
        @datetime = DateTime.new(1970, 1, 1)
        @user = User.create(first_name: "Bob", last_name: "Example", email: "user@example.com", password: "password",
                            role: "applicant")
        @program = Program.create(title: "newProgram", short_description: "Test", long_description: "This is a test.",
                            deadline: @datetime, application_form: @pdf)
        visit "/users/sign_in"
        fill_in "Email", :with => "user@example.com"
        fill_in "Password", :with => "password"
        click_button "Log in"
    end
    
    scenario 'Navigate to User Applications' do
        click_link("Your Applications")
        expect(page).to have_content "Actions"
        expect(current_path).to have_content "/apps"
    end
    
    scenario 'Navigate to Applying Page' do
        click_link("Apply")
        expect(page).to have_content "New Application"
        expect(current_path).to have_content "/apps/new"
    end
    
    scenario 'User signs out' do
        click_link("Sign Out") 
        expect(page).to have_content "Signed out successfully"
        expect(page).to have_content "Please log in or sign up to apply."
    end
    
    scenario 'User shows long description' do
        click_button("newProgram")
        expect(page).to have_content "This is a test."
    end
    
end

feature 'User navigates from applying page' do

end

feature 'User navigates from applications page' do
    
end
