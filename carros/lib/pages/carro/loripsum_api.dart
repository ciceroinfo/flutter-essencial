import 'package:carros/pages/carro/simple_bloc.dart';
import 'package:http/http.dart' as http;

class LoripsumApi {
  static Future<String> getLoripsum() async {
    var url = 'https://loripsum.net/api';

    print(url);

    var response = await http.get(url);

    return response.body.replaceAll("<p>", "").replaceAll("</p>", "");
  }
}

class LoripsumBloc extends SimpleBloc<String> {

  static String lorim;

  fetch() async {
    try {

      lorim = lorim ?? await LoripsumApi.getLoripsum();

      add(lorim);
    } catch (e) {
      addError(e);
    }
  }
}
