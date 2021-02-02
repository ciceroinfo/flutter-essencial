import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final _tLogin = TextEditingController();
  final _tSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          _textFormField("Login", "Digite o login", controller: _tLogin),
          SizedBox(height: 10),
          _textFormField("Senha", "Digite a senha",
              password: true, controller: _tSenha),
          SizedBox(height: 20),
          _button("Login", _onClickLogin)
        ],
      ),
    );
  }

  Container _button(String text, Function onPressed) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        onPressed: onPressed,
      ),
    );
  }

  TextFormField _textFormField(String label, String hint,
      {bool password = false, TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      style: TextStyle(fontSize: 25, color: Colors.blue),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 25, color: Colors.grey),
        hintText: hint,
        hintStyle: TextStyle(fontSize: 16, color: Colors.red),
      ),
      obscureText: password,
    );
  }

  void _onClickLogin() {
    String l = _tLogin.text;
    String s = _tSenha.text;

    print("Login: $l, senha: $s");
  }
}
