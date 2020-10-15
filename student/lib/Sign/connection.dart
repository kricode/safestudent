import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/helper/helperfunctions.dart';
import 'package:projet/redirect.dart';
import './Inscription.dart';
import '../acceuilEtudiant/main.dart';
import '../Database/AuthService.dart';
import '../Admin/main.dart';


class Connection extends StatefulWidget {
  Connection({Key key}) : super(key: key);

  _ConnectionState createState() => _ConnectionState();
}

class _ConnectionState extends State<Connection> {


    AuthService authService = AuthService();
   
   final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isLoading = false;

    signIn() async {
    if (formKey.currentState.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signInWithEmailAndPassword(
              _emailController.text, _passwordController.text)
          .then((result) async {
        if (result != null)  {
          QuerySnapshot userInfoSnapshot =
              await FirestoreService().getUserInfo(_emailController.text);

         

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          print ('cet utilisateur existe pas');
        }
      });
    }
  }
@override
  Widget build(BuildContext context) {


   
   

    var scrWidth = MediaQuery.of(context).size.width;
    var scrHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Stack(
            children: [
              Form(
                key: formKey,
                              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0, top: 40),
                        child: Text(
                          'Safe Student',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Cardo',
                            fontSize: 35,
                            color: Colors.blue[100],
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        //
                      ),
                    ),
                    SizedBox(height: 50),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40.0, top: 40),
                        child: Text(
                          'Connectez vous',
                          style: TextStyle(
                            fontFamily: 'Cardo',
                            fontSize: 25,
                            color: Color(0xff0C2551),
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        //
                      ),
                    ),
                   
                    //
                    SizedBox(
                      height: 50,
                    ),
                    //
                    
                    
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
                                  validator: (val) {
                              return RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(val)
                                  ? null
                                  : "Entrez un E-mail valide";
                            },
                                  controller: _emailController,
                                  
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
                    //
                    SizedBox(
                      height: 15,
                    ),
                    //
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
                                  obscureText: true,
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
                    //
                    SizedBox(
                      height: 100,
                    ),
                   
                    //
                    Text(
                      "Veuillez vérifier vos coordonnées ",
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
                          signIn();
                       }),
                    GestureDetector(
                      onTap: (){
                        print("vous avez appuyé sur inscription");
                      //  readData();
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Inscription()),  );
                      },
                        child: RichText(
                          
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Vous ' ' avez pas de compte? ',
                              style: TextStyle(
                                fontFamily: 'Product Sans',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff8f9db5).withOpacity(0.45),
                              ),
                            ),
                            TextSpan(
                              
                              text: 'Inscrivez vous',
                              
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
                  ],
                ),
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
    );
  }
}







class Neu_button extends StatelessWidget {
  Neu_button({this.char});
  String char;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 58,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        borderRadius: BorderRadius.circular(13),
        boxShadow: [
          BoxShadow(
            offset: Offset(12, 11),
            blurRadius: 26,
            color: Color(0xffaaaaaa).withOpacity(0.1),
          )
        ],
      ),
      //
      child: Center(
        child: Text(
          char,
          style: TextStyle(
            fontFamily: 'ProductSans',
            fontSize: 29,
            fontWeight: FontWeight.bold,
            color: Color(0xff0962FF),
          ),
        ),
      ),
    );
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
