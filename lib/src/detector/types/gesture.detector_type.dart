import 'package:flutter/material.dart';
import 'package:graphy/graphy.dart';

abstract class GestureDetectorType extends Detector {
  Type get recognizerType;
  GestureRecognizerFactoryWithHandlers get recognizer;

  @override
  void start(ScenarioController controller) {
    super.controller = controller;

    controller.gestures.putIfAbsent(
      recognizerType,
      () => recognizer,
    );
  }
}
