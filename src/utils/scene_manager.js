// Generated by CoffeeScript 1.10.0
(function() {
  var M, global;

  global = this;

  M = {
    _scene_stack: [],
    update: function(dt) {
      var scene;
      scene = this.getRunningScene();
      if (scene) {
        scene.update(dt);
      }
    },
    enterScene: function(name) {
      var SceneClass, running_scene, scene;
      if (!global[name]) {
        alert("no scene called [" + name + "]");
        return;
      }
      running_scene = this.getRunningScene();
      if (running_scene) {
        running_scene.destroy();
        this._scene_stack.pop();
      }
      SceneClass = global[name];
      scene = new SceneClass();
      if (scene) {
        this._scene_stack.push(scene);
      }
    },
    getRunningScene: function() {
      var length, scene, scene_stack;
      scene_stack = this._scene_stack;
      length = scene_stack.length;
      if (length > 0) {
        scene = scene_stack[length - 1];
      }
      return scene;
    }
  };

  utils.SceneManager = M;

}).call(this);

//# sourceMappingURL=scene_manager.js.map
