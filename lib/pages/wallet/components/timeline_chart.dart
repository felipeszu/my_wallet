import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:my_wallet/model/chart_data.dart';
import 'package:my_wallet/model/timeline_serie.dart';
import 'package:my_wallet/utils/colors.dart';


class TimeLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;
  static charts.SelectionModel pointerValue;

  TimeLineChart(this.seriesList, {this.animate});

  factory TimeLineChart.withSampleData(List<ChartData> categoryList) {
    return new TimeLineChart(
      _createSampleData(categoryList),
      animate: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(13.0),
      child: new charts.TimeSeriesChart(
        seriesList,
        animate: animate,
        customSeriesRenderers: [
          new charts.PointRendererConfig(
            customRendererId: 'customPoint'),
          new charts.LineRendererConfig(
            customRendererId: 'customArea',
            includeArea: true,
            stacked: true,
          ),
        ],
      primaryMeasureAxis: new charts.PercentAxisSpec(viewport: charts.NumericExtents.fromValues([0.001, 0.1])),
      dateTimeFactory: const charts.LocalDateTimeFactory(),
      ),
    );
  }

  static double doubleInRange() => Random().nextDouble() * 0.1;
  
  static List<TimeSeries> generatedDataList(String name) {
    List<TimeSeries> newDataList = [];
    var i = 1;
    while(i < 13){
      newDataList.add(
        TimeSeries(new DateTime(2020, i, 01), doubleInRange(), name)
      );
      i++;
    }
    return newDataList;
  }

  static List<charts.Series<TimeSeries, DateTime>> _createSampleData(List<ChartData> categoryList) {
    final areaData = generatedDataList('cdi');
    List<charts.Series<TimeSeries, DateTime>> chartList = [];
    chartList.add( new charts.Series<TimeSeries, DateTime>(
          id: 'ibovDot',
          areaColorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blue[200].withAlpha(130)),
          colorFn: (_, __) => charts.ColorUtil.fromDartColor(ColorUtil.chartColor1.withAlpha(0)),
          domainFn: (TimeSeries timerSeries, _) => timerSeries.time,
          measureFn: (TimeSeries timerSeries, _) => timerSeries.value,
          data: areaData)
        ..setAttribute(charts.rendererIdKey, 'customArea'),);
    categoryList.forEach((element) { 
      if(element.isChecked){
        final lineData = generatedDataList('cdi');
        chartList.add(
          new charts.Series<TimeSeries, DateTime>(
            id: 'ipcaLine',
            colorFn: (_, __) => element.color,
            domainFn: (TimeSeries timerSeries, _) => timerSeries.time,
            measureFn: (TimeSeries timerSeries, _) => timerSeries.value,
            data: lineData,
          ),
        );
        chartList.add(
          new charts.Series<TimeSeries, DateTime>(
          id: 'ipcaDot',
          colorFn: (_, __) => element.color,
          domainFn: (TimeSeries timerSeries, _) => timerSeries.time,
          measureFn: (TimeSeries timerSeries, _) => timerSeries.value,
          data: lineData,
          ) ..setAttribute(charts.rendererIdKey, 'customPoint'),
        );
      }
    });
    return chartList;
  }
}
