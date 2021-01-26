import 'package:aula01_app/pages/hello_page1.dart';
import 'package:aula01_app/pages/hello_page2.dart';
import 'package:aula01_app/pages/hello_page3.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  Row _title() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text("bradesco ", style: new TextStyle(fontWeight: FontWeight.bold)),
      Text("seguros")
    ]);
  }

  _body(BuildContext context) {
    return Container(
      color: colorConvert("#cb0930"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[_text(), _pageView(), _buttons(context)],
      ),
    );
  }

  Container _pageView() {
    return Container(
      height: 300,
      child: PageView(
        children: [
          _img("assets/images/dog1.png"),
          _img("assets/images/dog2.png"),
          _img("assets/images/dog3.png"),
          _img("assets/images/dog4.png"),
          _img("assets/images/dog5.png")
        ],
      ),
    );
  }

  Column _buttons(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: <
        Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        _button(context, "ListView",
            () => _onClickNavigation(context, HelloPage1())),
        _button(
            context, "Page 2", () => _onClickNavigation(context, HelloPage2())),
        _button(
            context, "Page 3", () => _onClickNavigation(context, HelloPage3())),
      ]),
      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <Widget>[
        _button(context, "Snack", _onClickSnack),
        _button(context, "Dialog", _onClickDialog),
        _button(context, "Toast", _onClickToast)
      ])
    ]);
  }

  void _onClickNavigation(BuildContext context, Widget page) {
    print("Clicked on {$page}");
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
  }

  _onClickToast() {}

  _onClickDialog() {}

  _onClickSnack() {}

  _button(BuildContext context, String text, Function onPressed) {
    return RaisedButton(
        color: Colors.white,
        child: Text(
          text,
          style: TextStyle(color: colorConvert("#e60935")),
        ),
        onPressed: onPressed);
  }

  _img(String img) {
    return Image.asset(
      img,
      width: 300,
      height: 300,
      fit: BoxFit.cover,
    );
  }

  Text _text() {
    return Text(
      "Hello World!",
      style: TextStyle(
        fontSize: 30,
        color: Colors.green,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.wavy,
      ),
    );
  }

  Color colorConvert(String color) {
    color = color.replaceAll("#", "");
    if (color.length == 6) {
      return Color(int.parse("0xFF" + color));
    } else if (color.length == 8) {
      return Color(int.parse("0x" + color));
    }

    return Colors.grey;
  }
}
