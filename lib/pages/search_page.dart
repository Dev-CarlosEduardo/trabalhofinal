import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/appdata.dart';
import '../widgets/customappbar.dart';
import '../widgets/customdrawer.dart';

class SearchPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
              key: _scaffoldKey,
              appBar: CustomAppBar(
                scaffoldKey: _scaffoldKey,
                pageContext: context,
                title: 'Pesquisar',
                hideSearch: false,
                // showBack: false
              ),
              drawer: CustomDrawer(pageContext: context),
              backgroundColor: Colors.white,
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Página de busca...'),
                ],
              )),
            ));
  }
}
