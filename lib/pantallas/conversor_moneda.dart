import 'package:flutter/material.dart';

class ConversorMoneda extends StatelessWidget {
  const ConversorMoneda({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controladorMonto = TextEditingController();
    final resultado = ValueNotifier<String>("");

    void convertir(bool aDolares) {
      final monto = double.tryParse(controladorMonto.text);
      if (monto == null) {
        resultado.value = "Monto inválido";
        return;
      }

      const tasaCambio = 6.96; // Tasa ficticia
      resultado.value = aDolares
          ? (monto / tasaCambio).toStringAsFixed(2)
          : (monto * tasaCambio).toStringAsFixed(2);
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: controladorMonto,
            decoration: const InputDecoration(labelText: 'Monto'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => convertir(true),
                child: const Text('A Dólares'),
              ),
              ElevatedButton(
                onPressed: () => convertir(false),
                child: const Text('A Bolivianos'),
              ),
            ],
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
