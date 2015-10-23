// Generated by CoffeeScript 1.10.0
(function() {
  var EntryScene,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  EntryScene = (function(superClass) {
    extend(EntryScene, superClass);

    function EntryScene() {
      var Input, block, edge, edge_border, edge_dynamic, player, size, world;
      EntryScene.__super__.constructor.apply(this, arguments);
      this._world = new utils.BumpWorld();
      size = {
        width: utils.renderer.width,
        height: utils.renderer.height
      };
      edge_border = 10;
      edge_dynamic = true;
      world = this._world;
      edge = new Block({
        world: world,
        dynamic: edge_dynamic,
        width: edge_border,
        height: size.height
      });
      edge.setPosition(edge_border / 2, size.height / 2);
      this.addChild(edge);
      edge = new Block({
        world: world,
        dynamic: edge_dynamic,
        width: edge_border,
        height: size.height
      });
      edge.setPosition(size.width - edge_border / 2, size.height / 2);
      this.addChild(edge);
      edge = new Block({
        world: world,
        dynamic: edge_dynamic,
        width: size.width - 2 * edge_border,
        height: edge_border
      });
      edge.setPosition(size.width / 2, edge_border / 2);
      this.addChild(edge);
      edge = new Block({
        world: world,
        dynamic: edge_dynamic,
        width: size.width - 2 * edge_border,
        height: edge_border
      });
      edge.setPosition(size.width / 2, size.height - edge_border / 2);
      this.addChild(edge);
      block = new Block({
        world: this._world,
        dynamic: true,
        width: 40,
        height: 40
      });
      block.setPosition(300, 300);
      this.addChild(block);
      player = new Player({
        world: this._world,
        dynamic: true,
        width: 32,
        height: 32
      });
      player.setPosition(100, 100);
      this.addChild(player);
      this._player = player;
      Input = utils.Input;
      Input.registerArrowKey(Input.KEY_W, "up");
      Input.registerArrowKey(Input.KEY_S, "down");
      Input.registerArrowKey(Input.KEY_A, "left");
      Input.registerArrowKey(Input.KEY_D, "right");
    }

    EntryScene.prototype.update = function(dt) {
      var Input, dx, dy, horizontal, player_x, player_y, ref, renderer, speed, target_x, target_y, vertical, x, y;
      EntryScene.__super__.update.apply(this, arguments);
      Input = utils.Input;
      horizontal = Input.getAxis("Horizontal");
      vertical = Input.getAxis("Vertical");
      speed = 20000;
      this._player.setVelocity(horizontal * speed * dt, vertical * speed * dt);
      this._player.update(dt);
      this._world.collide(0, 0, utils.renderer.width, utils.renderer.height);
      this._player.updatePosition();
      ref = this._player.getPosition(), player_x = ref[0], player_y = ref[1];
      renderer = this.getRenderer();
      x = renderer.x;
      y = renderer.y;
      target_x = -player_x + utils.renderer.width / 2;
      target_y = -player_y + utils.renderer.height / 2;
      dx = Math.lerp(0, target_x - x, 0.1);
      dy = Math.lerp(0, target_y - y, 0.1);
      renderer.x += dx;
      return renderer.y += dy;
    };

    return EntryScene;

  })(utils.SceneBase);

  (typeof exports !== "undefined" && exports !== null ? exports : this).EntryScene = EntryScene;

}).call(this);

//# sourceMappingURL=entry_scene.js.map
