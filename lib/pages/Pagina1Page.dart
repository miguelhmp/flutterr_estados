import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterr_estados/bloc/usuario/UsuarioBloc.dart';
import 'package:flutterr_estados/models/Usuario.dart';

class Pagina1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usr = BlocProvider.of<UsuarioBloc>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: usr.state.userExist
            ? Text('${usr.state.usuario.nombre}')
            : Text('No data'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                usr.add(BorrarUsuario());
              }),
        ],
      ),
      body: BlocBuilder<UsuarioBloc, UsuarioState>(
        builder: (_, state) {
          return state.userExist
              ? InformacionUsuario(usuario: state.usuario)
              : Center(child: Text('No hay un usuario seleccionado'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.accessibility_new),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;

  const InformacionUsuario({this.usuario});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'General',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(
            color: Colors.black26,
          ),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          Text('Profesiones',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
          Divider(color: Colors.black26),
          // ListTile(title: Text('Profesion 1')),
          ...usuario.profesiones
              .map((profesiones) => ListTile(title: Text(profesiones)))
              .toList()
        ],
      ),
    );
  }
}
