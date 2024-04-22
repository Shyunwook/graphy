import 'package:graphy/src/sign/sign.dart';

// TODO 아래 내용도 고민 해봐야함
// 스트링이 더 괜찮다, enum은 너무 제한적임
// T.toString();

enum SignType { gesture, sound, sensor }

class GestureSignType extends SignTypeManager {
  @override
  SignType get type => SignType.gesture;
}

class SensorSignType extends SignTypeManager {
  @override
  SignType get type => SignType.sensor;
}

class SoundSignType extends SignTypeManager {
  @override
  SignType get type => SignType.sound;
}
