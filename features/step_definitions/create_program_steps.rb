Given /the following programs exist/ do |programs|
  programs.hashes.each do |p|
    Program.create!(p)
  end
end

When(/^I create a program with name "(.*?)"$/) do |title|
  fill_in :program_title, :with => title
  click_on('Submit')
end

Then(/^a program with name "(.*?)" should exist$/) do |name|
  Program.find_by_name(name).should_not == nil
end

Then(/^a program with name "(.*?)" should not exist$/) do |name|
  Program.find_by_name(name).should == nil
end

Then(/^I should see a link "(.*?)"$/) do |link|
  page.should have_link(link)
end

Then(/^I should not see a link with "(.*?)"$/) do |link|
  page.should_not have_link(link)
end

