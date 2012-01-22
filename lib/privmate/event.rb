module Privmate
  
  class Event
   
    attr_accessor :id 
    attr_accessor :name
    attr_accessor :description
    attr_accessor :partial
    attr_accessor :text

    def initialize(id) 
      self.id = id
    end

    def self.build(id, &block)
      eb = EventBuilder.new(id)
      eb.instance_eval(&block)
      eb.valid? ? eb.event : nil
    end

    class EventBuilder

      attr_accessor :event
  
      def initialize(id)
	self.event = Event.new(id)
      end

      def name(str)
	event.name = str
      end

      def description(str)
	event.description = str
      end

      def partial(file, locals = {})
	raise "Content has already been defined" if instance_variable_defined?(:@content_set)
	event.partial = {:file => file, :locals => locals}
	instance_variable_set(:@content_set, true)
      end

      def text(str)
	raise "Content has already been defined" if instance_variable_defined?(:@content_set)
	event.text = str
	instance_variable_set(:@content_set, true)
      end

      def valid?
	event.id and event.name and event.description and instance_variable_defined?(:@content_set)
      end
    end
  end
end
