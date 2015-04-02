Given /the following users exist/ do |users|
  users.hashes.each do |user|
    User.create!(user)
  end
end

And /^I log in as a user with email "(.*?)" and password "(.*?)"$/ do |email, password|
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button("Log in")
end
