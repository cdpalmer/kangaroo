require File.expand_path('../boot', __FILE__)

require 'rails/all'
require_relative '../app/models/on_connect'

Bundler.require(:default, Rails.env)

module Kangaroo
  class Application < Rails::Application
    I18n.enforce_available_locales = false

    config.remote_movie_service = ::OnConnect.new
  end
end
