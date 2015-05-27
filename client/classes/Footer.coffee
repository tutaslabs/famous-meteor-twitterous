Meteor.startup  ->

  class App.Footer extends Famous.Node

    constructor: (@options) ->
      super @options
      @numSections = App.data.sections.length
      @build()

    build: ->
# object to store the buttons
      @buttons = {}

# for every section create a NavButton
# and set its size and align

      App.data.sections.forEach  (section, i) =>
        @buttons[section.id] = @addChild(new App.NavButton(section.id)).setProportionalSize(1 / @numSections).setAlign(i / @numSections)
