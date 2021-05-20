part of 'UsuarioBloc.dart';

class UsuarioState {
  final bool userExist;
  final Usuario usuario;

  UsuarioState({Usuario user})
      : usuario = user ?? null,
        userExist = (user != null) ? true : false;

  UsuarioState copyWith({Usuario user}) {
    return UsuarioState(user: user ?? this.usuario);
  }

  UsuarioState InitState() => new UsuarioState();
}
