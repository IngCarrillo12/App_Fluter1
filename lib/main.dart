import 'package:first_task/Pages/calculateCylinder.dart';
import 'package:first_task/Pages/calculateMonthlyFee.dart';
import 'package:first_task/Pages/calculatepropina.dart';
import 'package:first_task/Pages/home.dart';
import 'package:first_task/Pages/myform.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Calcultadora',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 17, 76, 202)),
        fontFamily: 'Roboto',
        useMaterial3: false,
      ),
     initialRoute: 'home',  
      routes: {
        'home': (context) => const Home(), 
        'calculateCylinder': (context) => const Calculatecylinder(),
        'calculateMontyhlyFee': (context) => const Calculatemonthlyfee(),
        'calculatePropina': (context) => const Calculatepropina(),
        'formularioSatisfaccion': (context) => const Myform(),
      },
    );
  }
}

 