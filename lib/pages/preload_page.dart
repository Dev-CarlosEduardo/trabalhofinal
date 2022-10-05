import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../model/appdata.dart';

class PreloadPage extends StatefulWidget {
  @override
  _PreloadPage createState() => _PreloadPage();
}

class _PreloadPage extends State<PreloadPage> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    Provider.of<AppData>(context).requestData(context);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            loading
                ? Container(
                    margin: EdgeInsets.all(20),
                    child: Text(
                      'Carregando Informações...',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Helvetica Neue',
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(),
            Container(
              margin: EdgeInsets.all(20),
              child: loading
                  ? CircularProgressIndicator(
                      strokeWidth: 4,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),
                    )
                  : Container(),
            ),
            !loading
                ? Container(
                    margin: EdgeInsets.all(20),
                    child: ElevatedButton(
                      child: Text(
                        'Tentar Novamente',
                      ),
                      onPressed: () {},
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
