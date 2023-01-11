import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseClient {
  FirebaseFirestore firestore() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    return firestore;
  }

   FirebaseAuth auth() {
    FirebaseAuth auth = FirebaseAuth.instance;
    return auth;
  }
}
