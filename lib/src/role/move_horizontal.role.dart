import 'package:flutter/material.dart';
import 'package:graphy/src/actor/actor_model.dart';
import 'package:graphy/src/quark/behavior/behavior.dart';
import 'package:graphy/src/role/role.dart';

class MoveHorizontalRole extends Role<DoubleBehavior, double> {
  MoveHorizontalRole({super.transformation});

  @override
  void role(ActorModel actor, double value, BuildContext context) {
    final Offset position = actor.currentPosition;
    final Offset initialPosition = actor.initialPosition;

    actor.changePosition(
      Offset(initialPosition.dx + value, position.dy),
    );
  }
}
