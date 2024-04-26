abstract class Detection<T> {
  /// Scenario generator에서 Scenario가 생성될 때 실행되는 메소드
  void startDetecting();
  void dispose();
  void addCallback(Function(T event) callback);
}
