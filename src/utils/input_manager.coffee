
M = {
  registerKey: (keyCode) ->
    key =
      code: keyCode
      isDown: false
      isUp: true
      press: undefined
      release: undefined

      downHandler: (event) ->
        if event.keyCode == key.code
          key.press() if key.isUp and key.press
          key.isDown = true
          key.isUp = false
        event.preventDefault()

      upHandler: (event) ->
        if event.keyCode == key.code
          key.release() if key.isDown and key.release
          key.isDown = false
          key.isUp = true
        event.preventDefault()

    window.addEventListener("keydown", key.downHandler.bind(key), false)
    window.addEventListener("keyup", key.upHandler.bind(key), false)

    key
}

utils.InputManager = M
