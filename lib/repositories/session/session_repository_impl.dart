// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_relatorio_jw/repositories/models/congregation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:app_relatorio_jw/repositories/session/session_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SessionRepositoryImpl implements SessionRepository {
  FirebaseAuth auth;
  FirebaseFirestore firestore;
  SessionRepositoryImpl({
    required this.auth,
    required this.firestore,
  });
  @override
  Future authCongregation(Congregation congregation) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: congregation.email!, password: congregation.passworld!);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw InvalidEmail();
        case 'user-not-found':
          throw UserNotFound();
        case 'email-already-in-use':
          throw EmailAlreadyInUSe();
        case 'wrong-passworld':
          throw WrongPassworld();
        case 'invalid-passworld':
          throw InvalidPassworld();
        case 'weak-passworld':
          throw WeakPassworld();
        default:
          throw GenericErrorFirebase();
      }
    } catch (_){
      throw GenericError();
    }
  }

  @override
  Future registerCongregation(Congregation congregation) async {
    try {
      await firestore
          .collection('congregacao')
          .doc()
          .set(congregation.toMapRegister());
    } on FirebaseException catch (e) {
      switch (e.code) {
        case 'already-exist':
          throw AlreadyExistError();
        case 'deadline-exceeded':
          throw DeadLineError();
        case 'invalid-argument':
          throw InvalidArgumentError();
        case 'unavailable':
          throw UnavailableError();
        case 'unknown':
          throw UnknownError();

        default:
          GenericErrorFirebase();
      }
    } catch (_) {
      GenericError();
    }
  }
}

class AlreadyExistError implements Exception {}

class DeadLineError implements Exception {}

class InvalidArgumentError implements Exception {}

class UnavailableError implements Exception {}

class UnknownError implements Exception {}
class GenericErrorFirebase implements Exception {}

class GenericError implements Exception {}


class InvalidEmail implements Exception {}

class UserNotFound implements Exception {}

class EmailAlreadyInUSe implements Exception {}

class WrongPassworld implements Exception {}

class InvalidPassworld implements Exception {}

class WeakPassworld implements Exception {}
