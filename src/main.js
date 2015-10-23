// Generated by CoffeeScript 1.10.0
(function() {
  var load_resource_process, main_process, require_process, resource_map, scripts;

  scripts = ["engine/pixi", "init", "lib/functions", "lib/bump", "utils/input_manager", "utils/scene_manager", "utils/scene_base", "utils/game_object", "utils/entity_base", "utils/bump_world", "objects/player", "objects/block", "scenes/entry_scene"];

  resource_map = {
    bunny: "res/bunny.png",
    block: "res/block.png",
    player: "res/player.png"
  };

  require_process = function(scripts, i) {
    var script;
    if (i === scripts.length) {
      load_resource_process();
      return;
    }
    script = scripts[i];
    ++i;
    return requirejs(["src/" + script + ".js"], function() {
      return require_process(scripts, i);
    });
  };

  require_process(scripts, 0);

  load_resource_process = function() {
    var name, path;
    for (name in resource_map) {
      path = resource_map[name];
      PIXI.loader.add(name, path);
      resources[name] = PIXI.loader.resources[name];
    }
    return PIXI.loader.load(main_process);
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
