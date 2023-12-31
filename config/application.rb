require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Stockup
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.jwt_secret_key = ENV['JWT_SECRET_KEY']

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:3002', 'https://rmkaelbr.github.io/StockUp-React', 'https://rmkaelbr.github.io'  # React app origin.
        resource '*', headers: :any, methods: [:get, :post, :delete, :options]
      end
    end
  end
end
