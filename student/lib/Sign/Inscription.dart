import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/Sign/connection.dart';

import '../modals/Demande.dart';
import 'package:flutter/services.dart';

import 'dart:io';



class Inscription extends StatefulWidget {
  Inscription({Key key}) : super(key: key);

  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {

 

FirestoreService service = FirestoreService();

  Demande _demande;
  static const menuItems = <String>[
    'Cardiologie',
    'Cardiovasculaire',
    'dermatologiques',
    'respiratoire',
    'dermatologiques',
    'Diabetique',
  ];
  final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
      .map(
        (String value) => DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

        DateTime selectedDate = DateTime.now();

    String  selectedval;
   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   TextEditingController _nameController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();
   TextEditingController _emailController = TextEditingController();
   TextEditingController _casController = TextEditingController();
   TextEditingController _departementController = TextEditingController();
   TextEditingController _imageController = TextEditingController();
   TextEditingController _numberController = TextEditingController();
  
    String imageUrl;
     
Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1990, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
  
  @override
  Widget build(BuildContext context) {

      
// final demandeProvider = Provider.of<DemandeProvider>(context);


    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;
    return 
          SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key : _formKey,
                child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40.0, top: 40),
                          child: Text(
                            'Inscription',
                            style: TextStyle(
                              fontFamily: 'Cardo',
                              fontSize: 35,
                              color: Color(0xff0C2551),
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          //
                        ),
                      ),
                     
                      //
                      SizedBox(
                        height: 30,
                      ),
                      //
                      
                      //

                      SizedBox(
                        height: 30,
                      ),
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
                              return val.length > 9
                                  ? null
                                  : "Entrez votre Nom et Prenom";
                            },
                                  
                                  controller:  _nameController,
                                  
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
                                  controller: _emailController,
                                  
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
                                  controller: _passwordController,
                                  obscureText: true ,
                                  
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff0962ff),
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.vpn_key),
                                    hintText: "*************",
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
                                    "Votre Date de Naissance",
                                    style: TextStyle(
                                      fontFamily: 'Product Sans',
                                      fontSize: 15,
                                      color: Color(0xff8f9db5),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Text("${selectedDate.toLocal()}".split(' ')[0], style:  TextStyle(
                                                                fontFamily: 'Product Sans',
                                                                fontSize: 15,
                                                                color: Color(0xff8f9db5),
                                                              ),),
                                      SizedBox(height: 20.0,),
                                      RaisedButton(
                                          color: Color(0xff0962ff),
                                        
                                        onPressed: () => _selectDate(context),
                                        child: Text('Selectionner', style: TextStyle(
                                                                fontFamily: 'Product Sans',
                                                                fontSize: 15,
                                                                color: Colors.white
                                                              ),),
                                      ),
                                    ],
                                  ),
                              //
                            ],
                          ),

                        SizedBox(height: 20),
                          
                          Column(
                            
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50.0, bottom: 8),
                                  child: Text(
                                    "Cas",
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
                                  controller: _casController,
                                  
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff0962ff),
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    hintText: "*************",
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
                                    "Departement",
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
                                  controller: _departementController,
                                  
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff0962ff),
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    hintText: "Informatique",
                                    hintStyle: TextStyle(
                                        fontSize: 15,
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
                      Column(
                            
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50.0, bottom: 8),
                                  child: Text(
                                    "Cas",
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
                                  : "Entrez Un Numero Valide";
                            },
                                  controller: _numberController,
                                  
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff0962ff),
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.phone),
                                    hintText: "*************",
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
                      SizedBox(
                        height: 15,
                      ),
                     
                      SizedBox(
                        height: 15,
                      ),
                      
                      SizedBox(
                        height: 15,
                      ),
                      //
                      Text(
                        "Validez votre demande et attendez votre reponse ",
                        style: TextStyle(
                          fontFamily: 'Product Sans',
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff8f9db5).withOpacity(0.45),
                        ),
                        //
                      ),
                      GestureDetector(
                        child: Container(
                        
                        margin: EdgeInsets.symmetric(vertical: 20),
                        width: scrWidth * 0.40,
                        height: 75,
                        decoration: BoxDecoration(
                          color: Color(0xff0962ff),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            'Valider',
                            style: TextStyle(
                              fontFamily: 'ProductSans',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                        onTap: (){

                          String _name = _nameController.text;
                          String _email = _emailController.text;
                          String _password = _passwordController.text;
                          String _cas = _casController.text;
                          String _departement = _departementController.text;
                          String _image = _imageController.text;
                          _demande = new Demande(name:_name, email: _email, password: _password, cas: _cas, departement: _departement, image: 'non', role: "etudiant", anniv: selectedDate, numero: _numberController.text);
                          /*addDemande(_demande);
                        demandeProvider.savedemande(_demande);*/
                       // demandeProvider.savedemande();
                       if (_formKey.currentState.validate()){
                         print('voila le mail $_demande');
                          service.saveDemande(_demande);
                         Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => Connection()),
                          );

                       }
                        }
                      ), 
                            
                      
                      GestureDetector(
                        onTap: (){
                          Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => Connection()),
                          );
                        },
                           child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Vous Avez déja un commpte? ',
                                style: TextStyle(
                                  fontFamily: 'Product Sans',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff8f9db5).withOpacity(0.45),
                                ),
                              ),
                              TextSpan(
                                
                                text: 'Connectez vous',
                                style: TextStyle(
                                  fontFamily: 'Product Sans',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff90b7ff),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 50),
                    ],
                  ),
                  
                  
                  ClipPath(
                    clipper: OuterClippedPart(),
                    child: Container(
                      color: Color(0xff0962ff),
                      width: scrWidth,
                      height: scrHeight,
                    ),
                  ),
                  //
                  ClipPath(
                    clipper: InnerClippedPart(),
                    child: Container(
                      color: Color(0xff0c2551),
                      width: scrWidth,
                      height: scrHeight,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    ;
  }



  uploadImage() async {
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;


    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted){
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);

      if (image != null){
        //Upload to Firebase
        var snapshot = await _storage.ref()
        .child("folderName/imageName")
        .putFile(file)
        .onComplete;

        var downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('No Path Received');
      }

    } else {
      print('Grant Permissions and try again');
    }

    

    
  }

}



class OuterClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //
    path.moveTo(size.width / 2, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height / 4);
    //
    path.cubicTo(size.width * 0.55, size.height * 0.16, size.width * 0.85,
        size.height * 0.05, size.width / 2, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

class InnerClippedPart extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    //
    path.moveTo(size.width * 0.7, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.1);
    //
    path.quadraticBezierTo(
        size.width * 0.8, size.height * 0.11, size.width * 0.7, 0);

    //
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
