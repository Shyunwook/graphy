import 'package:graphy/src/quark/module/module.dart';
import 'package:graphy/src/quark/translator/translator.dart';

class DragHorizontalModule extends DoubleModule {
  DragHorizontalModule({
    super.min,
    super.max,
  }) {
    addTranslator(OffsetXToDoubleTranslator());
  }
}
