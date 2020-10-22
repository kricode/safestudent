import 'package:flutter/material.dart';
import 'package:projet/Admin/Doctor/DoctorListTile.dart';
import 'package:projet/Admin/Doctor/ajoutmedecin.dart';
import 'package:projet/Database/AuthService.dart';

class DoctorMain extends StatefulWidget {
  DoctorMain({Key key}) : super(key: key);

  _DoctorMainState createState() => _DoctorMainState();
}

class _DoctorMainState extends State<DoctorMain> {
  
  @override
  Widget build(BuildContext context) {
    AuthService authservice = AuthService();
    return Scaffold(
      appBar : AppBar(
      elevation: 50,
      backgroundColor: Colors.blue,
      title: Text("Safe Kid"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            authservice.signOut();
            Navigator.pop(context);
          },
        )
      ],
    ),
      body: DoctorListTile(),
        floatingActionButton: FloatingActionButton(
        onPressed: (){
          
            print("touches");
            Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AjoutmedecinPage()),
                          );
        },
        tooltip: 'Ajouter un Medecin',
        child: Icon(Icons.add),
      ),
      
    );
  }
}