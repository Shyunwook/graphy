import 'package:flutter/material.dart';

class ActorModel extends ChangeNotifier {
  final Offset initialPosition;
  late Offset currentPosition;

  ActorModel({required this.initialPosition}) {
    currentPosition = initialPosition;
  }

  void changePosition(Offset newPos) {
    currentPosition = newPos;
    notifyListeners();
  }
}
