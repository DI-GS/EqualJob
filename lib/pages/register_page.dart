import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class RegisterPage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    _speak(String text) async {
      await flutterTts.speak(text);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Nombre de Usuario'),
              onTap: () => _speak('Campo de texto Nombre de Usuario'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Correo Electrónico'),
              onTap: () => _speak('Campo de texto Correo Electrónico'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
              onTap: () => _speak('Campo de texto Contraseña'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
              child: Text('Registrar'),
            ),
          ],
        ),
      ),
    );
  }
}
