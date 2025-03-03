import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseprueba/auth/portal_auth.dart';
import 'package:firebaseprueba/firebase_options.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PortalAuth(),
      debugShowCheckedModeBanner: false,
    );
  }
}
