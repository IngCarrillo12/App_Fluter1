import 'package:first_task/widgets/checkBoxList.dart';
import 'package:first_task/widgets/radiolist.dart';
import 'package:first_task/widgets/textField.dart';
import 'package:flutter/material.dart';


class Myform extends StatefulWidget {
  const Myform({super.key});

  @override
  _MyformState createState() => _MyformState();
}

class _MyformState extends State<Myform> {
  int _selectedRating = 1; 
  final List<String> _characteristics = [
    'Buena atención',
    'Ambiente agradable',
    'Comida deliciosa',
    'Rápida atención',
    'Precios accesibles'
  ];
  final List<bool> _selectedCharacteristics = [false, false, false, false, false];
  final TextEditingController _commentsController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final List<String> selectedCharacteristics = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
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
         child: Padding(
          padding: const EdgeInsets.all(16.0), 
        child: Form(
          key: _formKey,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                'Califica nuestro servicio:',
                style: TextStyle(
                  fontSize: 18,
                fontWeight: FontWeight.w600,
                  ),
              ),
              Radiolist(
                selectedRating: _selectedRating,
                onChanged: (int? newValue) {
                  setState(() {
                    _selectedRating = newValue ?? 1; 
                  });
                },
              ),
              const SizedBox(height: 20),
              Text('Calificación seleccionada: $_selectedRating'),


              const SizedBox(height: 20),
              const Text(
                '¿Qué te gustó del servicio?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,),
              ),
              CheckboxList(
                items: _characteristics, 
                selectedItems: _selectedCharacteristics, 
                onChanged: (int index) {
                  setState(() {
                    _selectedCharacteristics[index] = !_selectedCharacteristics[index];
                  });
                },
              ),
              const SizedBox(height: 20),
              Text('Características seleccionadas: ${_getSelectedCharacteristics()}'),

              const SizedBox(height: 20),
              Textfield(
                controller: _commentsController,
                labelText: 'Comentarios adicionales',
                hintText: 'Escribe tus comentarios aquí',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingresa un comentario';
                  }
                  return null;
                },
                maxLines: 4,
                
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Enviar'),
              ),

            ],
          ),
        ),
         ),
      ),
    );
  }
  String _getSelectedCharacteristics() {
  for (int i = 0; i < _characteristics.length; i++) {
    if (_selectedCharacteristics[i]) {
      if (!selectedCharacteristics.contains(_characteristics[i])) {
        selectedCharacteristics.add(_characteristics[i]);

      }
    } else {
      if (selectedCharacteristics.contains(_characteristics[i])) {
        selectedCharacteristics.remove(_characteristics[i]);
      }
    }
  }
  return selectedCharacteristics.join(', ');
}



  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_selectedRating == 0 || !selectedCharacteristics.isNotEmpty) {
        _showSentDialog('Por favor llena todas las preguntas. ',false);
        return;
      }
      _showSentDialog('Formulario enviado correctamente ',true);
    }
  }

  void _showSentDialog(String message, bool sent) {
   showDialog(
  context: context,
  builder: (context) => AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20), 
    ),
    backgroundColor: Colors.white, 
    title: sent
        ? const Text(
            'Éxito',
            style: TextStyle(
            color: Colors.green, 
            fontWeight: FontWeight.bold, 
            fontSize: 24,
            ),
          )
        : const Text(
            'Error',
            style: TextStyle(
              color: Colors.red, 
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
    content: Text(
      message,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black87, 
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          sent?Navigator.pushNamed(context, 'home'):Navigator.of(context).pop();
        },
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          backgroundColor: Colors.blue, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10), 
          ),
        ),
        child: const Text(
          'OK',
          style: TextStyle(
            color: Colors.white, 
            fontSize: 16, 
            fontWeight: FontWeight.bold, 
          ),
        ),
      ),
    ],
  ),
);

  }
}
