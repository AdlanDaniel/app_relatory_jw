import 'package:app_relatorio_jw/core/rest_clients/firebase.dart';
import 'package:app_relatorio_jw/repositories/session/session_repository.dart';
import 'package:app_relatorio_jw/repositories/session/session_repository_impl.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<FirebaseClient>(FirebaseClient());
    Get.put<SessionRepository>(SessionRepositoryImpl(
        auth: Get.find<FirebaseClient>().auth(),
        firestore: Get.find<FirebaseClient>().firestore()));

    
  }
}
