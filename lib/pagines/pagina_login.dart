
import 'package:firebaseprueba/auth/servei_auth.dart';
import 'package:firebaseprueba/components/boto_auth.dart';
import 'package:firebaseprueba/components/textFieldreut.dart';
import 'package:flutter/material.dart';

class PaginaLogin extends StatelessWidget {
  final Function()? ferClic;
  const PaginaLogin({super.key, required this.ferClic});


  Future<void> ferLogin(BuildContext context, String email, String password) async {

    String? error = (await ServeiAuth().registreAmbEmailIPasswrd(email, password)) as String?;

    if(error != null){
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          backgroundColor: Color.fromARGB(255, 250, 183, 159),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: const Text("Error"),
          content: Text("Email i/o password incorrectes."), 
        ),
      );
    }else{
      print("Login correcte");
    }

  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController tecEmail = TextEditingController();
    final TextEditingController tecPassword = TextEditingController();
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
                  "Benginvut/da de nou",
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 240, 218),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 25),

                // Text divisor
                const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Color.fromARGB(255, 255, 240, 218),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Text(
                          "Fes login",
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
                

                const SizedBox(height: 10),

                // No estas registrado.
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Encara no ets membre?"),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: ferClic,
                        child: const Text(
                          "Registra't",
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
                    text: "Login",
                    onTap: () {
                      ferLogin(context, tecEmail.text, tecPassword.text,
                          );
                    }),
                
              ],
            ),
          ),
        ),
      ),
    ); 
  }
  
  
}






