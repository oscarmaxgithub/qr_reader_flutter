import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  /// CLASE QUE SE ENCARGA DEL MANEJO DE ESTADOS DE LA APLICACION
  /// SE LE LLAMA UI POR USER INTERFACE, PERO TAMBIEN SE PUEDE LLAMAR SERVICE
  int _selectedMenuOpt = 0;

  int get selectedMenuOpt => _selectedMenuOpt;

  set selectedMenuOpt(int value) {
    _selectedMenuOpt = value;
    notifyListeners();//notifica a todos los widgets que esten escuchando el set
  }
}
