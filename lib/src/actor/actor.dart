import 'package:flutter/material.dart';
import 'package:graphy/graphy.dart';
import 'package:graphy/src/actor/actor_info.dart';
import 'package:graphy/src/actor/actor_model.dart';
import 'package:graphy/src/scene/scene_info.dart';

class Actor extends StatefulWidget {
  final String? name;
  final String? target;
  final Offset initialPosition;
  final ScenarioController scenarioController;
  final Widget child;

  const Actor({
    super.key,
    this.name,
    this.target,
    this.initialPosition = Offset.zero,
    required this.scenarioController,
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
      controller: widget.scenarioController,
      initialPosition: widget.initialPosition,
    );

    super.initState();
  }

  @override
  Widget build(BuildContext _) {
    return ActorInfo(
      model: _actorModel,
      child: ListenableBuilder(
        listenable: _actorModel,
        builder: (context, _) {
          if (widget.scenarioController.needInitialized) {
            widget.scenarioController.initialize(
              context,
              widget.target,
            );
          }

          if (widget.name != null) {
            SceneInfo.of(context).setActor(
              name: widget.name!,
              context: context,
            );
          }

          return Positioned(
            left: _actorModel.currentPosition.dx,
            top: _actorModel.currentPosition.dy,
            child: RawGestureDetector(
              gestures: widget.scenarioController.gestures,
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}
