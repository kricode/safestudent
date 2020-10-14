import '../modals/Demande.dart';
import '../modals/doctor.dart';
import '../modals/Etudiant.dart';
import '../modals/Utilisateur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class FirestoreService {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> saveDemande(Demande demande){
    return _db.collection('Demandes').doc(demande.email).set(demande.toMap());
  }

  Future<void> saveDoctor(Doctor doctor){
    return _db.collection('Doctors').doc(doctor.email).set(doctor.toMap());
  }

Future<void> saveEtudiant(Etudiant etudiant){
    return (_db.collection('Etudiants').doc(etudiant.email).set(etudiant.toMap())
    
          
    );
  }

Future<void> validerDemande(Demande demande){
    return (_db.collection('Etudiants').doc(demande.email).set(demande.toMap())
    
          
    );
  }

Future<void> saveUser(uti utilisateur) {
    return (_db.collection('Users').doc(utilisateur.email).set(utilisateur.toMap())..catchError((e) {
      print(e.toString());
    }
    
          
    ));
  }


  

  Stream<List<Demande>> getDemandeList() {
    return _db.collection('Demandes')
        .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => Demande.fromFirestore(document.data()))
        .toList());
  }

  Future<void> removeDemande(String demandeemail){
    return _db.collection('Demandes').doc(demandeemail).delete();
  }


//Recuperation  de la liste des docteurs:
 Stream<List<Demande>> getDoctorList() {
    return _db.collection('users')
        .where("role", isEqualTo: "doctor" )
        .snapshots()
        .map((snapShot) => snapShot.docs
        .map((document) => Demande.fromFirestore(document.data()))
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
    _db.collection("Users").add(userData).catchError((e) {
      print(e.toString());
    });
  }

    getRol(DocumentSnapshot snapshot) {
    return _db
        .collection("users")
        .where('email', isEqualTo: snapshot.data())
        .get();
  }

 getUserInfo(String email) async {
    return _db
        .collection("users")
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
  

}