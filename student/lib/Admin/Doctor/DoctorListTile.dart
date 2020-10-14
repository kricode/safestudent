import 'package:flutter/material.dart';
import 'package:projet/Admin/Doctor/DoctorTile.dart';
import 'package:projet/Admin/Doctor/ajoutmedecin.dart';
import 'package:provider/provider.dart';
import 'package:projet/Database/FirestoreService.dart';


class DoctorListTile extends StatelessWidget {
  const DoctorListTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        FirestoreService firebaseServices = FirestoreService();

    return  Scaffold(
          body: StreamProvider(
          create: (BuildContext context) => firebaseServices.getDoctorList(),
           //child: iteminscription(),
           child: DoctorTile()),

            floatingActionButton: FloatingActionButton(
        onPressed: (){
          
            Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AjoutmedecinPage()),
                          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
  }
