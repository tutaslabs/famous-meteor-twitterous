Template.main.rendered = ->

  scene = Famous.Engine.createScene()

  scene.addChild new App.Twitterus()
  Famous.Engine.init()

