
import 'package:flutter/material.dart';



import '../service_auth/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});


  void logout() {

    final _auth = AuthService();

    _auth.signout();

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.greenAccent.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.message,
                    color: Colors.green,
                    size: 60,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text('H O M E'),
                  leading: Icon(Icons.home),
                  onTap: () {

                    Navigator.pop(context);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text('P A Y M E N T S'),
                  leading: Icon(Icons.payment_outlined),
                  onTap: () {

                    Navigator.pop(context);


                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 25.0),
                child: ListTile(
                  title: Text('N E W G R O U P'),
                  leading: Icon(Icons.group_add_outlined),
                  onTap: () {

                    Navigator.pop(context);


                  },
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0, bottom: 20.0),
            child: ListTile(
              title: Text('L O G O U T'),
              leading: Icon(Icons.logout_outlined),
              onTap: logout,
            ),
          ),
        ],
      ),
    );
  }
}
