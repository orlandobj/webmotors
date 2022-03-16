import 'package:flutter/material.dart';
import 'package:webmotors/widgets/vehicle_pagination.dart';

class VehicleCatalog extends StatefulWidget {
  const VehicleCatalog({Key? key}) : super(key: key);

  @override
  State<VehicleCatalog> createState() => _VehicleCatalogState();
}

class _VehicleCatalogState extends State<VehicleCatalog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Catálogo de carros"), backgroundColor: const Color.fromARGB(255, 192, 40, 43),),
      body: Container(color: const Color.fromARGB(255, 200, 200, 200), child: const VehiclePagination()),
    );
  }
}
