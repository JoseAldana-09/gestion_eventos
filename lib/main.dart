import 'package:flutter/material.dart';
import 'pantallas/conversion_base.dart';
import 'pantallas/conversor_moneda.dart';
import 'pantallas/numero_primo.dart';
import 'pantallas/cambiar_tema.dart';

void main() {
  runApp(const AplicacionGestionEventos());
}

class AplicacionGestionEventos extends StatefulWidget {
  const AplicacionGestionEventos({Key? key}) : super(key: key);

  @override
  _EstadoAplicacionGestionEventos createState() =>
      _EstadoAplicacionGestionEventos();
}

class _EstadoAplicacionGestionEventos extends State<AplicacionGestionEventos> {
  int _indiceSeleccionado = 0;
  bool _modoOscuro = false;

  static const List<Widget> _pantallasFijas = [
    ConversionBase(),
    ConversorMoneda(),
    NumeroPrimo(),
  ];

  List<Widget> get _pantallas {
    return [
      ..._pantallasFijas,
      CambiarTema(
        modoOscuro: _modoOscuro,
        alCambiarTema: _cambiarModo,
      ),
    ];
  }

  void _cambiarModo(bool esModoOscuro) {
    setState(() {
      _modoOscuro = esModoOscuro;
    });
  }

  void _seleccionarPantalla(int indice) {
    setState(() {
      _indiceSeleccionado = indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _modoOscuro ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gestión de Eventos de Juan José Aldana Rodríguez'),
          backgroundColor: _modoOscuro
              ? Colors.black87
              : const Color.fromARGB(255, 250, 104, 37),
        ),
        body: _pantallas[_indiceSeleccionado],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.swap_horiz),
              label: 'Base Numérica',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.attach_money),
              label: 'Conversor Moneda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle),
              label: 'Número Primo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.brightness_6),
              label: 'Tema',
            ),
          ],
          currentIndex: _indiceSeleccionado,
          selectedItemColor: Colors.amber[800],
          unselectedItemColor: Colors.grey[600],
          backgroundColor: _modoOscuro ? Colors.black54 : Colors.white,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          type: BottomNavigationBarType.fixed,
          onTap: _seleccionarPantalla,
        ),
      ),
    );
  }
}
