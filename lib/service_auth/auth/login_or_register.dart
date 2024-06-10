


import 'package:flutter/material.dart';

import '../../pages/sign_in_page.dart';
import '../../pages/sign_up_page.dart';



class Login_or_Register extends StatefulWidget {
  const Login_or_Register({super.key});

  @override
  State<Login_or_Register> createState() => _Login_or_RegisterState();
}

class _Login_or_RegisterState extends State<Login_or_Register> {

  bool showloginpage = true;

  void togglespages(){

    setState(() {

      showloginpage = !showloginpage;
    });
  }

  @override
  Widget build(BuildContext context) {

    if(showloginpage){

      return SignInPage(
        onTap: togglespages,
      );
    }else{

      return Sign_UP_Page(

        onTap: togglespages,
      );
    }

  }
}
