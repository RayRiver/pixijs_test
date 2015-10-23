
class BumpWorld extends lib.Bump
  collision: (item1, item2, dx, dy) ->
    [x, y] = item1.getDesiredPos()
    item1.setDesiredPos(x + dx, y + dy)

  endCollision: (item1, item2) ->

  shouldCollide: (item1, item2) ->
    tag1 = item1.getTag()
    tag2 = item2.getTag()
    if tag1 == "Player" and tag2 == "Block"
      true
    else
      false

  getBBox: (item) -> item.getBBox()

  update: (dt, x, y, w, h) ->
    @collide(x, y, w, h)

utils.BumpWorld = BumpWorld
