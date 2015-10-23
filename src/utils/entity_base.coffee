
class EntityBase extends utils.GameObject
  constructor: ->
    super

    @_x = 0
    @_y = 0
    @_vx = 0
    @_vy = 0
    @_scale_x = 1
    @_scale_y = 1

  setPosition: (x, y) ->
    @_x = x ? @_x
    @_y = y ? @_y

    renderer = @getRenderer()
    if renderer
      renderer.position.x = @_x
      renderer.position.y = @_y

  getPosition: -> [@_x, @_y]

  setScale: (scale_x, scale_y) ->
    @_scale_x = scale_x ? @_scale_x
    @_scale_y = scale_y ? @_scale_y

    renderer = @getRenderer()
    if renderer
      renderer.scale.x = @_scale_x
      renderer.scale.y = @_scale_y

  getScale: -> [@_scale_x, @_scale_y]

  setVelocity: (vx, vy) ->
    @_vx = vx ? @_vx
    @_vy = vy ? @_vy

  getVelocity: -> [@_vx, @_vy]

utils.EntityBase = EntityBase
