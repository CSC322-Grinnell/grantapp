Then /^(?:|I )should see a drop-down menu labeled "(.*)"$/ do |label|
  page.has_field?(label)
end

Then /^(?:|I )should see a check-box menu labeled "(.*)"$/ do |label|
  page.has_field?(label)
end

When /^(?:|I )follow one of the "([^"]*)" links$/ do |link|
  first(:link, link).click
end

When /^(?:|I )select "([^"]*)" from the drop-down menu labeled "(.*)"$/ do |option, label|
	page.find_field(label).select(option)
end

When /^(?:|I )select "([^"]*)" from the check-box menu labeled "(.*)"$/ do |option, label|
	page.check(option)
end

And /^(?:|I )should see that the "([^"]*)" is "([^"]*)"$/ do |field, value|
	page.text.should match(/#{field}.*#{value}/mi)
end


Then /^(?:|I )should see all applications with program "([^"]*)"$/ do |program|
	page.text.should match(/#{program}/mi) 
end 

And /^(?:|I )should see that the "([^"]*)" has "([^"]*)"$/ do |field, value|
	check = Program.where(title: value).first.id
	check = 'user_program_ids_' + check.to_s
	page.find("label[for=#{check}]").should have_checked_field(value)
end

