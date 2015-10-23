
class EntryScene extends utils.SceneBase
  constructor: ->
    super

    @_world = new utils.BumpWorld()

    block = new Block({
      world: @_world
      dynamic: true
      width: 40
      height: 40
    })
    block.setPosition(100, 100)
    @addChild(block)

    player = new Player({
      world: @_world
      dynamic: true
      width: 50
      height: 50
    })
    player.setPosition(40, 40)
    @addChild(player)
    @_player = player

    # todo keycode define
    speed = 200
    key_up = utils.InputManager.registerKey(87)
    key_up.press = -> player.setVelocity(null, -speed)
    key_up.release = -> player.setVelocity(null, 0)
    key_down = utils.InputManager.registerKey(83)
    key_down.press = -> player.setVelocity(null, speed)
    key_down.release = -> player.setVelocity(null, 0)
    key_left = utils.InputManager.registerKey(65)
    key_left.press = -> player.setVelocity(-speed, null)
    key_left.release = -> player.setVelocity(0, null)
    key_right = utils.InputManager.registerKey(68)
    key_right.press = -> player.setVelocity(speed, null)
    key_right.release = -> player.setVelocity(0, null)

  update: (dt) ->
    super

    @_player.update(dt)

    renderer = @getRenderer
    @_world.collide(0, 0, 500, 500) # todo

    @_player.updatePosition()

(exports ? this).EntryScene = EntryScene
