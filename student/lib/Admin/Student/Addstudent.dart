import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projet/Database/AuthService.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/modals/Demande.dart';
import 'package:projet/modals/Etudiant.dart';
import 'package:projet/modals/Utilisateur.dart';

class AddStudent extends StatefulWidget {
  AddStudent({Key key}) : super(key: key);

  _AddStudentState createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
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

   TextEditingController _imageController = TextEditingController();
   TextEditingController _numberController = TextEditingController();
  
    String imageUrl;
  String _departementController;
  String _casController;
  void initState() {
    super.initState();
  }
  List<String> departement= [
    "Informatique",
    "automatique",
    "Biologie",
    
  ];
  List<String> cas= [
    "hypertension",
    "Insuffisance cardiaque",
    "Diabéte",
    
  ];
      
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
  
     User utif;
          AuthService authService = new AuthService();
  @override
  Widget build(BuildContext context) {
   



      
// final demandeProvider = Provider.of<DemandeProvider>(context);


    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;
    return            
          SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Ajouter un Etudiant'),
          ),
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Form(
              key : _formKey,
                child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      
                     
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
                             
                              //
                              Padding(
                                padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                                child: DropDownField(
                  onValueChanged: (dynamic value) {
                    _casController = value;
                    print(_casController);
                  },
                  value: _casController,
                  required: false,
                  hintText: 'Votre cas',
                  labelText: 'Cas',
                  items: cas,
        
              ),
                              ),
                              //
                            ],
                          ),
                          SizedBox(height: 30,),

                          Column(
                            
                            children: [
                             
                              //
                              Padding(
                                padding: const EdgeInsets.fromLTRB(40, 0, 40, 10),
                                child:  DropDownField(
                  onValueChanged: (dynamic value) {
                    _departementController = value;
                    print(_departementController);
                  },
                  value: _departementController,
                  required: false,
                  hintText: 'Département',
                  labelText: 'Département',
                  items: departement,
        
              ),
                              ),
                              //
                            ],
                          ),
                          SizedBox(height: 30,),
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
                                    "Numero De Contact D'urgence",
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
                                    hintText: "0660526352",
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
                          String _cas = _casController;
                          String _departement = _departementController;
                          String _image = _imageController.text;
                          Etudiant etudiant = new Etudiant(name:_name, email: _email, password: _password, cas: _cas, departement: _departement, image: 'non', role: "etudiant", anniv: Timestamp.fromMicrosecondsSinceEpoch(selectedDate.microsecondsSinceEpoch)
, numero: _numberController.text );
                          /*addDemande(_demande);
                        demandeProvider.savedemande(_demande);*/
                       // demandeProvider.savedemande();
                       if (_formKey.currentState.validate()){
                         print(_name);
                         singUp(_name, _email, _password);
                         service.saveEtudiant(etudiant);
                         uti utilisateur = new uti(email: _email, name:  _name, password: _password, role: "etudiant" ); 
                        service.saveUser(utilisateur);
                        Navigator.pop(context);
                        
                         // service.saveDemande(_demande);
                      //   Navigator.pop(context,
                        //MaterialPageRoute(builder: (context) => Connection()),
                        //  );

                       }
                        }
                      ), 
                            
                      
                     
                      SizedBox(height: 50),
                    ],
                  ),
                  
                  
                  
                ],
              ),
            ),
          ),
        ),
      )
    ;
  }
     void  singUp(String name, String email , String password) async {

    

     utif =  await authService.signUpWithEmailAndPassword(email,
          password).then((result){
        
      });
    
  }

  

/*

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

    

    
  }*/
}