//Esta clase va a ser "parte" de mi "UsuarioCubit

part of 'UsuarioCubit.dart';

@immutable
abstract class UsuarioState {}

class UsuarioInitial extends UsuarioState {
  final userExist = false;
}

class UsuarioActivo extends UsuarioState {
  final userExist = true;
  final Usuario usuario;

  UsuarioActivo(this.usuario);
}
