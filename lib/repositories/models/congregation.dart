class Congregation {
  String? name;
  String? email;
  String? passworld;
  Congregation({
    this.name,
    this.email,
    this.passworld,
  });

  Congregation.fromMap(Map<String, dynamic> map) {
    name = map['nome'];
    email = map['email'];
    passworld = map['senha'];
  }
  toMapRegister() {
    Map<String, dynamic> data = Map();
    data['nome'] = name;
    data['email'] = email;

    return data;
  }

  toMapAuth() {
    Map<String, dynamic> data = Map();

    data['email'] = email;
    data['senha'] = passworld;
  }
}
