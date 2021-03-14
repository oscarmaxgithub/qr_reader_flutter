import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
        tooltip: 'Scann QR',
        child: Icon(Icons.filter_center_focus),
        // backgroundColor: ,
        onPressed: ()  async{
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#3D8BEF',
              'Cancelar',
              false,
              ScanMode.QR);
          print('barcopde'+barcodeScanRes);
        }
        );
  }
}
