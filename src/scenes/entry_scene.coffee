
class EntryScene extends utils.SceneBase
  constructor: ->
    super

    @_world = new utils.BumpWorld()


    size =
      width: 800
      height: 600

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

    speed = 20000
    @_player.setVelocity(horizontal * speed * dt, vertical * speed * dt)

    @_player.update(dt)

    @_world.collide(0, 0, 800, 600) # todo

    @_player.updatePosition()

    [x, y] = @_player.getPosition()

    renderer = @getRenderer()
    renderer.x = -x+400
    renderer.y = -y+300

(exports ? this).EntryScene = EntryScene
