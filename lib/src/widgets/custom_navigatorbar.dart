import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providerServices/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final uiProvider=Provider.of<UIProvider>(context);

    // final currentIndexSelected=0;
    final currentIndexSelected=uiProvider.selectedMenuOpt;

    return BottomNavigationBar(
      elevation: 0,
        currentIndex: currentIndexSelected,
        items:<BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.map),label: 'Mapa'),
          BottomNavigationBarItem(icon: Icon(Icons.compass_calibration),label: 'Direcciones'),
        ],
      onTap: (int indexItem){
        uiProvider.selectedMenuOpt=indexItem;
      },
    );
  }
}
