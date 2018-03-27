require_relative 'boot'

require 'rails/all'
# OlivR - import data from Excel
require 'csv'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cashoo
  class Application < Rails::Application
	
    # Oliv - enable internationalization 
    # will also require internationalization of web pages 
    # enable translation of pages content and texts 
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
	# config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
	# config.i18n.default_locale = :en


    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
