import 'package:flutter/material.dart';
import'package:projet/modals/Demande.dart';
import'package:projet/Database/FirestoreService.dart';

// ignore: camel_case_types
class Iteminscriptionmobile extends StatefulWidget {
  final Demande demande;
  Iteminscriptionmobile({this.demande});
  @override
  _IteminscriptionmobileState createState() => _IteminscriptionmobileState();
}

class _IteminscriptionmobileState extends State<Iteminscriptionmobile> {
  FirestoreService service = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
   body: SafeArea(
        child: SingleChildScrollView(
         padding: EdgeInsets.only(top:8.0),
                  child: Container(
           
                            width:1000,
                            height: 100.0,
                              padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              boxShadow: [  
                               BoxShadow(
                               offset: const Offset(1.0, 1.0),
                               blurRadius: 1.0,
                               spreadRadius: 1.0,
                                ),
                                 ],
                              color:Colors.white,
                               borderRadius:BorderRadius.circular(20.0),
                            ),
                            child:Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                              children:<Widget>[
                                Row(
                                  
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                             Container(
                                    
                                      width:40,
                                        decoration:  BoxDecoration( 
                                                            shape: BoxShape.circle,
                                                            image: new DecorationImage(
                                                            fit: BoxFit.cover,
                                                            image:AssetImage('assets/images/etudiant2.png')
                                                  )
                                  )), 
                                  
                                 SingleChildScrollView(
                                                                    child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children:<Widget>[
                               Text(
                                "\t ${widget.demande.name} \n ${widget.demande.departement}",
                                style: TextStyle(fontWeight: FontWeight.w100,fontSize: 20,
                                          fontFamily: 'Cardo'),
                              ),
                              SizedBox(height:8),
                            
                                     ],
                                   ),
                                 ) ,
                              ],
                            ),        
                                      
                                                                    
                                             Flexible(
                                                                                            child: SizedBox(
                                                 width: 100.0,
                                                 height: 30.0,
                                                                                            child: RaisedButton( shape: StadiumBorder(),
                                                  color: Colors.green[100],
                                                  onPressed: () {
                                                    service.validerDemande(widget.demande);

                                                  },
                                                  child: Text("Inscrire"),
                                            ),
                                               ),
                                             ),
                                                       
                                             Flexible(
                                                                                            child: SizedBox(
                                                 width:100.0,
                                                 height: 30.0,
                                                                                            child: RaisedButton(
                                                      shape: StadiumBorder(),
                                                      color: Colors.red[100],
                                                      onPressed: () {
                                                        service.removeDemande(widget.demande.email);

                                                      },
                                                      child: Text("Supprimer"),
                                                    ),
                                               ),
                                             ),
                                    
                               
                              
                                 

                           
                              ]
                                
                            
                                 ),                         
                                    ),
        ),
        ),
                     
      
    
    );
  }
}