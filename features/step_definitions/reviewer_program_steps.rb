Then /^(?:|I )should see a drop-down menu labeled "(.*)"$/ do |label|
  page.has_field?(label)
end

When /^(?:|I )follow one of the "([^"]*)" links$/ do |link|
  first(:link, link).click
end

When /^(?:|I )select "([^"]*)" from the drop-down menu labeled "(.*)"$/ do |option, label|
	page.find_field(label).select(option)
end

And /^(?:|I )should see that the "([^"]*)" is "([^"]*)"$/ do |field, value|
	page.text.should match(/#{field}.*#{value}/mi)
end

