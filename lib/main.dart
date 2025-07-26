import 'package:ecoaviso/pages/CrearCuentaPage.dart';
import 'package:flutter/material.dart';
import 'package:ecoaviso/pages/InicioSesion.dart';
import 'package:ecoaviso/pages/HomePage.dart'; // Import HomePage

void main() async {
  runApp(const EcoAvisoApp());
}

class EcoAvisoApp extends StatelessWidget {
  const EcoAvisoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoAviso',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => InicioSesion(),
        '/signup': (context) => CrearCuentaPage(),
        '/home': (context) => HomePage(), // Define the route for HomePage
      },
    );
  }
}
