import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/appdata.dart';
import '../widgets/customappbar.dart';
import '../widgets/customdrawer.dart';

class HomePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
              key: _scaffoldKey,
              appBar: CustomAppBar(
                scaffoldKey: _scaffoldKey,
                pageContext: context,
                hideSearch: true,
              ),
              drawer: CustomDrawer(pageContext: context),
              backgroundColor: Colors.purple[700],
              body: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.zero,
                    child: Text('BEM VINDO',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'helvetica Neue',
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                  ),
                  Image.asset('lib/assets/logo.png', width: 400),
                  Container(
                    child: Text('Copyright©2022',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'helvetica Neue',
                            color: Colors.white)),
                  ),

                  //teste firebase
                  // Container(
                  //   child: ElevatedButton(
                  //       child: Text('Firebase Consulta'),
                  //       onPressed: () {
                  //         Navigator.pushNamed(context, '/firebase_consulta');
                  //       }),
                  // )
                ],
              )),
            ));
  }
}
