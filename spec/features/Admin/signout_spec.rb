# spec/features/Admin/signout_spec.rb
require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'Admin sign in' do
    
    before do
        @admin = AdminUser.create(email: 'admin@example.com', password: 'password')
        visit "/admin/login"
        fill_in "Email", :with => "admin@example.com"
        fill_in "Password", :with => "password"
        click_button "Login"
    end
    
    scenario 'from the dashboard' do
        visit "/admin/dashboard"
        click_link("Logout")
        expect(page).to have_text("You need to sign in or sign up before continuing.")
    end
    
    scenario 'from the admin users page' do
        visit "/admin/admin_users"
        click_link("Logout")
        expect(page).to have_text("You need to sign in or sign up before continuing.")
    end
    
    scenario 'from the applications page' do
        visit "/admin/apps"
        click_link("Logout")
        expect(page).to have_text("You need to sign in or sign up before continuing.")
    end
    
    scenario 'from the programs page' do
        visit "/admin/programs"
        click_link("Logout")
        expect(page).to have_text("You need to sign in or sign up before continuing.")
    end
    
    scenario 'from the reviewer feedbacks page' do
        visit "/admin/feedbacks"
        click_link("Logout")
        expect(page).to have_text("You need to sign in or sign up before continuing.")
    end
    
    scenario 'from the reviewer users page' do
        visit "/admin/users"
        click_link("Logout")
        expect(page).to have_text("You need to sign in or sign up before continuing.")
    end
    
    scenario 'from the admin user\'s profile page' do
        visit "/admin/users"
        click_link("Logout")
        expect(page).to have_text("You need to sign in or sign up before continuing.")
    end
    
end