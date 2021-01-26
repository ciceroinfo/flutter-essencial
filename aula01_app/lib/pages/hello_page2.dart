import 'package:aula01_app/widgets/dafault_button.dart';
import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context) {
    return Center(
        child: DefaultButton("Voltar", onPressed: () => Navigator.pop(context, "Tela 2")));
  }
}
