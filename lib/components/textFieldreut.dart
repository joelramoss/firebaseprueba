import 'package:flutter/material.dart';

class Textfieldreut extends StatelessWidget {
  final String nombre;
  final String nombrehint;
  final bool? isPassword;
  final TextEditingController? controller;
  const Textfieldreut({super.key, required this.nombre, required this.nombrehint, this.isPassword, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        cursorColor: const Color.fromARGB(255, 222, 100, 0),
        style: const TextStyle(
          color: Color.fromARGB(255, 154, 69, 0),
        ),
        controller: TextEditingController(),
        obscureText: isPassword!,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Color.fromARGB(255, 255, 229,190),
              width: 2,
            ),
          ),
          focusedBorder:  const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          fillColor: const Color.fromARGB(255, 255, 205, 130),
          filled: true,
          labelText: nombre,
          hintText: nombrehint,
          hintStyle:  TextStyle(
            color: Colors.orange[800],
          ),
        ),
      ),
    );
  }
}
