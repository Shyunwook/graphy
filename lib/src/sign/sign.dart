import 'package:quark/muabe_quark.dart';

enum SignType { gesture, sound }

class Sign {
  final SignType type;
  final Module module;

  Sign({required this.type, required this.module});
}
