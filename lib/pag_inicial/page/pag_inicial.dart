import 'package:app_relatorio_jw/Routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_button_pag_inicial.dart';

class PagInicial extends StatefulWidget {
  const PagInicial({Key? key}) : super(key: key);

  @override
  State<PagInicial> createState() => _HomeState();
}

class _HomeState extends State<PagInicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: Icon(
            Icons.info,
            size: 25,
            color: Color(0xFF3CB371),
          ),
          onPressed: () {},
        ),
      ),
      body: Container(
        color: Color(0xFF3CB371),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
                iconButton: Icons.home,
                textButtonColor: Color(0xFF3CB371),
                colorButton: MaterialStateProperty.all(Colors.white),
                onPressed: () {
                  Get.toNamed(Routes.registerCongregation);
                },
                buttonName: 'Congregacao'),
            SizedBox(height: 50),
            CustomButton(
                iconButton: Icons.person,
                textButtonColor: Color(0xFF3CB371),
                colorButton: MaterialStateProperty.all(Colors.white),
                onPressed: () {
                  // Get.toNamed(Routes.registerCongregation);
                },
                buttonName: 'Publicador'),
          ],
        )),
      ),
    );
  }
}
