# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'simplecov'
SimpleCov.start
# Gem is broken, waiting on Issue to be fixed.
# SimpleCov.start 'rails' do
#     require 'simplecov-badge'
#     # add your normal SimpleCov configs
#     add_filter "/app/admin/"
#     # configure any options you want for SimpleCov::Formatter::BadgeFormatter
#     SimpleCov::Formatter::BadgeFormatter.generate_groups = true
#     SimpleCov::Formatter::BadgeFormatter.strength_foreground = true
#     SimpleCov::Formatter::BadgeFormatter.timestamp = true
#     # call SimpleCov::Formatter::BadgeFormatter after the normal HTMLFormatter
#     SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
#         SimpleCov::Formatter::HTMLFormatter,
#         SimpleCov::Formatter::BadgeFormatter,
#     ]
# end

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :active_record
    with.library :active_model
    with.library :action_controller
    with.library :rails
  end
end
