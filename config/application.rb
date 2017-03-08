require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatSpace
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.generators do |g|
      g.stylesheets false
      g.javascripts false
      g.helper false
      g.test_framework :rspec,
                      view_specs: false,
                      helper_specs: false,
                      fixture: true,
                      fixture_replacement: :factory_girl,
                      routing_specs: false,
                      integration_tool: false
    end
  end
end



