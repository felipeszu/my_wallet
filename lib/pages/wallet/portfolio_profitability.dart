import 'package:flutter/material.dart';
import 'package:my_wallet/pages/wallet/components/session_title.dart';

class PortfolioProfitability extends StatelessWidget {
  const PortfolioProfitability({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          SessionTitle(title: 'RENTABILIDADE DA CARTEIRA'),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      contentRentability(),
                      customVerticalDivider(),
                      contentRentability(),
                      customVerticalDivider(),
                      contentRentability(),
                    ],
                  ),
                ),
              ),
            )
          )
        ]
      ),
    );
  }

  Widget contentRentability(){
    return Container(
      margin: EdgeInsets.all(8),
      height: 120,
      width: 130,
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget> [
          Text(
            'Rentabilidade Mês',
            style: TextStyle(
              fontSize: 16
            ),
          ),
          Text(
            '+ 15,00%',
            style: TextStyle(
              color: Colors.green,
              fontSize: 17,
              fontWeight: FontWeight.bold
            ),
          ),
        ]
      )
    );
  }

  Widget customVerticalDivider(){
    return Container(
      height: 60,
      width: 3,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4)
      ),
    );
  }
}