# Given /the following users exist/ do |users|
#   users.hashes.each do |user|
#     User.create!(user)
#   end
# end

Given /the following users exist/ do |users|
  users.hashes.each do |user|
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
    User.create!(u)
  end
end

And /^I log in as a user with email "(.*?)" and password "(.*?)"$/ do |email, password|
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button("Log in")
end

And /^I should see a form for "(.*?)"$/ do |form_label|
  page.should have_form(form_label)
end

Then /^I should see a button with "(.*?)"/ do |label|
  page.should have_button(label)
end

Then /^I should not see a button with "(.*?)"/ do |label|
  page.should_not have_button(label)
end
