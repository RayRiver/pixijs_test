
class Block extends utils.EntityBase
  constructor: (config) ->
    super

    @setTag("Block")

    config = config ? {}
    w = config.width ? 30
    h = config.height ? 30
    dynamic = config.dynamic ? false

    @_world = config.world
    @_width = w
    @_height = h

    renderer = new PIXI.Sprite(resources["block"].texture)
    @setRenderer(renderer)

    renderer.width = w
    renderer.height = h

    renderer.anchor.x = 0.5
    renderer.anchor.y = 0.5

    if @_world
      if dynamic
        @_world.add(@)
      else
        @_world.addStatic(@)

  update: (dt) ->
    super

  getBBox: ->
    [x, y] = @getPosition()
    w = @_width
    h = @_height
    [x-w/2, y-h/2, w, h]

(exports ? this).Block = Block
