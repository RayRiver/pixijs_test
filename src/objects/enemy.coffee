
class Enemy extends utils.EntityBase
  constructor: (config) ->
    super

    @setTag("Enemy")

    config = config ? {}
    w = config.width ? 30
    h = config.height ? 30
    dynamic = config.dynamic ? false

    @_world = config.world
    @_width = w
    @_height = h

    renderer = new PIXI.Sprite(resources["enemy"].texture)
    @setRenderer(renderer)

    renderer.width = w
    renderer.height = h

    renderer.anchor.x = 0.5
    renderer.anchor.y = 0.5

    if @_world
      if dynamic
        @_world.add(this)
      else
        @_world.addStatic(this)

  update: (dt) ->
    super

    [x, y] = @getPosition()
    [vx, vy] = @getVelocity()

    x += vx * dt
    y += vy * dt

    @setDesiredPos(x, y)

  setDesiredPos: (x, y) ->
    @_desired_x = x ? @_desired_x
    @_desired_y = y ? @_desired_y

  getDesiredPos: ->
    [@_desired_x, @_desired_y]

  updatePosition: ->
    @setPosition(@_desired_x, @_desired_y)

  getBBox: ->
    [@_desired_x - @_width/2, @_desired_y - @_height/2, @_width, @_height]


(exports ? this).Enemy = Enemy
