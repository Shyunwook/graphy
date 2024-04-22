import 'package:graphy/graphy.dart';
import 'package:graphy/src/sign/sign_type.dart';

class GestureSign extends GestureSignType {
  Sign dragHorizontal({
    double? min,
    double? max,
  }) {
    return createSign(DragHorizontalModule());
  }

  // TODO DragVerticalModule로 수정 예정
  Sign dragVertical({
    double? min,
    double? max,
  }) {
    return createSign(DragHorizontalModule());
  }
}
