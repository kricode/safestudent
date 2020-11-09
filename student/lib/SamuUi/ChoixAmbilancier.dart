import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:projet/Database/AuthService.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/SamuUi/acceuil.dart';
import 'package:projet/modals/Alerte.dart';
import 'package:projet/modals/Ambulancier.dart';
import 'package:provider/provider.dart';
import 'package:sms/sms.dart';
import '../modals/AlerteValide.dart';

class ChoixAmbilancier extends StatefulWidget {
  final Alerte alerte;
  ChoixAmbilancier({Key key, this.alerte}) : super(key: key);

  _ChoixAmbilancierState createState() => _ChoixAmbilancierState();
}


class _ChoixAmbilancierState extends State<ChoixAmbilancier> {
  @override
  Widget build(BuildContext context) {
    FirestoreService service = FirestoreService();

    return StreamProvider(
        create: (BuildContext context) => service.getAmbulancier('samu'),
         //child: iteminscription(),
         child: MaterialApp(home: ListAmb(alerte: widget.alerte)));
  }
}



class ListAmb extends StatefulWidget {
  final Alerte alerte;
  ListAmb({Key key, this.alerte}) : super(key: key);

  _ListAmbState createState() => _ListAmbState();
}

class _ListAmbState extends State<ListAmb> {


  
 final FirestoreService service = FirestoreService();
       final  AuthService authService = new AuthService();
         SmsSender sender = new SmsSender();

  
  @override
  Widget build(BuildContext context) {
    
List userList = Provider.of<List<Ambulancier>>(context);

    return Scaffold(
          body: Container(
            
            child:  userList != null ? ListView.builder(
          
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
                             
                                width: 50,
                                  decoration: new BoxDecoration(
                                                               
                                                                shape: BoxShape.circle,
                                                                image: new DecorationImage(
                                                                fit: BoxFit.fitWidth,
                                                                image:  AssetImage('assets/images/ambulancier.png')
                                                      )
                            )),
                                              ),
                                              Divider(),
                             GestureDetector(
                               onTap: (){
                                 
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
                                      Text(userList[index].numero, style: TextStyle(fontSize: 15, color: Colors.grey))
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
                            
                            
                            Padding(
                              padding: const EdgeInsets.only(right: 15  ),
                              child: IconButton(
                                          icon: new Image.asset('assets/images/send.png'),
                                         tooltip: 'Envoyer un message',
                                          onPressed: () {
                                           print("you clicked on send message");
                                           String message = 'Vous avez une Alerte  Dont le cas est ${widget.alerte.cas}  Nom de la personne : ${widget.alerte.name}  Veuillez nous contacter';
                                           //A essayer une fois i have reseau psk djezzy makach l credit xd
                                      //       sender.sendSms(new SmsMessage(widget.alerte.numero, 'Hello flutter!'));
                                           SmsMessage messagesend = new SmsMessage(userList[index].numero, message);
                                    /*      messagesend.onStateChanged.listen((state) {
                                            if (state == SmsMessageState.Sent) {
                                              
                                              
                                              print("SMS is sent!");
                                            } else if (state == SmsMessageState.Delivered) {
                                              print("SMS is delivered!");
                                            } else {
                                              print("error");
                                            }
                                          });*/
                                          DateTime time =  DateTime.now();
                                          sender.sendSms(messagesend);
                                          AlerteValide alerteValide = new AlerteValide( nameEtu: widget.alerte.name ,anniv: widget.alerte.anniv
                                          ,email: widget.alerte.email, location: widget.alerte.place, numero: widget.alerte.numero, cas: widget.alerte.cas,
                                          temps: widget.alerte.temps, service: 'samu', ambu: userList[index].name, valid: Timestamp.fromDate(time) );
                                          String alerteId = '${widget.alerte.name} _ ${userList[index].name} _ ${widget.alerte.temps.toDate().toString()} _ Samu';
                                          

                                          service.valideAlerte(alerteValide, alerteId);
                                          service.removeAlert(widget.alerte.email);
                                           Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AcceuilSamu()));                                         
                                            },
                                           ),
                            ),
                                                                          
                                      
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