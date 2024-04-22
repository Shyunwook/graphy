import 'package:graphy/graphy.dart';

class SignCollection {
  static final SignCollection instance = SignCollection._internal();

  factory SignCollection() => instance;

  SignCollection._internal();

  GestureSign gestureSign = GestureSign();
  SensorSign sensorSign = SensorSign();
}
