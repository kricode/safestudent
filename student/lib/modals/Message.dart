import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Message{
  
  String name;// nom de l'etudiant
  String email; //email du medecin
  String namedoc;// nom du medecin
  String adresse;//adresse fournie par le medecin
  Timestamp temps;// temps de l'alerte
  String description;// description de l'alerte
  String numero;// numero du medecin

  Message({this.name, this.email, this.namedoc, this.temps, this.description, this.adresse, this.numero});
  Map<String,dynamic> toMap(){
    return {
      'name': name,
    'email': email,
    'namedoc': namedoc,
    'temps': temps,

    'description' : description,
    'adresse': adresse,

    'numero' : numero
    
   
    };
  }
  Message.fromFirestore(Map<String, dynamic> firestore)
      : name = firestore['name'],
        email = firestore['email'],
        namedoc = firestore['namedoc'],
        temps = firestore['temps'],
        adresse = firestore['adresse'],
        numero = firestore['numero']    ;

}