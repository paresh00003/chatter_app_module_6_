import 'package:chatter_app_module_6/service_auth/auth/auth_service.dart';
import 'package:chatter_app_module_6/service_auth/chat/chat_service.dart';
import 'package:flutter/material.dart';

import '../components/my_drawer.dart';
import '../components/user_tile.dart';
import 'chat_page.dart';

class Home_Page extends StatelessWidget {

   Home_Page({super.key});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home',style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.green,
      ),
      drawer: const MyDrawer(),
      body: _userList(),
    );
  }

  Widget _userList() {
    return StreamBuilder(
      stream: _chatService.getUsersStream(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {

          return Text('Error');

        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }

          return ListView(
            children:
                snapshot.data!.map<Widget>((userData) => _userListitem(userData,context)).toList(),
          );

      },
    );
  }

  Widget _userListitem(Map<String, dynamic> userData, BuildContext context) {


    if(userData['email'] != _authService.getcurrentUsers()){

      return UserTile(
        text: userData["email"],
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverEmail: userData["email"],
                  receiverID: userData["uid"],
                ),
              ));
        },
      );
    } else{

      return Container();
    }
  }
}
