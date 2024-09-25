import 'package:flutter/material.dart';



class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Menu'),
      ),
      body: ListView(
        children: <Widget>[
          _crearItem(context, Icons.calculate, 'Calcular areas y volumen de cilindro', 'calculateCylinder'),
          const Divider(),
          _crearItem(context, Icons.payment, 'Calcular monto mensual', 'calculateMontyhlyFee'),
          const Divider(),
           _crearItem(context, Icons.calculate, 'Calcular propina', 'calculatePropina'),
          const Divider(),
           _crearItem(context, Icons.format_align_center_outlined, 'Formulario de satisfacción', 'formularioSatisfaccion'),
        ],
      ),
    );
  }

  Widget _crearItem(BuildContext context, IconData icon, String nombre, String ruta) {
    return ListTile(
      leading: Icon(icon),
      title: Text(nombre),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Navigator.pushNamed(context, ruta);
      },
    );
  }
}