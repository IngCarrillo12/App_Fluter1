import 'package:first_task/widgets/inputs.dart';
import 'package:first_task/widgets/textMessage.dart';
import 'package:flutter/material.dart';

class Calculatepropina extends StatefulWidget {
  const Calculatepropina({super.key});

  @override
  State<Calculatepropina> createState() => _CalculatepropinaState();
}

class _CalculatepropinaState extends State<Calculatepropina> {
  final TextEditingController _totalCuenta = TextEditingController();
  final TextEditingController _porcentajePropina = TextEditingController();
  double totalCuenta = 0;
  double porcentajePropina = 0;
  double totalPagar = 0;
  double propina = 0;
  String messageError = '';
  void calcularPropina() {
    setState(() {
      messageError='';
     if (_totalCuenta.text.isEmpty || _porcentajePropina.text.isEmpty) {
        messageError = "Por favor ingresa todos los valores.";
        return;
      }
    totalCuenta = double.tryParse(_totalCuenta.text) ?? 0;
    porcentajePropina = double.tryParse(_porcentajePropina.text) ?? 0;
     if (totalCuenta== 0 || porcentajePropina == 0) {
       messageError = "Por favor ingresa valores válidos para total de cuenta y porcentaje de propina";
        return;
      }
    propina = totalCuenta * (porcentajePropina / 100);
    totalPagar = totalCuenta + propina;
    });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculador propina"),
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
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  
                    Input(
                      labelText: 'Total Cuenta',
                      hintText: '20000',
                      value: _totalCuenta,
                      icon: Icons.attach_money,
                    ),
                  
                  const SizedBox(width: 10),
                   Input(
                      labelText: 'Porcentaje de propina',
                      hintText: '2',
                      value: _porcentajePropina,
                      icon: Icons.percent,
                  
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: (() {
                      calcularPropina();
                    }),
                    child: const Text("Calcular"),
                  ),
                ],
              ),
           
           if(messageError!='')Textmessage(message: messageError, title: 'Error'),
           if (totalCuenta != 0 && porcentajePropina != 0)
              Column(
                children: [
                  Textmessage(message: "$totalCuenta", title: 'Total de cuenta', icon: Icons.attach_money),
                   const Divider(),
                  Textmessage(message: "$porcentajePropina",title: 'Porcentaje de propina', icon: Icons.percent,),
                   const Divider(),
                  Textmessage(message: "$propina", title: 'Propina', icon: Icons.attach_money,),
                   const Divider(),
                  Textmessage(message: "$totalPagar", title: 'Total a pagar', icon: Icons.attach_money),
                   const Divider(),
                ],
              ),
           
          ],
        ),
      ),
    );
  }
}