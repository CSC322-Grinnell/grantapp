When /^(?:|I )click on Show for the "([^"]*)" program$/ do |program|
  page.find_link('Show').click
 end


Then /^(?:|I )should see a link to "([^"]*)"$/ do |text|
    page.has_link?(text)
end

Then(/^I should see an app for "(.*?)" with "(.*?)"$/) do |program, text|
  page.has_content?(/#{program}.*#{text}/m)
end