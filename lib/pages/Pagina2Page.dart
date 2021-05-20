import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterr_estados/bloc/usuario/UsuarioBloc.dart';
import 'package:flutterr_estados/models/Usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioBloc = BlocProvider.of<UsuarioBloc>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: usuarioBloc.state.userExist
            ? Text('${usuarioBloc.state.usuario.nombre}')
            : Text('No data'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Establecer usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blueAccent,
              onPressed: () {
                final newUser = new Usuario(
                  nombre: 'Miguel Montes',
                  edad: 28,
                  profesiones: ['Developer', 'Doctor', 'Analyst'],
                );
                usuarioBloc.add(
                  ActivarUsuario(usuario: newUser),
                );
              },
            ),
            MaterialButton(
              child:
                  Text('Cambiar edad', style: TextStyle(color: Colors.white)),
              color: Colors.blueAccent,
              onPressed: () {
                usuarioBloc.state.userExist
                    ? usuarioBloc.add(CambiarEdad(30))
                    : print('No hay un usuario seleccionado');
              },
            ),
            MaterialButton(
              child: Text('Añadir una profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blueAccent,
              onPressed: () {
                if (usuarioBloc.state.userExist) {
                  // final prof = usuarioBloc.state.usuario.profesiones;
                  // usuarioBloc.add(AgregarProfesion([
                  //   ...prof,
                  //   'Ingeniero',
                  //   'Mecanico',
                  // ]));
                  usuarioBloc.add(AgregarProfesion('Marinero'));
                } else {
                  print('No hay un usuario seleccionado');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
