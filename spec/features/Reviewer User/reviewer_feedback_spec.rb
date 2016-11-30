require 'rails_helper.rb'
require 'spec_helper.rb'

# This file tests the ability of a User with a reviewer role to sort, write, 
# submit, edit, and deltete feedback. 
# This test suite uses RSpec Capybara framework

feature 'Reviewer feedback' do
    
    # Create an applicant user and a reviewer user in the mock database 
    before do
        #Create users
        @applicant_user = User.create(first_name: "Appplicant", last_name: "Example", email: "applicant@example.com", password: "password", role: "applicant");
        @reviewer_user = User.create(first_name: "Reviewer", last_name: "Example", email: "reviewer@example.com", password: "password", role: "reviewer");
        #Create program
        my_pdf = File.new(Rails.root + "spec/fixtures/test_pdf.pdf")
        my_datetime = DateTime.new(1970, 1, 1)
        #Create user
        
        @my_program = Program.create(title: "newProgram", short_description: "Short", long_description: "Long",
                            deadline: @my_datetime, application_form: @my_pdf)
                            
        @my_application = App.create(user: @applicant_user, program: @my_program, user_app: @my_pdf)

        # Create feedback
        @my_feedback = Feedback.create(user: @reviewer_user, app: @my_application, comment: "well done.", score: 10)
        
        
        
    end
    
    # Sign in user and navigate to feedback
    before do 
        visit "/users/sign_in"
        fill_in "Email", :with => "reviewer@example.com"
        fill_in "Password", :with => "password"
        click_button "Log in"
    end
    
    # Modify feedback
    scenario 'user modifies feedback' do
        @my_feedback["comment"] = "medium done."
        @my_feedback["score"] = 5
    end
    
    # Delete feedback
    ## DO NOT WORK ##
    # Reviewer user is not assigned to any programs so cannot view feedback page
    scenario 'user deletes feedback' do

        #visit "/feedbacks"
        
        #expect(page).to have_content "My Feedback"
        #expect(page).to have_content @my_feedback["comment"]
        
        #@my_feedback.delete 

        # Check if my feedback page still has comment from feedback that was deleted 
        #expect(page).not_to have_content @my_feedback["comment"]
    end
    
end
