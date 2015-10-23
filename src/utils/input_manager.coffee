
Input = {
  KEY_W: 87
  KEY_S: 83
  KEY_A: 65
  KEY_D: 68

  _down_keys: {}
  _arrow_up_key: null
  _arrow_down_key: null
  _arrow_left_key: null
  _arrow_right_key: null

  registerArrowKey: (keyCode, direction) ->
    key = @registerKey(keyCode)

    if direction == "left"
      @_arrow_left_key = key
    else if direction == "right"
      @_arrow_right_key = key
    else if direction == "up"
      @_arrow_up_key = key
    else if direction == "down"
      @_arrow_down_key = key

  registerKey: (keyCode) ->
    input = this

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
          input._down_keys[keyCode] = true
        event.preventDefault()

      upHandler: (event) ->
        if event.keyCode == key.code
          key.release() if key.isDown and key.release
          key.isDown = false
          key.isUp = true
          input._down_keys[keyCode] = false
        event.preventDefault()

    window.addEventListener("keydown", key.downHandler.bind(key), false)
    window.addEventListener("keyup", key.upHandler.bind(key), false)

    key

  getAxis: (name) ->
    if name == "Vertical"
      vertical = 0

      if @_arrow_up_key.isDown
        vertical -= 1
      else if @_arrow_down_key.isDown
        vertical += 1

      return vertical

    else if name == "Horizontal"
      horizontal = 0

      if @_arrow_left_key.isDown
        horizontal -= 1
      else if @_arrow_right_key.isDown
        horizontal += 1

      return horizontal

    else
      lib.assert(false)

  getKey: (keyCode) ->
    if @_down_keys[keyCode]
      true
    else
      false

}

utils.Input = Input
