import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demologinfionan/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
class MyFirebase {
  static Future<String> createAccount({String email, String password}) async {
    AuthResult auth = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return auth.user.uid;
  }
 
  static Future<void> createProfile(User user) async {
    await Firestore.instance.collection(User.PROFILE_COLLECION)
                .document(user.uid)
                .setData(user.serialize());
  }
  static Future<String> login({String email, String password}) async {
    AuthResult auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, 
      password: password
      );
      return auth.user.uid;
  }
}