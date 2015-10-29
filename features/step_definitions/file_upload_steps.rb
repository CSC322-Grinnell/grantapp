When /^(?:|I )attach the file "([^"]*)" to "([^"]*)"$/ do |path, field|
  attach_file(field, File.expand_path(path))
end


# When /^(?:|I ) upload a file called "([^"]*)" to "([^"]*)"$/ do |file, field|
#     attach_file(field, File.join(RAILS_ROOT, 'features', 'test_files', file))
# end

 When /^I upload a file called "genapp.pdf" to "Rubric"$/ do 
      attach_file 'program_rubric', File.join(Rails.root, 'features', 'test_files', "genapp.pdf")
 end
