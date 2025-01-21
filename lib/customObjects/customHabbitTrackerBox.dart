import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomHabbitTrackerBox extends BoxDecoration {
  final bool isCompleted;

  CustomHabbitTrackerBox({
    BorderRadius? borderRadius,
    List<BoxShadow>? boxShadow,
    required this.isCompleted,
  }) : super(
          color: isCompleted ? Colors.green[500] : Colors.grey[300],
          borderRadius: borderRadius,
          boxShadow: boxShadow,
        );

  bool getIsCompleted() {
    return isCompleted;
  }
}
