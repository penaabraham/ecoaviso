import 'package:flutter/material.dart';

class CrearCuentaPage extends StatefulWidget {
  const CrearCuentaPage({Key? key}) : super(key: key);

  @override
  _CrearCuentaPageState createState() => _CrearCuentaPageState();
}

class _CrearCuentaPageState extends State<CrearCuentaPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  // --- NUEVOS CONTROLADORES ---
  final _municipioController = TextEditingController();
  final _coloniaController = TextEditingController();
  // --------------------------

  bool _obscureText = true;

  void _signup() {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    // --- NUEVOS VALORES ---
    String municipio = _municipioController.text.trim();
    String colonia = _coloniaController.text.trim();
    // ----------------------

    // Modificamos la validación para incluir los nuevos campos si son obligatorios
    if (name.isEmpty || email.isEmpty || password.isEmpty || municipio.isEmpty || colonia.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor, completa todos los campos')),
      );
      return;
    }

    // Aquí podrías usar los valores de los nuevos campos:
    // print('Nombre: $name');
    // print('Email: $email');
    // print('Contraseña: $password');
    // print('Municipio: $municipio');
    // print('Colonia: $colonia');

    // Simulate successful account creation
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Cuenta creada con éxito! Por favor, inicia sesión.')),
    );
    // Navigate back to the login page after successful signup
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                // Imagen superior
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/logocrear.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Título
                const Text(
                  'Crear Cuenta',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                const Text("Completa los campos a continuación."),
                const SizedBox(height: 20),
                // Campo de nombre
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Campo de email
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                // Campo de contraseña
                TextField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
                // --- NUEVOS CAMPOS DE TEXTO ---
                const SizedBox(height: 15), // Espacio entre campos
                TextField(
                  controller: _municipioController,
                  decoration: InputDecoration(
                    labelText: 'Municipio', // Etiqueta del campo
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 15), // Espacio entre campos
                TextField(
                  controller: _coloniaController,
                  decoration: InputDecoration(
                    labelText: 'Colonia', // Etiqueta del campo
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                // -----------------------------
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _signup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Crear Cuenta',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                // Enlace de inicio de sesión
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("¿Ya tienes una cuenta? "),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Iniciar sesión",
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}