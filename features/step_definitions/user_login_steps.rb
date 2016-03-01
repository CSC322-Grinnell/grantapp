require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

Given /the following users exist/ do |users|
  users.hashes.each do |user|
    puts users.hashes
    # basic fields
    u = { :email => user[:email],
          :password => user[:password] }
    # default role  
    if (user[:role] != nil)
      u[:role] = user[:role]
    else
      u[:role] = 'applicant'
    end
    # optional programs for reviewers
    if (user[:role] == 'reviewer' && user[:program] != nil)
    	 u[:program_ids] = Program.find_by_title(user[:program]).id
    end  
    puts User
    User.create!(u)
  end
end

When /^I go to the user sign in page/ do
	 visit "/#{place}"
end

And /^I sign in as a user with email "(.*?)" and password "(.*?)"$/ do |email, password|
  fill_in "user_mail", :with => email
  fill_in "user_password", :with => password
  click_button("Log in")
end

Then /^I should be on the home page/ do
  expect(page.current_path).to eq root_path
end

Then /^I should see a form for "(.*?)"/ do |form_label|
  page.should have_form(form_label)
end

Then /^I should see a button with "(.*?)"/ do |label|
  page.should have_button(label)
end

Then /^I should not see a button with "(.*?)"/ do |label|
  page.should_not have_button(label)
end

Then(/^I should see "(.*?)"$/) do |arg1|
  pending # express the regexp above with the code you wish you had
end