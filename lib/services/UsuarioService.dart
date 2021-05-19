import 'package:flutter/material.dart';
import 'package:flutterr_estados/models/Usuario.dart';

class UsuarioService with ChangeNotifier {
  Usuario _usuario;

  Usuario get usuario => _usuario;

  set usuario(Usuario value) {
    _usuario = value;
    notifyListeners();
  }

  bool get userExist => (this._usuario != null) ? true : false;

  void cambiarEdad(int edad) {
    this._usuario.edad = edad;
    notifyListeners();
  }

  void removerUsuario() {
    this._usuario = null;
    notifyListeners();
  }

  void agregarProfesion() {
    this
        ._usuario
        .profesiones
        .add('Profesion ${_usuario.profesiones.length + 1}');
    notifyListeners();
  }
}
