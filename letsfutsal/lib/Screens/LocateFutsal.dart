import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:letsfutsal/Services/FutsalService.dart';

import '../Entities/Futsal.dart';

class LocateFutsal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: Row(
            children: [
              Expanded(child: Center(child: Text("Google Map"))),
              Icon(
                Icons.arrow_back_sharp,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
        body: FutureBuilder(
            future: FutsalService().getFutsals(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {

                List<Futsal> futsals = snapshot.data;
                print(futsals.length);
                return GoogleMap(
                  markers: {
                    ...futsals
                        .map((e) => Marker(
                            markerId: MarkerId(e.id.toString()),
                            position: LatLng(e.lat, e.lng),
                            infoWindow: InfoWindow(title: e.name)))
                        .toList()
                  },
                  initialCameraPosition:
                      CameraPosition(target: LatLng(27.70864056324402, 85.32600756915386), zoom: 12),
                );
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
