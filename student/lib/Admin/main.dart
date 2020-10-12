import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:projet/Admin/demandes.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:provider/provider.dart';
import './widgets/avatar.dart';
import './widgets/iteminscription.dart';

class admin extends StatefulWidget {
  admin({Key key}) : super(key: key);

  _adminState createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
Widget build(BuildContext context) {
      final FirestoreService firebaseServices = FirestoreService();

int _currentindex = 0;
  return MaterialApp(

    title: 'Safe Student',
    home: BackdropScaffold(
      
      appBar: BackdropAppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text("Acceuil"),
        
      ),
      stickyFrontLayer: true,
     // frontLayer: _pages[_currentIndex],
      backLayer: BackdropNavigationBackLayer(
        items: [
          ListTile(title: Text("Acceuil")),
          ListTile(title: Text("Deconnexion")),
        ],
        //onTap: (int position) => {setState(() => _currentIndex = position)},
      ),
      frontLayer: Container(
        child: StreamProvider(
        create: (BuildContext context) => firebaseServices.getUserList(),
         //child: iteminscription(),
         child: DemandesList(),
        )
      )
    ),
    
  );

    
  }
}