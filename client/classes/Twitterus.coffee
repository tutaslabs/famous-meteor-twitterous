Meteor.startup  ->

  class App.Twitterus extends Famous.Node

    constructor: (@mount) ->
      super @mount

      @build()

    build: ->
      @currentSection = App.data.sections[0].id
      @makeHeader this
      @makeFooter this
      @makeSwapper this

    makeHeader: (node) ->
# the header will be positioned defaultly
# along the top of its parent.
# It will be the complete width of its parent
# and 100 pixels tall.

      node.addChild()
      .setSizeMode('default', 'absolute')
      .setAbsoluteSize(null, 100)
      .addChild new App.Header()

    makeFooter: (node) ->
# the footer will be aligned
# to the bottom of its parent.
# Like the header it will be
# 100px tall and the complete width.
# note how we use MountPoint and Align
# together to line up the bottom of the footer
# with the bottom of the parent

      node.addChild()
      .setSizeMode('default', 'absolute')
      .setAbsoluteSize(null, 100)
      .setMountPoint(0, 1)
      .setAlign(0, 1)
      .addChild new App.Footer()

    makeSwapper: (node) ->
# the swapper will be 200 pixels smaller than
# its parent in Y and otherwise the same size.
# It will be position 100 pixels below its parent
# such that it clears the header

      node.addChild()
      .setDifferentialSize(null, -200)
      .setPosition(0, 100)
      .addChild new App.Swapper()

    onReceive: (event,payload) ->
# if the event is click then we know
# that a NavButton was clicked
# (NavButtons are the only element)
# With the click event.
      if event is 'click'

# get the id of the nav butt
        to = payload.node.getId() #used by buttons (the div)
        id = payload.node.id #used by header / swapper (name of button)

        @emit 'changeSection',
          from: this.currentSection
          to: to
          id: id

#set the current section
        @currentSection = to



    onMount: (parent,id) ->
      `Famous.Node.prototype.onMount.call(this, parent, id);`
      @emit 'changeSection',
        from: null
        to: @currentSection
        id: @currentSection