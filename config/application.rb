require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

         
module Grantapp
  
  class Application < Rails::Application
    config.time_zone = "Central Time (US & Canada)"
    config.active_record.default_timezone = :local
    config.active_record.raise_in_transactional_callbacks = true
    
    config.generators do |g|
      g.test_framework :rspec
    end
  end
  
end
