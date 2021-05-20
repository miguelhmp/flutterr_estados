import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterr_estados/bloc/usuario/UsuarioCubit.dart';
import 'package:flutterr_estados/models/Usuario.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text(
                'Establecer usuario',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blueAccent,
              onPressed: () {
                final newUser = new Usuario(
                    nombre: 'Miguel Hussein',
                    edad: 28,
                    profesiones: [
                      'FullStack Developer',
                      'Pro Gamer',
                      'Psychopath'
                    ]);
                usuarioCubit.seleccionarUsuario(newUser);
              },
            ),
            MaterialButton(
              child: Text(
                'Cambiar edad',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blueAccent,
              onPressed: () {
                usuarioCubit.cambiarEdad(30);
              },
            ),
            MaterialButton(
              child: Text(
                'Añadir una profesion',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.blueAccent,
              onPressed: () {
                final user = usuarioCubit.state;
                if (user is UsuarioActivo) {
                  usuarioCubit.agregarProfesion([
                    ...user.usuario.profesiones,
                    'Cop',
                    'Programmer',
                    'Analyst',
                  ]);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
