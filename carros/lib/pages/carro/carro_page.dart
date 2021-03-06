import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/loripsum_api.dart';
import 'package:carros/utils/text.dart';
import 'package:flutter/material.dart';

class CarroPage extends StatefulWidget {

  final Carro carro;

  CarroPage(this.carro);

  @override
  _CarroPageState createState() => _CarroPageState();
}

class _CarroPageState extends State<CarroPage> {
  final _loripsumApiBloc = LoripsumBloc();

  @override
  void initState() {
    super.initState();
    _loripsumApiBloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.carro.nome),
        actions: [
          IconButton(icon: Icon(Icons.place), onPressed: _onClickMap),
          IconButton(icon: Icon(Icons.videocam), onPressed: _onClickMap),
          PopupMenuButton<String>(
            onSelected: (value) => _onClickPopupMenu(value),
            itemBuilder: (context) {
              return [
                PopupMenuItem(value: "Editar", child: Text("Editar")),
                PopupMenuItem(value: "Deletar", child: Text("Deletar")),
                PopupMenuItem(value: "Share", child: Text("Share")),
              ];
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: [
          Image.network(widget.carro.urlFoto),
          _bloco1(),
          Divider(),
          _bloco2(),
        ],
      ),
    );
  }

  Row _bloco1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(widget.carro.nome, fontSize: 20, bold: true),
            text(widget.carro.tipo, fontSize: 16),
          ],
        ),
        Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  size: 40,
                  color: Colors.red,
                ),
                onPressed: _onClickFavorito),
            IconButton(
                icon: Icon(
                  Icons.share,
                  size: 40,
                ),
                onPressed: _onClickShare)
          ],
        )
      ],
    );
  }

  void _onClickMap() {}

  _onClickPopupMenu(String value) {
    switch (value) {
      case "Editar":
        print("Editar");
        break;
      case "Deletar":
        print("Deletar");
        break;
      case "Share":
        print("Share");
        break;
    }
  }

  void _onClickFavorito() {}

  void _onClickShare() {}

  _bloco2() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        text(widget.carro.descricao, fontSize: 16),
        SizedBox(height: 20),
        StreamBuilder<String>(
          stream: _loripsumApiBloc.stream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            return text(snapshot.data, fontSize: 14);
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _loripsumApiBloc.dispose();
  }
}
