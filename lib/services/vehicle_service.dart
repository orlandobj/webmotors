import 'package:dio/dio.dart';
import 'package:webmotors/config/defines.dart';
import 'package:webmotors/models/vehicle.dart';

class VehicleService {
  static Future<List<Vehicle>> getVehicles(page) async {
    List<Vehicle> vehicles = [];
    Response<dynamic> response = await Dio().get(host + "Vehicles?Page=" + page.toString());
    for (Map data in response.data) {
      vehicles.add(Vehicle.fromJson(data));
    }
    return vehicles;
  }
}
