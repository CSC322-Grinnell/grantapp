Then /^(?:|I )should see a drop-down menu labeled "(.*)"$/ do |label|
  page.has_field?(label).value.should == content
end