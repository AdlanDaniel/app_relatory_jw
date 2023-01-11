// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_relatorio_jw/repositories/models/congregation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:app_relatorio_jw/repositories/session/session_repository.dart';
import 'package:app_relatorio_jw/repositories/session/session_repository_impl.dart';

class RegisterCongregationController extends GetxController {
  SessionRepository repository;
  RegisterCongregationController({
    required this.repository,
  });

  TextEditingController nameCongregationEC = TextEditingController();
  TextEditingController emailCongregationEC = TextEditingController();
  TextEditingController passworldCongregationEC = TextEditingController();
  RxBool loading = false.obs;

  Future registerCongregation(BuildContext context) async {
    Congregation congregation = Congregation();
    congregation.name = nameCongregationEC.text;
    congregation.email = emailCongregationEC.text;

    try {
      await repository.registerCongregation(congregation);
      loading.value = false;
      clearFields();
      sucefulDialog(context);
    } on AlreadyExistError {
      clearFields();

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Documento tentado criar ja existe'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
    } on DeadLineError {
      clearFields();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('O prazo expirou para cadastro, tente novamente'),
        backgroundColor: Color(0xFF3CB371),
        duration: Duration(seconds: 4),
      ));
    } on InvalidArgumentError {
      clearFields();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Argumento Inválido'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
    } on UnavailableError {
      clearFields();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Serviço indisponível no momeneto, tente novamente'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
    } on UnknownError {
      clearFields();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro no banco de dados desconhecido'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
    } on GenericErrorFirebase {
      clearFields();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Erro desconhecido do banco de dados'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
    } on GenericError {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Erro desconhecido ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
    }
  }

  Future authCongregation(BuildContext context) async {
    Congregation congregation = Congregation();

    congregation.email = emailCongregationEC.text;
    congregation.passworld = passworldCongregationEC.text;
    try {
      await repository.authCongregation(congregation);
      loading.value = false;
    } on InvalidEmail {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Email Inválido',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
    } on UserNotFound {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Usuário não encontrado',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
    } on EmailAlreadyInUSe {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Email já está em conectado',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
    } on WrongPassworld {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Senha Incorreta',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
    } on InvalidPassworld {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Senha Inválida',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
    } on WeakPassworld {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Senha Fraca',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
    } on GenericErrorFirebase {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Erro desconhecido do banco de dados ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
    } on GenericError {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          'Erro desconhecido  ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 4),
      ));
    }
  }

  clearFields() {
    nameCongregationEC.clear();
    emailCongregationEC.clear();
    passworldCongregationEC.clear();
  }

  sucefulMessenger(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Usuário Cadastrado com sucesso'),
      backgroundColor: Color(0xFF3CB371),
      duration: Duration(seconds: 4),
    ));
  }

  sucefulDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: CircleAvatar(
            backgroundColor: Color(0xFF3CB371),
            child: Icon(
              Icons.check,
              size: 30,
              color: Colors.white,
            )),
        content: Text('Cadastro realizado com sucesso!'),
      ),
    );
  }
}
