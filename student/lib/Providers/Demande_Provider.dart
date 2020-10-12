import 'package:flutter/material.dart';
import '../modals/Demande.dart';
import '../database/FirestoreService.dart';
import 'package:uuid/uuid.dart';

class DemandeProvider with ChangeNotifier{

//final firestoreservice = new FirestoreService();

String _id;
  String _name;
  String _email;
  String _password;
  String _cas;
  String _departement;
  String _image;

  var uuid = Uuid();

  //getters
    String get name => _name;
      String get email => _email;
  String get password => _password;
  String get cas => _cas;
  String get departement => _departement;
  String get image => _image;

  //setters
   changeName(String value) {
    _name = value;
    notifyListeners();
  }
   changeEmail(String value) {
    _email = value;
    notifyListeners();
  }
   changePassword(String value) {
    _password = value;
    notifyListeners();
  }
   changeCas(String value) {
    _cas = value;
    notifyListeners();
  }
   changeDepartement(String value) {
    _departement = value;
    notifyListeners();
  }
   changeImage(String value) {
    _image = value;
    notifyListeners();
  }
  ///////////////////////////////
  ///
  ///
  loadValues(Demande demande){
    _name=demande.name;
    _email=demande.email;
    _password=demande.password;
    _cas=demande.cas;
    _departement=demande.departement;
    _image=demande.image;
    
    _id=demande.id;
  }


  savedemande() {
    print('$email,$name');
    /*if (_email == null) {
      var newdemande = Demande(name:_name, email: _email, password: _password, cas: _cas, departement: _departement, image: _image, id: uuid.v4());
      firestoreservice.saveDemande(newdemande);
    } else {
      //Update
      var updateddemande =
          Demande(name:_name, email: _email, password: _password, cas: _cas, departement: _departement, image: _image, id: _id);
      firestoreservice.saveDemande(updateddemande);
    }*/
  }




}