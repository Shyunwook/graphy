import 'package:flutter/material.dart';
import 'package:graphy/src/actor/actor_model.dart';
import 'package:graphy/src/quark/behavior/behavior.dart';
import 'package:graphy/src/role/role.dart';

class MoveHorizontalRole extends Role<DoubleBehavior, double> {
  MoveHorizontalRole({super.transformation});

  @override
  void role(ActorModel actor, double value, BuildContext context) {
    actor.changePosition(
      Offset(
        value,
        actor.currentPosition.dy,
      ),
    );
  }
}
