import 'package:flutter/material.dart';
import 'package:projet/Admin/Doctor/DoctorInfo.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:projet/Database/AuthService.dart';
import 'package:projet/modals/doctor.dart';
import 'package:provider/provider.dart';
import 'package:projet/Database/FirestoreService.dart';


class DoctorListTile extends StatelessWidget {
  const DoctorListTile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        FirestoreService firebaseServices = FirestoreService();

    return  Scaffold(

          body: StreamProvider(
          create: (BuildContext context) => firebaseServices.getDoctorList(),
           //child: iteminscription(),
           child: MaterialApp(home: DoctorTile())),
          

           
    );
  }
  }

  class DoctorTile extends StatelessWidget {
     DoctorTile({Key key}) : super(key: key);
  
 final FirestoreService service = FirestoreService();
       final  AuthService authService = new AuthService();
 
  @override
  Widget build(BuildContext context) {
    
List userList = Provider.of<List<Doctor>>(context);

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
                               //  Navigator.push(context,
                                 //MaterialPageRoute(builder: (context) => ConfirmationPage(demande: userList[index])));
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
                                                                image:  AssetImage('assets/images/doctor.png')
                                                      )
                            )),
                                              ),
                                              Divider(),
                             GestureDetector(
                               onTap: (){
                                  Navigator.push(context,
                                 MaterialPageRoute(builder: (context) => DoctorInfo(doctor: userList[index])));
                               },
                                  child: Container(
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
                                      Text(userList[index].specialite, style: TextStyle(fontSize: 15, color: Colors.grey))
                                  ],
                                ),
                                    ),
                                
                                
                                  ],
                                )
                            ),
                             ),
                                            ],
                                          ),
                                        ),
                                      ),
                            
                                      
                            Spacer(),
                            
                            
                            IconButton(
                                        icon: new Image.asset('assets/images/trash.png'),
                                       tooltip: 'Supprimer Un Medecin',
                                        onPressed: () {
                                          showDialog(
              
                                                    context: context,
                                                    builder: (BuildContext context) {
                                                      return AlertDialog(
                                                        title: Text('Voulez vous vraiment supprimer ce Medecin?'),
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
                                                                         service.removeStudent(userList[index].email);
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
                                         print("you clicked");
                                                               
                                          },
                                         ),
                                                                          
                                      
                             SizedBox(height:4) ,  
                                          
                                     
                                    
                                       

                                 
                                    ]
                                      
                                  
                                       ),                         
                                          ),
              ),
              ),
              ),
          
          
          
          
     
        ) : 
        Center(
                 child: CircularProgressIndicator()
        ),
        
        
      ),
    );
  }

  }
