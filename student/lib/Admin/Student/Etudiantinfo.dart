import 'package:flutter/material.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class EtudiantInfo extends StatefulWidget {
  final dynamic etudiant;
  EtudiantInfo({Key key, this.etudiant}) : super(key: key);

  _EtudiantInfoState createState() => _EtudiantInfoState();
}

class _EtudiantInfoState extends State<EtudiantInfo> {
      final snackBarsuppression = SnackBar(content: Text('Vous avez supprimé un Etudiant'));

   FirestoreService service = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

         body: SingleChildScrollView  (
                    child: Stack(

            children:<Widget>[
             
                   ClipPath(
                  clipper: OvalBottomBorderClipper(),
                  child: Container(
                    height: 130,
                    color: Color(0x4A0f55d7),
                   
                    
                    
                  ),
                  
              ),
              
                   SafeArea(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8),
                                                child: Column(
                           children:<Widget> [
                             Container(
                               height:20,
                               margin:EdgeInsets.only(bottom:10),
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
                           image: AssetImage("assets/images/etudiant2.png"),
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
                              "Nom & Prénom",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ),
                            Expanded(
                                child: Text(
                              widget.etudiant.name,
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
                              widget.etudiant.email,
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
                              "Maladie",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ),
                            Expanded(
                                child: Text(
                              widget.etudiant.cas,
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
                              "Département",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ),
                            Expanded(
                                child: Text(
                              widget.etudiant.departement,
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
                              widget.etudiant.numero,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ))
                               
                                  
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
                                   Icon(Icons.calendar_today,color: Colors.grey,),
                                 
                                  Text(
                              "Date De Naissance",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ),
                            Expanded(
                                child: Text(
                              widget.etudiant.anniv.toDate().toString(),
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ))
                               
                                  
                                ]
                              ),
                              
                            
                          ),
                          SizedBox(height: 30,),
                          IconButton(
                                          icon: new Image.asset('assets/images/trash.png'),
                                         tooltip: 'Supprimer Un Etudiant',
                                          onPressed: () {
                                          service.removeStudent(widget.etudiant.email);
                                          Navigator.pop(context);
                                          Scaffold.of(context).showSnackBar(snackBarsuppression);


                                           print("you clicked");
                                                                 
                                            },
                                           ),
                                 
              
               
                        
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