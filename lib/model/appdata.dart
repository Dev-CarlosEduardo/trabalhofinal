import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppData with ChangeNotifier {
  var data;

  void setData(newData) {
    data = newData;
    notifyListeners();
  }

  Future<void> requestData(BuildContext ctx) async {
    print("chamou");

    await Future.delayed(Duration(seconds: 1));

    final url = Uri.parse("https://api.b7web.com.br/flutter1wb/");

    final res = await http.get(url); // criar arquivo JSON

    print(res);

    if (res.statusCode == 200) {
      // inserir os dados em DATA

      setData(jsonDecode(res.body));

      Navigator.pushReplacementNamed(ctx, '/home');
    } else {
      return;
    }
  }
}
