import 'package:flutter/material.dart';
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



    );
  }
}