import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:projet/modals/AlerteValide.dart';

class AlertInfo extends StatefulWidget {
  final AlerteValide alerte;
  AlertInfo({Key key, this.alerte}) : super(key: key);

  _AlertInfoState createState() => _AlertInfoState();
}

class _AlertInfoState extends State<AlertInfo> {
  @override
  Widget build(BuildContext context) {
    return Material(
          child: SingleChildScrollView(
                      child: Stack(

              children:<Widget>[
               
                     ClipPath(
                    clipper: OvalBottomBorderClipper(),
                    child: Container(
                      height: 100,
                      color: Color.fromRGBO(58, 66, 86, 1.0),
                     
                    
                      
                    ),
                    
                ),
                
                     SafeArea(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(8),
                                                  child: Column(
                             children:<Widget> [
                               Container(
                                 height:30,
                                 margin:EdgeInsets.only(bottom:10),
                                 child:Row(
                                   mainAxisAlignment: MainAxisAlignment.start,
                                   children:<Widget> [
                                     
                                    Align(
                                 child: IconButton(
                                        icon: Icon(Icons.arrow_back),
                                  color: Colors.white,
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(8.0),
                                
                    
                                onPressed: (){
                                  Navigator.pop(context);
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
                                "Temps",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.w100),
                              ),
                             
                               Expanded(
                                    child: Text(
                                  widget.alerte.temps.toDate().toString(),
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
                                "Evacuation",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.w100),
                              ),
                             
                               Expanded(
                                    child: Text(
                                  widget.alerte.valid.toDate().toString(),
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
                                "Nom",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.w100),
                              ),
                             
                               Expanded(
                                    child: Text(
                                  widget.alerte.nameEtu,
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
                                "Evacuateur",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.w100),
                              ),
                              Expanded(
                                  child: Text(
                                widget.alerte.service,
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
                                "Ambulancier",
                                textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.w100),
                              ),
                              Expanded(
                                  child: Text(
                                widget.alerte.ambu,
                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.right,
                                style: TextStyle(fontWeight: FontWeight.w100),
                              ))
                                 
                                    
                                  ]
                                ),
                         ),
                         SizedBox(height: 16),
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
                            SizedBox(height: 60,)

                            
                          
                          
                             ],
                                                  ),
                                                ),
                     ),
              ],
             
             ),
          ),
    );
  }
}