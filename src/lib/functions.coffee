
lib.assert = ->
  console.assert(arguments...)

lib.log = ->
  console.log(arguments...)

Math.clamp = (v, a, b) ->
  if a <= b
    if v < a
      a
    else if v > b
      b
    else
      v
  else
    if v < b
      b
    else if v > a
      a
    else
      v

Math.lerp = (a, b, p) ->
  p = Math.clamp(p, 0, 1)
  if a <= b
    a + (b - a) * p
  else
    b + (a - b) * (1 - p)


