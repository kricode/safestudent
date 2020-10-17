
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:projet/Database/FirestoreService.dart';
import '../Sign/connection.dart';
import '../chat/chatrooms.dart';

import 'package:projet/acceuilEtudiant/assistance.dart';

import 'package:projet/acceuilEtudiant/profil.dart';
import 'calendrier.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
FirebaseAuth auth = FirebaseAuth.instance;
FirestoreService service = FirestoreService();
String emailuser = auth.currentUser.email;

class _HomeScreenState extends State<HomeScreen> {
 String displaytext="voulez vous vraiment alerter le service hospitalier?";
 
 final GlobalKey<ScaffoldState> _globalKeyScaffold =  new GlobalKey<ScaffoldState>();
 Future <String>createAlertDialog(BuildContext context){
  String word ="votre alerte est effectuée";
   return showDialog(context: context,builder:(context){
     return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
            contentPadding: EdgeInsets.all(30.0),
            
        content: Text(displaytext),
          contentTextStyle:(TextStyle(color:Colors.black,fontSize: 20.0,fontStyle: FontStyle.italic)),
                     actions: <Widget>[
             MaterialButton(
              child: Text('Oui'),
              color: Color(0xFF9578CD),
              elevation: 3.0,
              onPressed: (){
                Navigator.of(context).pop(word.toString());
              }
            ),
            SizedBox(height:4.0),
            MaterialButton(
              child: Text('Non'),
               color: Color(0xFF9578CD),
               elevation: 3.0,
              onPressed: () {
                 Navigator.push(context
                 , MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          ],


     );
   });
   
 }
     var donnee;
       Future<dynamic> getData() async {
    FirebaseFirestore.instance.collection("Etudiants").doc(emailuser).get().then((value){
      print(value.data());
      setState(() {
       donnee = value;
      });
      
        }
    );
    
  }
   @override
  void initState() {

    super.initState();
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
     key: _globalKeyScaffold,
     
      body: Stack(

          children:<Widget>[
           
                 ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: 200,
                  color: Color(0xFF9578CD),
                  child: Center(child: Text("Safe Student",style: TextStyle(color:Colors.black,fontWeight: FontWeight.bold,fontSize: 25),)),
                  
                  
                ),
                
            ),
            
                     SafeArea(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                         children:<Widget> [
                           Container(
                             height:64,
                             margin:EdgeInsets.only(bottom:40),
                             child:Row(
                               mainAxisAlignment: MainAxisAlignment.end,
                               children:<Widget> [
                                 
                                Align(
                               alignment: Alignment.topRight,
                             child: SizedBox(
                                 width:40,
                                 height: 40,
                                                            child: IconButton(
                                     icon: Icon(Icons.exit_to_app),
                                     // icon: Image.asset('assets/images/kisspng-start-svg-png-icon-free-download-501746-onlin-5b6a8876ad34f1.8833342315337084067095.png'),
                                color: Colors.black,
                                alignment: Alignment.topRight,
                               
                      
                              // l'alerte pour se déconnecter de l'application étudiant 
                            onPressed: (){
                               showDialog(context:context,
                               builder: (context) =>  AlertDialog(
                                      title: Text("voulez vous vos déconnecter?"),
                                      actions: [
                                        FlatButton(onPressed:(){
                                            Navigator.pop(context);
                                        },
                                          
                                    child: Text("Non")),
                                        // ignore: missing_required_param
                                        FlatButton(
                                          onPressed: (){
                                    Navigator.push(context
                                     , MaterialPageRoute(builder: (context) => Connection()));
                                        },
                                        child: Text('se déconnecter'),
                                        ),
                                      ],
                                      elevation: 24.0,
                                   
                                     
                                ),);
                               
          
                            },
                            ),
                             ),
                            ),
                        
                             ],
                             ),
                             
                           ),

                           Container(
                height: 150,
                width: 320,
                   child:GestureDetector(
                     onTap: (){
                       createAlertDialog(context).then((word){
                        SnackBar mysnackbar=SnackBar(content: Text("$word"));
                         _globalKeyScaffold.currentState.showSnackBar(mysnackbar);
                       });
                     },
                   
                     
                                                             child: Card(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                                    elevation: 8.0,
                                              
                                             child:Padding(
                                               padding: const EdgeInsets.all(16.0),
                                               child: Column(
                                                 
                                                 mainAxisAlignment: MainAxisAlignment.center,
                                                 children: <Widget>[
                                                   Image.asset(
                                               "assets/images/icons8-hôpital-3-96.png",
                                               height: 80,
                                             ),
                                             Text(
                                               'Alerter',
                                               textAlign: TextAlign.center,
                                               style: Theme.of(context)
                                                   .textTheme
                                                   .headline6
                                                   .copyWith(fontSize: 15),
                                             ),
                     
                                                 ],
                                               ),
                                             ),
                                            
                                          ),
                                        ),
                                        ),
                                                
                                                SizedBox(
                                                  height: 2,
                                                ),
                                                Expanded(
                                 child: GridView.count(
                                   padding: EdgeInsets.all(20),
                                   crossAxisCount: 2,
                                   mainAxisSpacing: 2,
                                   childAspectRatio: 1.0,
                                   primary: false,
                                   children: <Widget>[
                                            GestureDetector(
                                              onTap: (){
                                                 Navigator.push(
                              context,
                               MaterialPageRoute(builder: (context) => AssistancePage()),
              );},
                                            child: Card(
                                      
                                         shape: RoundedRectangleBorder(
                                           borderRadius:BorderRadius.circular(12)),
                                           elevation:8,
                                           child: Column(
                                               mainAxisAlignment:MainAxisAlignment.center,
                                               children: <Widget>[
                                               Image.asset(
                                                 "assets/images/icons8-formulaire-96.png",
                                                 height:80,
                                               ),
                                               Text(
                                                 "Assistance",
                                                 textAlign: TextAlign.center,
                                                 style: Theme.of(context)
                                                     .textTheme
                                                     .headline6
                                                     .copyWith(fontSize: 15),
                                               )
                                           ])),
                                            ),
                                     
                                            GestureDetector(
                                              
                                              onTap: (){
                                                print('u touched doctor');
                                                 Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(builder: (context) => ChatRoom(actuel: donnee,)),
                                                      );
                                              },
                                         child: Card(
                                       shape: RoundedRectangleBorder(
                                         borderRadius:BorderRadius.circular(12)),
                                         elevation:8,
                                         child: Column(
                                               mainAxisAlignment:MainAxisAlignment.center,
                                               children: <Widget>[
                                               Image.asset(
                                                 "assets/images/icons8-docteur-homme-96.png",
                                                 height: 80,
                                               ),
                                               SizedBox(
                                                 height:4),
                                               Text(
                                                 "Docteur",
                                                 textAlign: TextAlign.center,
                                                 style: Theme.of(context)
                                                     .textTheme
                                                     .headline6
                                                     .copyWith(fontSize: 15),
                                               )
                                         ])),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                 Navigator.push(
                              context,
                               MaterialPageRoute(builder: (context) => Calendrier()),
              );
                                              },
                                                                                          child: Card(
                                       shape: RoundedRectangleBorder(
                                         borderRadius:BorderRadius.circular(12)),
                                         elevation:8,
                                         child: Column(
                                               mainAxisAlignment:MainAxisAlignment.center,
                                               children: <Widget>[
                                               Image.asset(
                                                 "assets/images/icons8-calendrier-64.png",
                                                 height: 80,
                                               ),
                                               SizedBox(height:4),
                                               Text(
                                                 "Calendrier",
                                                 textAlign: TextAlign.center,
                                                 style: Theme.of(context)
                                                     .textTheme
                                                     .headline6
                                                     .copyWith(fontSize: 15),
                                               )
                                         ])),
                                            ),
                                            GestureDetector(
                                              onTap: (){
                                                 Navigator.push(
                              context,
                               MaterialPageRoute(builder: (context) => Profil()),
              );},
                                            child:Card(
                                       shape: RoundedRectangleBorder(
                                         borderRadius:BorderRadius.circular(12)),
                                         elevation:8,
                                         child: Column(
                                             mainAxisAlignment:MainAxisAlignment.center,
                                             children: <Widget>[
                                             Image.asset(
                                               "assets/images/icons8-carnet-de-santé-96.png",
                                               height: 80,
                                             ),
                                             SizedBox(height:4),
                                             Text(
                                               "Profil Etudiant",
                                               textAlign: TextAlign.center,
                                               style: Theme.of(context)
                                                   .textTheme
                                                   .headline6
                                                   .copyWith(fontSize: 15),
                                             )
                                         ])),),
                                        
                                            
                                   ],
                                 ),
                             
                               ),
                     
                                                
                                                 
                                                  
                             
                          
                             
                                
                                              ],
                     
                                            ),
                                                                 ),
                                          ),
                                
                                 SizedBox(height: 6.0,),
                                
                                ],
                                 ),
               
  
                                   
                                   
                                   
                           
                         );
  }
  
                      
}
                     
                        
 
                     




                           