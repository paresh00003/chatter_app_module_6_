import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../service_auth/auth/auth_service.dart';
import '../service_auth/chat/chat_service.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({super.key, required this.receiverEmail, required this.receiverID});

  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  final TextEditingController _messagecontroller = TextEditingController();

  void sendmessage() async {
    if (_messagecontroller.text.isNotEmpty) {
      await _chatService.sendMessage(receiverID, _messagecontroller.text);
      _messagecontroller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail,style: TextStyle(
          color: Colors.white
        ),),

        backgroundColor: Colors.green.shade700,
      ),
      body: Column(
        children: [
          Expanded(child: _buildmessagelist()),
          _buildUserInput(),
        ],
      ),
    );
  }

  Widget _buildmessagelist() {
    String senderID = _authService.getcurrentUsers()!.uid;

    return StreamBuilder(
      stream: _chatService.getmesssage(receiverID, senderID),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading..");
        }

        return ListView(
          children: snapshot.data!.docs.map((doc) => _buildmessageitem(doc)).toList(),
        );
      },
    );
  }

  Widget _buildmessageitem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;

    // Check if the sender is the current user
    bool isCurrentUser = data['senderId'] == _authService.getcurrentUsers()!.uid;

    // Align message to the right if the sender is the current user, otherwise left

    var alignment = isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;


    return Container(
      alignment: alignment,
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Column(
        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isCurrentUser ? Colors.green[100] : Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(data["message"]),
          ),
        ],
      ),
    );
  }

  Widget _buildUserInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1.0, color: Colors.black12),
              ),
              child: TextFormField(
                controller: _messagecontroller,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: "Type a Message",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(

            margin: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(


                color: Colors.green.shade200,
              borderRadius: BorderRadius.circular(30)
            ),
            child: IconButton(
              onPressed: sendmessage,
              icon: Icon(Icons.arrow_upward_outlined,color: Colors.green,),
            ),
          ),
        ],
      ),
    );
  }
}
