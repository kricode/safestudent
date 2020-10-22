
import 'package:cloud_firestore/cloud_firestore.dart';

import '../modals/Utilisateur.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _db = FirebaseFirestore.instance;


  uti _userFromFirebaseUser(User user) {
    return uti != null ? uti(email: user.email) : null;
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      if (email != null){ 
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);}
      else return print("ajoutez vos coordonnées");
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future resetPass(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
      
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

/*Future getRole(User user) async{
  if (_db.collection("users").doc(user.email).get(['role'])) =   )

}*/
 

  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
