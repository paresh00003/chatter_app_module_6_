import 'package:chatter_app_module_6/pages/sign_in_page.dart';
import 'package:chatter_app_module_6/pages/sign_up_page.dart';
import 'package:chatter_app_module_6/service_auth/auth/auth_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAYzHYbN9fC1oZZ_NNWqeEXxyfuTS2BnaA",
          appId: "1:51172512230:android:3ed65fa75cd36eb1b1c627",
          messagingSenderId: "51172512230",
          projectId: "chatter-app-5b34c",
          storageBucket: "chatter-app-5b34c.appspot.com"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      debugShowCheckedModeBanner: false,

      home: AuthGate(


      ),
    );
  }
}