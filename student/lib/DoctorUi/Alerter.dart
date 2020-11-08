import 'package:flutter/material.dart';

class Alerter extends StatefulWidget {
  final String etudiant;
  Alerter({Key key, this.etudiant}) : super(key: key);

  _AlerterState createState() => _AlerterState();
}

class _AlerterState extends State<Alerter> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text(widget.etudiant),
    );
  }
}