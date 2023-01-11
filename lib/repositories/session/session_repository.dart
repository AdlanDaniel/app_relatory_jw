import 'package:app_relatorio_jw/repositories/models/congregation.dart';

abstract class SessionRepository {
  Future authCongregation(Congregation congregation);
  Future registerCongregation(Congregation congregation);
}
