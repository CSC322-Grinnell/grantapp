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
        
    end
    
    scenario 'navigate' do

    end
    
end
