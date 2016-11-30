# spec/features/user_signs_in.rb
=begin
require 'rails_helper.rb'
require 'spec_helper.rb'

feature 'Admin remove another admin' do
    
    before do
        @admin = AdminUser.create(email: 'admin@example.com', password: 'password')
        visit "/admin/login"
        fill_in "Email", :with => "admin@example.com"
        fill_in "Password", :with => "password"
        click_button "Login"
        #create another admin user
        @admin = AdminUser.create(email: 'newadmin@example.com', password: 'password')
    end
    
    scenario 'with valid email and password' do
        visit "/admin/admin_users"
    end
    
=end