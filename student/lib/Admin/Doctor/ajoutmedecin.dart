import 'dart:ui';

import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:projet/Admin/main.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/Database/AuthService.dart';
import 'package:projet/Modals/Doctor.dart';

class AjoutmedecinPage extends StatefulWidget {
  @override
  _AjoutmedecinPageState createState() => _AjoutmedecinPageState();
}

class _AjoutmedecinPageState extends State<AjoutmedecinPage> {
  String _name;
    String _email;
     String _password;
      String _specialite;
       List<String> specialite= [
    "Cardiologue",
    "Généraliste",
    "Neurologue",
    
  ];

    AuthService authService = new AuthService();
    Doctor doctor ;

    final GlobalKey<FormState> _formKey =GlobalKey<FormState>();


singUp() async {

    if(_formKey.currentState.validate()){
      setState(() {

        isLoading = true;
      });

      await authService.signUpWithEmailAndPassword(_email,
          _password).then((result){
            if(result != null){
                
              Map<String,String> userDataMap = {
                "name" : _name,
                "email" : _email,
                "role"  : "doctor"
              };

              service.addUserInfo(userDataMap);

            
                Navigator.pop(context);

            }
      });
    }
  }


     FirestoreService service = FirestoreService();
          bool isLoading = false;
      Widget _buildNom(){
            return Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText:"Nom",
                  contentPadding:
                                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                      focusColor: Color(0xff0962ff),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(color: Color(0xff0962ff)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.grey[350],
                                        ),
                                      ),),
                  
      validator: (String value) {
        if (value.isEmpty) {
          return 'veuilez saisir votre nom';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },

                ),
              ],
            );
      }

 
        Widget _buildEmail() {
          return Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextFormField(
      decoration: InputDecoration(labelText: 'Email',
      contentPadding:
                                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                      focusColor: Color(0xff0962ff),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(color: Color(0xff0962ff)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.grey[350],
                                        ),
                                      ),),
      validator: (String value) {
        if (value.isEmpty) {
              return 'veuillez saisir votre email';
        }

        if (!RegExp(
                    r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
              return 'veuillez saisir un email correct';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    ),
            ],
          );
    }
        Widget _buildPassword(){
              return Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFormField(
      decoration: InputDecoration(labelText: 'Mot de passe',
       contentPadding:
                                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                      focusColor: Color(0xff0962ff),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(color: Color(0xff0962ff)),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.grey[350],
                                        ),
                                      ),),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'veuillez saisir votre mot de passe ';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    ),
                ],
              );
  
      }
        Widget _buildSpecialite(){
           return Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
              DropDownField(
                  onValueChanged: (dynamic value) {
                    _specialite = value;
                    print(_specialite);
                  },
                  value: _specialite,
                  required: false,
                  hintText: 'La specialité',
                  labelText: 'Specialite',
                  items: specialite,
        
              ),
             ],
           );
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Ajouter un médecin"),
        centerTitle: true,
        backgroundColor: Color(0xFF9578CD),
      ),
      body: SingleChildScrollView(
              child: Container(
          margin:EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
           _buildNom(),
           SizedBox(height: 25,),
            _buildEmail(),
             SizedBox(height: 25,),
            _buildPassword(),
             SizedBox(height: 25,),
            _buildSpecialite(),
            SizedBox(
            height: 30.0,
            ),
          
             
             IconButton(
                                        icon: new Image.asset('assets/images/user.png'),
                                       tooltip: 'Ajouter Un Medecin',
                                        onPressed: () {
                                           print(_name);
                       doctor = new Doctor(name:_name, email: _email, password: _password, specialite: _specialite,);
                       print(doctor);
                   // singUp();
                                                               
                                          },
                                         ),
                    

          ],
          )
          ),
        ),
      ),
      
    );
  }
}