When /^(?:|I )attach the file "([^"]*)" to "([^"]*)"$/ do |path, field|
  attach_file(field, File.expand_path(path))
end


 When(/^I upload a file called "(.*?)" to rubric$/) do |file|
     attach_file 'program_rubric', File.join(Rails.root, 'features', 'test_files', file)
 end
 
 When(/^I upload a file called "(.*?)" to application form$/) do |file|
     attach_file 'program_application_form', File.join(Rails.root, 'features', 'test_files', file)
 end

When(/^I upload a file called "(.*?)" to upload application$/) do |file|
     attach_file 'app_user_app', File.join(Rails.root, 'features', 'test_files', file)
 end

# # When /^I upload a file called "genapp.pdf" to "Rubric"$/ do 
#       attach_file 'program_rubric', File.join(Rails.root, 'features', 'test_files', "genapp.pdf")
#  end
