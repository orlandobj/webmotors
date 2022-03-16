import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webmotors/widgets/vehicle_card.dart';

import '../models/vehicle.dart';
import '../services/vehicle_service.dart';

class VehiclePagination extends StatefulWidget {
  const VehiclePagination({Key? key}) : super(key: key);

  @override
  State<VehiclePagination> createState() => _VehiclePaginationState();
}

class _VehiclePaginationState extends State<VehiclePagination> {
  int page = 1;
  bool maximumPageReached = false;
  bool isLoading = false;
  List<Vehicle> vehicles = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //Obtém os primeiros 10 veículos;
    VehicleService.getVehicles(page).then((value) {
      for (Vehicle vehicle in value) {
        vehicles.add(vehicle);
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollEndNotification>(
        child: ListView(
          reverse: false,
          children: [...vehicles.map((e) => VehicleCard(vehicle: e)).toList()],
        ),
        onNotification: (ScrollNotification notification) {
          //Obtém o restante ao chegar no final da página;
          if (notification.metrics.pixels == notification.metrics.maxScrollExtent) {
            if (!maximumPageReached && !isLoading) {
              isLoading = true;
              EasyLoading.show(status: 'Carregando...');
              page++;
              VehicleService.getVehicles(page).then((value) {
                maximumPageReached = value.length < 10;
                for (Vehicle vehicle in value) {
                  vehicles.add(vehicle);
                }
                //Evita que faça requisições seguidas sem terminar a anterior
                isLoading = false;
                setState(() {});
                EasyLoading.dismiss();

                return true;
              });
            }
          }

          return false;
        });
  }
}
