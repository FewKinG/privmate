require 'privmate'
require 'rails'

module Privmate
  class Engine < Rails::Engine
    
    config.widget_factory_name = "default factory name"
    config.mount_at = '/privmate'

    initializer "load config" do |app|
      config.mount_at += '/' unless config.mount_at.last == '/'
      require File.join(Rails.root, "config", "privmate_config.rb")
    end
  end
end
