

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';


class Alerte{
  String id;
    String name;
    String numero;
    String email;
    String cas;
    Timestamp anniv;
    Timestamp temps;
    String image;
   GeoPoint location;
     Alerte({this.id ,this.name, this.email, this.cas, this.location,this.temps, this.numero, this.anniv, this.image});
 
 Map<String,dynamic> toMap(){
    return {
      'name': name,
    'email': email,
    'numero' : numero,
    'temps' : temps ,
    'cas' : cas ,
    'location' : location,
    'anniv' : anniv,
    'image' : image

   
    };
  }

Alerte.fromFirestore(Map<String, dynamic> firestore):
       
        name = firestore['name'],
        email = firestore['email'],
        
        cas = firestore['cas'],
        
        location = firestore['location'],
        
        temps= firestore['temps'],
        anniv = firestore['anniv'],

        numero = firestore['numero'],
        image = firestore['image'];
}
