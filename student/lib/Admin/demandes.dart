import 'package:flutter/material.dart';
import 'package:projet/Database/FirestoreService.dart';
import 'package:projet/modals/Demande.dart';
import 'package:provider/provider.dart';

class DemandesList extends StatelessWidget {
  const DemandesList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
List userList = Provider.of<List<Demande>>(context);
    FirestoreService firebaseServices = FirestoreService();

    return Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Stream Provider'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (_, int index) => Padding(
          padding: EdgeInsets.all(10.0),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.amber,
            ),
            title: Text(
              userList[index].name,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            subtitle: Text(
              userList[index].email,
              style: TextStyle(
                fontSize: 25.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}