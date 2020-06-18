import 'package:flutter/material.dart';
import 'package:my_wallet/model/chart_data.dart';
import 'package:my_wallet/pages/wallet/components/check_list_group.dart';
import 'package:my_wallet/pages/wallet/components/selectable_buttons.dart';
import 'package:my_wallet/pages/wallet/components/session_title.dart';
import 'package:my_wallet/pages/wallet/components/timeline_chart.dart';
import 'package:my_wallet/utils/colors.dart';

class ProfitabilityWallet extends StatefulWidget {
  
  @override
  _ProfitabilityWalletState createState() => _ProfitabilityWalletState();
}

class _ProfitabilityWalletState extends State<ProfitabilityWallet> {

  List<ChartData> categoryList = [
    ChartData(title: 'CDI', isChecked: true, color: ColorUtil.chartColor1),
    ChartData(title: 'Poupança', isChecked: false, color: ColorUtil.chartColor2),
    ChartData(title: 'IBOV', isChecked: false, color: ColorUtil.chartColor3),
    ChartData(title: 'IPCA', isChecked: true, color: ColorUtil.chartColor4)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        SessionTitle(title: 'GRÁFICO DE RENTABILIDADE DA CARTEIRA',),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SelectableButton(),
                  Container(
                    width: 700,
                    height: 300,
                    child: TimeLineChart.withSampleData(categoryList)
                  ),
                  CheckBoxGroup(
                    listCategory: categoryList, 
                    onChanged: (category) => setState(() => refreshList(category)),
                  )
                ],
              ),
            ),
          ),
        ),
      ]
    );
  }

  refreshList(ChartData category){
    int index = categoryList.indexWhere((element) => element.title == category.title);
    categoryList[index] = category;
  }
}

