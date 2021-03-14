import 'package:flutter/material.dart';
import 'package:qr_reader/providerServices/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScannModel> listScans = [];
  String tipoSeleccionado = 'http';

  insertNuevoScan(String valor) async {
    final nuevoScan = new ScannModel(valor: valor);
    final id = await DBProvider.db.nuevoScan2(nuevoScan);
    //
    nuevoScan.id = id;
    if (this.tipoSeleccionado == nuevoScan.tipo) {
      this.listScans.add(nuevoScan);
      notifyListeners();
    }
  }

  loadAllScans() async {
    final scans = await DBProvider.db.getAllScans();
    this.listScans = [...scans];
    notifyListeners();
  }

  loadScansByType(String tipo) async {
    final scans = await DBProvider.db.getAllScansbyType(tipo);
    this.listScans = [...scans];
    notifyListeners();
  }

  deleteAllScans() async {
    await DBProvider.db.deleteScansAll();
    this.listScans = [];
    notifyListeners();
  }

  deleteScansbyId(int id) async {
    await DBProvider.db.deleteScanById(id);
    this.loadScansByType(this.tipoSeleccionado);
  }
}
