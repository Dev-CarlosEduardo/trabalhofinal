import 'package:brag/routes.dart';
import 'package:flutter/material.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  String iconPage = 'assets/images/single_icon_white.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple[700],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Image.asset('lib/assets/logo.png'),
                iconSize: 400,
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RouterGenerator.homePage);
                },
              ),
            ],
          ),
        ));
  }
}
