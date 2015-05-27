Meteor.startup  ->

  class App.Header extends Famous.Node

    constructor: (@options) ->
      super @options

      @build()

    build: ->

      @el = new Famous.DOMElement this,{ classes: ['header'] }

      @title = @addChild()
      @titleEl = new Famous.DOMElement(@title).setProperty('textAlign', 'center').setProperty('lineHeight', '100px').setProperty('fontSize', '30px')

#      @titleEl.setContent 'hello'

      @titlePosition = new Famous.Align(@title)

    onReceive: (event,payload) ->

      if event is'changeSection'
        @changeSection(payload.id)

    changeSection: (to) ->
#  -1 in Y will put the title directly above its parent
        @titlePosition.set 0, -1, 0, {duration: 250}, =>

# while the title is offscreen
# change the content
          @titleEl.setContent(to)

#align 0, 0, 0 places the title back into its parent
# exactly

          @titlePosition.set(0, 0, 0, {duration: 250})



