import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FirebaseConsultaPage extends StatefulWidget {
  @override
  _FirebaseConsultaPage createState() => _FirebaseConsultaPage();
}

class _FirebaseConsultaPage extends State<FirebaseConsultaPage> {
  var users = [];
  final dbRef = FirebaseDatabase.instance.ref();

  // consultar() {
  //   dbRef.child('users').once().then((DataSnapshot snapshot) {
  //     setState(() {
  //       for (var i = 0; i < snapshot.value.length; i++) {
  //         if (snapshot.value[i] != null) {
  //           users.add(snapshot.value[i]);
  //         }
  //       }
  //     });
  //   });
  // }

  @override
  void initState() {
    super.initState();

    // consultar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Consulta'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                var name = users[index]['name'];
                var age = users[index]['age'].toString();

                return ListTile(
                  leading: Image.asset('lib/assets/logo.png', width: 30),
                  title: Text(name),
                  subtitle: Text(age),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
