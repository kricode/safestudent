import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/chat/chatrooms.dart';

class DoctorUi extends StatefulWidget {
  DoctorUi({Key key}) : super(key: key);

  _DoctorUiState createState() => _DoctorUiState();


}

FirebaseAuth auth = FirebaseAuth.instance;
FirestoreService service = FirestoreService();
String emailuser = auth.currentUser.email;


class _DoctorUiState extends State<DoctorUi> {
  var donnee;
       Future<dynamic> getData() async {
    FirebaseFirestore.instance.collection("users").doc(emailuser).get().then((value){
      print(value.data());
      setState(() {
       donnee = value;
      });
      
        }
    );
    
  }
   @override
  void initState() {

    super.initState();
    getData();
 
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
       child: donnee != null ? ChatRoom(actuel: donnee,) : CircularProgressIndicator() ,
    );
  }
}