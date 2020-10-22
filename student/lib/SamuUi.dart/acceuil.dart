import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/SamuUi.dart/AlertList.dart';
import 'package:provider/provider.dart';


class AcceuilSamu extends StatefulWidget {
  AcceuilSamu({Key key}) : super(key: key);

  _AcceuilSamuState createState() => _AcceuilSamuState();
}

FirebaseAuth auth = FirebaseAuth.instance;
FirestoreService service = FirestoreService();
String emailuser = auth.currentUser.email;
  @override
class _AcceuilSamuState extends State<AcceuilSamu> {
  
  
  Widget build(BuildContext context) {
    final FirestoreService firebaseServices = FirestoreService();

    return StreamProvider(
        create: (BuildContext context) => firebaseServices.getAlerteList(),
         //child: iteminscription(),
         child: MaterialApp(home: AlertList()));
  }
  }
