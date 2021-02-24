import 'package:flutter/material.dart';

import 'carro.dart';
import 'carros_api.dart';

class CarrosListView extends StatefulWidget {
  String tipo;

  CarrosListView(this.tipo);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView>
    with AutomaticKeepAliveClientMixin<CarrosListView> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return _body();
  }

  _body() {
    Future<List<Carro>> future = CarrosApi.getCarros(widget.tipo);

    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);

          return Center(
            child: Text(
              "Não foi possivel buscar os carros",
              style: TextStyle(
                color: Colors.red,
                fontSize: 22,
              ),
            ),
          );
        }

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        return _listView(snapshot.data);
      },
    );
  }

  Container _listView(List<Carro> carros) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: carros.length,
          itemBuilder: (context, index) {
            Carro c = carros[index];
            return Card(
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.network(
                          c.urlFoto,
                          width: 250,
                        ),
                      ),
                      Text(
                        c.nome,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        "descrição...",
                        style: TextStyle(fontSize: 16),
                      ),
                      ButtonBarTheme(
                        data: ButtonBarTheme.of(context),
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              child: const Text('DETALHES'),
                              onPressed: () {
                                /* ... */
                              },
                            ),
                            FlatButton(
                              child: const Text('SHARE'),
                              onPressed: () {
                                /* ... */
                              },
                            ),
                          ],
                        ),
                      ),
                    ]),
              ),
            );
          }),
    );
  }
}
