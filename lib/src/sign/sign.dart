import 'package:graphy/src/sign/sign_type.dart';
import 'package:quark/core/module.dart';

// Sign의 인스턴스를 만들 수 있는 곳을 여기 한 곳으로 틀어 막는다.
class Sign {
  final SignType type;
  final Module module;

  Sign._({required this.type, required this.module});
}

abstract class SignTypeManager {
  SignType get type;

  Sign createSign(Module module) {
    return Sign._(type: type, module: module);
  }
}
