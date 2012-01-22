require "privmate/version"
require 'active_support/all'
require 'engine'

module Privmate
  extend ActiveSupport::Autoload

  autoload :Config
  autoload :Event
  autoload :EventsBuilder
  autoload :PrivMate
  autoload :Jugger

end

