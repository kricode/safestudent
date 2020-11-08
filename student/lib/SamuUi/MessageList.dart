import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/SamuUi/DetailMessage.dart';
import 'package:projet/modals/Message.dart';
import 'package:provider/provider.dart';



class MessageList extends StatefulWidget {
  MessageList({Key key}) : super(key: key);

  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  @override
  Widget build(BuildContext context) {
     final FirestoreService firebaseServices = FirestoreService();

    return StreamProvider(
        create: (BuildContext context) => firebaseServices.getMessageList(),
         //child: iteminscription(),
         child: MaterialApp(home: MessageTile()));
  }
}


class MessageTile extends StatefulWidget {
  MessageTile({Key key}) : super(key: key);

  _MessageTileState createState() => _MessageTileState();
}

class _MessageTileState extends State<MessageTile> {

  @override
  Widget build(BuildContext context) {
       List messageList = Provider.of<List<Message>>(context);

    return Scaffold(
       body: Container(
            decoration: new BoxDecoration(color: Color(0x1A102b3c)),
            child: Column(
              children: [
                Stack(
                  children: [
                    
                    ClipPath(
                    clipper: WaveClipperOne(),
                    child: Container(
                      height: 170,
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
                              child: Text("Messages Reçus", style: TextStyle(
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
              child:messageList != null ? 
            ListView.builder(
              
              itemCount: messageList.length,
              itemBuilder: (_, int index) => Padding(
                padding: EdgeInsets.all(10.0),
                child: SafeArea(
              child: SingleChildScrollView(

               padding: EdgeInsets.all(4),
                        child:

                        Container(
                 
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
                        MaterialPageRoute(builder: (context) => DetailMessage(message:  messageList[index],)));
                                        
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
                                                                image: AssetImage('assets/images/doctor.png')
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

                                    Text(messageList[index].namedoc, style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Cardo',
                                    ),),
                                    Text(messageList[index].numero, style: TextStyle(fontSize: 15, color: Colors.grey))
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
                                                       width:50.0,
                                                       height: 60,
                                                                                                  
                                                            
                                                            child:  IconButton(
                                                            icon: new Image.asset('assets/images/check.png'),
                                                            tooltip: 'Montrer Alerte sur la carte',
                                                            onPressed: () {
                                                             
                                                            },
                                                          )
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
      ) ,
            ),

            

        ],
      ),
          ),
    );
  }
}