import 'package:flutter/material.dart';

CustomDrawer({BuildContext? pageContext}) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('BRAGA CLUBE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Helvetica Neue')),
              Text('Versão 1.0',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Helvetica Neue')),
            ],
          ),
          decoration: BoxDecoration(color: Colors.purple),
        ),
        ListTile(
          leading: Icon(
            Icons.home,
            color: Colors.black,
          ),
          title: Text('Home'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, '/home');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.image,
            color: Colors.black,
          ),
          title: Text('Areas de Lazer'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, '/lazer');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.search,
            color: Colors.black,
          ),
          title: Text('Pesquisar'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, '/search');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.save_alt,
            color: Colors.black,
          ),
          title: Text('Areas salvas'),
          onTap: () {
            Navigator.pushReplacementNamed(pageContext!, '/favorites');
          },
        )
      ],
    ),
  );
}
