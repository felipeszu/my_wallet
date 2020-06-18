import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:my_wallet/model/chart_data.dart';

class PieChart extends StatefulWidget {
  final List<charts.Series<ChartData, String>> series;
  PieChart({Key key, @required this.series}) : super(key: key);

  @override
  _PieChartState createState() => _PieChartState();
}

class _PieChartState extends State<PieChart> {
  bool showValue = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          charts.PieChart(
            widget.series,
            animate: true,
            defaultRenderer: charts.ArcRendererConfig(
              arcWidth: 40,
              startAngle: 4 / 5 * 3.14,
            ),
          ),
          centralData()
        ],
      ),
    );
  }

  Widget centralData(){
    return Container(
      height: 220,
      width: 220,
      padding: EdgeInsets.symmetric(vertical: 35.0, horizontal: 40.0),
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.0),
                blurRadius: 6.0)
          ]),
      child: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              GestureDetector(
                onTap: (){
                  setState(() {
                    showValue = !showValue;
                  });
                },
                child: Text(
                  'Exibir Valor',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Text(
                showValue ? 'R\$ • • • • •' : 'R\$ 15.000,00',
                style:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                '22 ATIVOS',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
              Divider(
                height: 10,
                indent: 10,
                thickness: 2,
                color: Colors.grey.shade300,
              ),
              Text(
                'Valor total bruto',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ]),
      ),
    );
  }

}
