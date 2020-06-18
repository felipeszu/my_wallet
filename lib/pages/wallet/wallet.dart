import 'package:flutter/material.dart';
import 'package:my_wallet/model/chart_data.dart';
import 'package:my_wallet/pages/wallet/my_wallet.dart';
import 'package:my_wallet/pages/wallet/portfolio_profitability.dart';
import 'package:my_wallet/pages/wallet/profitability_by_category.dart';
import 'package:my_wallet/pages/wallet/profitability_wallet.dart';
import 'package:my_wallet/utils/colors.dart';

class WalletView extends StatefulWidget {
  @override
  _WalletViewState createState() => _WalletViewState();
}

class _WalletViewState extends State<WalletView> {

  static final data = [
      new ChartData(title: 'Renda Fixa', percent: 20, color: ColorUtil.chartColor1),
      new ChartData(title: 'Fundos', percent: 10, color: ColorUtil.chartColor2),
      new ChartData(title: 'Previdencia', percent: 10, color: ColorUtil.chartColor3),
      new ChartData(title: 'Ações/Futuros', percent: 15, color: ColorUtil.chartColor4),
      new ChartData(title: 'Tesouro', percent: 30, color: ColorUtil.chartColor5),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget> [
          MyWallet(categoryList: data),
          PortfolioProfitability(),
          ProfitabilityByCategory(categoryList: data,),
          ProfitabilityWallet()
        ]
      ),
    );
  }
}