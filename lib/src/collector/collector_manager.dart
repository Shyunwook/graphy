import 'package:graphy/src/collector/collector.dart';

mixin CollectorManager<T extends Collector<U>, U> on Collector<U> {
  T addCollection(U value) => throw UnimplementedError();
}
