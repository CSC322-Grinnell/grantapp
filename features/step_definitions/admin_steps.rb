Given /the following admins exist/ do |admins|
  admins.hashes.each do |admin|
    AdminUser.create!(admin)
  end
end

Then(/^I should see a form for "(.*?)"$/) do |arg1|
  page.should have_field(arg1)
end

Then(/^I should see a button with "(.*?)"$/) do |arg1|
  page.should have_button(arg1)
end

Then(/^I should see a disabled button with "(.*?)"$/) do |arg1|
  find(:button, arg1, disabled: true)
end

When(/^I fill form for "(.*?)" with "(.*?)"$/) do |arg1, arg2|
  fill_in arg1, :with => arg2
end

When(/^I click "(.*?)"$/) do |link|
  click_on(link)
end

Then(/^I should see a field for "(.*?)"$/) do |field|
  page.should have_field(field) 
end

And(/^I log in as an admin with email "(.*?)" and password "(.*?)"$/) do |email, password|
  fill_in "admin_user_email", :with => email
  fill_in "admin_user_password", :with => password
  click_button("Login")
end
