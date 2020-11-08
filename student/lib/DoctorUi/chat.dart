import 'dart:io';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:location/location.dart';
import 'package:projet/DoctorUi/Alerter.dart';
import 'package:projet/modals/Alerte.dart';

import '../Database/FirestoreService.dart';
import '../widget/widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  final String title;
   final String myname;
  final String chatRoomId;
   dynamic info;

  Chat({this.chatRoomId, this.myname, this.title, this.info});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  FirestoreService service = FirestoreService();
    

  Stream<QuerySnapshot> chats;
  TextEditingController messageEditingController = new TextEditingController();

  Widget chatMessages(){
    return StreamBuilder(
      stream: chats,
      builder: (context, snapshot){
        return snapshot.hasData ?  ListView.builder(
          itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index){
              return MessageTile(
                message: snapshot.data.documents[index].data()["message"],
                sendByMe: widget.myname == snapshot.data.documents[index].data()["sendBy"],
              );
            }) : Center(child: CircularProgressIndicator(),);
      },
    );
  }

  addMessage() {
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        "sendBy": widget.myname,
        "message": messageEditingController.text,
        'time': DateTime
            .now()
            .millisecondsSinceEpoch,
      };

      FirestoreService().addMessage(widget.chatRoomId, chatMessageMap);

      setState(() {
        messageEditingController.text = "";
      });
    }
  }
var etudiant;

 

  @override
  void initState() {
    FirestoreService().getChats(widget.chatRoomId).then((val) {
      setState(() {
        chats = val;
      });
    });
    
print(widget.myname);


    super.initState();
  }
  final _formKey = GlobalKey<FormState>();
  TextEditingController _description = TextEditingController();
  TextEditingController _adresse = TextEditingController();
  FirebaseFirestore _db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
 /*   var location = new Location();
    Geoflutterfire geo = Geoflutterfire();

  LocationData locationdata;
    _getlocation() async {
    var pos = await location.getLocation();
    setState(() {
     locationdata = pos; 
    });

   
    
  }*/
  
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
         actions: [
          GestureDetector(
            onTap: () {
              
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Alerter(etudiant: widget.title,)));
            },
            child: IconButton(
                onPressed: () {
            showDialog(
              
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(widget.title),
                    content: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'Donnez la description du cas'
                                  ),
                                  controller: _description,

                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                   decoration: InputDecoration(
                                    hintText: 'Donnez son adresse'
                                  ),
                                  controller: _adresse,
                                ),
                              ),
                              SizedBox(height: 40,),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  child: Text("Alerter"),
                                  onPressed: () {
                                    
                                    if (_formKey.currentState.validate()) {
                                    //  _getlocation();
                                      // GeoFirePoint point = geo.point(latitude: locationdata.latitude, longitude: locationdata.longitude);

                                      DateTime time =  DateTime.now();
                                        _db.collection('Messages').doc('${widget.info['email']}_${widget.title}').set({ 
                                              'name': widget.title,
                                              'namedoc' : widget.info['name'],
                                              'email': widget.info['email'],
                                              'numero' : widget.info['numero'],
                                              'temps' : Timestamp.fromDate(time) ,
                                              
                                              'adresse' : _adresse.text,
                                              'description': _description.text,
                                             

                                              
                                            });
                                      Navigator.pop(context);
                                     
                                    }
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
          icon: Icon(Icons.info),
        ),
          )
        ],

      ),
      body: Container(
        
        child: Stack(
          children: [
            chatMessages(),
            Container(alignment: Alignment.bottomCenter,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                color: Color(0x3A7A7676),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          controller: messageEditingController,
                          style: simpleTextStyle(),
                          decoration: InputDecoration(
                              hintText: "Message ...",
                              hintStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                              border: InputBorder.none
                          ),
                        )),
                    SizedBox(width: 16,),
                    GestureDetector(
                      onTap: () {
                        addMessage();
                      },
                      child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    const Color(0x36FFFFFF),
                                    const Color(0x0FFFFFFF)
                                  ],
                                  begin: FractionalOffset.topLeft,
                                  end: FractionalOffset.bottomRight
                              ),
                              borderRadius: BorderRadius.circular(40)
                          ),
                          padding: EdgeInsets.all(12),
                          child: Image.asset("assets/images/send.png",
                            height: 25, width: 25,)),
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

}

class MessageTile extends StatelessWidget {
  
  final String message;
  final bool sendByMe;

  MessageTile({@required this.message, @required this.sendByMe});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: sendByMe ? 0 : 24,
          right: sendByMe ? 24 : 0),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: sendByMe
            ? EdgeInsets.only(left: 30)
            : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(
            top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: sendByMe ? BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomLeft: Radius.circular(23)
            ) :
            BorderRadius.only(
        topLeft: Radius.circular(23),
          topRight: Radius.circular(23),
          bottomRight: Radius.circular(23)),
            gradient: LinearGradient(
              colors: sendByMe ? [
                const Color(0xff007EF4),
                const Color(0xff2A75BC)
              ]
                  : [
                const Color(0x4A242323),
                const Color(0x4A5E3F3F)
              ],
            )
        ),
        child: Text(message,
            textAlign: TextAlign.start,
            style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'OverpassRegular',
            fontWeight: FontWeight.w300)),
      ),
    );
  }
}

