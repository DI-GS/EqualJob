import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class HomePage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  // Lista de trabajos de ejemplo (mínimo 6 trabajos)
  final List<Map<String, String>> jobs = [
    {
      'title': 'Desarrollador de Software',
      'description': 'Responsable de desarrollar aplicaciones de software...'
    },
    {
      'title': 'Diseñador Gráfico',
      'description': 'Encargado de diseñar gráficos y materiales visuales...'
    },
    {
      'title': 'Analista de Datos',
      'description': 'Analiza grandes volúmenes de datos para obtener insights...'
    },
    {
      'title': 'Gerente de Proyecto',
      'description': 'Gestiona y coordina los proyectos dentro de la empresa...'
    },
    {
      'title': 'Especialista en Marketing',
      'description': 'Desarrolla y ejecuta estrategias de marketing...'
    },
    {
      'title': 'Administrador de Redes',
      'description': 'Administra y mantiene la infraestructura de redes...'
    },
  ];

  Future<void> _speak(String text) async {
    await flutterTts.speak(text);
  }

  void _showJobDetails(BuildContext context, Map<String, String> job) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(job['title'] ?? 'No title'),
          content: Text(job['description'] ?? 'No description'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cerrar'),
            ),
          ],
        );
      },
    );
    _speak('${job['title'] ?? 'No title'} seleccionado. ${job['description'] ?? 'No description'}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mural de Trabajos'),
      ),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          final job = jobs[index];
          return ListTile(
            title: Text(job['title'] ?? 'No title'),
            onTap: () => _showJobDetails(context, job),
            onLongPress: () => _speak(job['title'] ?? 'No title'),
          );
        },
      ),
    );
  }
}
