import '../quark/module/module.dart';
import '../quark/translator/translator.dart';

class DragHorizontalModule extends DoubleModule {
  DragHorizontalModule({
    super.min,
    super.max,
  }) {
    addTranslator(OffsetXToDoubleTranslator());
  }
}
