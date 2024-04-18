import 'package:flutter/material.dart';

class SceneInfo extends InheritedWidget {
  final Map<String, BuildContext> _actors = {};

  SceneInfo({super.key, required super.child});

  static SceneInfo? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SceneInfo>();
  }

  static SceneInfo of(BuildContext context) {
    final SceneInfo? result = maybeOf(context);
    return result!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }

  void setActor({
    required String name,
    required BuildContext context,
  }) {
    // actor의 context는 변경 될 수 있기 때문에 putIfAbsent를 사용하지 않고 덮어쓴다.
    _actors[name] = context;
  }
}
