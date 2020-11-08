import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:projet/PompierUi/MessageList.dart';
import 'package:projet/PompierUi/acceuil.dart';
import 'package:projet/modals/Message.dart';

class DetailMessage extends StatefulWidget {
  final Message message;
  DetailMessage({Key key, this.message}) : super(key: key);

  _DetailMessageState createState() => _DetailMessageState();
}

class _DetailMessageState extends State<DetailMessage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
              child: Stack(

            children:<Widget>[
             
                   ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: 200,
                    color: Color.fromRGBO(58, 66, 86, 1.0),
                   
                  
                    
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
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children:<Widget> [
                                   
                                  Align(
                               child: IconButton(
                                      icon: Icon(Icons.arrow_back),
                                color: Colors.black,
                                alignment: Alignment.topLeft,
                                padding: EdgeInsets.all(8.0),
                              
                  
                              onPressed: (){
                                Navigator.push(
                                context,
                                 MaterialPageRoute(builder: (context) => MessageList()),
                                );
                              },
                              ),
                              ),
                          
                               ],
                               ),
                               
                             ),
                             
                      
                      Container(
                       width:100.0,
                       height: 100.0,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         image: DecorationImage(

                           image: AssetImage("assets/images/doctor.png"),
                           fit: BoxFit.cover,  
                         ),
                         borderRadius: BorderRadius.circular(70.0),
                        
                       ),
                      

                      ),
                       SizedBox(
                         height:30.0,
                       ),
                       Container(
                          width:300,
                            height:50.0,
                            padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color:Colors.white,
                             borderRadius:BorderRadius.circular(50.0),
                          
                          ),
                          child:Row(
                                
                                children:<Widget>[
                                   
                                 
                                  Text(
                              "Temps",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ),
                           
                             Expanded(
                                  child: Text(
                                widget.message.temps.toDate().toString(),
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.w100),
                              )),
                            
                               
                                  
                                ]
                              ),
                            
                          ),
                          SizedBox(height: 30,),
                     Container(
                          width:300,
                            height:50.0,
                            padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color:Colors.white,
                             borderRadius:BorderRadius.circular(50.0),
                          
                          ),
                          child:Row(
                                
                                children:<Widget>[
                                   
                                 
                                  Text(
                              "Medecin",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ),
                           
                             Expanded(
                                  child: Text(
                                widget.message.namedoc,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.w100),
                              )),
                            
                               
                                  
                                ]
                              ),
                            
                          ),
                          SizedBox(height: 20,),
                          Container(
                          width:300,
                            height:50.0,
                            padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color:Colors.white,
                             borderRadius:BorderRadius.circular(50.0),
                          
                          ),
                          child:Row(
                                
                                children:<Widget>[
                                   
                                 
                                  Text(
                              "Etudiant",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ),
                           
                             Expanded(
                                  child: Text(
                                widget.message.name,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.w100),
                              )),
                            
                               
                                  
                                ]
                              ),
                            
                          ),
                         SizedBox(height:20) ,
                          Container(
                          width:300,
                            height:50.0,
                            padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color:Colors.white,
                             borderRadius:BorderRadius.circular(50.0),
                          
                          ),
                          child:Row(
                                
                                children:<Widget>[
                                 
                                  Text(
                              "Email",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ),
                           
                             Expanded(
                                  child: Text(
                                widget.message.email,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.w100),
                              )),
                            
                               
                                  
                                ]
                              ),
                            
                          ),
                       
                            SizedBox(height:16) ,
                        
                          Container(
                          width:300,
                            height:50.0,
                            padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color:Colors.white,
                             borderRadius:BorderRadius.circular(50.0),
                            
                          ),
                        child:Row(
                                
                                children:<Widget>[
                                  Text(
                              "Maladie",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ),
                            Expanded(
                                child: Text(
                              widget.message.description != null ?  widget.message.description : 'Cas non mentionné',
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ))
                               
                                  
                                ]
                              ),
                       ),
                        SizedBox(height:16) ,
                        
                          Container(
                          width:300,
                            height:50.0,
                            padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color:Colors.white,
                             borderRadius:BorderRadius.circular(50.0),
                            
                          ),
                        child:Row(
                                
                                children:<Widget>[
                                   
                                 
                                  Text(
                              "Adresse",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ),
                            Expanded(
                                child: Text(
                              widget.message.adresse != null ?  widget.message.adresse : 'Adresse non mentionnée',
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ))
                               
                                  
                                ]
                              ),
                       ),
                       SizedBox(height:16,),
                       Container(
                          width:300,
                            height:50.0,
                            padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color:Colors.white,
                             borderRadius:BorderRadius.circular(50.0),
                          
                          ),
                          child:Row(
                                
                                children:<Widget>[
                                   Icon(Icons.phone_android,color: Colors.grey,),
                                 
                                  Text(
                              "Numero De Contact",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ),
                           
                             Expanded(
                                  child: Text(
                                widget.message.numero,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.w100),
                              )),
                            
                               
                                  
                                ]
                              ),
                            
                          ),
                          SizedBox(height: 40,),
                           
                           SizedBox(
                                                 
                                                   
                                                                   child: IconButton(
                                                                     
                                                                    icon: new Image.asset('assets/images/check.png'),
                                                                    tooltip: 'Valider Le Message',
                                                                    onPressed: () {
                                                                      print("you clicked supprimer message");
                                                                       
                                                                      
                                                                      
                                                                    },
                                                                  ),
                                                                        ),
                                     


                          
                         
                        
                        
                           ],
                                                ),
                                              ),
                   ),
            ],
           
           ),
      ),);
  }
}