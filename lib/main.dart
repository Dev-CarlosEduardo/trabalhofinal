import 'package:brag/pages/login_page.dart';
import 'package:brag/routes.dart';
import 'package:brag/widgets/area_cache.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<AreaCache>(
      create: (_) => AreaCache(),
      child: MaterialApp(
        onGenerateTitle: (context) => "App",
        initialRoute: RouterGenerator.loginPage,
        onGenerateRoute: RouterGenerator.generateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}






















// import 'package:brag/src/pages/login_page.dart';
// import 'package:brag/src/pages/register_form.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'src/models/appdata.dart';
// import 'src/pages/home.dart';
// import 'src/pages/preload_page.dart';
// import 'src/pages/search_page.dart';
// import 'src/pages/lazer_page.dart';
// import 'src/pages/favorites.dart';
// import 'src/pages/listarea_page.dart';
// import 'src/pages/local_page.dart';
// // import 'src/firebase/consulta.dart';

// void main() => runApp(
//       MultiProvider(
//         providers: [ChangeNotifierProvider(create: (context) => AppData())],
//         child: MyApp(),
//       ),
//     );

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       routes: {
//         '/preload': (context) => PreloadPage(),
//         '/home': (context) => HomePage(),
//         '/search': (context) => SearchPage(),
//         '/lazer': (context) => LazerPage(),
//         '/favorites': (context) => FavoritesPage(),
//         '/listarea': (context) => ListAreaPage(),
//         '/local': (context) => LocalPage(),
//         '/login': (context) => LoginPage(),
//         '/register': (context) => RegisterForm(),
//         // '/firebase_consulta': (context) => FirebaseConsultaPage()
//       },
//       initialRoute: '/register', // certo
//       // initialRoute: '/home', // só pra abrir
//     );
//   }
// }
