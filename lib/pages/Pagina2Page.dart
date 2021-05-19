import 'package:flutter/material.dart';
import 'package:flutterr_estados/models/Usuario.dart';
import 'package:flutterr_estados/services/UsuarioService.dart';
import 'package:provider/provider.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: usuarioService.userExist
            ? Text('${usuarioService.usuario.nombre}')
            : Text('No data'),
        centerTitle: true,
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
                //Cuando se esta dentro de un metodo como onPressed,
                //que no se puede "redibujar" se cambia la propiedad
                //por defecto 'listen' a false.
                final usuarioService =
                    Provider.of<UsuarioService>(context, listen: false);
                final newUser = new Usuario(
                    nombre: 'Miguel Hussein',
                    edad: 28,
                    profesiones: [
                      'Fullstack Developer',
                      'Pro Gamer',
                    ]);

                usuarioService.usuario = newUser;
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
                final userService =
                    Provider.of<UsuarioService>(context, listen: false);
                userService.userExist
                    ? userService.cambiarEdad(15)
                    : print('No hay usuario seleccionado.');
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
                usuarioService.agregarProfesion();
              },
            ),
          ],
        ),
      ),
    );
  }
}
