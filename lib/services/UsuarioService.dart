import 'dart:async';

import 'package:flutterr_estados/models/Usuario.dart';

class _UsuarioService {
  Usuario _usuario;

  StreamController<Usuario> _usuarioStreamController =
      new StreamController.broadcast();

  Stream<Usuario> get usuarioStream => _usuarioStreamController.stream;

  bool get userExist => (this._usuario != null) ? true : false;

  Usuario get usuario => this._usuario;

  set usuario(Usuario usuario) {
    this._usuario = usuario;
    //Se añade un nuevo elemento al stream
    this._usuarioStreamController.add(usuario);
  }

  set cambiarEdad(int edad) {
    this._usuario.edad = edad;
    //Se devuelve el usuario actualizado por medio del stream
    this._usuarioStreamController.add(this._usuario);
  }

  closeStream() {
    this._usuarioStreamController?.close();
  }
}

//Singleton simple
final usuarioService = new _UsuarioService();
