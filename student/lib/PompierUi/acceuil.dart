import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/PompierUi/AlertList.dart';
import 'package:provider/provider.dart';


class AcceuilPompier extends StatefulWidget {
  AcceuilPompier({Key key}) : super(key: key);

  _AcceuilPompierState createState() => _AcceuilPompierState();
}

FirebaseAuth auth = FirebaseAuth.instance;
FirestoreService service = FirestoreService();
String emailuser = auth.currentUser.email;
  @override
class _AcceuilPompierState extends State<AcceuilPompier> {
  
  
  Widget build(BuildContext context) {
    final FirestoreService firebaseServices = FirestoreService();

    return StreamProvider(
        create: (BuildContext context) => firebaseServices.getAlerteList(),
         //child: iteminscription(),
         child: MaterialApp(home: AlertList()));
  }
  }
