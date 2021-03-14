import 'package:flutter/material.dart';
import 'package:qr_reader/src/widgets/scan_item.dart';

class HistorialDireccionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanItem(tipo: 'http');
  }
}
