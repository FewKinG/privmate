module Privmate
  class EventsController < ApplicationController
    
    def index
      @events = PrivMate.config.event_class.find_events
      respond_to do |format|
	format.html
	format.js
      end
    end

    def show
      name = params[:id].to_sym
      @event = PrivMate.config.events[name]
      respond_to do |format|
	format.html
	format.js
      end
    end

  end
end
