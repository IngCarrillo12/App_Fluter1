import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Input extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController value;
  final IconData icon;

  const Input({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.value,
    required this.icon, 
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        child: TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.allow(RegExp(r'[\d.]')),
          ],
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(181, 0, 0, 0),
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 17, 76, 202),
                width: 2.0,
              ),
            ),
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 18,
              color: Color.fromARGB(179, 0, 0, 0),
            ),
            floatingLabelStyle: const TextStyle(
              color: Color.fromARGB(255, 17, 76, 202),
              fontWeight: FontWeight.w700,
              shadows: [
                Shadow(
                  color: Color.fromARGB(255, 17, 76, 202),
                  offset: Offset(2, 3),
                  blurRadius: 2.2,
                ),
              ],
            ),
            labelText: labelText,
            hintText: hintText,
            suffixIcon: Icon(icon),
            
            
           
          ),
          controller: value,
        ),
      ),
    );
  }
}
