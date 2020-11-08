import 'package:flutter/material.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/Database/AuthService.dart';

import 'package:projet/modals/Demande.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:projet/modals/Etudiant.dart';
import 'package:projet/modals/Utilisateur.dart';

class ConfirmationPage extends StatefulWidget{
  final dynamic demande;
  ConfirmationPage({this.demande});
  @override
  _ConfirmationPageState  createState()=> _ConfirmationPageState();
  }
  class _ConfirmationPageState extends State<ConfirmationPage> {
    FirestoreService service = FirestoreService();
        AuthService authService = new AuthService();
Etudiant  etudiant ;
uti utilisateur;

  @override
  Widget build(BuildContext context) {
    final snackBarsuppression = SnackBar(content: Text('Vous avez supprimé un Etudiant'));
    final snackbarajout = SnackBar(content: Text('Vous avez ajouté un Etudiant'));
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
                              widget.demande.name,
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
                              widget.demande.email,
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
                              widget.demande.cas,
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
                              widget.demande.departement,
                              textDirection: TextDirection.ltr,
                              textAlign: TextAlign.right,
                              style: TextStyle(fontWeight: FontWeight.w100),
                            ))
                               
                                  
                                ]
                              ),
                       ),
                       SizedBox(height:16,),
                                 
              SingleChildScrollView(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       SingleChildScrollView(
                                                              child: Container(
                                  
                                  margin: EdgeInsets.only(left:50.0),
                                  height: 80,
                                  width: 110,
                                  child: IconButton(
                                    icon: new Image.asset('assets/images/check.png'),
                                                                  tooltip: 'Valider La Demande',
                                                                  onPressed: () {
                                                                  //   utilisateur = new uti(name: widget.demande.name, email: widget.demande.email, role: 'etudiant', password: widget.demande.password);
                                                                   // service.validerDemande(widget.demande);

                                                                    //service.saveUser(utilisateur);
                                  
                                                                     //singUp();
                                                                  //  service.removeDemande(widget.demande.email);
                                                                    // uti utilisateur;
                                                                    // utilisateur = uti(email: widget.demande.email, password: widget.demande.password, role: 'etudiant');
                                                                    // service.saveUser(utilisateur); 
                                                                    Scaffold.of(context).showSnackBar(snackbarajout);
                                                                    Navigator.pop(context);

                                                                    print("you clicked ajout");
                                                                    
                                                                  },
                                  ),
                              ),
                                
                                
                               ),
                               SizedBox(
                                 height:80,
                               width:100),
                            GestureDetector(
                            child: SingleChildScrollView(
                                                      child: Container(
                              
                              margin: EdgeInsets.symmetric(vertical: 20),
                              height: 65,
                              width: 100,
                              child: IconButton(
                                                                  icon: new Image.asset('assets/images/reject.png'),
                                                                  tooltip: 'Rejeter La Demande',
                                                                  onPressed: () {
                                                                   showDialog(
              
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text('Voulez vous vraiment supprimer cette demande?'),
                                                        content: Stack(
                                                          overflow: Overflow.visible,
                                                          children: <Widget>[
                                                            
                                                            Form(
                                                            
                                                              child: Row(
                                                                mainAxisSize: MainAxisSize.min,
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: <Widget>[

                                                                  
                                                                  SizedBox(height: 40,),
                                                                  Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: RaisedButton(
                                                                      child: Text("Supprimer"),
                                                                      onPressed: () {
                                                                         service.removeStudent(widget.demande.email);
                                                                          Navigator.pop(context);
                                                                          print("you clicked on Delete");
                                                                        
                                                                      },
                                                                    ),
                                                                  ),Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: RaisedButton(
                                                                      child: Text("Non"),
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                        
                                                                        
                                                                      },
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                });
                                                                     
                                                                     Scaffold.of(context).showSnackBar(snackBarsuppression);
                                                                    print("you clicked suppression");
                                                                    
                                                                  },
                          ),
                            ),
                            
                           ),)
            ]
              ),
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
  
       
         singUp() async {

    
      

      await authService.signUpWithEmailAndPassword(widget.demande.email.toString(),
          widget.demande.password.toString()).then((result){
            if(result != null){
              service.saveEtudiant(etudiant);
                
              Map<String,String> userDataMap = {
                "name" : widget.demande.name,
                "email" : widget.demande.email,
                "role"  : "etudiant"
              };

              service.addUserInfo(userDataMap);

            
              
            }
      });
    
  }
    
}

