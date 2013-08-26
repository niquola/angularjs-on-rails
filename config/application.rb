require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module AngularOnRails
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec, :fixture => true, :controller_specs => false, :view_specs => false
    end

    config.assets.paths << Rails.root.join("vendor", "assets", "components")
    config.assets.paths << Rails.root.join("vendor", "assets", "components", "bootstrap", "less")
  end
end
