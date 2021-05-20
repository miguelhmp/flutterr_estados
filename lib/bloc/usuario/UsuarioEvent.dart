part of 'UsuarioBloc.dart';

@immutable
abstract class UsuarioEvent {}

class ActivarUsuario extends UsuarioEvent {
  final Usuario usuario;
  ActivarUsuario({this.usuario});
}

class CambiarEdad extends UsuarioEvent {
  final int edad;

  CambiarEdad(this.edad);
}

class AgregarProfesion extends UsuarioEvent {
  // final List<String> profesiones;

  final String profesiones;

  AgregarProfesion(this.profesiones);
}

class BorrarUsuario extends UsuarioEvent {}
