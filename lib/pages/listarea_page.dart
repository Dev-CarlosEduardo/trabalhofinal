import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/appdata.dart';
import '../widgets/customappbar.dart';
import '../widgets/customdrawer.dart';
import '../widgets/areabox.dart';

class ListAreaPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  void areaBoxAction(pageContext, areaData) {
    Navigator.pushNamed(pageContext, '/local', arguments: areaData);
  }

  @override
  Widget build(BuildContext context) {
    final areaIndex = ModalRoute.of(context)!.settings.arguments;

    return Consumer<AppData>(builder: (ctx, appdata, child) {
      var areas = [];

      for (var country in appdata.data[areaIndex]['countries']) {
        areas.addAll(country['cities']);
      }
      return Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
              scaffoldKey: _scaffoldKey,
              pageContext: context,
              title:
                  '${appdata.data[areaIndex]['name']} (${areas.length} areas)',
              showBack: true),
          drawer: CustomDrawer(pageContext: context),
          backgroundColor: Colors.white,
          body: GridView.count(
            crossAxisCount: 3,
            children: List.generate(areas.length, (index) {
              return AreaBox(
                data: areas[index],
                onTap: (areaData) {
                  areaBoxAction(context, areaData);
                },
              );
            }),
          ));
    });
  }
}
