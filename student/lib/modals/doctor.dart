import 'package:flutter/material.dart';


class Doctor{
  String doctorId;
  String name;
  String email;
  String password;
  String specialite;

  Doctor({this.doctorId, this.name, this.email, this.password, this.specialite});
  Map<String,dynamic> toMap(){
    return {
      'name': name,
    'email': email,
    'password': password,
    'specialite': specialite,
    
   
    };
  }

}