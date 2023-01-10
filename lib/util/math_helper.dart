import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

Matrix2 multiplyMatrix(double angle) =>
    Matrix2(cos(angle), -sin(angle), sin(angle), cos(angle));

/// rotates widget using degrees
Alignment rotateWidget(double angle, [double distance = 0.8]) {
  Vector2 point = Vector2(0, distance);
  double r = radians(angle - 90);
  Matrix2 m = Matrix2.rotation(r).multiplied(Matrix2(point.x, 0, point.y, 0));
  return Alignment(m.entry(0, 1), m.entry(1, 1));
}
