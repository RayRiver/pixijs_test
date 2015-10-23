
# require scripts
scripts = [
  "engine/pixi"

  "init"

  "lib/functions"
  "lib/bump"

  "utils/input_manager"
  "utils/scene_manager"
  "utils/scene_base"
  "utils/game_object"
  "utils/entity_base"
  "utils/bump_world"

  "objects/player"
  "objects/block"

  "scenes/entry_scene"

]

# resources
resource_map = {
  bunny: "res/bunny.png"
  block: "res/block.png"
  player: "res/player.png"
  enemy: "res/enemy.png"
}

# require process
require_process = (scripts, i) ->
  if i == scripts.length
    load_resource_process()
    return
  script = scripts[i]
  ++i
  requirejs ["src/" + script + ".js"], ->
    require_process scripts, i

require_process scripts, 0

# load resource process
load_resource_process = ->
  for name, path of resource_map
    PIXI.loader.add(name, path)
    resources[name] = PIXI.loader.resources[name]
  PIXI.loader.load(main_process)

# main process
main_process = ->
  renderer = PIXI.autoDetectRenderer(800, 600)#, {backgroundColor: 0x1099bb})
  document.body.appendChild(renderer.view)

  utils.renderer = renderer

  utils.SceneManager.enterScene("EntryScene")

  current_t = 0
  animate = (t) ->
    requestAnimationFrame(animate)

    dt = (t - current_t) / 1000
    current_t = t

    utils.SceneManager.update(dt)

    # render the container
    scene = utils.SceneManager.getRunningScene()
    renderer.render(scene.getRenderer())

  # start animating
  animate(current_t)


