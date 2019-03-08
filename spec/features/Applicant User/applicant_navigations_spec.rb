require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'User applies to program' do
    
    before do

        @pdf = File.new(Rails.root + "spec/fixtures/test.pdf")
        
        @datetime = DateTime.new(1970, 1, 1)
        @user = User.create(first_name: "Bob", last_name: "Example", email: "user@example.com", password: "password", organization: "test", phone_number: "1234567890", state: "IO", city: "Grinnell", zip_code: "50112", address: "test_address", role: "applicant");
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
    end
    
    scenario 'User deletes application' do
        
    end
    
    scenario 'User modifies application' do
        
    end
    
end