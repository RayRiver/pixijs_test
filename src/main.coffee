
# require scripts
scripts = [
  "engine/pixi.js"

  "init.js"

  "utils/scene_manager.js"
  "utils/scene_base.js"

  "scenes/entry_scene.js"

]

# resources
resources = [

]

# require process
require_process = (scripts, i) ->
  if i == scripts.length
    load_resource_process()
    return
  script = scripts[i]
  ++i
  requirejs ["src/" + script], ->
    require_process scripts, i

require_process scripts, 0

# load resource process
load_resource_process = ->
  PIXI.loader
    .add("res/bunny.png")
    .load(main_process)

# main process
main_process = ->
  renderer = PIXI.autoDetectRenderer(400, 300)#, {backgroundColor: 0x1099bb})
  document.body.appendChild(renderer.view)

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


