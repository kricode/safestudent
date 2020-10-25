import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:projet/PompierUi/acceuil.dart';
import 'package:projet/modals/Alerte.dart';
import 'ChoixAmbilancier.dart';
class DetailPage extends StatefulWidget {
  final Alerte alerte;
  DetailPage({Key key, this.alerte}) : super(key: key);

  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
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
                               MaterialPageRoute(builder: (context) => AcceuilPompier()),
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

                         image: widget.alerte.image != null ? NetworkImage(widget.alerte.image)  : AssetImage("assets/images/etudiant2.png"),
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
                              widget.alerte.name,
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
                                 Icon(Icons.email,color: Colors.grey,),
                               
                                Text(
                            "Email",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.w100),
                          ),
                         
                           Expanded(
                                child: Text(
                              widget.alerte.email,
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
                            "cas",
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
                            "Date De Naissance",
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.w100),
                          ),
                          Expanded(
                              child: Text(
                            widget.alerte.anniv.toDate().toString(),
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
                              widget.alerte.numero,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            )),
                          
                             
                                
                              ]
                            ),
                          
                        ),

                           

                         
                      
                       

                        
                        Padding(
                             padding: const EdgeInsets.all(60.0),
                             child: Container(
                               height: 100,
                               child: Row(
                                 mainAxisSize: MainAxisSize.max,
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Flexible(
                                               child: SizedBox(
                                                 
                                                                 child: IconButton(
                                                                  icon: new Image.asset('assets/images/map.png'),
                                                                  tooltip: 'Consulter Alerte sur la carte',
                                                                  onPressed: () {
                                                                    print("you clicked map");
                                                                    
                                                                    
                                                                  },
                                                                ),
                                                                      ),
                                   ),
                                  IconButton(
                                    
                                                                icon: new Image.asset('assets/images/check.png'),
                                                                tooltip: 'Valider Alerte',
                                                                onPressed: () {
                                                                  print("you clicked on validate alert");
                                                                  Navigator.push(context
                                                                   , MaterialPageRoute(builder: (context) => ChoixAmbilancier(alerte: widget.alerte,)));
                                                                  
                                                                
                                                                },
                                                              )
                                 ],
                               ),
                             ),
                           )
                      
                      
                         ],
                                              ),
                                            ),
                 ),
          ],
         
         ),);
  }
}