import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet/DoctorUi/doctoracceuil.dart';
import 'package:projet/PompierUi/acceuil.dart';
import 'package:projet/SamuUi/acceuil.dart';
import 'package:projet/Sign/connection.dart';
import './admin/main.dart';
import './EtudiantUi/main.dart';



class Redirect extends StatefulWidget {


  Redirect({Key key}) : super(key: key);

  _RedirectState createState() => _RedirectState();
}

FirebaseAuth auth = FirebaseAuth.instance;


class _RedirectState extends State<Redirect> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream:  FirebaseFirestore.instance.collection('users').doc(auth.currentUser.email).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
        if (snapshot.hasError){
          return Text ('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState){
          case ConnectionState.waiting: return Text('loading');
          default: 
          return checkRole(snapshot);
        }
      }
    );
  }
  Widget checkRole(AsyncSnapshot<DocumentSnapshot> snapshot){
    
    if( snapshot.data['role'] == 'admin'){
      return  admin();
    } else{
      if (snapshot.data['role'] == 'etudiant'){
        return  HomeScreen();     }
        else{
          if(snapshot.data['role']== 'doctor'){
            return DoctorUi();
          }
          else{
              if (snapshot.data['role'] == 'samu'){
             return AcceuilSamu();    
           }
           else{if (snapshot.data['role'] == 'pompier'){
             return AcceuilPompier();    
           }
               else { return Connection();}
                
          }
        }
    }
  }
  }}