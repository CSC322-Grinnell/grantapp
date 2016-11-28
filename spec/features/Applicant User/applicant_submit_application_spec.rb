require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'User applies to program' do
    
    before do

        @pdf = File.new(Rails.root + "spec/fixtures/testUpload.pdf")
        
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
    
    scenario 'User shows long description' do
        click_button(@program.title)
        expect(page).to have_content "This is a test."
    end
    
    scenario 'User uploads application' do
        visit "/apps/new"
        
    end
    
    scenario 'User deletes application' do
        @application = App.create(user: @user, program: @program, user_app: @pdf)
        visit "/apps"
        expect(page).to have_content @program.title
        click_on("Delete")
        expect(page).not_to have_content @program.title
    end
    
    scenario 'User modifies application' do
        @application = App.create(user: @user, program: @program, user_app: @pdf)
        @replacePdf = File.new(Rails.root + "spec/fixtures/test.pdf")
        visit "/apps"
        expect(page).to have_content @program.title
        click_on("Edit")
        
    end
    
end