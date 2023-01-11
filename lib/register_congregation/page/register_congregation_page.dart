import 'package:app_relatorio_jw/Routes/routes.dart';
import 'package:app_relatorio_jw/core/widgets/custom_button_register.dart.dart';
import 'package:app_relatorio_jw/core/widgets/custom_textForm_register.dart';
import 'package:app_relatorio_jw/register_congregation/controller/register_congregation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterCongregationPage extends StatefulWidget {
  const RegisterCongregationPage({Key? key}) : super(key: key);

  @override
  State<RegisterCongregationPage> createState() =>
      _RegisterCongregationPageState();
}

class _RegisterCongregationPageState extends State<RegisterCongregationPage> {
  final controller = Get.find<RegisterCongregationController>();
  final keyform = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(15, 150, 15, 10),
          child: Form(
            key: keyform,
            child: Column(children: [
              Text(
                'Cadastre a Congregação',
                style: TextStyle(
                    color: Color(0xFF3CB371),
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(height: 10),
              Text(
                'Preencha os dados',
                style: TextStyle(
                    color: Color(0xFF808080),
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 50,
              ),
              CustomTextFormRegister(
                  prefixIcon: Icons.person,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo Obrigatório';
                    }
                    return null;
                  },
                  labelText: 'Nome ',
                  controller: controller.nameCongregationEC),
              SizedBox(height: 20),
              CustomTextFormRegister(
                  prefixIcon: Icons.email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo Obrigatório';
                    }
                    return null;
                  },
                  labelText: 'Email ',
                  controller: controller.emailCongregationEC),
              SizedBox(height: 20),
              CustomTextFormRegister(
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Campo Obrigatório';
                    }
                    return null;
                  },
                  labelText: 'Senha',
                  controller: controller.passworldCongregationEC),
              SizedBox(height: 50),
              Obx(() => (controller.loading.value
                  ? CircularProgressIndicator(color: Color(0xFF3CB371))
                  : CustomButtonRegister(
                      colorButton: MaterialStateProperty.all(Color(0xFF3CB371)),
                      widthButton: MediaQuery.of(context).size.width * 0.6,
                      heigthButton: 40,
                      onPressed: () {
                        if (keyform.currentState?.validate() ?? false) {
                          controller.loading.value = true;

                          // controller.registerCongregation(context);

                          controller.authCongregation(context);
                          // controller.loading.value = false;
                          // controller.sucefulDialog(context);
                        }
                      },
                      buttonName: 'CADASTRAR '))),
              SizedBox(height: 20),
              CustomButtonRegister(
                  colorButton: MaterialStateProperty.all(Color(0xFF3CB371)),
                  widthButton: MediaQuery.of(context).size.width * 0.35,
                  heigthButton: 40,
                  onPressed: () {
                    Get.offNamed(Routes.pagInicial);
                  },
                  buttonName: 'Voltar')
            ]),
          ),
        ),
      ),
    );
  }
}
