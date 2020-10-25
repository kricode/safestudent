import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:projet/Admin/Doctor/AddDoctor.dart';
import 'package:projet/Admin/Doctor/DoctorListTile.dart';
import 'package:projet/Admin/Doctor/ajoutmedecin.dart';
import 'package:projet/Database/AuthService.dart';
import 'package:projet/modals/doctor.dart';

class DoctorMain extends StatefulWidget {
  DoctorMain({Key key}) : super(key: key);

  _DoctorMainState createState() => _DoctorMainState();
}

class _DoctorMainState extends State<DoctorMain> {
  List<String> specialite= [
    "Cardiologue",
    "Généraliste",
    "Neurologue",
    
  ];
   AuthService authService = new AuthService();
    Doctor doctor ;
    final _formKey = GlobalKey<FormState>();
    TextEditingController _name = TextEditingController();
    TextEditingController _email = TextEditingController();
    TextEditingController _password = TextEditingController();
    String _specialite;

  
  @override
  Widget build(BuildContext context) {
    AuthService authservice = AuthService();
    return Scaffold(
      appBar : AppBar(
      elevation: 50,
      backgroundColor: Colors.blue,
      title: Text("Safe Student"),
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
                       MaterialPageRoute(builder: (context) => AddDoctor()),
                          );
        },
        tooltip: 'Ajouter un Medecin',
        child: Icon(Icons.add),
      ),
      
    );
  }
}