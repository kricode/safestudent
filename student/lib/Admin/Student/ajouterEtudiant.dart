import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet/Admin/main.dart';
import 'package:projet/Database/AuthService.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/modals/Etudiant.dart';
import 'package:projet/modals/utilisateur.dart';
import 'package:flutter/services.dart';




class AjoutetudiantPage extends StatefulWidget {
  
  @override
  _AjoutetudiantPageState createState() => _AjoutetudiantPageState();
}

class _AjoutetudiantPageState extends State<AjoutetudiantPage> {
  User utif;
   Etudiant etudiant;
   uti utilisateur;
    AuthService authService = new AuthService();

  String _name;
    String _email;
     String _password;
      String _departement;
        String _cas;
        String _numero;
        FirestoreService service = FirestoreService();
          bool isLoading = false;

  

  



    final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
      Widget _buildNom(){
            return Column(
               mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                                padding: const EdgeInsets.only(left: 10.0, bottom: 8),
                                child: Text(
                                  "Nom",
                                  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 15,
                                    color: Color(0xff8f9db5),
                                  ),
                                ),
                              ),
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
          return 'veuilez saisir le nom';
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
                              
             mainAxisAlignment: MainAxisAlignment.start,
            children: [
               Padding(
                                padding: const EdgeInsets.only(left: 10.0, bottom: 8),
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 15,
                                    color: Color(0xff8f9db5),
                                  ),
                                ),
                              ),
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
              return 'veuillez saisir un email';
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
                 mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                                padding: const EdgeInsets.only(left: 10.0, bottom: 8),
                                child: Text(
                                  "Mot de passe",
                                  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 15,
                                    color: Color(0xff8f9db5),
                                  ),
                                ),
                              ),
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
          return 'veuillez saisir le mot de passe ';
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
      Widget _buildDepartement(){
           return Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Padding(
                                padding: const EdgeInsets.only(left: 10.0, bottom: 8),
                                child: Text(
                                  "Département",
                                  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 15,
                                    color: Color(0xff8f9db5),
                                  ),
                                ),
                              ),
               TextFormField(
                  decoration: InputDecoration(labelText:"Département",
                   contentPadding:
                                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                      focusColor: Color(0xff0962ff),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        
                                        borderSide: BorderSide(color: Color(0xff0962ff),),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.grey[350],
                                        ),
                                      ),),
               
      validator: (String value) {
        if (value.isEmpty) {
          return 'veuilez saisir le département';
        }

        return null;
      },
      onSaved: (String value) {
        _departement = value;
      },
                ),
             ],
           );
      }
        Widget _buildNumero(){
           return Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Padding(
                                padding: const EdgeInsets.only(left: 10.0, bottom: 8),
                                child: Text(
                                  "Numero de contact",
                                  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 15,
                                    color: Color(0xff8f9db5),
                                  ),
                                ),
                              ),
               TextFormField(
                 keyboardType: TextInputType.number,
                                                              inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10),
                                                  ], 
                  decoration: InputDecoration(labelText:"Numero:",
                  
                   contentPadding:
                                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                      focusColor: Color(0xff0962ff),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        
                                        borderSide: BorderSide(color: Color(0xff0962ff),),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.grey[350],
                                        ),
                                      ),),
               
      validator: (val) {
                              return val.length == 10  
                                  ? null
                                  : "Entrez Un Numero Valide";
                            },
      onSaved: (String value) {
        _departement = value;
      },
                ),
             ],
           );
      }
       Widget _buildMaladie(){
           return Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Padding(
                                padding: const EdgeInsets.only(left:10.0, bottom: 8),
                                child: Text(
                                  "Maladie",
                                  style: TextStyle(
                                    fontFamily: 'Product Sans',
                                    fontSize: 15,
                                    color: Color(0xff8f9db5),
                                  ),
                                ),
                              ),
               TextFormField(
                  decoration: InputDecoration(labelText:"Maladie",
                   contentPadding:
                                          EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                      focusColor: Color(0xff0962ff),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        
                                        borderSide: BorderSide(color: Color(0xff0962ff),),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                          color: Colors.grey[350],
                                        ),
                                      ),),
               
      validator: (String value) {
        if (value.isEmpty) {
          return 'veuilez saisir votre maladie';
        }

        return null;
      },
      onSaved: (String value) {
        _cas = value;
      },
                ),
             ],
           );
      }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Ajouter un étudiant"),
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
           SizedBox(height: 20,),
          
            _buildEmail(),
             SizedBox(height: 20,),
            _buildPassword(),
             SizedBox(height: 20,),
            _buildDepartement(),
             SizedBox(height: 20,),
             _buildNumero(),
             SizedBox(height: 20,),
              _buildMaladie(),
            SizedBox(
            height: 25.0,
            ),
          
             SingleChildScrollView(
                            child: Row(
                 children: [
                   GestureDetector(
                            child: Container(
                            
                            margin: EdgeInsets.symmetric(vertical: 20),
                            height: 65,
                            width: 110,
                            decoration: BoxDecoration(
                              color: Color(0xFF9578CD),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                'Ajouter',
                                style: TextStyle(
                                  fontFamily: 'ProductSans',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                            onTap: (){
          etudiant = new Etudiant(name:_name, email: _email, password: _password, cas: _cas, departement: _departement, image: 'non',);
          print(_email);
                    singUp();
                      
                    } ,
                           ),
                           SizedBox(
                             height:20,
                           width:100),

          ]
            ),
             ),

          ],
          )
          ),
        ),
      ),
      
    );
  }
  singUp() async {

    if(_formKey.currentState.validate()){
      setState(() {

        isLoading = true;
      });

     utif =  await authService.signUpWithEmailAndPassword(_email,
          _password).then((result){
            if(result != null){
              service.saveEtudiant(etudiant);
                
              Map<String,String> userDataMap = {
                "name" : _name,
                "email" : _email,
                "role"  : "etudiant"
              };

              service.addUserInfo(userDataMap);

            
              Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (context) => admin()
              ));
            }
      });
    }
  }
}
