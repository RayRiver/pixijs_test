
global = this

M =
  _scene_stack: []

  update: (dt) ->
    scene = this.getRunningScene()
    scene.update(dt) if scene
    return

  enterScene: (name) ->
    if !global[name]
      alert "no scene called [" + name + "]"
      return

    running_scene = this.getRunningScene()
    if running_scene
      running_scene.destroy()
      this._scene_stack.pop()

    SceneClass = global[name]
    scene = new SceneClass()
    this._scene_stack.push(scene) if scene

    return

  getRunningScene: ->
    scene_stack = this._scene_stack
    length = scene_stack.length
    scene = scene_stack[length - 1] if length > 0
    scene

utils.SceneManager = M
