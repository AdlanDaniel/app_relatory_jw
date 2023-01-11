import 'package:app_relatorio_jw/register_congregation/controller/register_congregation_controller.dart';
import 'package:app_relatorio_jw/repositories/session/session_repository.dart';
import 'package:app_relatorio_jw/repositories/session/session_repository_impl.dart';
import 'package:get/get.dart';

class RegisterCongregationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<RegisterCongregationController>(RegisterCongregationController(
        repository: Get.find<SessionRepository>()));
  }
}
