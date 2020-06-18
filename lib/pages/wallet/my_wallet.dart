import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:my_wallet/model/chart_data.dart';
import 'package:my_wallet/pages/wallet/components/pie_chart.dart';
import 'package:my_wallet/pages/wallet/components/pie_chart_subtitle.dart';

class MyWallet extends StatefulWidget {
  final List<ChartData> categoryList;
  MyWallet({this.categoryList});
  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 3,
        child: ExpansionTile(
          title: Text(
            'Minha Carteira',
            style: TextStyle(
              fontWeight: FontWeight.w600
            ),
          ),
          children: <Widget>[
            PieChart(series: _createSampleData(),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: PieChartSubtitle(data: widget.categoryList,),
            )
          ],
        ),
      )
    );
  }

  List<charts.Series<ChartData, String>> _createSampleData() {  
    return [
      new charts.Series<ChartData, String>(
        id: 'Segments',
        domainFn: (ChartData chartData, _) => chartData.title,
        measureFn: (ChartData chartData, _) => chartData.percent,
        colorFn: (ChartData chartData, _) => chartData.color,
        data: widget.categoryList,
      )
    ];
  }
}