import 'package:flutter/material.dart';
import 'package:projet/modals/doctor.dart';

class DoctorTile extends StatefulWidget {
  final Doctor doctor;
  DoctorTile({Key key, @required this.doctor}) : super(key: key);

  _DoctorTileState createState() => _DoctorTileState();
}

class _DoctorTileState extends State<DoctorTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("here tile"),
    );
  }
}