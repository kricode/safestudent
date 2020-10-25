import 'package:dropdownfield/dropdownfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:projet/Database/AuthService.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/modals/Utilisateur.dart';
import 'package:projet/modals/doctor.dart';
import 'package:projet/modals/doctor.dart';

class AddDoctor extends StatefulWidget {
  AddDoctor({Key key}) : super(key: key);

  _AddDoctorState createState() => _AddDoctorState();
}



class _AddDoctorState extends State<AddDoctor> {
     List<String> specialite= [
    "Cardiologue",
    "Généraliste",
    "Neurologue",
    
  ];

    AuthService authService = new AuthService();
    Doctor doctor ;
    User utif;



  void  singUp(String name, String email , String password) async {

    

     utif =  await authService.signUpWithEmailAndPassword(email,
          email).then((result){
            if(result != null){
              
                
              Map<String,String> userDataMap = {
                "name" : name ,
                "email" : email,
                "role"  : "etudiant"
                
              };

              service.addUserInfo(userDataMap);
             
            }
      });
    
  }

  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
   FirestoreService service = FirestoreService();
   bool isLoading = false;
   TextEditingController _name = TextEditingController();
   TextEditingController _email = TextEditingController();
   TextEditingController _password = TextEditingController();
   String _specialite;
  @override
  Widget build(BuildContext context) {
     final snackbarajout = SnackBar(content: Text('Vous avez ajouté un Etudiant'));

    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),

        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(children: [
              ClipPath(
            clipper: WaveClipperOne(),
            child: Container(
              height: 200,
              color: Colors.blue[200],
              child: Center(child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Ajoutez  Un  Medecin", style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),),
                ),
              )),
            ),
          ),
            ],),

          SizedBox(height: 40,),
          Form(
              key : _formKey,
                child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                     
                      //
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
                              return val.length > 8
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
                          

                     
                        /*  IconButton(
                            icon: Icon(Icons.image),
                            onPressed: () => uploadImage(_emailController.text),
                          ),*/
                         
                      //
                      
                      SizedBox(
                        height: 15,
                      ),
                     Padding(
                                padding: const EdgeInsets.fromLTRB(50, 10, 30, 20),
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

                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                                        icon: new Image.asset('assets/images/user.png'),
                                        iconSize: 40,
                                       tooltip: 'Ajouter Le Medecin',
                                        onPressed: () {
                                         print("you clicked");
                                        
                                               
                                                if (_formKey.currentState.validate()){
                                               print(_name.text);
                                              print(_specialite);
                                              print(_email.text);
                                              Doctor doctor = new Doctor( email: _email.text, name: _name.text, password: _password.text, specialite: _specialite );
                                              service.saveDoctor(doctor);
                                             singUp(_name.text, _email.text, _password.text);
                                             
                                              uti utilisateur = new uti(email: _email.text, name:  _name.text, password: _password.text, role: "doctor" ); 
                                            service.saveUser(utilisateur);
                                            Navigator.pop(context);
                                            

                       }
                                        
                                        Scaffold.of(context).showSnackBar(snackbarajout);
                                                               
                                          },
                                         ),
                          IconButton(
                                        icon: new Image.asset('assets/images/reject.png'),
                                        iconSize: 50,
                                       tooltip: 'Annuler l''ajout',
                                        onPressed: () {
                                         print("you cancelled");
                                        
                                                // singUp();
                                        Navigator.pop(context);
                                                               
                                          },
                                         ),
                        ],
                        
                      )
                      
                    ],
                  ),
                  
                  
                  
                ],
              ),
            )
          


          ],

        ),

      ),
    );
  }
  
}