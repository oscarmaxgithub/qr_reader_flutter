import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providerServices/db_provider.dart';
import 'package:qr_reader/providerServices/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScannButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
        tooltip: 'Scann QR',
        child: Icon(Icons.filter_center_focus),
        // backgroundColor: ,
        onPressed: ()  async{
          // final String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF','Cancelar',false,ScanMode.QR);
          final String barcodeScanRes = 'geo:-12.098720,-77.049348';
          // final String barcodeScanRes = 'https://nodejs.org/es/';
          if(barcodeScanRes=='-1') return;
          final mScanLisProvider=Provider.of<ScanListProvider>(context,listen: false);
          final  regiInserted= await mScanLisProvider.insertNuevoScan(barcodeScanRes);
          launchURL(context, regiInserted);

        }
        );
  }
}
