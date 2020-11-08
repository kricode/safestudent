import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:projet/modals/Ambulancier.dart';


class AddAmbu extends StatefulWidget {
  final String secteur;
  AddAmbu({Key key, @required this.secteur}) : super(key: key);

  _AddAmbuState createState() => _AddAmbuState();
}

class _AddAmbuState extends State<AddAmbu> {


  final GlobalKey<FormState> _formKey =GlobalKey<FormState>();
   FirestoreService service = FirestoreService();
   bool isLoading = false;
   TextEditingController _name = TextEditingController();
   TextEditingController _email = TextEditingController();
   TextEditingController _numero = TextEditingController();
   String _specialite;
  @override
  Widget build(BuildContext context) {
         final snackbarajout = SnackBar(content: Text('Vous avez ajouté un Ambulancier!'));

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
                      color: widget.secteur == 'samu' ? Color(0x8A0073e6 ) : Color.fromRGBO(58, 66, 86, 1.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 60,
                                child: widget.secteur == 'samu' ? Image (image: AssetImage('assets/images/samu.png')) :
                                           Image (image: AssetImage('assets/images/protectionDz.png'))   ,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                              child: Text("Ajoutez Un Ambulancier", style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: "Cardo",
                              ),),
                            )
                          ],
                        ),
                      )
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
                                    hintText: "Boubchir Yasnima",
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
                                    hintText: "Yasmina@email.com",
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

                          Column(
                            
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50.0, bottom: 8),
                                  child: Text(
                                    "Numero De Telephone",
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
                                  keyboardType: TextInputType.number,
                                                              inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10),
                                                  ], 
                                   validator: (val) {
                              return val.length == 10
                                  ? null
                                  
                                  : "Entrez un numero Valide";
                            },
                                  controller: _numero,
                                  
                                  style: TextStyle(

                                      fontSize: 18,
                                      color: Color(0xff0962ff),
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.perm_phone_msg),
                                    hintText: "0657146957",
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
                     

                      SizedBox(height: 30,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                                        icon: new Image.asset('assets/images/user.png'),
                                        iconSize: 40,
                                       tooltip: 'Ajouter Le Medecin',
                                        onPressed: () {
                                         print("you clicked on add");
                                         if (_formKey.currentState.validate()){
                                               print(_name.text);
                                              print(_specialite);
                                              print(_email.text);
                                              Ambulancier ambulancier = new Ambulancier( email: _email.text, name: _name.text, numero: _numero.text, secteur: widget.secteur);
                                              service.saveAmbulance(ambulancier);
                                             
                                            Navigator.pop(context);     
                                             }
                                                                               
                                      
                                                              
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