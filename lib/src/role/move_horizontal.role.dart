import 'package:flutter/material.dart';
import 'package:graphy/src/actor/actor_model.dart';
import 'package:graphy/src/quark/behavior/behavior.dart';
import 'package:graphy/src/role/role.dart';

class MoveHorizontalRole extends Role<DoubleBehavior, double> {
  MoveHorizontalRole({super.transformation});

  @override
  void role(ActorModel actor, double value, BuildContext context) {
    final Offset position = actor.currentPosition;
    // final Offset initialPosition = actor.initialPosition;
    /// TODO 확인 필요
    /// 이전에는 누적값이 내려와서 Offset(initialPosition.dx + value, ...);
    /// 이렇게 했었는데 지금은 누적값이 아니네...?? 아 모듈이 초기화 되나?
    actor.changePosition(
      Offset(position.dx + value, position.dy),
    );
  }
}
