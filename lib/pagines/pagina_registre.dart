
import 'package:firebaseprueba/auth/servei_auth.dart';
import 'package:firebaseprueba/components/boto_auth.dart';
import 'package:firebaseprueba/components/textFieldreut.dart';
import 'package:flutter/material.dart';

class PaginaRegistre extends StatelessWidget {
  final Function()? ferClic;
  void ferRegistre(BuildContext context, String email, String password,
      String confPassword) async {
    if (password.isEmpty || email.isEmpty) {
      // Gestionar-se del cas
      return;
    }
    ;

    if (password != confPassword) {
      // Gestio del cas
      return;
    }
    // ? = Puede retornar algo o no retornar nada
    String? error = (await ServeiAuth().registreAmbEmailIPasswrd(email, password)) as String?;
    if (error != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 250, 183, 159),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Text("Error"),
          content: Text("Email i/o password incorrectes."), 
        ),
      );
    }
  }

  const PaginaRegistre({super.key, required this.ferClic});

  @override
  Widget build(BuildContext context) {
    final TextEditingController tecEmail = TextEditingController();
    final TextEditingController tecPassword = TextEditingController();
    final TextEditingController tecConfirmPassword = TextEditingController();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 183, 159),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                const Icon(
                  Icons.fireplace,
                  size: 120,
                  color: Color.fromARGB(255, 255, 240, 218),
                ),

                const SizedBox(height: 25),

                // Frase
                const Text(
                  "Crea un compte nou",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 240, 218),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                // Text divisor
                const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 255, 240, 218),
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          "Registrate",
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 240, 218)),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 255, 240, 218),
                        ),
                      ),
                    ],
                  ),
                ),

                // TextField Email.
                Textfieldreut(
                    nombre: "Escriu el teu correu electronic",
                    nombrehint: "Escriu el teu correu electronic",
                    isPassword: false,
                    controller: tecEmail,
                ),

                // TextField Password.
                Textfieldreut(
                    nombre: "Contrasenya",
                    nombrehint: "Posa la teva contrasenya",
                    isPassword: true,
                    controller: tecPassword,
                    
                    ),

                // TextField Confirm Password.
                Textfieldreut(
                    nombre: "Confirma la contrasenya",
                    nombrehint: "Confirma la contrasenya",
                    isPassword: true,
                    controller: tecConfirmPassword,
                ),

                const SizedBox(height: 10),

                // No estas registrado.
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Ja ets membre?"),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: ferClic,
                        child: const Text(
                          "Fes login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 40, 71, 97),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                // Boton Registrar.
                BotoAuth(
                    text: "Registrar",
                    onTap: () {
                      ferRegistre(context, tecEmail.text, tecPassword.text,
                          tecConfirmPassword.text);
                    }),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
