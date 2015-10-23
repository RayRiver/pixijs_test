
lib.assert = ->
  console.assert(arguments...)

lib.log = ->
  console.log(arguments...)

Math.lerp = (min, max, p) ->
  lib.assert(min <= max)
  lib.assert(p >= 0 and p <= 1)
  min + (max - min) * p

Math.clamp = (val, min, max) ->
  lib.assert(min <= max)
  if val < min
    min
  else if val > max
    max
  else
    val

