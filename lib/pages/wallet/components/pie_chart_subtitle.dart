import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:my_wallet/model/chart_data.dart';

class PieChartSubtitle extends StatefulWidget {
  final List<ChartData> data;
  PieChartSubtitle({this.data});
  @override
  _PieChartSubtitleState createState() => _PieChartSubtitleState();
}

class _PieChartSubtitleState extends State<PieChartSubtitle> {
  @override
  Widget build(BuildContext context) {
    List<FragmentPieChartSubtitle> fragmentList = widget.data.map(
      (element) => FragmentPieChartSubtitle(color: element.color, title: element.title)).toList();

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 15.0,
      runSpacing: 15.0,
      children: fragmentList
    );
  }
}

class FragmentPieChartSubtitle extends StatelessWidget {
  final charts.Color color;
  final String title;

  const FragmentPieChartSubtitle({Key key, @required this.color, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 4,
            width: 40,
            decoration: BoxDecoration(
              color: Color.fromARGB(color.a, color.r, color.g, color.b), 
              borderRadius: BorderRadius.circular(4.0)
            ),
          ),
          Text(title),
          Text(
            '10% | 5 ativos',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
