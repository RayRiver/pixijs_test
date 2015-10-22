
class SceneBase
  constructor: ->
    @_renderer = new PIXI.Container()

  destroy: ->
    @_renderer = null

  update: (dt) ->

  getRenderer: -> @_renderer

  addChildRenderer: (child_renderer) ->
    @_renderer.addChild(child_renderer)
    @

  addChild: (child) ->
    child_renderer = child.getRenderer()
    @addChildRenderer(child_renderer)
    @

utils.SceneBase = SceneBase

