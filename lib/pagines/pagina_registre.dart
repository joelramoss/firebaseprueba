
import 'package:firebaseprueba/pagines/pagina_inici';
import 'package:flutter/material.dart';
import 'package:firebaseprueba/auth/servei_auth.dart';
import 'package:firebaseprueba/components/boto_auth.dart';
import 'package:firebaseprueba/components/textFieldreut.dart';

class PaginaRegistre extends StatelessWidget {
  final Function()? ferClic;

  const PaginaRegistre({super.key, required this.ferClic});

  Future<void> ferRegistre(BuildContext context, String email, String password, String confPassword) async {
    if (password.isEmpty || email.isEmpty) {
      return;
    }

    if (password != confPassword) {
      return;
    }

    try {
      String? error = await ServeiAuth().registreAmbEmailIPasswrd(email, password);
      if (error != null) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: const Color.fromARGB(255, 250, 183, 159),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text("Error"),
            content: const Text("Email i/o password incorrectes."),
          ),
        );
      } else {
        // Redirigir a la página de inicio
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => PaginaInici()),
        );
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController tecEmail = TextEditingController();
    final TextEditingController tecPassword = TextEditingController();
    final TextEditingController tecConfirmPassword = TextEditingController();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 183, 159),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.fireplace, size: 120, color: Color.fromARGB(255, 255, 240, 218)),
                const SizedBox(height: 25),
                const Text("Crea un compte nou", style: TextStyle(color: Color.fromARGB(255, 255, 240, 218), fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(child: Divider(thickness: 1, color: Color.fromARGB(255, 255, 240, 218))),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Text("Regístrate", style: TextStyle(color: Color.fromARGB(255, 255, 240, 218))),
                      ),
                      Expanded(child: Divider(thickness: 1, color: Color.fromARGB(255, 255, 240, 218))),
                    ],
                  ),
                ),
                Textfieldreut(
                  nombre: "Escriu el teu correu electronic",
                  nombrehint: "Escriu el teu correu electronic",
                  isPassword: false,
                  controller: tecEmail,
                ),
                Textfieldreut(
                  nombre: "Contrasenya",
                  nombrehint: "Posa la teva contrasenya",
                  isPassword: true,
                  controller: tecPassword,
                ),
                Textfieldreut(
                  nombre: "Confirma la contrasenya",
                  nombrehint: "Confirma la contrasenya",
                  isPassword: true,
                  controller: tecConfirmPassword,
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text("Ja ets membre?"),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: ferClic,
                        child: const Text(
                          "Fes login",
                          style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 40, 71, 97)),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                BotoAuth(
                  text: "Registrar",
                  onTap: () {
                    ferRegistre(context, tecEmail.text, tecPassword.text, tecConfirmPassword.text);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
