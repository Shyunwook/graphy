import 'package:graphy/src/quark/module/module.dart';
import 'package:graphy/src/quark/translator/translator.dart';

class AccelerometerXModule extends DoubleModule {
  AccelerometerXModule({
    super.min,
    super.max,
  }) {
    addTranslator(AccelerometerXToDoubleTranslator());
  }
}
