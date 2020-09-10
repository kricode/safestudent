


import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:student/profil.dart';


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
                             child: IconButton(
                                    icon: Image.asset("assets/images/etudiant.png"),
                              color: Colors.black,
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.all(8.0),
                      
                
                            onPressed: (){
                              Navigator.push(
                              context,
                               MaterialPageRoute(builder: (context) => Profil()),
              );
                            },
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
                                               "Alert",
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
                                    Card(
                                      
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
                                     
                                            Card(
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
                                            Card(
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
                                               "Carnet de santé",
                                               textAlign: TextAlign.center,
                                               style: Theme.of(context)
                                                   .textTheme
                                                   .headline6
                                                   .copyWith(fontSize: 15),
                                             )
                                         ])),
                                            
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
                     
                        
 
                     




                           