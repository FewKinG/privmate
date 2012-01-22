module Privmate

  class EventsBuilder
      
    attr_accessor :events

    def initialize
      self.events = {}
    end

    def event(id, &block)
      event = Privmate::Event.build(id, &block)
      raise "Invalid event specified" unless event
      self.events[id] = event
    end

  end

end
