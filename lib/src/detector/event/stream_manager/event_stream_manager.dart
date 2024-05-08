import 'dart:async';

import 'package:graphy/graphy.dart';
import 'package:graphy/src/scene/scene_info.dart';

abstract class EventStreamManager<T> {
  SceneInfo? sceneInfo;

  void initialize(ScenarioController controller) {
    sceneInfo = controller.sceneInfo;
  }

  void addCallback(Type owner, Function(T event) callback) {
    this.sceneInfo?.sceneStreamManager.addCallback(owner, callback);
  }

  /// Scenario generator에서 Scenario가 생성될 때 실행되는 메소드
  void startStream(Type owner) {
    sceneInfo?.sceneStreamManager.addSubscription(owner, stream);
  }

  Stream<T> get stream;
}
