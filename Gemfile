source 'https://rubygems.org'
ruby "2.3.4"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
#Rails bootstrap sortable
gem 'momentjs-rails'
gem 'rails_bootstrap_sortable'
# Twitter Bootstrap for UI and navigation bar
gem 'bootstrap-sass'
# File Uploads
gem 'paperclip'
gem 'aws-sdk', '< 2.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# Used for admin side management
gem 'activeadmin', github:'activeadmin'
# Enforce Ruby style guidelines
#gem 'rubocop'
gem 'rubocop', '~> 0.46.0', require: false
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Unicorn as the app server
# gem 'unicorn'
gem 'devise'
#local environment variable shenanigans for using bucket without pushing secret AWS key to Git
gem 'figaro', "~> 0.7.0"
#Use CanCan for user authorization
gem "cancan"
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
#Enum for declaring different admin roles
gem 'enum', '~> 1.0'

group :development, :test do
  gem 'sqlite3'
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'cucumber-rails-training-wheels'
  gem 'rspec'
  gem 'rspec-rails'
  #Uncomment this gem if using rails 2.0.0 or later
  gem 'byebug'
  gem 'gherkin'
  gem 'multi_test', '>= 0.1.2' 
  gem 'database_cleaner'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Gem for test coverage
gem 'simplecov', :require => false, :group => :test


# Ruby parser gem needed for ruby 2.3.0
gem 'parser', '~> 2.2', '>= 2.2.3.0'