import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


import '../../pages/home_page.dart';
import 'login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return  Home_Page();
          } else {
            return const Login_or_Register();
          }
        },
      ),
    );
  }
}
