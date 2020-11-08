import 'package:projet/modals/Alerte.dart';
import 'package:projet/modals/AlerteValide.dart';
import 'package:projet/modals/Ambulancier.dart';

import '../modals/Demande.dart';
import '../modals/Message.dart';

import '../modals/doctor.dart';
import '../modals/Etudiant.dart';
import '../modals/Utilisateur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  var timestamp = Timestamp.now();
 
 // var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

  

  Future<void> saveDemande(Demande demande){
    return _db.collection('Demandes').doc(demande.email).set(demande.toMap());
  }


  Future<void> saveAlerte(Alerte alerte){
    return _db.collection('Alertes').doc(alerte.email).set(alerte.toMap());
  }


  Future<void> saveDoctor(Doctor doctor){
    return _db.collection('Doctors').doc(doctor.email).set(doctor.toMap());
  }

  
Future<void> saveEtudiant(Etudiant etudiant){
    return (_db.collection('Etudiants').doc(etudiant.email).set(etudiant.toMap())
    
          
    );
  }
  Future<void> saveAmbulance(Ambulancier ambulancier){
    return (_db.collection('Ambulanciers').doc(ambulancier.email).set(ambulancier.toMap())
    
          
    );
  }
  Future<void> valideAlerte(AlerteValide alertevalide, String alerteId){
    return (_db.collection('AlertesValidees').doc(alerteId).set(alertevalide.toMap())
    
          
    );
  }

Future<void> validerDemande(Demande demande){
    return (_db.collection('Etudiants').doc(demande.email).set(demande.toMap())
    
          
    );
  }

Future<void> saveUser(uti utilisateur) {
    return (_db.collection('users').doc(utilisateur.email).set(utilisateur.toMap())..catchError((e) {
      print(e.toString());
    }
    
          
    ));
  }



   getEtudiantInfo(String email) async {
    return _db
        .collection("Etudiants")
        .where("email", isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

  Stream<List<Demande>> getDemandeList() {
    return _db.collection('Demandes')
        .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => Demande.fromFirestore(document.data()))
        .toList());
  }
    Stream<List<AlerteValide>> getAlerteValide() {
    return _db.collection('AlertesValidees')
        .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => AlerteValide.fromFirestore(document.data()))
        .toList());
  }
   Stream<List<Ambulancier>> getAmbulancier(String service) {
    return _db.collection('Ambulanciers')
    .where('secteur' ,isEqualTo: service)
         .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => Ambulancier.fromFirestore(document.data()))
        .toList());
  }
Stream<List<Etudiant>> getStudentList() {
    return _db.collection('Etudiants')
        .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => Etudiant.fromFirestore(document.data()))
        .toList());
  }

   Stream<List<Alerte>> getAlerteList() {
    return _db.collection('Alertes')
       
        .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => Alerte.fromFirestore(document.data()))
        .toList());
  }
    Stream<List<Message>> getMessageList() {
    return _db.collection('Messages')
       
        .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => Message.fromFirestore(document.data()))
        .toList());
  }
  

  Future<void> removeDemande(String demandeemail){
    return _db.collection('Demandes').doc(demandeemail).delete();
  }
   Future<void> removeDoctor(String doctoremail){
    return _db.collection('Doctos').doc(doctoremail).delete();
  }

Future<void> removeStudent(String studentEmail){
    return _db.collection('Etudiants').doc(studentEmail).delete();
  }
  Future<void> removeAlert(String alertemail){
    return _db.collection('Alertes').doc(alertemail).delete();
  }

//Recuperation  de la liste des docteurs:
 Stream<List<Doctor>> getDoctorList() {
    return _db.collection('Doctors')
         .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => Doctor.fromFirestore(document.data()))
        .toList());
  }

Future<void>  searchDoctor(String specialite) {
    return _db
        .collection("Doctor")
        .where('specialite', isEqualTo: specialite)
        .get();
  }



//
//
//
//
//     Dans ce qui va venir j vais faire les fonctions de la messagerie//
Future<void> addUserInfo(userData) async {
    _db.collection("users").doc(userData.email).set(userData).catchError((e) {
      print(e.toString());
    });
  }

  
   getSecteuralert(String secteur) async {
    return  _db
        .collection("AlertesValidees")
        .where('secteur', arrayContains: secteur)
        .snapshots();
  }

    getRol(DocumentSnapshot snapshot) {
    return _db
        .collection("users")
        .where('email', isEqualTo: snapshot.data()['email'])
        .get();
  }

 getUserInfo(String email) async {
    return _db
        .collection("Etudiants")
        .where("email", isEqualTo: email)
        .get()
        .catchError((e) {
      print(e.toString());
    });
  }

    searchByName(String searchField) {
    return _db
        .collection("users")
        .where('name', isEqualTo: searchField)
        .get();
  }
    searchByNameStudent(String searchField) {
    return _db
        .collection("users")
        .where('name', isEqualTo: searchField)
        .where('role', isEqualTo: 'etudiant')
        .get();
  }


  addChatRoom(chatRoom, chatRoomId) {
   return  _db
        .collection("chatRoom")
        .doc(chatRoomId)
        .set(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

   getChats(String chatRoomId) async{
    return _db
        .collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }


   addMessage(String chatRoomId, chatMessageData){

    return _db.collection("chatRoom")
        .doc(chatRoomId)
        .collection("chats")
        .add(chatMessageData).catchError((e){
          print(e.toString());
    });
  }

   getUserChats(String itIsMyName) async {
    return  _db
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }

  getLastChat(String chatRoomId) async{
    return _db
    .collection("chatRoom")
    .doc(chatRoomId)
    .collection("chats")
    .orderBy('time')
    .get();
  }
  
  

}