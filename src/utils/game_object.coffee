
global = this

class GameObject
  constructor: ->
    @_renderer = null
    @_components = {}
    @_tag = "Default"

  destroy: ->
    @removeAllComponents()
    @setRenderer(null)

  update: (dt) ->
    com.update(dt) for name, com of @_components

  addComponent: (name, config) ->
    if @_components[name]
      lib.assert(false, "component [" + name + "] already exists")
      return

    com_class = global.components[name]
    if !com_class
      lib.assert(false, "component class not exist: " + name)
      return

    com = new com_class()
    cc.asert(com)
    @_components[name] = com
    com.attach(@)

    @

  removeComponent: (name) ->
    com = @_components[name]
    if !com
      lib.assert(false, "cannot remove component not exist: " + name)
      return

    @_components.remove(name)
    com.detach()

    @

  removeAllComponents: ->
    com.detach() for name, com of @._components
    @_components.clear()

  getComponent: (name) ->
    @_components[name]

  getRenderer: ->
    return @_renderer

  setRenderer: (renderer) ->
    if @_renderer
      @_renderer = null

    if renderer
      @_renderer = renderer

  setTag: (tag) -> @_tag = tag
  getTag: -> @_tag

utils.GameObject = GameObject
