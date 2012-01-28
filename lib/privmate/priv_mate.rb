module Privmate

  class PrivMate

    cattr_accessor :config

    def self.prepare_channel(user_id) 
      Jugger.prepare_channel(user_id)
    end

    def self.setup(&block)
      self.config = Privmate::Config.build(&block)
    end

    def self.trigger_event(id, user = nil)
      user ||= config.event_class.current_user
      event = config.event_class.new(:id => id, :user_id => user.id, :created => Time.now)
      if event.save
	Jugger.publish(event)
      end
    end

    def self.event(id)
      self.config.events[id.to_sym]
    end

  end

end
