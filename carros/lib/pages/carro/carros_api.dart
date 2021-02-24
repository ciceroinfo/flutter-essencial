import 'dart:convert' as convert;

import 'package:carros/pages/carro/carro.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class CarrosApi {
  static Future<List<Carro>> getCarros(String tipo) async {
    Usuario user = await Usuario.get();

    var url =
        'https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipo';

    Map<String, String> headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${user.token}"
    };

    print(url);

    var response = await http.get(url, headers: headers);

    List list = convert.json.decode(response.body);

    return list.map<Carro>((e) => Carro.fromJson(e)).toList();
  }
}

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}
