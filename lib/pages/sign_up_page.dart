
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../service_auth/auth/auth_service.dart';



class Sign_UP_Page extends StatelessWidget {
  final void Function()? onTap;

  Sign_UP_Page({super.key, required this.onTap});

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  TextEditingController _confirmcontroller = TextEditingController();


  void register(BuildContext context) {
    final _auth = AuthService();

    
      
    if (_passwordcontroller.text == _confirmcontroller.text){
      
      try{

        _auth.signupwithemailandpassword(  
            _emailcontroller.text,
            _passwordcontroller.text);
      }catch (e){

        showDialog(
          context: context,
          builder: (context) => AlertDialog(

            title: Text(e.toString()),
          ),
        );
      }
      
    }else{

      showDialog(
        context: context,
        builder: (context) => AlertDialog(

          title: Text("Password don't match!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var SizeforHeight = MediaQuery
        .of(context)
        .size
        .height;
    var SizeforWidth = MediaQuery
        .of(context)
        .size
        .width;

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery
                  .of(context)
                  .size
                  .height / 4.0,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery
                              .of(context)
                              .size
                              .width, 50)),
                  color: Colors.purpleAccent.shade200),
            ),
            SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Text(
                  'Create Your Account',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade200),
                ),

                SizedBox(
                  height: 30,
                ),

                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      height: SizeforHeight / 1.6,
                      width: SizeforWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Email',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1.0, color: Colors.black12)),
                              child: TextFormField(
                        
                                controller: _emailcontroller,
                                decoration: InputDecoration(
                                    prefix: Icon(
                                      size: 17,
                                      Icons.email_outlined,
                                      color: Colors.blue,
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                            Text(
                              'Password',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1.0, color: Colors.black12)),
                              child: TextFormField(
                                obscureText: true,
                                controller: _passwordcontroller,
                                decoration: InputDecoration(
                                    prefix: Icon(
                                      size: 17,
                                      Icons.password_outlined,
                                      color: Colors.blue,
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                            Text(
                              'Confirm Password',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1.0, color: Colors.black12)),
                              child: TextFormField(
                                controller: _confirmcontroller,
                                obscureText: true,
                                decoration: InputDecoration(
                                    prefix: Icon(
                                      size: 17,
                                      Icons.password_outlined,
                                      color: Colors.blue,
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () => register(context),
                        
                              child: Container(
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.symmetric(horizontal: 20),
                                width: MediaQuery
                                    .of(context)
                                    .size
                                    .width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue,
                                ),
                                child: Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?  ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        "Login Now",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
