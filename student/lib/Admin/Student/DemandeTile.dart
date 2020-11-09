import 'package:flutter/material.dart';
import 'package:projet/Admin/Student/ajouterEtudiant.dart';
import 'package:projet/Admin/Student/confirmation.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/modals/Demande.dart';
import 'package:projet/modals/Utilisateur.dart';
import 'package:provider/provider.dart';
import 'package:projet/Database/AuthService.dart';
import 'package:projet/modals/Etudiant.dart';


import './listtile.dart';

class DemandesList extends StatelessWidget {
   DemandesList({Key key}) : super(key: key);

 final FirestoreService service = FirestoreService();
       final  AuthService authService = new AuthService();
Etudiant  etudiant ;
  @override
  Widget build(BuildContext context) {
    final snackBarsuppression = SnackBar(content: Text('Vous avez supprimé un Etudiant'));
    final snackbarajout = SnackBar(content: Text('Vous avez ajouté un Etudiant'));
List userList = Provider.of<List<Demande>>(context);

    return Material(
          child: Container(child:  userList != null ? ListView.builder(
          
          itemCount: userList.length,
          itemBuilder: userList.length == 0 ? Container(child: Text('nothing'),) : (_, int index) => Padding(
                padding: EdgeInsets.all(10.0),
                child: SafeArea(
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
                                    color: Colors.white,
                                    
                                  ),
                                  child:Row(
                                     
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                    children:<Widget>[
                                      GestureDetector(
                                        onTap: (){
                                 Navigator.push(context,
                                 MaterialPageRoute(builder: (context) => ConfirmationPage(demande: userList[index])));
                                        },
                                       child: Container(
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: Container(
                               //Ici nous allons faire montrer la foto et le nom prenom
                                //nous avons decider de tout separer comme ça il sera plus simple
                                //pour generer l'interface graphique
                                width: 50,
                                  decoration: new BoxDecoration(
                                                               
                                                                shape: BoxShape.circle,
                                                                image: new DecorationImage(
                                                                fit: BoxFit.fitWidth,
                                                                image: AssetImage('assets/images/etudiant2.png')
                                                      )
                            )),
                                              ),
                                              Divider(),
                             Container(
                              child: Row(
                                
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                    Text(userList[index].name, style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Cardo',
                                    ),),
                                    Text(userList[index].cas, style: TextStyle(fontSize: 15, color: Colors.grey))
                                ],
                              ),
                                  ),
                              
                              
                                ],
                              )
                            ),
                                            ],
                                          ),
                                        ),
                                      ),
                            
                                      
                            Spacer(),
                            IconButton(
                                        icon: new Image.asset('assets/images/check.png'),
                                       tooltip: 'Valider une demande',
                                        onPressed: () {
                                         print("you clicked");
                                         uti  utilisateur = new uti(name: userList[index].name, email: userList[index].email, role: 'etudiant', password: userList[index].password);

                                                     service.saveUser(utilisateur);
                                                      service.validerDemande(userList[index]);
                                                      singUp(userList[index].name.toString(), userList[index].email.toString(), userList[index].password.toString() ).then(
                                                      service.removeDemande(userList[index].email));
                                                      Scaffold.of(context).showSnackBar(snackbarajout);

                                                               
                                          },
                                         ),
                            
                            IconButton(
                                        icon: new Image.asset('assets/images/reject.png'),
                                       tooltip: 'Rejeter une demande',
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
                                                                         service.removeDemande(userList[index].email);
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
                                        
                                                               
                                          },
                                         ),
                                                                          
                                      
                             SizedBox(height:4) ,  
                                          
                                     
                                    
                                       

                                 
                                    ]
                                      
                                  
                                       ),                         
                                          ),
              ),
              ),
              ),
          
          
          
          
          
          /*Padding(

            padding: EdgeInsets.all(10.0),
            child: SafeArea(
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
                                  GestureDetector(
                                                                    child: Row(
                                      
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              
                                     SingleChildScrollView(
                                                                        child: Row(
                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                         children:<Widget>[
                                 Text(
                                    "\t ${userList[index].name}",
                                    style: TextStyle(fontWeight: FontWeight.w100,fontSize: 20,
                                              fontFamily: 'Cardo'),
                                ),
                                SizedBox(height:8),
                               
                                 SizedBox(height: 4,),
                                         ],
                                         
                                       ),
                                     ) ,
                                ],
                              ),

                              onTap: (){
                                 Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ConfirmationPage(demande: userList[index]),
                            ));
                              },
                                  ),   
                                  
                                        
                                                                      
                                               Flexible(
                                                   child: SizedBox(
                                                   width: 100.0,
                                                   height: 40.0,
                                      child: RaisedButton( shape: StadiumBorder(),
                                                    color: Colors.green[100],
                                                    onPressed: () {
                                                     uti  utilisateur = new uti(name: userList[index].name, email: userList[index].email, role: 'etudiant', password: userList[index].password);

                                                      service.saveUser(utilisateur);
                                                      service.validerDemande(userList[index]);
                                                      singUp(userList[index].name.toString(), userList[index].email.toString(), userList[index].password.toString() ).then(
                                                       // service.removeDemande(userList[index].email)
                                                      );


                                                    },
                                                    child: Text("à enlever"),
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
                                                          service.removeDemande(userList[index].email);
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
          ),*/
        ) : Center(
                  child: CircularProgressIndicator()
        ),
        
        
      ),
    );
  }
  singUp(String name, String email, String password) async {

    
      

      await authService.signUpWithEmailAndPassword(email,
          password).then((result){
            
      });
    
  }
}