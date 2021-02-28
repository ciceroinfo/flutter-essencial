import 'package:carros/pages/carro/carros_bloc.dart';
import 'package:carros/pages/carro/carros_listview.dart';
import 'package:carros/utils/text_error.dart';
import 'package:flutter/material.dart';

import 'carro.dart';

class CarrosPage extends StatefulWidget {
  final String tipo;

  CarrosPage(this.tipo);

  @override
  _CarrosPageState createState() => _CarrosPageState();
}

class _CarrosPageState extends State<CarrosPage>
    with AutomaticKeepAliveClientMixin<CarrosPage> {
  @override
  bool get wantKeepAlive => true;

  final _bloc = CarrosBloc();

  String get tipo => widget.tipo;

  List<Carro> carros;

  @override
  void initState() {
    super.initState();

    _bloc.fetch(widget.tipo);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    print("CarrosListView build ${widget.tipo}");

    return StreamBuilder(
      stream: _bloc.stream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return TextError("Não foi possivel buscar os carros");
        }

        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: _onRefresh,
          child: CarrosListView(snapshot.data),
          
        );
      },
    );
  }

  Future<void> _onRefresh() {
    return _bloc.fetch(tipo);
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.dispose();
  }

}
