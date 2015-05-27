Meteor.startup  ->

  class App.Section extends Famous.Node

    constructor: (@i) ->
      super @i
      @build()

    build: ->
# create and style a new DOMElement
      @el = new Famous.DOMElement(this).setProperty('overflow-y', 'scroll').setProperty('overflow-x', 'hidden')

# create the tweets in the section.
      @tweets = @createTweets this, @i



    createTweets: (node,id) ->
      result = []
      numberOfTweets = App.data.sections[id].tweetNumber


# create an array of length equal to the number of tweets and then
# map over it to create an array of tweets

      for i in [0...numberOfTweets]
# this node will be 100px tall and positioned after the previous one
# in the array
        tweet = node.addChild().setSizeMode('default', 'absolute').setAbsoluteSize(null, 100).setPosition(0, 100 * i).addChild(new App.Tweet())
        result.push(tweet)
      return result