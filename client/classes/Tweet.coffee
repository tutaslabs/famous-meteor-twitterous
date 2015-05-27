Meteor.startup  ->

  class App.Tweet extends Famous.Node

    constructor: (@options) ->
      super @options
      @build()

    build: ->
# create a new DOMElement and style it.
      @el = new Famous.DOMElement(this)
        .setProperty('backgroundColor', @getRandomColor())
        .setProperty('boxSizing', 'border-box')
        .setProperty('lineHeight', '100px')
        .setProperty('borderBottom', '1px solid black')
        .setProperty('font-size', '12px')
        .setContent(@getRandomMessage())


# Pick a random element from an array

    random: (array) ->
        array[(Math.random() * array.length)|0]



# create Random message
    getRandomMessage: ->
      gender = Random.choice(['men', 'women'])
      num = _.random(0, 50)
      avatarUrl = 'https://randomuser.me/api/portraits/thumb/' + gender + '/' + num + '.jpg'

#      m = '<b><div class="icon"><img src="' + avatarUrl + '"></div>'+ @random(App.data.usernames)  + @random(App.data.begin) + @random(App.data.middle) + @random(App.data.end) + ' ' + @random(App.data.hashtags)
      m = '<b><div class="icon"><img src="' + avatarUrl + '"></div>'+ @random(App.data.usernames) + @random(App.data.begin)

# Create a random hex color
    getRandomColor: ->
# trick to create a range.



      r = '#'+@random('0123456789ABCDEF')+@random('0123456789ABCDEF')+@random('0123456789ABCDEF')+@random('0123456789ABCDEF')+@random('0123456789ABCDEF')+@random('0123456789ABCDEF')
      return r