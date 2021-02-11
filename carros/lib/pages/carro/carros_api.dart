import 'package:carros/pages/carro/carro.dart';

class CarrosApi {
  static List<Carro> getCarros() {
    final carros = <Carro>[];

    carros.add(Carro(
        nome: "Ferrari FF",
        urlFoto:
            "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/classicos/Chevrolet_Corvette.png"));
    carros.add(Carro(
        nome: "Koenigsegg UPDATE",
        urlFoto:
            "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/luxo/Koenigsegg_CCX.png"));
    carros.add(Carro(
        nome: "Lamborghini Reventon",
        urlFoto:
            "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/luxo/Lamborghini_Reventon.png"));
    return carros;
  }
}
