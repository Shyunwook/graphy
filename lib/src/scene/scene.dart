import 'package:flutter/material.dart';
import 'package:graphy/graphy.dart';
import 'package:graphy/src/scene/scene_info.dart';
import 'package:graphy/src/scene/scene_stream_manager.dart';

class Scene extends StatefulWidget {
  final List<Actor> actors;

  const Scene({
    super.key,
    required this.actors,
  });

  @override
  State<Scene> createState() => _SceneState();
}

class _SceneState extends State<Scene> {
  final SceneStreamManager sceneStreamManager = SceneStreamManager();

  @override
  void dispose() {
    sceneStreamManager.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SceneInfo(
      sceneStreamManager: sceneStreamManager,
      child: Stack(
        children: widget.actors,
      ),
    );
  }
}
