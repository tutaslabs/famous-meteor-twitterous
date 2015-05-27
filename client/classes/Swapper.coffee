Meteor.startup  ->

  class App.Swapper extends Famous.Node

    constructor: (@options) ->
      super @options
      @build()

    build: ->
# create a new dom element
      @el = new Famous.DOMElement(this)

# store the current section
      @currentSection = null

# create the sections
      @sections = @createSections(this)

    createSections: (node) ->
      result = {}

# iterate over all the sections in our data
      App.data.sections.forEach (section, i) =>
        child = node.addChild()
        result[section.id] =
          align: new Famous.Align child
          section: child.addChild(new App.Section(i))
      return result

    onReceive: (event,payload) ->
      if event is 'changeSection'
          @changeSection(payload.id)


    changeSection: (to) ->
# Swap out any section that isn't the new section
# and swap in the new section

      App.data.sections.forEach (section) =>
          if section.id is to
#500 millisecond transition
            @sections[section.id].align.set 0, 0, 0, {duration: 200}
          else
# 1 in x will put the top left corner of the
# section directly off the screen
            @sections[section.id].align.set 1, 0, 0, {duration: 200}


      @currentSection = to