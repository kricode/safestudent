import '../helper/authenticate.dart';
import '../helper/constants.dart';
import '../helper/helperfunctions.dart';
import '../helper/theme.dart';
import '../database/AuthService.dart';
import '../database/FirestoreService.dart';
import './chat.dart';
import './search.dart';
import 'package:flutter/material.dart';
import '../Sign/connection.dart';

class ChatRoom extends StatefulWidget {
  final dynamic actuel ;
  ChatRoom({this.actuel});
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  Stream chatRooms;

  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data.documents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ChatRoomsTile(
                    medecin: widget.actuel,
                    username: widget.actuel['name'],
                    name: snapshot.data.documents[index].data()['chatRoomId']
                        .toString()
                        .replaceAll("_", "")
                        .replaceAll(widget.actuel['name'], ""),
                    chatRoomId: snapshot.data.documents[index].data()["chatRoomId"],
                  );
                })
            : Container();
      },
    );
  }

  @override
  void initState() {
    getUserInfogetChats();
    print(widget.actuel);
    super.initState();
  }

  

String myname;
  getUserInfogetChats() async {
  
    FirestoreService().getUserChats(widget.actuel['name'],).then((snapshots) {
      setState(() {
        myname =widget.actuel['name'];

        chatRooms = snapshots;
        print(
            "we got the data + ${chatRooms.toString()} this is name  ${widget.actuel['name']}");
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vos Discussions'),
        elevation: 0.0,
        centerTitle: false,
        actions: [
          GestureDetector(
            onTap: () {
              AuthService().signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => Connection()));
            },
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.exit_to_app)),
          )
        ],
      ),
      body: Container(
        child: chatRoomsList(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: () {
          
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Search(data:  widget.actuel)));
        },
      ),
    );
  }
}

class ChatRoomsTile extends StatelessWidget {
  final String username;
  final String name;
  final String chatRoomId;
  final dynamic medecin;

  ChatRoomsTile({this.name,@required this.chatRoomId, @required this.username, @required this.medecin});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Chat(
            info: medecin,
            title : name,
            myname: username,
            chatRoomId: chatRoomId,
          )
        ));
      },
      child: Container(
        height: 90,
        decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
        color: Color(0x3A99ccff),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              ),

        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  color: CustomTheme.colorAccent,
                  borderRadius: BorderRadius.circular(30)),
              child: Text(name.substring(0, 1),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'OverpassRegular',
                      fontWeight: FontWeight.w300)),
            ),
            SizedBox(
              width: 12,
            ),
            Text(name,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'OverpassRegular',
                    fontWeight: FontWeight.w300)),
                    Spacer(),
            
          ],
        ),
        
      ),
    );
  }
}
