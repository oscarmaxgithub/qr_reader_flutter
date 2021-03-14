import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providerServices/db_provider.dart';
import 'package:qr_reader/providerServices/scan_list_provider.dart';
import 'package:qr_reader/providerServices/ui_provider.dart';
import 'package:qr_reader/src/pages/historial_direcciones_page.dart';
import 'package:qr_reader/src/pages/historial_mapas_pages.dart';
import 'package:qr_reader/src/widgets/custom_navigatorbar.dart';
import 'package:qr_reader/src/widgets/scan_button.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial'),
        elevation: 0,
        actions: [
          IconButton(icon: Icon(Icons.delete_forever), onPressed: () {})
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScannButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //obtener el selected menu opt
    final uiProvider=Provider.of<UIProvider>(context);

    final currentIndexSelected = uiProvider.selectedMenuOpt;
    // //TODO: LEER BASE DE DATOS
    // final tempScan=new ScannModel(valor: 'www.google.com');
    // DBProvider.db.getAllScans().then((value) => print(value));

    ///USAR ScanListprovider
    final scanListProvider=Provider.of<ScanListProvider>(context,listen: false);

    switch (currentIndexSelected) {
      case 0:
        scanListProvider.loadScansByType('geo');
        return HistorialMapasPage();
      case 1:
        scanListProvider.loadScansByType('http');
        return HistorialDireccionesPage();
      default:
        scanListProvider.loadScansByType('geo');
        return HistorialMapasPage();
    }
  }
}
