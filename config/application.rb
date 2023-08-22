require_relative "boot"
require "rails"

Bundler.require(*Rails.groups)

module GrowCurriculumBackend
  class Application < Rails::Application
    config.load_defaults 7.0

  end
end
