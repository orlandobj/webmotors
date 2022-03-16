import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webmotors/views/vehicle_catalog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter test webmotors',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: const VehicleCatalog(),
      builder: EasyLoading.init(),
    );
  }
}
