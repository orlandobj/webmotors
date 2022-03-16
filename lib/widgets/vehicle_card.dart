import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webmotors/widgets/custom_paint.dart';

import '../models/vehicle.dart';

class VehicleCard extends StatefulWidget {
  const VehicleCard({required this.vehicle, Key? key}) : super(key: key);
  final Vehicle vehicle;

  @override
  State<VehicleCard> createState() => _VehicleCardState();
}

class _VehicleCardState extends State<VehicleCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      color: const Color.fromARGB(255, 230, 230, 230),
      margin: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
      child: Column(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  CachedNetworkImage(
                    imageUrl: widget.vehicle.image,
                    placeholder: (context, url) => SizedBox(
                      height: MediaQuery.of(context).size.width * 0.5,
                      child: const Center(child: CircularProgressIndicator()),
                    ),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  Container(height: MediaQuery.of(context).size.width * 0.10)
                ],
              ),
              Positioned(left: 0, bottom: MediaQuery.of(context).size.width * 0.07, child: const CustomShape()),
              Positioned(
                  left: MediaQuery.of(context).size.width * 0.03,
                  bottom: MediaQuery.of(context).size.width * 0.08,
                  child: Text(
                    "R\$ " + widget.vehicle.price,
                    style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.width * 0.08, fontWeight: FontWeight.w600),
                  )),
            ],
          ),
          Container(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
              child: Column(
                children: [
                  Text(
                    widget.vehicle.make + " " + widget.vehicle.version,
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today_outlined, color: Colors.grey, size: MediaQuery.of(context).size.width * 0.04),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(
                            widget.vehicle.yearFab.toString() + "/" + widget.vehicle.yearModel.toString(),
                            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          FaIcon(FontAwesomeIcons.tachometerAlt, color: Colors.grey, size: MediaQuery.of(context).size.width * 0.04),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(widget.vehicle.km.toString() + " Km", style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03))
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.paintBrush,
                            color: Colors.grey,
                            size: MediaQuery.of(context).size.width * 0.04,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Text(widget.vehicle.color, style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03))
                        ],
                      )
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
