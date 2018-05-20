require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    $redis = Redis.new(host: 'localhost', port: 6379)

    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '**', '*.{rb,yml}')]
    config.i18n.default_locale = :'zh-CN'
    config.time_zone = 'Beijing'
    config.active_record.default_timezone = :local

    # Defined un-need generate files.
    config.generators do |g|
      g.system_tests false
      g.stylesheets false
      g.javascripts false
      g.jbuilder false
    end

    # Grape configuration
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

  end
end
