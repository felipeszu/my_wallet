import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class ChartData {

  final String title;
  int percent;
  final charts.Color color;
  bool isChecked;

  ChartData({this.title, this.percent, Color color, this.isChecked = false})
      : this.color = charts.Color(
            r: color.red, g: color.green, b: color.blue, a: color.alpha);
}