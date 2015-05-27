Template.main.rendered = ->

  $(".famous-container").remove()
  div = document.createElement('div')
  div.className += "famous-container"

  document.body.appendChild(div)
  scene = Famous.Engine.createScene('div')

  scene.addChild new App.Twitterus()
  Famous.Engine.init()

