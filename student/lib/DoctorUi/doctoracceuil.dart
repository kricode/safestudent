import 'package:flutter/material.dart';

class DoctorUi extends StatefulWidget {
  DoctorUi({Key key}) : super(key: key);

  _DoctorUiState createState() => _DoctorUiState();
}

class _DoctorUiState extends State<DoctorUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text("you are in doctor"),
    );
  }
}