import 'package:flutter/material.dart';


class Doctor{
  
  String name;
  String email;
  String password;
  String specialite;
  String image;
  String adresse;
  String numero;

  Doctor({this.name, this.email, this.password, this.specialite, this.image, this.adresse, this.numero});
  Map<String,dynamic> toMap(){
    return {
      'name': name,
    'email': email,
    'password': password,
    'specialite': specialite,

    'image' : image,
    'adresse': adresse,

    'numero' : numero
    
   
    };
  }
  Doctor.fromFirestore(Map<String, dynamic> firestore)
      : name = firestore['name'],
        email = firestore['email'],
        password = firestore['password'],
        specialite = firestore['specialite'],
        adresse = firestore['adresse'],
        numero = firestore['numero'],
        image = firestore['image']
       
        ;

}