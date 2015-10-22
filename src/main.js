// Generated by CoffeeScript 1.10.0
(function() {
  var load_resource_process, main_process, require_process, resources, scripts;

  scripts = ["engine/pixi.js", "init.js", "utils/scene_manager.js", "utils/scene_base.js", "scenes/entry_scene.js"];

  resources = [];

  require_process = function(scripts, i) {
    var script;
    if (i === scripts.length) {
      load_resource_process();
      return;
    }
    script = scripts[i];
    ++i;
    return requirejs(["src/" + script], function() {
      return require_process(scripts, i);
    });
  };

  require_process(scripts, 0);

  load_resource_process = function() {
    return PIXI.loader.add("res/bunny.png").load(main_process);
  };

  main_process = function() {
    var animate, current_t, renderer;
    renderer = PIXI.autoDetectRenderer(400, 300);
    document.body.appendChild(renderer.view);
    utils.SceneManager.enterScene("EntryScene");
    current_t = 0;
    animate = function(t) {
      var dt, scene;
      requestAnimationFrame(animate);
      dt = (t - current_t) / 1000;
      current_t = t;
      utils.SceneManager.update(dt);
      scene = utils.SceneManager.getRunningScene();
      return renderer.render(scene.getRenderer());
    };
    return animate(current_t);
  };

}).call(this);

//# sourceMappingURL=main.js.map
