module Privmate

  class PrivMate

    cattr_accessor :config

    def self.setup(&block)
      self.config = Privmate::Config.build(&block)
    end

    def self.trigger_event(id)
      event = config.event_class.new(:id => id, :user_id => config.event_class.current_user.id, :created => Time.now)
      if event.save
	Jugger.publish(event)
      end
    end

    def self.event(id)
      self.config.events[id.to_sym]
    end

  end

end
