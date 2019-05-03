# spec/features/add_project.rb

require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'Admin add a new project' do
    
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
    end
    
    
    # Add a new program with correct information
     scenario 'add a new project' do
        my_pdf = File.new(Rails.root + "spec/fixtures/test_pdf.pdf")
        my_datetime = DateTime.new(1970, 1, 1)
        @my_program = Program.create(title: "newProgram", short_description: "Short", long_description: "Long",
                            deadline: @my_datetime, application_form: @my_pdf)
    end
    
    
    
    end
    
