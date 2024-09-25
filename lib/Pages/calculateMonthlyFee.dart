import 'dart:math';

import 'package:first_task/widgets/inputs.dart';
import 'package:first_task/widgets/textMessage.dart';
import 'package:flutter/material.dart';

class Calculatemonthlyfee extends StatefulWidget {
  const Calculatemonthlyfee({super.key});

  @override
  State<Calculatemonthlyfee> createState() => _CalculatemonthlyfeeState();
}

class _CalculatemonthlyfeeState extends State<Calculatemonthlyfee> {
  final TextEditingController _montoPrestamo = TextEditingController();
  final TextEditingController _tasaInteresAnual = TextEditingController();
  final TextEditingController _anosPrestamo = TextEditingController();
  double tasaInteresAnual = 0;
  double montoPrestamo = 0;
  int anosPrestamo = 0;
  double tasaInteresMensual = 0;
  double cuotaMensual = 0;
  String messageError = '';
  int totalPagos = 0;
  void calcularCuotaMensual() {
    setState(() {
    if (_montoPrestamo.text.isEmpty || _tasaInteresAnual.text.isEmpty || _anosPrestamo.text.isEmpty) {
       messageError = "Por favor ingresa todos los valores.";
        return;
      }  
    tasaInteresAnual = double.tryParse(_tasaInteresAnual.text)?? 0;
    montoPrestamo = double.tryParse(_montoPrestamo.text)?? 0;
    anosPrestamo = int.tryParse(_anosPrestamo.text)?? 0;
    if (tasaInteresAnual == 0 || montoPrestamo == 0 || anosPrestamo == 0) {
       messageError = "Por favor ingresa valores válidos > 0";
        return;
      }
    tasaInteresMensual = tasaInteresAnual / 12 / 100;
    totalPagos = anosPrestamo * 12;
    cuotaMensual = montoPrestamo *
      (tasaInteresMensual * pow((1 + tasaInteresMensual), totalPagos)) /
      (pow((1 + tasaInteresMensual), totalPagos) - 1);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcular monto mensual'),
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pushNamed(context, 'home'); // Navega a la ruta Home
            },
          ),
        ],
        ),
        
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity, 
          alignment: Alignment.center, 
          padding: const EdgeInsets.all(16.0), 
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                    Input(
                      labelText: 'Monto prestamo',
                      hintText: '20000',
                      value: _montoPrestamo,
                      icon: Icons.attach_money_rounded,
                    ),
                  
                  const SizedBox(width: 10),
                   Input(
                      labelText: 'Tasa interes',
                      hintText: '2',
                      value: _tasaInteresAnual,
                      icon: Icons.percent,
                  
                  ),
                  const SizedBox(width: 10),
                   Input(
                      labelText: 'Años prestamo',
                      hintText: '3',
                      value: _anosPrestamo,
                      icon: Icons.calendar_month,
                  
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: (() {
                      calcularCuotaMensual();
                    }),
                    child: const Text("Calcular"),
                  ),
            if(messageError!='')Textmessage(message: messageError, title: 'Error'),
           if (tasaInteresAnual != 0 || montoPrestamo != 0 || anosPrestamo != 0)Textmessage(message: "$cuotaMensual", title: 'Couta mensual ', icon: Icons.attach_money),
            
          ],
        ),
      ),
       )
    );
  }
}