# spec/features/add_project.rb

require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'Admin modifies an existed project' do
    
    before do
        #Create a admin
        @admin = AdminUser.create(email: 'admin@example.com', password: 'password')
    end
        
    # Sign in user and navigate to programs
    before do 
        visit "/admin/login"
        fill_in "Email", :with => "admin@example.com"
        fill_in "Password", :with => "password"
        click_button "Login"
        click_link "Programs"
        my_pdf = File.new(Rails.root + "spec/fixtures/test_pdf.pdf")
        my_datetime = DateTime.new(1970, 1, 1)
        @my_program = Program.create(title: "newProgram", short_description: "Short", long_description: "Long",
                            deadline: @my_datetime, application_form: @my_pdf)
    end
    
    
    # Modifies the existed program
     scenario 'Admin modifies a program' do
        my_new_pdf = File.new(Rails.root + "spec/fixtures/testUpload.pdf")
        my_new_datetime = DateTime.new(2019, 9, 9)
        @my_program.update_attributes(title: "editProgram", short_description: "editShort", long_description: "editLong",
                               deadline: @my_new_datetime, application_form: @my_new_pdf)
        #visit "/programs"
        #expect(page).to have_content @my_program.title
        
    end
    
    
    end