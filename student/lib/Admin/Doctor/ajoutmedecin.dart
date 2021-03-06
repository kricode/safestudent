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

      await authService.signUpWithEmailAndPassword(_email.text,
          _password.text).then((result){
            if(result != null){
                
              Map<String,String> userDataMap = {
                "name" : _name.text,
                "email" : _email.text,
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
     TextEditingController _name;
    TextEditingController _email;
     TextEditingController _password;
      String _specialite;
  @override
  Widget build(BuildContext context) {
    final snackbarajout = SnackBar(content: Text('Vous avez ajouté un Etudiant'));

       

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
            Column(
                            
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50.0, bottom: 8),
                                  child: Text(
                                    "Nom & Prenom",
                                    style: TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 15,
                                      color: Color(0xff8f9db5),
                                    ),
                                  ),
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                                child: TextFormField(
                                   validator: (val) {
                              return val.length > 9
                                  ? null
                                  : "Entrez votre Nom et Prenom";
                            },
                                  
                                  controller:  _name,
                                  
                                  style: TextStyle(
                                     
                                    
                                      fontSize: 18,
                                      color: Color(0xff0962ff),
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.person),
                                    hintText: "Toumi",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[350],
                                        fontWeight: FontWeight.w600),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                                    ),
                                    
                                  ),
                                ),
                              ),
                              //
                            ],
                          ),
                          
                          Column(
                            
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50.0, bottom: 8),
                                  child: Text(
                                    "Email",
                                    style: TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 15,
                                      color: Color(0xff8f9db5),
                                    ),
                                  ),
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                                child: TextFormField(
                                  controller: _email,
                                  
                          validator: (val) {
                            return RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(val)
                                ? null
                                : "Veuillez entrer un email valide";
                          },
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff0962ff),
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.alternate_email),
                                    hintText: "Abdelkrim@email.com",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[350],
                                        fontWeight: FontWeight.w600),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                                    ),
                                    
                                  ),
                                ),
                              ),
                              //
                            ],
                          ),
                          Column(
                            
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50.0, bottom: 8),
                                  child: Text(
                                    "Mot De Passe",
                                    style: TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 15,
                                      color: Color(0xff8f9db5),
                                    ),
                                  ),
                                ),
                              ),
                              //
                              Padding(
                                padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                                child: TextFormField(
                                   validator: (val) {
                              return val.length > 6
                                  ? null
                                  : "Votre Mot De Passe Doit Depasser 6 caracteres";
                            },
                                  controller: _password,
                                  
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff0962ff),
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.vpn_key),
                                    hintText: "Password",
                                    hintStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.grey[350],
                                        fontWeight: FontWeight.w600),
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                                    ),
                                    
                                  ),
                                ),
                              ),
                              //
                            ],
                          ),
                          SizedBox(height: 30,),
                          
                              Padding(
                                padding: const EdgeInsets.fromLTRB(30, 10, 30, 20),
                                child: DropDownField(
                                    onValueChanged: (dynamic value) {
                                      _specialite = value;
                                      print(_specialite);
                                    },
                                    value: _specialite,
                                    required: false,
                                    hintText: 'Choisissez une spécialité',
                                    labelText: 'Spécialité',
                                    items: specialite,
                        
                                ),
                              ),
                              SizedBox(height: 30),
                              IconButton(
                                        icon: new Image.asset('assets/images/user.png'),
                                       tooltip: 'Supprimer Un Etudiant',
                                        onPressed: () {
                                         print("you clicked");
                                        print(_name);
                                        print(_specialite);
                                                // singUp();
                                        Navigator.pop(context);
                                        Scaffold.of(context).showSnackBar(snackbarajout);
                                                               
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