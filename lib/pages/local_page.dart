import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/appdata.dart';
import '../widgets/customappbar.dart';
import '../widgets/customdrawer.dart';

class LocalPage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextStyle styles = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Helvetica Neue');

  void backButtomAction(pagaContext) {
    Navigator.pop(pagaContext);
  }

  @override
  Widget build(BuildContext context) {
    Map localData = ModalRoute.of(context)!.settings.arguments as Map;

    // print(localData['places']);

    final double statusBarHeight = MediaQuery.of(context).padding.top;
    final double footerHeight = MediaQuery.of(context).padding.bottom;

    var starRate = double.parse(localData['review']).floor();

    var stars = [];
    for (var i = 0; i < 5; i++) {
      if (i < starRate) {
        stars.add(true);
      } else {
        stars.add(false);
      }
    }
    return Consumer<AppData>(
        builder: (ctx, appdata, child) => Scaffold(
            key: _scaffoldKey,
            drawer: CustomDrawer(pageContext: context),
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  height: 250,
                  child: Image.network(
                    localData['places'][0]['img'],
                    fit: BoxFit.cover,
                  ),
                ),
                ListView(
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 220),
                      decoration: BoxDecoration(
                          color: Colors.purple[700],
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 5),
                                      child: Text(
                                        localData['name'],
                                        style: TextStyle(
                                            fontFamily: 'helvetica Neue',
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: stars[0]
                                              ? Colors.yellow
                                              : Colors.black,
                                          size: 16,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: stars[1]
                                              ? Colors.yellow
                                              : Colors.black,
                                          size: 16,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: stars[2]
                                              ? Colors.yellow
                                              : Colors.black,
                                          size: 16,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: stars[3]
                                              ? Colors.yellow
                                              : Colors.black,
                                          size: 16,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: stars[4]
                                              ? Colors.yellow
                                              : Colors.black,
                                          size: 16,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: Text(
                                            localData['review'],
                                            style: TextStyle(
                                                fontFamily: 'Helvetica Neue',
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(10),
                                child: IconButton(
                                  icon: Icon(Icons.qr_code_scanner),
                                  color: Colors.white,
                                  iconSize: 60,
                                  onPressed: () {},
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 20, left: 15, right: 15, bottom: 20),
                            child: Text(
                              localData['description'],
                              style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                            color: Colors.grey,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20, bottom: 15),
                            child: Text(
                              'PRINCIPAIS AREAS VISITADAS',
                              style: TextStyle(
                                  fontFamily: 'Helvetica Neue',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            ),
                          ),
                          GridView.count(
                              padding: EdgeInsets.only(bottom: footerHeight),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              childAspectRatio: 10 / 11,
                              children: List.generate(
                                  localData['places'].length, (index) {
                                return Container(
                                  margin: EdgeInsets.all(10),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 1 / 1,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            child: Image.network(
                                              localData['places'][index]['img'],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5),
                                        child: Text(
                                          localData['places'][index]['name'],
                                          style: TextStyle(
                                              fontFamily: 'Helvetica Neue',
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 15),
                                        child: Text(
                                          'Area de Lazer',
                                          style: TextStyle(
                                              fontFamily: 'Helvetica Neue',
                                              fontSize: 12,
                                              color: Colors.black),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }))
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(top: statusBarHeight),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      backButtomAction(context);
                    },
                  ),
                ),
              ],
            )));
  }
}
