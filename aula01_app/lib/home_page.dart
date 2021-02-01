import 'package:aula01_app/drawer_list.dart';
import 'package:aula01_app/pages/hello_listview.dart';
import 'package:aula01_app/pages/hello_page1.dart';
import 'package:aula01_app/pages/hello_page2.dart';
import 'package:aula01_app/pages/hello_page3.dart';
import 'package:aula01_app/utils/nav.dart';
import 'package:aula01_app/utils/util.dart';
import 'package:aula01_app/widgets/dafault_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: _title(),
          bottom: TabBar(
            tabs: [
              Tab(text: "Tab 1"),
              Tab(text: "Tab 2"),
              Tab(text: "Tab 3"),
            ],
          ),
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            _body(context),
            Container(color: Colors.yellow),
            Container(color: Colors.green),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _onClickFab();
          },
        ),
        drawer: DrawerList(),
      ),
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
      padding: EdgeInsets.only(top: 16),
      color: colorConvert("#cb0930"),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
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
      margin: EdgeInsets.only(top: 20, bottom: 20),
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

  _onClickToast() {
    Fluttertoast.showToast(
        msg: "This is Center Long Toast",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
  }

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

  void _onClickFab() {
    print("Add");
  }
}
