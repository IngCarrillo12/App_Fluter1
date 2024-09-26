import 'dart:math';
import 'package:first_task/widgets/inputs.dart';
import 'package:first_task/widgets/textMessage.dart';
import 'package:flutter/material.dart';

class Calculatecylinder extends StatefulWidget {
  const Calculatecylinder({super.key});

  @override
  State<Calculatecylinder> createState() => _CalculatecylinderState();
}

class _CalculatecylinderState extends State<Calculatecylinder> {
  final TextEditingController _radio = TextEditingController();
  final TextEditingController _altura = TextEditingController();
  double radio = 0;
  double altura = 0;
  double resultadoAreaL = 0;
  double resultadoAreaT = 0;
  double resultadoVolumen = 0;
  String messageError = '';

  void Calcular() {
    setState(() {
      if (_radio.text.isEmpty || _altura.text.isEmpty) {
        messageError = "Por favor ingresa todos los valores.";
        return;
      }

      radio = double.tryParse(_radio.text) ?? 0;
      altura = double.tryParse(_altura.text) ?? 0;

      if (radio == 0 || altura == 0) {
        messageError = "Por favor ingresa valores válidos para el radio y la altura.";
        return;
      }

      resultadoAreaL = 2 * pi * radio * altura;
      resultadoAreaT = 2 * pi * radio * (radio + altura);
      resultadoVolumen = pi * pow(radio, 2) * altura;
    });
  }

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de área y volumen cilíndrico"),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, 'home');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Input(
                      labelText: 'Radio',
                      hintText: '1.5',
                      value: _radio,
                      icon: Icons.circle_rounded,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 1,
                    child: Input(
                      labelText: 'Altura',
                      hintText: '2',
                      value: _altura,
                      icon: Icons.height,
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {
                      Calcular();
                    },
                    child: const Text("Calcular"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (messageError != '')
                Textmessage(message: messageError, title: 'Error'),
              if (radio != 0 || altura != 0)
                Column(
                  children: [
                    Textmessage(
                        message: "$resultadoAreaL",
                        title: 'Área Lateral ',
                        icon: Icons.area_chart),
                    Textmessage(
                        message: "$resultadoAreaT",
                        title: 'Área Total ',
                        icon: Icons.area_chart),
                    Textmessage(
                        message: "$resultadoVolumen",
                        title: 'Volumen ',
                        icon: Icons.square),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
