import 'package:flutter/material.dart';
import 'package:my_wallet/model/chart_data.dart';
import 'package:my_wallet/pages/wallet/components/session_title.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProfitabilityByCategory extends StatefulWidget {
  final List<ChartData> categoryList;
  ProfitabilityByCategory({Key key, this.categoryList}) : super(key: key);

  @override
  _ProfitabilityByCategoryState createState() => _ProfitabilityByCategoryState();
}

class _ProfitabilityByCategoryState extends State<ProfitabilityByCategory> {
  PageController pageController;
  
  @override
  void initState() {
    pageController = PageController(viewportFraction: 0.8);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 280,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SessionTitle(title: 'RENTABILIDADE POR CATEGORIA'),
          Expanded(
            child: PageView.builder(
              controller: pageController,
              itemCount: widget.categoryList.length,
              itemBuilder: (context, index) => profitabilityCard(widget.categoryList[index])
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            alignment: Alignment.center,
            child: SmoothPageIndicator(
            	controller: pageController,  // PageController
            	count:  widget.categoryList.length,
            	effect:  ExpandingDotsEffect(
                dotWidth: 10,
                dotHeight: 10,
                dotColor: Colors.grey.shade300,
              )
            ),
          )
        ],
      )
    );
  }

  Widget profitabilityCard(ChartData category){
    return Container(
      child: Card(
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Container(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                height: 30,
                decoration: BoxDecoration(
                  color: Color.fromARGB(category.color.a, category.color.r, category.color.g, category.color.b),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: Text(
                  category.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                  ),
                )
              ),
              Text(
                'R\$ 5.000.000,00',
                style: TextStyle(
                  fontSize: 26
                ),
              ),
              Divider(
                height: 10,
                indent: 10,
                thickness: 2,
                color: Colors.grey.shade300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  informationTile('Mês'),
                  informationTile('Ano'),
                  informationTile('12 Meses'),
                ],
              )
            ]
          ),
        ),
      ),
    );
  }

  Widget informationTile(String title){
    return Column(
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[700]
          )
        ),
        Text(
          '^ 5%',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.green
          ),
        )
      ],
    );
  }
}