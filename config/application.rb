require_relative "boot"

require "rails/all"
require "csv"

Bundler.require(*Rails.groups)

module FramgiaProject
  class Application < Rails::Application
    config.serve_static_assets = true
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
