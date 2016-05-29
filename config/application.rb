require File.expand_path('../boot', __FILE__)
require 'rails/all'

Bundler.require(*Rails.groups)

if ENV['RAILS_ENV'] == 'test'
  require 'simplecov'
  SimpleCov.start 'rails'
  puts "required simplecov"
end

module Heykamok
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
  end
end
