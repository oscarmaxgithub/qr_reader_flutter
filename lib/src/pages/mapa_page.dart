import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qr_reader/providerServices/db_provider.dart';

class MapaPage extends StatefulWidget {
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {

  Completer<GoogleMapController> _controller = Completer();

  MapType objTipoMapa=MapType.normal;

  @override
  Widget build(BuildContext context) {
    final ScannModel objScan = ModalRoute.of(context).settings.arguments;
    final CameraPosition _posicionInicial = CameraPosition(
        target: objScan.getLatLong(),
        zoom: 17.5,
        tilt: 40 //Los grados  de inclinaciond e la  camara
        );

    ///Marcadores
    Set<Marker> markers = new Set<Marker>();
    markers.add(
        new Marker(markerId: MarkerId(''), position: objScan.getLatLong()));

    return new Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.location_on),
              tooltip: 'Regresar al punto inicial',
              onPressed: () async {
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(
                        target: objScan.getLatLong(),
                        zoom: 17.5,
                        tilt: 40 //Los grados  de inclinaciond e la  camara
                        )));
              })
        ],
      ),
      body: GoogleMap(
        mapType: objTipoMapa,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        markers: markers,
        initialCameraPosition: _posicionInicial,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.layers),
        onPressed: (){
          if(objTipoMapa==MapType.normal){
            objTipoMapa=MapType.satellite;
          }else{
            objTipoMapa=MapType.normal;
          }
          setState(() {

          });
        },
      ),
    );
  }
}
