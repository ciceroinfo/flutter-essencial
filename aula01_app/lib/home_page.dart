import 'package:aula01_app/pages/hello_listview.dart';
import 'package:aula01_app/pages/hello_page1.dart';
import 'package:aula01_app/pages/hello_page2.dart';
import 'package:aula01_app/pages/hello_page3.dart';
import 'package:aula01_app/utils/nav.dart';
import 'package:aula01_app/utils/util.dart';
import 'package:aula01_app/widgets/dafault_button.dart';
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
        children: <Widget>[
          _text(),
          _pageView(),
          _buttons(),
        ],
      ),
    );
  }

  Container _pageView() {
    return Container(
      height: 301,
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

  _buttons() {
    return Builder(builder: (context) {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: <
          Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _button(context, "ListView",
                  onPressed: () =>
                      _onClickNavigation(context, HelloListView())),
              _button(context, "Page 2",
                  onPressed: () => _onClickNavigation(context, HelloPage2())),
              _button(context, "Page 3",
                  onPressed: () => _onClickNavigation(context, HelloPage3())),
            ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
            Widget>[
          _button(context, "Snack", onPressed: () => _onClickSnack(context)),
          _button(context, "Dialog", onPressed: () => _onClickDialog(context)),
          _button(context, "Toast", onPressed: _onClickToast)
        ])
      ]);
    });
  }

  void _onClickNavigation(BuildContext context, Widget page) async {
    print("Clicked on {$page}");

    String retorno = await push(context, page);

    print("retorno: '$retorno'");
  }

  _onClickToast() {}

  _onClickDialog(context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Dialog Flutter"),
              actions: [
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancelar")),
                FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      print("OK Dialog button");
                    },
                    child: Text("OK")),
              ],
            ),
          );
        });
  }

  _onClickSnack(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Olá Snack"),
      action: SnackBarAction(
        textColor: Colors.yellow,
        label: "OK",
        onPressed: () {
          print("OK Snack");
        },
      ),
    ));
  }

  _button(BuildContext context, String text, {@required Function onPressed}) {
    return DefaultButton(text, onPressed: onPressed);
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
}
