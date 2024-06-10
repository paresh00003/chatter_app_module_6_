
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../service_auth/auth/auth_service.dart';


class SignInPage extends StatelessWidget {
  final void Function()? onTap;

  SignInPage({super.key, required this.onTap});

  TextEditingController _emailcontroller = TextEditingController();

  TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var SizeforHeight = MediaQuery.of(context).size.height;
    var SizeforWidth = MediaQuery.of(context).size.width;

    void login(BuildContext context) async {
      final authservice = AuthService();

      try {
        await authservice.signInWithEmailPassword(
            _emailcontroller.text, _passwordcontroller.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(

            title: Text(e.toString()),
          ),
        );
      }
    }

    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlueAccent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50)),
                  color: Colors.purpleAccent.shade200),
            ),
            SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Center(
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                Text(
                  'Login To Your Account',
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
                      height: SizeforHeight / 2,
                      width: SizeforWidth,
                      decoration: BoxDecoration(
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
                                    prefix: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        size: 17,
                                        Icons.email_outlined,
                                        color: Colors.blue,
                                      ),
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
                                controller: _passwordcontroller,
                                obscureText: true,
                                decoration: InputDecoration(
                                    prefix: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        size: 17,
                                        Icons.password_outlined,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    border: InputBorder.none),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),


                            GestureDetector(
                              onTap: () => login(context),

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
                                    "Sign In",
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),

                            // Center(
                            //   child: ElevatedButton(
                            //     style: ElevatedButton.styleFrom(
                            //         backgroundColor: Colors.blue.shade300),
                            //     onPressed: () => login(context),
                            //     child: Text(
                            //       '   Sign In   ',
                            //       style: TextStyle(
                            //           fontSize: 18,
                            //           color: Colors.white,
                            //           fontWeight: FontWeight.bold),
                            //     ),
                            //   ),
                            // ),
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
                      "Don't have an account?  ",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: onTap,
                      child: Text(
                        "Sign Up Now",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
