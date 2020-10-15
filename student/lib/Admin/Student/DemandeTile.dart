import 'package:flutter/material.dart';
import 'package:projet/Admin/Student/ajouterEtudiant.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/modals/Demande.dart';
import 'package:provider/provider.dart';
import './listtile.dart';

class DemandesList extends StatelessWidget {
  const DemandesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
List userList = Provider.of<List<Demande>>(context);
    FirestoreService service = FirestoreService();

    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Stream Provider'),
      ),
      body: userList != null? ListView.builder(
        
        itemCount: userList.length,
        itemBuilder: (_, int index) => Padding(
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
                                Row(
                                  
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
                             Text(
                                "\t ${userList[index].email}",
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
                                                    service.validerDemande(userList[index]);

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
        ),
      ) : Center(
        child: Column(
          children: [
            
            Container(
              child: Image(image:AssetImage('assets/images/noresult.jpg')),
            ),
            SizedBox(height: 30),
            Text('Aucune Demande Pour Le Moment',style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xff0962ff),
                                      fontWeight: FontWeight.bold),)
          ],
        ),
      ),
       floatingActionButton: FloatingActionButton(
        onPressed: (){
          
          
            Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AjoutetudiantPage()),
                          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      
    );
  }
}