import 'package:flutter/material.dart';
import 'package:graphy/graphy.dart';

class ActorModel extends ChangeNotifier {
  final ScenarioController controller;
  final Offset initialPosition;
  late Offset currentPosition;

  ActorModel({
    required this.controller,
    required this.initialPosition,
  }) {
    currentPosition = initialPosition;
  }

  void changePosition(Offset newPos) {
    currentPosition = newPos;
    notifyListeners();
  }
}
