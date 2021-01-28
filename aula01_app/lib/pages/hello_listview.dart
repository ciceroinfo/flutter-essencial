import 'package:aula01_app/widgets/dafault_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class HelloListView extends StatefulWidget {
  @override
  _HelloListViewState createState() => _HelloListViewState();
}

class _HelloListViewState extends State<HelloListView> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                print("Lista");
                setState(() {
                  _gridView = false;
                });
              }),
          IconButton(
              icon: Icon(Icons.grid_on),
              onPressed: () {
                print("Grid");
                setState(() {
                  _gridView = true;
                });
              }),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<Dog> dogs = [
      Dog("Dog 1", "assets/images/dog1.png"),
      Dog("Dog 2", "assets/images/dog2.png"),
      Dog("Dog 3", "assets/images/dog3.png"),
      Dog("Dog 4", "assets/images/dog4.png"),
      Dog("Dog 5", "assets/images/dog5.png")
    ];

    if (_gridView) {
      return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: dogs.length,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    } else {
      return ListView.builder(
        itemCount: dogs.length,
        itemExtent: 300,
        itemBuilder: (context, index) {
          return _itemView(dogs, index);
        },
      );
    }
  }

  Stack _itemView(List<Dog> dogs, int index) {
    Dog dog = dogs[index];

    return Stack(
      fit: StackFit.expand,
      children: [
        _img(dog.foto),
        Container(
          alignment: Alignment.topLeft,
          child: Container(
            margin: EdgeInsets.all(12),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(16)),
            child: Text(
              dog.nome,
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),
          ),
        ),
      ],
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
