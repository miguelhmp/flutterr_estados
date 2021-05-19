import 'package:flutter/material.dart';
import 'package:flutterr_estados/services/UsuarioService.dart';
import 'package:provider/provider.dart';

import 'package:flutterr_estados/pages/Pagina1Page.dart';
import 'pages/Pagina2Page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => new UsuarioService(),
      )
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'pagina1',
      routes: {
        'pagina1': (_) => Pagina1Page(),
        'pagina2': (_) => Pagina2Page(),
      },
    );
  }
}
