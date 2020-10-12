import 'package:flutter/material.dart';

class DoctorProvider with ChangeNotifier{
  String _doctorid;
  String _name;
  String _email;
  String _password;
  String _specialite;

  String get name => _name;
  String get email => _email;
  String get password => _password;
  String get specialite => _specialite;


  changeName(String value){
    _name = value;
    notifyListeners();
  }
  changeEmail(String value){
      _email = value;
      notifyListeners();
    }


  changePassword(String value){
      _password = value;
      notifyListeners();
    }


  changeSpecialite(String value){
      _specialite = value;
      notifyListeners();
    }




}