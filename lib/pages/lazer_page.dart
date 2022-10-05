import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/appdata.dart';
import '../widgets/customappbar.dart';
import '../widgets/customdrawer.dart';
import '../widgets/areabox.dart';

class LazerPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  void seeAreaAction(context, lazerIndex) {
    print(lazerIndex);
    Navigator.pushNamed(context, '/listarea', arguments: lazerIndex);
  }

  void areaBoxAction(pageContext, areaData) {
    Navigator.pushNamed(pageContext, '/local', arguments: areaData);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppData>(
      builder: (ctx, appdata, child) => Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(
              scaffoldKey: _scaffoldKey,
              pageContext: context,
              title: 'Escolha sua area de lazer',
              hideSearch: true,
              showBack: false),
          drawer: CustomDrawer(pageContext: context),
          backgroundColor: Colors.white,
          //body: Center(child: Text('Continentes: ${appdata.data.length}')),
          body: ListView.builder(
              itemCount: appdata.data.length,
              itemBuilder: (context, index) {
                // MODIFICAR ARQUIVO JSON PESSOAL
                var cities = [];
                for (var country in appdata.data[index]['countries']) {
                  cities.addAll(country['cities']);
                }

                return Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            '${appdata.data[index]['name']} (${cities.length})',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Helvetica Neue'),
                          ),
                        ),
                        TextButton(
                          child: Text(
                            'Ver todas',
                            style: TextStyle(
                                fontFamily: 'Helvetica Neue',
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          onPressed: () {
                            seeAreaAction(context, index);
                          },
                        ),
                      ],
                    ),
                    Container(
                      height: 150,
                      margin: EdgeInsets.only(bottom: 20),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: cities.length,
                        itemBuilder: (areaContext, areaIndex) {
                          return AreaBox(
                              data: cities[areaIndex],
                              onTap: (areaData) {
                                areaBoxAction(context, areaData);
                              });
                        },
                      ),
                    )
                  ],
                );
              })),
    );
  }
}
