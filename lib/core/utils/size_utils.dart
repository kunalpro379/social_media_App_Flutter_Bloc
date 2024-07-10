import 'dart:ui' as ui;
import 'package:flutter/material.dart';

const num FIGMA_DESIGN_WIDTH = 414;
const num FIGMA_DESIGN_HEIGHT = 896;
const num FIGMA_DESIGN_STATUS_BAR = 0;

typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

class Sizer extends StatelessWidget {
  const Sizer({
    Key? key,
    required this.builder,
  }) : super(key: key);

  final ResponsiveBuild builder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizeUtils.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizeUtils.deviceType);
      });
    });
  }
}

class SizeUtils {
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late DeviceType deviceType;
  static late double height;
  static late double width;

  static void setScreenSize(
    BoxConstraints constraints,
    Orientation currentOrientation,
  ) {
    boxConstraints = constraints;
    orientation = currentOrientation;

    if (orientation == Orientation.portrait) {
      width = boxConstraints.maxWidth.orDefault(FIGMA_DESIGN_WIDTH.toDouble());
      height =
          boxConstraints.maxHeight.orDefault(FIGMA_DESIGN_HEIGHT.toDouble());
    } else {
      width = boxConstraints.maxHeight.orDefault(FIGMA_DESIGN_WIDTH.toDouble());
      height =
          boxConstraints.maxWidth.orDefault(FIGMA_DESIGN_HEIGHT.toDouble());
    }
    deviceType = DeviceType.mobile;
  }
}

extension ResponsiveExtension on num {
  double get _width => SizeUtils.width;
  double get _height => SizeUtils.height;

  double get h => ((this * _width) / FIGMA_DESIGN_WIDTH);
  double get v =>
      (this * _height) / (FIGMA_DESIGN_HEIGHT - FIGMA_DESIGN_STATUS_BAR);

  double get adaptSize {
    var height = v;
    var width = h;
    return height < width ? height.toDoubleValue() : width.toDoubleValue();
  }

  double get fSize => adaptSize;
}

extension FormatExtension on double {
  double toDoubleValue({int fractionDigits = 2}) {
    return double.parse(this.toStringAsFixed(fractionDigits));
  }

  double orDefault(double defaultValue) {
    return this > 0 ? this : defaultValue;
  }
}

enum DeviceType { mobile, tablet, desktop }
