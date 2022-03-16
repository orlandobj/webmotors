//Classe que representa um veículo a ser exibido na tela;

class Vehicle {
  Vehicle(
      {required this.id,
      required this.make,
      required this.model,
      required this.version,
      required this.image,
      required this.km,
      required this.price,
      required this.yearModel,
      required this.yearFab,
      required this.color});

  int id;
  String make;
  String model;
  String version;
  String image;
  int km;
  String price;
  int yearModel;
  int yearFab;
  String color;

  static fromJson(json) {
    return Vehicle(
        id: json["ID"],
        make: json["Make"],
        model: json["Model"],
        version: json["Version"],
        //Colocaram http ao invés de https, o que resultou em erro ao recuperar a imagem
        //diretamente como ela está descrita no retorno.
        image: json["Image"].replaceAll("http", "https"),
        km: json["KM"] ?? 0,
        price: json["Price"],
        yearModel: json["YearModel"],
        yearFab: json["YearFab"],
        color: json["Color"]);
  }
}
