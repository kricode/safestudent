import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Ambulancier{
  String email;
  String name;
  double numero;
  String secteur;
  Ambulancier({this.email, this.name, this.numero, this.secteur});

  Map<String,dynamic> toMap(){
    return {
      'name': name,
    'email': email,
    'secteur': secteur,
    
    'numero' : numero
   
    };
  }

    Ambulancier.fromFirestore(Map<String, dynamic> firestore)
      : 
        name = firestore['name'],
        email = firestore['email'],
        secteur = firestore['secteur'],
        numero = firestore['numero']
        ;

  }
