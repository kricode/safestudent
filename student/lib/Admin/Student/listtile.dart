import 'package:flutter/material.dart';
import 'package:projet/modals/Demande.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/Database/AuthService.dart';

class ListTilePage extends StatefulWidget {
  final Demande demande;
  ListTilePage({this.demande});
  
  @override
  _ListTilePageState createState() => _ListTilePageState();
}

class _ListTilePageState extends State<ListTilePage> {
  FirestoreService service =FirestoreService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("ff"),
        centerTitle:true,
        backgroundColor:Color(0xFF9578CD),
      ),
       body: SafeArea(
        child: SingleChildScrollView(

         padding: EdgeInsets.all(4),
                  child: Container(
           
                            width:1000,
                            height: 100.0,
                              padding: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: [  
                               BoxShadow(
                               offset: const Offset(0.0, 1.0),
                               blurRadius: 2.0,
                               spreadRadius: 1.0,
                                ),
                                 ],
                              color:Colors.white,
                              
                            ),
                            child:Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             crossAxisAlignment: CrossAxisAlignment.center,
                              children:<Widget>[
                                Row(
                                  
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            
                                 SingleChildScrollView(
                                                                    child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                     children:<Widget>[
                               Text(
                                "\t ${widget.demande.name}",
                                style: TextStyle(fontWeight: FontWeight.w100,fontSize: 20,
                                          fontFamily: 'Cardo'),
                              ),
                              SizedBox(height:8),
                             Text(
                                "\t ${widget.demande.departement}",
                                style: TextStyle(fontWeight: FontWeight.w100,fontSize: 20,
                                          fontFamily: 'Cardo'),
                              ),
                               SizedBox(height: 4,),
                                     ],
                                     
                                   ),
                                 ) ,
                              ],
                            ),   
                                
                                      
                                                                    
                                             Flexible(
                                                 child: SizedBox(
                                                 width: 100.0,
                                                 height: 40.0,
                                    child: RaisedButton( shape: StadiumBorder(),
                                                  color: Colors.green[100],
                                                  onPressed: () {
                                                    service.validerDemande(widget.demande);

                                                  },
                                                  child: Text("Ajouter"),
                                            ),
                                               ),
                                             ),
                                                SizedBox(height:4) ,      
                                             Flexible(
                                                                                            child: SizedBox(
                                                 width:100.0,
                                                 height: 40.0,
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



