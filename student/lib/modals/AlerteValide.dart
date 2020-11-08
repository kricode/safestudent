

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';


class AlerteValide{
  String id;
    String nameEtu;
    String numero;
    String email;
    String cas;
    Timestamp anniv;
    Timestamp temps;
    String image;
   GeoPoint location;
   String service;
   String ambu;
     AlerteValide({this.id , this.nameEtu, this.email, this.cas, this.location,this.temps, this.numero, this.anniv, this.image, this.ambu, this.service});
 
 Map<String,dynamic> toMap(){
    return {
      
      'nameEtu' : nameEtu,
    'email': email,
    'numero' : numero,
    'temps' : temps ,
    'cas' : cas ,
    'location' : location,
    'anniv' : anniv,
    'image' : image,
    'service' : service,
    'ambu' : ambu

   
    };
  }

AlerteValide.fromFirestore(Map<String, dynamic> firestore):
       
        
                nameEtu = firestore['nameEtu'],

        email = firestore['email'],
        
        cas = firestore['cas'],
        
        location = firestore['location'],
        
        temps= firestore['temps'],
        anniv = firestore['anniv'],

        numero = firestore['numero'],
        service = firestore['service'],

        ambu = firestore['ambu'],
        image = firestore['image'];
}
