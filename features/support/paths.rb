# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
# :nocov:

module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /^the home\s?page$/
      '/'

    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    when /^the admin log\s?in page$/
      new_admin_user_session_path

    when /^the user sign\s?in page$/
      new_user_session_path

    when /^admin dashboard$/
      admin_root_path

    when /^create program page$/
      new_program_path
 
    when /^programs page$/
      programs_path

    when /the details page for "(.*)"/
      '/programs/' + (Program.find_by_title($1).id).to_s

    when /the user admin page$/
      '/admin/users'

    when /the admin details page for "(.*)"/
      '/admin/users/' + (User.find_by_email($1).id).to_s




    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
# :nocov:
