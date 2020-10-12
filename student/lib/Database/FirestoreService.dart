import '../modals/Demande.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveDemande(Demande demande){
    return _db.collection('Demandes').doc(demande.email).set(demande.toMap());
  }

  Stream<List<Demande>> getUserList() {
    return _db.collection('Demandes')
        .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => Demande.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeDemande(String demandeemail){
    return _db.collection('Demandes').doc(demandeemail).delete();
  }

//
//
//
//
//     Dans ce qui va venir j vais faire les fonctions de la messagerie//

getUserInfo(String email) async {
    return _db
        .collection("users")
        .where("userEmail", isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  searchByName(String searchField) {
    return _db
        .collection("users")
        .where('userName', isEqualTo: searchField)
        .get();
  }

  addChatRoom(chatRoom, chatRoomId) {
    _db
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  getChats(String chatRoomId) async{
    return _db
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }


  addMessage(String chatRoomId, chatMessageData){

    _db.collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData).catchError((e){
          print(e.toString());
    });
  }

  getUserChats(String itIsMyName) async {
    return  _db
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }

}