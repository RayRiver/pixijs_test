// Generated by CoffeeScript 1.10.0
(function() {
  var EntityBase,
    extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
    hasProp = {}.hasOwnProperty;

  EntityBase = (function(superClass) {
    extend(EntityBase, superClass);

    function EntityBase() {
      EntityBase.__super__.constructor.apply(this, arguments);
      this._x = 0;
      this._y = 0;
      this._vx = 0;
      this._vy = 0;
      this._scale_x = 1;
      this._scale_y = 1;
    }

    EntityBase.prototype.setPosition = function(x, y) {
      var renderer;
      this._x = x != null ? x : this._x;
      this._y = y != null ? y : this._y;
      renderer = this.getRenderer();
      if (renderer) {
        renderer.position.x = this._x;
        return renderer.position.y = this._y;
      }
    };

    EntityBase.prototype.getPosition = function() {
      return [this._x, this._y];
    };

    EntityBase.prototype.setScale = function(scale_x, scale_y) {
      var renderer;
      this._scale_x = scale_x != null ? scale_x : this._scale_x;
      this._scale_y = scale_y != null ? scale_y : this._scale_y;
      renderer = this.getRenderer();
      if (renderer) {
        renderer.scale.x = this._scale_x;
        return renderer.scale.y = this._scale_y;
      }
    };

    EntityBase.prototype.getScale = function() {
      return [this._scale_x, this._scale_y];
    };

    EntityBase.prototype.setVelocity = function(vx, vy) {
      this._vx = vx != null ? vx : this._vx;
      return this._vy = vy != null ? vy : this._vy;
    };

    EntityBase.prototype.getVelocity = function() {
      return [this._vx, this._vy];
    };

    return EntityBase;

  })(utils.GameObject);

  utils.EntityBase = EntityBase;

}).call(this);

//# sourceMappingURL=entity_base.js.map
