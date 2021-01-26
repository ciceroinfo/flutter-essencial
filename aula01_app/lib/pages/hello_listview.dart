import 'package:aula01_app/widgets/dafault_button.dart';
import 'package:flutter/material.dart';

class HelloListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    List<Image> imgs = [
      _img("assets/images/dog1.png"),
      _img("assets/images/dog2.png"),
      _img("assets/images/dog3.png"),
      _img("assets/images/dog4.png"),
      _img("assets/images/dog5.png")
    ];

    return ListView.builder(
      itemCount: imgs.length,
      itemExtent: 300,
      itemBuilder: (context, index) {
        Image img = imgs[index];
        return img;
      },
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      width: 300,
      height: 300,
      fit: BoxFit.cover,
    );
  }
}
