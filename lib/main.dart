import 'package:app_relatorio_jw/Routes/routes.dart';
import 'package:app_relatorio_jw/binding/initial_binding/initial_binding.dart';
import 'package:app_relatorio_jw/pag_inicial/page/pag_inicial.dart';
import 'package:app_relatorio_jw/register_congregation/binding/register_congregation_binding.dart';
import 'package:app_relatorio_jw/register_congregation/page/register_congregation_page.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(GetMaterialApp(
    home: PagInicial(),
    initialBinding: InitialBinding(),
    getPages: [
      GetPage(
          name: Routes.registerCongregation,
          page: () => const RegisterCongregationPage(),
          binding: RegisterCongregationBinding()),
      GetPage(name: Routes.pagInicial, page: () => const PagInicial())
    ],
  ));
}
