import 'package:flutter/material.dart';
import 'package:projet/Admin/Student/Addstudent.dart';
import 'package:projet/Admin/Student/Alertes.dart';
import 'package:projet/Admin/Student/ajouterEtudiant.dart';
import './StudentDemandes.dart';
import './StudentList.dart';

class Tabs extends StatelessWidget {
  const Tabs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _tabpages = <Widget>[
      StudentDemandes(),
      StudentList()
      
    ];
    return DefaultTabController(
  length: 3,
  child: MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          onTap: (index) {
           // Tab index when user select it, it start from zero
          },
          tabs: [
            Tab(icon: Icon(Icons.add_to_queue),text: 'Demandes', ),
            Tab(icon:Icon(Icons.person),text: 'Etudiants', ),
           Tab(icon: Icon(Icons.sim_card_alert),text: 'Alertes', )

             

          ],
        ),
        title: Text("Etudiants", style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontFamily: 'Cardo',
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w200
                          ),),
        actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () {
            print("you clicked on signout");
          },
        )
      ],
      ),
      body: TabBarView(
        children: [
          StudentDemandes(),
          StudentList(),
          AlertList(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          
            Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddStudent()),
                          );
        },
        tooltip: 'Ajouter un Etudiant',
        child: Icon(Icons.add),
      ),

    ),
  ),
);
  }
}