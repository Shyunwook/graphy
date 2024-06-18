import 'package:graphy/src/collector/collector.dart';

mixin CollectorManager<T extends Collector<U>, U> on Collector<U> {
  여기 고칠거임
  T addCollection(U value);
}
