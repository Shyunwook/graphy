import 'package:flutter/material.dart';
import 'package:graphy/graphy.dart';
import 'package:graphy/src/scene/scene_info.dart';

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
  @override
  void dispose() {
    super.dispose();

    // sensor detector dispose
    AccelerometerDetection.instance.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SceneInfo(
      child: Stack(
        children: widget.actors,
      ),
    );
  }
}
