import 'package:flutter/material.dart';
import 'package:projet/Database/FirestoreService.dart';
import '../acceuilEtudiant/main.dart';
import'package:flutter_dropdown/flutter_dropdown.dart';
import '../modals/Demande.dart';



class Inscription extends StatefulWidget {
  Inscription({Key key}) : super(key: key);

  _InscriptionState createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {

 /* @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _casController.dispose();
    _departementController.dispose();
    _imageController.dispose();
    super.dispose();
  }*/

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
    String  selectedval;
   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   TextEditingController _nameController = TextEditingController();
   TextEditingController _passwordController = TextEditingController();
   TextEditingController _emailController = TextEditingController();
   TextEditingController _casController = TextEditingController();
   TextEditingController _departementController = TextEditingController();
   TextEditingController _imageController = TextEditingController();
   String _myActivity;
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
                                  
                                  controller:  _nameController,
                                  obscureText: "Nom" == 'Password' ? true : false,
                                  // this can be changed based on usage -
                                  // such as - onChanged or onFieldSubmitted
                                  onChanged: (value) {
                                   // demandeProvider.changeName(value);
                                  },
                                  style: TextStyle(
                                    
                                      fontSize: 18,
                                      color: Color(0xff0962ff),
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
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
                                  obscureText: "Email" == 'Pasword' ? true : false,
                                  // this can be changed based on usage -
                                  // such as - onChanged or onFieldSubmitted
                                  onChanged: (value) {
                                  //  demandeProvider.changeEmail(value);
                                  },
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff0962ff),
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
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
                                  controller: _passwordController,
                                  obscureText: "Password" == 'Password' ? true : false,
                                  // this can be changed based on usage -
                                  // such as - onChanged or onFieldSubmitted
                                  onChanged: (value) {
                           //         demandeProvider.changePassword(value);
                                  },
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
                                  obscureText: "Cas" == 'Password' ? true : false,
                                  // this can be changed based on usage -
                                  // such as - onChanged or onFieldSubmitted
                                  onChanged: (value) {
                                  //  demandeProvider.changeCas(value);
                                  },
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
                                  obscureText: "Departement" == 'Password' ? true : false,
                                  // this can be changed based on usage -
                                  // such as - onChanged or onFieldSubmitted
                                  onChanged: (value) {
                                  //  demandeProvider.changeDepartement(value);
                                  },
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
                          Column(
                            
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 50.0, bottom: 8),
                                  child: Text(
                                    "Image",
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
                                  controller: _imageController,
                                  obscureText: "image" == 'Password' ? true : false,
                                  // this can be changed based on usage -
                                  // such as - onChanged or onFieldSubmitted
                                  onChanged: (value) {
                                   //demandeProvider.changeImage(value);
                                  },
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff0962ff),
                                      fontWeight: FontWeight.bold),
                                  decoration: InputDecoration(
                                    hintText: "Image",
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
                      //
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
                        "ICI du blabla pour parler des regles ",
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
                          _demande = new Demande(name:_name, email: _email, password: _password, cas: _cas, departement: _departement, image: _image);
                          /*addDemande(_demande);
                        demandeProvider.savedemande(_demande);*/
                       // demandeProvider.savedemande();
                          
                          print('voila le mail $_demande');
                          service.saveDemande(_demande);
                         Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                          );
                       }),
                      
                      RichText(
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
                      SizedBox(height: 50),
                    ],
                  ),
                  RaisedButton(
                    child: Text('touch'),
                    onPressed: (){
                      String _name = _nameController.text;
                          String _email = _emailController.text;
                          String _password = _passwordController.text;
                          String _cas = _casController.text;
                          String _departement = _departementController.text;
                          String _image = _imageController.text;
                          _demande = new Demande(name:_name, email: _email, password: _password, cas: _cas, departement: _departement, image: _image, role: 'etudiant' );
                          
                      print(_demande.name);
                    },
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
