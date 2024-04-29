import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:graphy/graphy.dart';
import 'package:graphy/src/detector/types/types.dart';

class DragGestureDetector extends GestureDetectorType {
  @override
  Type get recognizerType => ScaleGestureRecognizer;

  @override
  GestureRecognizerFactoryWithHandlers<GestureRecognizer> get recognizer =>
      GestureRecognizerFactoryWithHandlers<ScaleGestureRecognizer>(
        () => ScaleGestureRecognizer(),
        (instance) {
          instance.onUpdate = (details) {
            controller.play(
              [
                OffsetAction(details.focalPointDelta),
              ],
            );
          };
        },
      );
}
