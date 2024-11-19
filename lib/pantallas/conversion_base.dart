import 'package:flutter/material.dart';

class ConversionBase extends StatelessWidget {
  const ConversionBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controladorNumero = TextEditingController();
    final resultado = ValueNotifier<String>("");

    void convertir(String base) {
      final numero = int.tryParse(controladorNumero.text);
      if (numero == null) {
        resultado.value = "Número inválido";
        return;
      }

      switch (base) {
        case 'Binario':
          resultado.value = numero.toRadixString(2);
          break;
        case 'Octal':
          resultado.value = numero.toRadixString(8);
          break;
        case 'Hexadecimal':
          resultado.value = numero.toRadixString(16).toUpperCase();
          break;
        default:
          resultado.value = "Base no soportada";
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: controladorNumero,
            decoration: const InputDecoration(labelText: 'Número decimal'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['Binario', 'Octal', 'Hexadecimal'].map((base) {
              return ElevatedButton(
                onPressed: () => convertir(base),
                child: Text(base),
              );
            }).toList(),
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
