import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class LoginPage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    _speak(String text) async {
      await flutterTts.speak(text);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de Sesión'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Usuario'),
              onTap: () => _speak('Campo de texto Usuario'),
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
              child: Text('Iniciar Sesión'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Registrar nuevo usuario'),
            ),
          ],
        ),
      ),
    );
  }
}
