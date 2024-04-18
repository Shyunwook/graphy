import 'package:flutter/material.dart';
import 'package:graphy/src/actor/actor_info.dart';
import 'package:graphy/src/actor/actor_model.dart';
import 'package:graphy/src/scene/scene_info.dart';

class Actor extends StatefulWidget {
  final String? name;
  final String? target;
  final Offset initialPosition;
  final Widget child;

  const Actor({
    super.key,
    this.name,
    this.target,
    this.initialPosition = const Offset(0, 0),
    required this.child,
  });

  @override
  State<Actor> createState() => _ActorState();
}

class _ActorState extends State<Actor> {
  late ActorModel _actorModel;

  @override
  void initState() {
    _actorModel = ActorModel(
      initialPosition: widget.initialPosition,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ActorInfo(
      model: _actorModel,
      child: ListenableBuilder(
        listenable: _actorModel,
        builder: (innerContext, _) {
          if (widget.name != null) {
            SceneInfo.of(innerContext).setActor(
              name: widget.name!,
              context: innerContext,
            );
          }
          return Positioned(
            left: _actorModel.currentPosition.dx,
            top: _actorModel.currentPosition.dy,
            child: widget.child,
          );
        },
      ),
    );
  }
}
