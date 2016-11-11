require 'rails_helper.rb'
require 'spec_helper.rb'

# This file tests the ability of a User with a reviewer role to view, sort, 
# and download applications and rubrics. 
# This test suite uses RSpec Capybara framework

feature 'Reviewer programs' do
    
    # Create a user in the mock database to test signing in with valid credentials
    before do
        @user = User.create(first_name: "Reviewer", last_name: "Example", email: "reviewer@example.com", password: "password", role: "reviewer");
    end
    
    # Sign in user
    before do 
        
    end
    
    scenario 'program' do

    end
    
end
