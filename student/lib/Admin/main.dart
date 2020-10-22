import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:projet/Database/AuthService.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/Sign/connection.dart';
import './widgets/avatar.dart';

class admin extends StatefulWidget {
  admin({Key key}) : super(key: key);

  _adminState createState() => _adminState();
}

class _adminState extends State<admin> {
  @override
Widget build(BuildContext context) {
  AuthService auth = AuthService();
      final FirestoreService firebaseServices = FirestoreService();
    final signout = SnackBar(content: Text('Vous vous êtes déconnecté'));

int _currentindex = 0;
  return MaterialApp(

    title: 'Safe Student',
    home: Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: Text("Safe Student", style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Cardo',
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w200
                          ),),
        actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            auth.signOut();
               Navigator.push(context,
                                 MaterialPageRoute(builder: (context) => Connection()));
                                 Scaffold.of(context).showSnackBar(signout);
            print("you clicked on signout");
          },
        )
      ],
        elevation: 30,
      ),
    body: avatar(),
    )
    
  );

    
  }
}