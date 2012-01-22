module Privmate
  
  class Config
   
    attr_accessor :events
    attr_accessor :event_class

    def self.build(&block)
      cb = ConfigBuilder.new
      cb.instance_eval(&block)
      cb.config
    end

    class ConfigBuilder

      attr_accessor :config

      def initialize()
	self.config = Config.new
      end

      def events(&block)
	builder = Privmate::EventsBuilder.new
	builder.instance_eval(&block)
	config.events = builder.events
      end

      def event_class(klass)
	config.event_class = klass
      end

    end

  end

end
