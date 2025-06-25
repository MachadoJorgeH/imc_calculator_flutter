import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  String _infoText = "Informe seus dados";

  void _resetFields() {
    _weightController.text = "";
    _heightController.text = "";
    setState(() {
      _infoText = "Informe seus dados";
    });
  }

  void _calculate() {
    if (_weightController.text.isEmpty || _heightController.text.isEmpty) {
      setState(() {
        _infoText = "Por favor, preencha todos os campos!";
      });
      return; // Sai da função sem calcular
    }
    // Pega o valor dos controladores e converte para double
    double weight = double.parse(_weightController.text);
    double height =
        double.parse(_heightController.text) / 100; // Convertendo cm para m

    double imc = weight / (height * height);

    // setState é ESSENCIAL. Ele avisa o Flutter que a tela precisa ser redesenhada
    setState(() {
      if (imc < 18.6) {
        _infoText = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _infoText = "Peso Ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _infoText = "Levemente Acima do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _infoText = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _infoText = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40) {
        _infoText = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculadora de IMC",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange.shade700,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Icon(Icons.person_outline, size: 120.0, color: Colors.orange),

            // Campo de texto para o Peso
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Peso (kg)",
                labelStyle: TextStyle(color: Colors.black),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.orange, fontSize: 25.0),
            ),

            // Campo de texto para a Altura
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Altura (cm)",
                labelStyle: TextStyle(color: Colors.black),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.orange, fontSize: 25.0),
            ),

            const SizedBox(height: 20), // Apenas para dar um espaço
            // Botão de Calcular
            ElevatedButton(
              onPressed: () {
                _calculate();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text(
                "Calcular",
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),

            const SizedBox(height: 20), // Apenas para dar um espaço
            // Botão de Limpar
            ElevatedButton(
              onPressed: () {
                _resetFields();
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              child: const Text(
                "Limpar dados",
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),

            const SizedBox(height: 20), // Apenas para dar um espaço
            // Texto onde o resultado aparecerá
            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
            ),
          ],
        ),
      ),
    );
  }
}
