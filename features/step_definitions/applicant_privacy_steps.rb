Given /the following apps exist/ do |apps|
  apps.hashes.each do |app|
    App.create!(app)
  end
end


When(/^I create a program with name "(.*?)"$/) do |title|
  fill_in :program_title, :with => title
  click_on('Submit')
end

Then(/^I should see all applications with user "(.*?)"$/) do |email|
	page.should have_content(email)
end

Then (/^I should not see any applications with user "(.*?)"$/) do |email|
	page.should_not have_content(email)
end

Then (/^I should see no applications$/) do
	App.all.each do |app|
		page.should_not have_content(app.email)
	end
end
