function PrivmateButton(element, options) {

  var me = this

  /* Methods */

  me.showEvents = function(fadeTime) {
    if (me.cb_show) {
      me.cb_show(me)
    }
    if (me.privmate_container && me.privmate_container.is(':hidden')) {
      me.privmate_container.fadeIn(fadeTime ? fadeTime : 500)
    }
  }

  me.hideEvents = function(fadeTime) {
    if (me.privmate_container && !me.privmate_container.is(':hidden')) {
      me.privmate_container.fadeOut(fadeTime ? fadeTime : 500, function() {me.cb_hide(me)})
    }
  }

  me.toggleEvents = function(fadeTime) {
    if (me.isShowingEvents()) {
      me.hideEvents(fadeTime)
    } else {
      me.showEvents(fadeTime)
    }
  }

  me.clearEvents = function() {
    if (me.list_events) {
      me.event_container.html('')
    } else {
      $(".event_name", me.event_container).html('')
      $(".event_description", me.event_container).html('')
    }
    me.element.removeClass('active')
  }

  me.addEvent = function(name, description, url) {
    if (me.event_container) {
      var e = me.event_container
      if (me.list_events) {
	e = me.list_event_template.clone()
	me.event_container.append(e)	
	e.show()
      } else {
	e.unbind(me.cb_event_click)
      }
      $(".event_name", e).html(name)
      $(".event_description", e).html(description)
      e.data("event-url", url)
      e.click(function() {
	me.cb_event_click(e)	
      })
    }
    if (!me.isShowingEvents()) {
      me.element.addClass('active')
      clearTimeout(me.obj_highlight_timeout)
      if (me.highlight_time > 0) {
	me.obj_highlight_timeout = setTimeout(function() {
	  me.element.removeClass('active')
	}, me.highlight_time * 1000)
      }
    }
  }

  me.hasNewEvents = function() {
    me.element.hasClass('active')
  }

  me.isShowingEvents = function() {
    if (!me.event_container) {
      return false
    }
    return !me.event_container.is(':hidden') 
  }

  // Event received
  me.receiveEvent = function(data) {
    if (!me.cb_on_event || me.cb_on_event(data, me) != false) {
      me.addEvent(data.name, data.description, data.url)
    }
  }

  /* Constructor */
  
  if (!options) {
    options = {}
  }

  var juggerPort = options["juggerPort"] ? options["juggerPort"] : 8080
  var user_id = options["userId"] ? options["userId"] : ":all:"
  var juggerKey = options["juggerKey"]

  me.cb_on_event = options["onEvent"]
  me.cb_button_click = options["onClick"]
  me.cb_show = options["onShow"]
  me.cb_hide = options["onHide"]
  me.cb_event_click = options["onEventClick"]

  me.element = element
  me.highlight_time = options["highlightTime"] ? options["highlightTime"] : 10
  me.list_events = options["listEvents"] ? options["listEvents"] : false
  me.event_container = options["eventContainer"] ? options["eventContainer"] : element
  me.privmate_container = options["privmateContainer"] ? options["privmateContainer"] : me.event_container
  me.list_event_template = options["listEventTemplate"] ? options["listEventTemplate"] : element

  me.element.click(function() {
    if (me.cb_button_click) {
      me.cb_button_click(me)
    }
    clearTimeout(me.obj_highglight_timeout)
    me.element.removeClass('active')  
  })

  me.juggernaut = new Juggernaut({port: juggerPort})
  
  jugger.subscribe("/privmate/" + user_id, me.receiveEvent, {
    key: juggerKey  
  }) 

}
