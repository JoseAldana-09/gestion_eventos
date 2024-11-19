import 'package:flutter/material.dart';

class NumeroPrimo extends StatelessWidget {
  const NumeroPrimo({Key? key}) : super(key: key);

  bool esPrimo(int numero) {
    if (numero < 2) return false;
    for (int i = 2; i <= numero ~/ 2; i++) {
      if (numero % i == 0) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final controladorNumero = TextEditingController();
    final resultado = ValueNotifier<String>("");

    void verificarPrimo() {
      final numero = int.tryParse(controladorNumero.text);
      if (numero == null) {
        resultado.value = "Número inválido";
        return;
      }
      resultado.value = esPrimo(numero) ? "Es primo" : "No es primo";
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: controladorNumero,
            decoration: const InputDecoration(labelText: 'Número'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: verificarPrimo,
            child: const Text('Verificar'),
          ),
          const SizedBox(height: 16),
          ValueListenableBuilder(
            valueListenable: resultado,
            builder: (context, valor, _) {
              return Text("Resultado: $valor");
            },
          ),
        ],
      ),
    );
  }
}
