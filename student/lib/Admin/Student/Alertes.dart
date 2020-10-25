import 'package:flutter/material.dart';
import 'package:projet/Admin/Student/AlertInfo.dart';
import 'package:projet/Database/AuthService.dart';
import 'package:projet/modals/Alerte.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/modals/AlerteValide.dart';
import 'package:provider/provider.dart';

class AlertList extends StatefulWidget {
  AlertList({Key key}) : super(key: key);

  _AlertListState createState() => _AlertListState();
}

class _AlertListState extends State<AlertList> {
  

  @override
  Widget build(BuildContext context) {
    final FirestoreService firebaseServices = FirestoreService();

    return StreamProvider(
        create: (BuildContext context) => firebaseServices.getAlerteValide(),
         //child: iteminscription(),
         child: MaterialApp(home: AlertTile()));
  }
}

class AlertTile extends StatelessWidget {
   AlertTile({Key key}) : super(key: key);

 final FirestoreService service = FirestoreService();
       final  AuthService authService = new AuthService();
 
  @override
  Widget build(BuildContext context) {
    
List userList = Provider.of<List<AlerteValide>>(context);

    return Material(
      
          child: Container(child:  userList != null ? ListView.builder(
          
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
                                    color: Colors.white,
                                    
                                  ),
                                  child:Row(
                                     
                                   crossAxisAlignment: CrossAxisAlignment.center,
                                    children:<Widget>[
                                      GestureDetector(
                                        onTap: (){
                               Navigator.push(context,
                                 MaterialPageRoute(builder: (context) => AlertInfo(alerte: userList[index])));
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

                                    Text(userList[index].nameEtu, style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Cardo',
                                    ),),
                                    Text('${userList[index].service }', style: TextStyle(fontSize: 15, color: Colors.grey))
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
                            
                            
                           
                                                                          
                                      
                             SizedBox(height:4) ,  
                                          
                                     
                                    
                                       

                                 
                                    ]
                                      
                                  
                                       ),                         
                                          ),
              ),
              ),
              ),
          
          
          
          
     
        ) : RaisedButton(
          child: Text("press"),
          onPressed: (){
            print(userList);
          },
        )
        //Center(
            //      child: CircularProgressIndicator()
       // ),
        
        
      ),
    );
  }

}