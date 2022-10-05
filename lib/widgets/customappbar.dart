import 'package:flutter/material.dart';

CustomAppBar({
  required GlobalKey<ScaffoldState> scaffoldKey,
  BuildContext? pageContext,
  String title = '',
  bool hideSearch = false,
  bool showBack = false,
}) {
  void searchAction() {
    Navigator.pushReplacementNamed(pageContext!, '/search');
  }

  IconButton drawerIcon = IconButton(
    icon: Icon(Icons.menu, color: Colors.white, size: 30),
    onPressed: () {
      scaffoldKey.currentState?.openDrawer();
    },
  );

  IconButton backIcon = IconButton(
    icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
    onPressed: () {
      Navigator.pop(pageContext!);
    },
  );

  late IconButton leadingButton = drawerIcon;

  if (showBack) {
    leadingButton = backIcon;
  }

  return AppBar(
    brightness: Brightness.light,
    backgroundColor: Colors.purple[700],
    elevation: 0,
    centerTitle: false,
    title: Text(
      title,
      style: TextStyle(
          color: Colors.blue,
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontFamily: 'Helvetica Neue'),
    ),
    leading: leadingButton,
    actions: <Widget>[
      !hideSearch
          ? IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
              onPressed: searchAction,
            )
          : Container()
    ],
  );
}
