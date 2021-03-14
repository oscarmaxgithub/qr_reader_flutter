import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providerServices/scan_list_provider.dart';
import 'package:qr_reader/providerServices/ui_provider.dart';
import 'package:qr_reader/src/pages/home_page.dart';
import 'package:qr_reader/src/pages/mapa_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light
        )
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create:(_)=>new UIProvider()),
        ChangeNotifierProvider(create:(_)=>new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qr Reader',
        initialRoute: 'home',
        routes: {
          // 'home':(BuildContext context)=> HomePage(),
          'home': (_) => HomePage(),
          'mapa': (_) => MapaPage(),
        },
        theme: ThemeData(
            primaryColor: Colors.red,
            floatingActionButtonTheme:FloatingActionButtonThemeData(
              backgroundColor: Colors.red
            )
        ),
      ),
    );
  }
}
