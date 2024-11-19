import 'package:flutter/material.dart';

class CambiarTema extends StatelessWidget {
  final bool modoOscuro;
  final Function(bool) alCambiarTema;

  const CambiarTema(
      {Key? key, required this.modoOscuro, required this.alCambiarTema})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SwitchListTile(
        title: const Text('Modo oscuro'),
        value: modoOscuro,
        onChanged: alCambiarTema,
      ),
    );
  }
}
