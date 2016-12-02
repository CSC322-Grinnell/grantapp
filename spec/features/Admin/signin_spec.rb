# spec/features/user_signs_in.rb
require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'Admin sign in' do
    
    before do
        @admin = AdminUser.create(email: 'admin@example.com', password: 'password')
    end
    
    scenario 'with valid email and password' do
        visit "/admin/login"
        fill_in "Email", :with => "admin@example.com"
        fill_in "Password", :with => "password"
        click_button "Login"
        expect(page).to have_content "Welcome"
    end
    
    scenario 'with valid email but not matching passwords' do
        visit "/admin/login"
        fill_in "Email", :with => "admin@example.com"
        fill_in "Password", :with => "passsss"
        click_button "Login"
        expect(page).to have_text('Invalid email or password.')
    end
    
    scenario 'with invalid email' do
        visit "/admin/login"
        fill_in "Email", :with => 'thisisnotavalidemail'
        fill_in 'Password', :with => 'password'
        click_button "Login"
        expect(page).to have_text('Invalid email or password.')
    end
end