# spec/features/user_signs_in.rb
require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'User signs in' do
    scenario 'with valid email and password' do
        visit "/users/sign_in"
        fill_in "Email", :with => "user@example.com"
        fill_in "Password", :with => "password"
        click_button "Log in"
        puts(current_path)
        #expect(current_path).to eq('/')
        expect(page).to have_content "Welcome"
    end
    
    scenario 'with valid email but not matching passwords' do
        visit "/users/sign_in"
        fill_in "Email", :with => "dumb@example.com"
        fill_in "Password", :with => "password"
        click_button "Log in"
        expect(page).to have_text('Invalid email or password')
    end
    
    scenario 'with invalid email' do
        visit "/users/sign_in"
        fill_in "Email", :with => 'not an email'
        fill_in 'Password', :with => 'password'
        click_button "Log in"
        expect(page).to have_text('error')
    end
end
