import 'package:flutter/material.dart';
import 'package:graphy/src/scene/scene_info.dart';

import '../actor/actor.dart';

class Scene extends StatelessWidget {
  final List<Actor> actors;

  const Scene({
    super.key,
    required this.actors,
  });

  @override
  Widget build(BuildContext context) {
    return SceneInfo(
      child: Stack(
        children: actors,
      ),
    );
  }
}
