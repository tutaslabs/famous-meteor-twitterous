Meteor.startup  ->

  class App.NavButton extends Famous.Node

    constructor: (@id) ->
      super @id

      @build()

    build: ->

# make and style an element
      @el = @makeEl(this)
      @addUIEvent 'click'

# hold the id of the section
# this NavButton points to.

#    @id = id

#set the content of the element
#to the target section.

      @el.setContent @id

    makeEl: (node) ->
      new Famous.DOMElement node,
        properties:
          textAlign: 'center'
          lineHeight: '100px'
          fontSize: '18px'
          cursor: 'pointer'
        classes: ['navigation']
    on: ->
      @el.removeClass('off').addClass('on')
    off: ->
      @el.removeClass('on').addClass('off')

    onReceive: (event,payload) ->
        if event is 'changeSection'
# swap on/off depend if this button points
# to the apps current section

          if payload.to is this.getId()
            @on()
          else
            @off()
