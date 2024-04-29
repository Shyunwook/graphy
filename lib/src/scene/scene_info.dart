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

  /// 다른 Actor에 의해 컨트롤 될 수 있도록 타겟 Actor 명단에 등록하기 위한 메소드
  void setActor({
    required String name,
    required BuildContext context,
  }) {
    _actors[name] = context;
  }

  BuildContext? getTarget(String name) {
    return _actors[name];
  }
}
