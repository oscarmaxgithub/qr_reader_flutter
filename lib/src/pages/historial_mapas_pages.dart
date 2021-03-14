import 'package:flutter/material.dart';
import 'package:qr_reader/src/widgets/scan_item.dart';

class HistorialMapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScanItem(tipo: 'geo');
  }
}
