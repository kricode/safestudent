import 'package:flutter/material.dart';
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
    final _tabs = <Tab>[
      Tab(icon: Icon(Icons.add_to_queue),text: 'Demandes', ),
      Tab(icon: Icon(Icons.view_list),text: 'Etudiants', )


    ];
    return Scaffold(
      appBar: TabBar(
        tabs: _tabs,
      ),

    body: TabBarView(
      children: _tabpages,
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