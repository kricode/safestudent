import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:projet/Database/AuthService.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/SamuUi/DetailPage.dart';
import 'package:projet/SamuUi/MapInstance.dart';
import 'package:projet/Sign/connection.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:projet/modals/Alerte.dart';
import 'package:projet/widget/AddAmbu.dart';
import 'package:provider/provider.dart';


class AlertList extends StatefulWidget {
  AlertList({Key key}) : super(key: key);
   
   Alerte alerte ;


  _AlertListState createState() => _AlertListState();
}

class _AlertListState extends State<AlertList> {
   final FirestoreService service = FirestoreService();
   final  AuthService authService = new AuthService();

  @override
  Widget build(BuildContext context) {
   List userList = Provider.of<List<Alerte>>(context);

    return Scaffold(
      appBar : AppBar(
      elevation: 50,
      backgroundColor: Color(0x9A4da6ff),
      title: Text("Safe Kid"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            authService.signOut();
            Navigator.pop(context);
          },
        )
      ],
    ),
      body:
          Container(
            decoration: new BoxDecoration(color: Color(0x1Acce6ff)),
            child: Column(
              children: [
                Stack(
                  children: [
                    
                   ClipPath(
                    clipper: WaveClipperOne(),
                    child: Container(
                      height: 120,
                      color: Color(0x8A0073e6),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [

                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 70,
                                child: Image(image: AssetImage('assets/images/samu.png')),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 30, 0, 50),
                              child: Text("Alertes", style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontFamily: "Cardo",
                              ),),
                            )
                          ],
                        ),
                      )
                    ),
                  ),
                ],),
              
            
            Expanded(
              child:userList != null ? 
            ListView.builder(
              
              itemCount: userList.length,
                itemBuilder: (_, int index) =>  Padding(
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
                        MaterialPageRoute(builder: (context) => DetailPage(alerte: userList[index],)));
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
                                                                image: userList[index].image != null ? NetworkImage(userList[index].image)  :AssetImage('assets/images/etudiant2.png')
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
                                                                          
                                      
                             SizedBox(height:4) ,      
                                                   Flexible(
                                                       child: SizedBox(
                                                       width:100.0,
                                                       height: 60,
                                                                                                  
                                                            
                                                            child:  IconButton(
                                                            icon: new Image.asset('assets/images/map.png'),
                                                            tooltip: 'Closes application',
                                                            onPressed: () {
                                                              var point = userList[index].place;
                                                              double latitude = point.latitude;
                                                              double longitude = point.longitude;

                                                              print(latitude.toString());
                                                            
                                                              LatLng pointalerte = LatLng(latitude, longitude);
                                                               Navigator.push(context
                                                       , MaterialPageRoute(builder: (context) => MapInstance(point: pointalerte,)));
                                                            },
                                                          )
                                                         ),
                                                     ),
                                                   
                                          
                                     
                                    
                                       

                                 
                                    ]
                                      
                                  
                                       ),                         
                                          ),
              ),
              ),
              ) 
            
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
      ) ,
            ),

            

        ],
      ),
          ),
          floatingActionButton: FloatingActionButton(
                              onPressed: (){
                                
                                
                                

                                
                                  print("touches");
                                Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => AddAmbu(secteur: "samu",),
                                                ));
                              },
                              tooltip: 'Ajouter un Ambulancier',
                              child: Icon(Icons.add),
                            ),
        
          );
          
  }
}