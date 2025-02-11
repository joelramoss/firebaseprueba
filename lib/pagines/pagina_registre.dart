import 'package:firebaseprueba/components/boto_auth.dart';
import 'package:firebaseprueba/components/textFieldreut.dart';
import 'package:flutter/material.dart';

class PaginaRegistre extends StatelessWidget {
  const PaginaRegistre({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController TECemail = TextEditingController();
    TextEditingController TECpass = TextEditingController();
    TextEditingController TECconfPass = TextEditingController();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 183, 159),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Logo
                const Icon(
                  Icons.fireplace,
                  size: 100,
                  color: Color.fromARGB(255, 255, 240, 218),
                ),
                const SizedBox(
                  height: 25,
                ),
                //frase
                const Text(
                  "Crea un compte nou",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Color.fromARGB(255, 255, 240, 218),
                  ),
                ),
                //Linea divisoria
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(children: [
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Color.fromARGB(255, 255, 240, 218),
                    )),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        "Registra't",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Color.fromARGB(255, 255, 240, 218),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Color.fromARGB(255, 255, 240, 218),
                    ))
                  ]),
                ),

                Textfieldreut(
                  nombre: "Correo electronico",
                  nombrehint: "Escribe tu correo electronico",
                  isPassword: false,
                  controller: TECemail,
                ),
                Textfieldreut(
                  nombre: "Contrasenya",
                  nombrehint: "Posa la teva contrasenya",
                  isPassword: true,
                  controller: TECpass,
                ),
                Textfieldreut(
                  nombre: "Confguracio Contrasenya",
                  nombrehint: "",
                  isPassword: false,
                  controller: TECconfPass,
                ),
                // text no estas registrado
                const SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Ja ets membre?",
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        child: const Text(
                          "Fes Login",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 40, 71, 97)),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                //Boton de Registro

                const BotoAuth(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
