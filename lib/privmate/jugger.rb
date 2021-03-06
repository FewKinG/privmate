module Privmate

  class Jugger

    def self.publish(event)
      return unless Juggernaut
      channel = ["/privmate/" + event.user_id] 
      event = PrivMate.config.events[event.id]
      Juggernaut.publish([channel], {
	:name => event.name,
	:description => event.description,
	:url => Rails.application.routes.url_helpers.privmate_event_path(event.id)
      })
    end

    def self.prepare_channel(user_id)
      return unless Juggernaut
      channel = ["/privmate/" + user_id] 
      Juggernaut.create_key(channel)
    end

  end

end
