# spec/features/Admin/admin_sign_in
require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'Admin add a new Admin' do
    
    before do
        @admin = AdminUser.create(email: 'admin@example.com', password: 'password')
        
        visit "/admin/login"
        fill_in "Email", :with => 'admin@example.com'
        fill_in 'Password', :with => 'password'
        click_button "Login"
    end
    
    scenario 'With confirmation password same with the actual password' do
        visit "/admin/admin_users/new"
        fill_in "Email", :with => 'newadmin@example.com'
        fill_in 'admin_user_password', :with => 'password'
        fill_in 'Password confirmation', :with => 'password'
        click_button "Create Admin user"
        expect(page).to have_text('Admin user was successfully created.')
    end
    
    scenario 'With confirmation password different from the actual password' do
        visit "/admin/admin_users/new"
        fill_in "Email", :with => 'newadmin@example.com'
        fill_in 'admin_user_password', :with => 'passwordwwwew'
        fill_in 'Password confirmation', :with => 'opjswewrwwe'
        click_button "Create Admin user"
        expect(page).to have_text('doesn\'t match Password')
    end
    
    scenario 'With a password smaller than the minimum of 8 characters but both actual and confirmation passwords are the same' do
        visit "/admin/admin_users/new"
        fill_in "Email", :with => 'newadmin@example.com'
        fill_in 'admin_user_password', :with => 'p'
        fill_in 'Password confirmation', :with => 'p'
        click_button "Create Admin user"
        expect(page).to have_text('is too short (minimum is 8 characters)')
    end
    
    scenario 'with both a small password and a password and confirmation password mismatch' do
        visit "/admin/admin_users/new"
        fill_in "Email", :with => 'newadmin@example.com'
        fill_in 'admin_user_password', :with => 'pass'
        fill_in 'Password confirmation', :with => 'poss'
        click_button "Create Admin user"
        expect(page).to have_text('is too short (minimum is 8 characters)')
        expect(page).to have_text('doesn\'t match Password')
    end
    
end