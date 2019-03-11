# spec/features/add_project.rb

require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'Admin deletes an existed project' do
    
    before do
        #Create a admin
        @admin = AdminUser.create(email: 'admin@example.com', password: 'password')
    end
        
    # Sign in user and create an new program
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
    
    
    # delete the existed program
     scenario 'Admin delete an program' do
  
        @my_program.delete
        #expect(page).to have_text('Are you sure you want to delete this?')
        ret = @my_program.valid?
        assert_equal false, ret 
        
        #expect(page).to have_content @my_program.title
        
    end
    
    
    end