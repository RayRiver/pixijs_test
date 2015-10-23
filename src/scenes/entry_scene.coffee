
class EntryScene extends utils.SceneBase
  constructor: ->
    super

    @_world = new utils.BumpWorld()


    size =
      width: utils.renderer.width
      height: utils.renderer.height

    # create edges
    edge_border = 10
    edge_dynamic = true
    world = @_world

    edge = new Block({world: world, dynamic: edge_dynamic, width: edge_border, height: size.height})
    edge.setPosition(edge_border/2, size.height/2)
    @addChild(edge)

    edge = new Block({world: world, dynamic: edge_dynamic, width: edge_border, height: size.height})
    edge.setPosition(size.width - edge_border/2, size.height/2)
    @addChild(edge)

    edge = new Block({world: world, dynamic: edge_dynamic, width: size.width - 2 * edge_border, height: edge_border})
    edge.setPosition(size.width/2, edge_border/2)
    @addChild(edge)

    edge = new Block({world: world, dynamic: edge_dynamic, width: size.width - 2 * edge_border, height: edge_border})
    edge.setPosition(size.width/2, size.height - edge_border/2)
    @addChild(edge)

    # create blocks
    block = new Block({
      world: @_world
      dynamic: true
      width: 40
      height: 40
    })
    block.setPosition(300, 300)
    @addChild(block)

    # create player
    player = new Player({
      world: @_world
      dynamic: true
      width: 32
      height: 32
    })
    player.setPosition(100, 100)
    @addChild(player)
    @_player = player

    # create enemy
    enemy = new Enemy({
      world: @_world
      dynamic: true
      width: 32
      height: 32
    })
    enemy.setPosition(400, 400)
    @addChild(enemy)
    @_enemy = enemy

    # keyboard input
    Input = utils.Input
    Input.registerArrowKey(Input.KEY_W, "up")
    Input.registerArrowKey(Input.KEY_S, "down")
    Input.registerArrowKey(Input.KEY_A, "left")
    Input.registerArrowKey(Input.KEY_D, "right")

  update: (dt) ->
    super

    Input = utils.Input
    horizontal = Input.getAxis("Horizontal")
    vertical = Input.getAxis("Vertical")

    speed = 200
    @_player.setVelocity(horizontal * speed, vertical * speed)
    @_player.update(dt)

    # simple enemy ai
    [player_x, player_y] = @_player.getPosition()
    [enemy_x, enemy_y] = @_enemy.getPosition()
    dx = player_x - enemy_x
    dy = player_y - enemy_y
    n = Math.sqrt(dx * dx + dy * dy)
    speed = 100
    vx = dx / n * speed
    vy = dy / n * speed
    @_enemy.setVelocity(vx, vy)
    @_enemy.update(dt)


    @_world.collide(0, 0, utils.renderer.width, utils.renderer.height)

    @_player.updatePosition()
    @_enemy.updatePosition()

    [player_x, player_y] = @_player.getPosition()

    # smooth camera move
    renderer = @getRenderer()
    x = renderer.x
    y = renderer.y
    target_x = -player_x + utils.renderer.width/2
    target_y = -player_y + utils.renderer.height/2
    dx = Math.lerp(0, target_x - x, 0.1)
    dy = Math.lerp(0, target_y - y, 0.1)
    renderer.x += dx
    renderer.y += dy

(exports ? this).EntryScene = EntryScene
