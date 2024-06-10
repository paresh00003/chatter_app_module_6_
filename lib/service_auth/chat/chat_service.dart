import 'package:chatter_app_module_6/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map(
      (snapshot) {
        return snapshot.docs.map(
          (doc) {
            final user = doc.data();

            return user;
          },
        ).toList();
      },
    );
  }

  Future<void> sendMessage(String receiverID, message) async {
    final String CurreentUserId = _auth.currentUser!.uid;
    final String CurreentUserEmail = _auth.currentUser!.email!;

    final Timestamp timestamp = Timestamp.now();

    Message newMessage = Message(
      senderId: CurreentUserId.toString(),
      senderEmail: CurreentUserEmail.toString(),
      receiverID: receiverID,
      message: message,
      timestamp: timestamp,
    );

    List<String> ids = [CurreentUserId, receiverID];

    ids.sort();

    String chatRoomid = ids.join('_');

    await _firestore
        .collection("chat_rooms")
        .doc(chatRoomid)
        .collection("messages")
        .add(newMessage.toMap());
  }

  Stream<QuerySnapshot> getmesssage(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID];

    ids.sort();

    String chatRoomId = ids.join('_');

    return _firestore
        .collection("chat_rooms")
        .doc(chatRoomId)
        .collection("messages")
        .orderBy("timestamp", descending: false)
        .snapshots();
  }
}
