import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterr_estados/bloc/usuario/UsuarioBloc.dart';
import 'package:flutterr_estados/pages/Pagina1Page.dart';

import 'pages/Pagina2Page.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => new UsuarioBloc()),
      ],
      child: MyApp(),
    ),
  );
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
