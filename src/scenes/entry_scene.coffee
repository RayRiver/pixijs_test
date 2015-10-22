
class EntryScene extends utils.SceneBase
  constructor: ->
    super

    # create a texture from an image path
    #texture = PIXI.Texture.fromImage('./res/bunny.png')

    # create a new Sprite using the texture
    bunny = new PIXI.Sprite( PIXI.loader.resources["res/bunny.png"].texture)

    # center the sprite's anchor point
    bunny.anchor.x = 0.5
    bunny.anchor.y = 0.5

    # move the sprite to the center of the screen
    bunny.position.x = 200
    bunny.position.y = 150

    @addChildRenderer(bunny)

    @_bunny = bunny

  update: (dt) ->
    super

    @_bunny.rotation += 0.1

(exports ? this).EntryScene = EntryScene
