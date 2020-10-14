import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './admin/main.dart';
import './acceuilEtudiant/main.dart';



class Redirect extends StatefulWidget {

  User user;
  Redirect({Key key, this.user}) : super(key: key);

  _RedirectState createState() => _RedirectState();
}

class _RedirectState extends State<Redirect> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream:  FirebaseFirestore.instance.collection('users').doc(widget.user.email).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
        if (snapshot.hasError){
          return Text ('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState){
          case ConnectionState.waiting: return Text('loading');
          default: 
          return Text(snapshot.data['name']);
        }
      }
    );
  }
  Widget checkRole(DocumentSnapshot snapshot){
    if( snapshot.get('role') == 'admin'){
      return  admin();
    } else{
      if (snapshot.get('role') == 'etudiant'){
        return  HomeScreen();     }
    }
  }
}