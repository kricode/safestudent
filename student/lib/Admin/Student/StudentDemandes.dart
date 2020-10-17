import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './DemandeTile.dart';
import 'package:projet/Database/FirestoreService.dart';





class StudentDemandes extends StatelessWidget {
  const StudentDemandes({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FirestoreService firebaseServices = FirestoreService();

    return StreamProvider(
        create: (BuildContext context) => firebaseServices.getDemandeList(),
         //child: iteminscription(),
         child: MaterialApp(home: DemandesList()));
  }
}