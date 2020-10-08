import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'package:projet/acceuilEtudiant/main.dart';
class Profil extends StatefulWidget{
  @override
  _ProfilState  createState()=> _ProfilState();
  }
  class _ProfilState extends State<Profil> {

    bool toggleValue=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

         body: Stack(

          children:<Widget>[
           
                 ClipPath(
                clipper: OvalBottomBorderClipper(),
                child: Container(
                  height: 200,
                  color: Color(0xFF9578CD),
                 
                  
                  
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
                               MaterialPageRoute(builder: (context) => HomeScreen()),
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
                         image: AssetImage("assets/images/icons8-utilisateur-96.png"),
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
                            "Name",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.w100),
                          ),
                          Expanded(
                              child: Text(
                            "bouchir yasmina",
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.right,
                            style: TextStyle(fontWeight: FontWeight.w100),
                          ))
                         
                            
                          ]
                        )
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
                                 Icon(Icons.email,color: Colors.grey,),
                               
                                Text(
                            "Email",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.w100),
                          ),
                          Expanded(
                              child: Text(
                            "bouchir.yasmina@gmail.com",
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
                               Icon(Icons.vpn_key,color: Colors.grey,),
                               
                                Text(
                            "\t Reset password",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.w100),
                          ),
                         
                            
                          ]
                        )
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
                            
                              Icon(Icons.notifications,color:Colors.grey),
                              Text("Notifications", textDirection: TextDirection.ltr,
                             textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.w100),),
                                Spacer(),
                             AnimatedContainer(
                               duration: 
                             Duration(milliseconds:1000),
                             height:40.0,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius:BorderRadius.circular(20.0),
                              color: toggleValue? Color(0xFF9578CD):Colors.white.withOpacity(0.5)
                            ),
                            child: Stack(

                              children:<Widget>[
                                AnimatedPositioned(
                                  duration: Duration(milliseconds: 1000),
                                  curve: Curves.easeIn,
                                  top:3.0,
                                  left: toggleValue?60.0:0.0,
                                  right: toggleValue?0.0:60.0,
                                  child: InkWell(
                                    onTap:toggleButton,
                                    child: AnimatedSwitcher(
                                      duration: Duration(milliseconds:1000),
                                      transitionBuilder: (Widget child,Animation<double>animation){
                                        return RotationTransition(child:child,turns: animation);
                                      },
                                      child: toggleValue?Icon(Icons.check_circle,color: Colors.black,size: 30.0,
                                      key: UniqueKey(),
                                      ):Icon(Icons.remove_circle_outline,color: Colors.black,size: 30.0,
                                      key: UniqueKey(),

                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                             ),
                            ],
                          
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
                             Icon(Icons.block,color:Colors.grey),
                            Text("\t Log out",
                             textDirection: TextDirection.ltr,
                             textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.w100),),
                            
                         
                            
                          ]
                        )
                     ),

                        
                      
                      
                      
                         ],
                                              ),
                                            ),
                 ),
          ],
         
         ),
    );

         }
         toggleButton(){
           setState(() {
             toggleValue=!toggleValue;
           });
         }
         
    
}

