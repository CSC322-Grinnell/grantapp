# spec/features/visitor_signs_up_spec.rb
require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'Visitor signs up' do
    scenario 'with valid email and password' do
        visit "/users/sign_up"
        fill_in "First name", :with => "firstname"
        fill_in "Last name", :with => "lastname"
        fill_in "Email", :with => "dumb@example.com"
        fill_in "Organization", :with => "test"
        fill_in "Phone number", :with => "1234567890"
        fill_in "Address", :with => "test"
        fill_in "City", :with => "Grinnell"
        find('#user_state').find(:xpath, 'option[2]').select_option
        fill_in "Zip code", :with => "50112"
        fill_in "Password", :with => "password"
        fill_in "Password confirmation", :with => "password"
        click_button "Sign up"
        expect(page).to have_text('Welcome')
    end
    
    scenario 'with valid email but not matching passwords' do
        visit "/users/sign_up"
        fill_in "Email", :with => "dumb@example.com"
        fill_in "Password", :with => "password"
        fill_in "Password confirmation", :with => "different password"
        click_button "Sign up"
        expect(page).to have_text('error')
    end
    
    scenario 'with invalid email' do
        visit "/users/sign_up"
        fill_in "Email", :with => 'not an email'
        fill_in 'Password', :with => 'password'
        fill_in 'Password confirmation', :with => 'password'
        click_button "Sign up"
        expect(page).to have_text('error')
    end
    
end
