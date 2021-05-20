import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterr_estados/models/Usuario.dart';

part 'UsuarioState.dart';
part 'UsuarioEvent.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  UsuarioBloc() : super(UsuarioState());

  @override
  Stream<UsuarioState> mapEventToState(UsuarioEvent event) async* {
    print(event);
    if (event is ActivarUsuario) {
      yield state.copyWith(user: event.usuario);
    } else if (event is CambiarEdad) {
      yield state.copyWith(user: state.usuario.copyWith(edad: event.edad));
    } else if (event is AgregarProfesion) {
      yield state.copyWith(
          user: state.usuario.copyWith(
              profesiones: [...state.usuario.profesiones, event.profesiones]));
    } else if (event is BorrarUsuario) {
      yield state.InitState();
    }
  }
}
