import 'package:flutter/material.dart';


class Doctor{
  
  String name;
  String email;
  String password;
  String specialite;
  String image;

  Doctor({this.name, this.email, this.password, this.specialite, this.image});
  Map<String,dynamic> toMap(){
    return {
      'name': name,
    'email': email,
    'password': password,
    'specialite': specialite,
    'image' : image
    
   
    };
  }
  Doctor.fromFirestore(Map<String, dynamic> firestore)
      : name = firestore['name'],
        email = firestore['email'],
        password = firestore['password'],
        specialite = firestore['specialite'],
        image = firestore['image']
       
        ;

}