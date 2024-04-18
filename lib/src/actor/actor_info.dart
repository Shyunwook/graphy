import 'package:flutter/material.dart';
import 'package:graphy/src/actor/actor_model.dart';

class ActorInfo extends InheritedWidget {
  final ActorModel model;

  const ActorInfo({
    super.key,
    required super.child,
    required this.model,
  });

  static ActorInfo? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ActorInfo>();
  }

  static ActorInfo of(BuildContext context) {
    final ActorInfo? result = maybeOf(context);
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
