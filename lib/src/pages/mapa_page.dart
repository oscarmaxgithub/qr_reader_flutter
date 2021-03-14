import 'package:flutter/material.dart';
import 'package:qr_reader/providerServices/db_provider.dart';

class MapaPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    final ScannModel objScan=ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Center(
        child: Text(objScan.valor),
      ),
    );
  }
}
