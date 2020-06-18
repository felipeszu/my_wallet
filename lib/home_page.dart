import 'package:flutter/material.dart';
import 'package:my_wallet/pages/wallet/wallet.dart';
import 'package:my_wallet/utils/colors.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Minha carteira'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search, color: Colors.white,), onPressed: null)
        ],
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Container(
              child: Material(
                color: ColorUtil.secondaryColor,
                child: TabBar(
                  controller: _tabController,
                  tabs: <Tab> [
                    Tab(text: 'CARTEIRA',),
                    Tab(text: 'MOVIMENTAÇÕES',),
                    Tab(text: 'POSIÇÃO',)
                  ]
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: <Widget>[
                  WalletView(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
