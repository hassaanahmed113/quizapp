import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterquizapp/Model/RoomModel.dart';

class RoomdbServices {
  Future<void> addUser(RoomModel Room) async {
    final quizdatauser = FirebaseFirestore.instance.collection('room');
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      final user = auth.currentUser;
      if (user != null) {
        final uuserr = RoomModel(
            currentUserid: Room.currentUserid,
            opponentUserid: Room.opponentUserid,
            currentuserCorrect: Room.currentuserCorrect,
            currentuserWrong: Room.currentuserWrong,
            opponentuserCorrect: Room.opponentuserCorrect,
            opponentuserWrong: Room.opponentuserCorrect);
        await quizdatauser.doc(user.uid).set(uuserr.toMap());
      }
    } catch (e) {
      print('Error adding item: $e');
    }
  }
}
