
import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/carro/carros_api.dart';
import 'package:carros/pages/carro/simple_bloc.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {
  fetch(String tipo) async {
    try {
      add(await CarrosApi.getCarros(tipo));
    } catch (e) {
      addError(e);
    }
  }
}
