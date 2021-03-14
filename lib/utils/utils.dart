import 'package:flutter/cupertino.dart';
import 'package:qr_reader/providerServices/db_provider.dart';
import 'package:url_launcher/url_launcher.dart';

launchURL(BuildContext context, ScannModel objScan) async {
  if(objScan.tipo=='http'){
    await canLaunch(objScan.valor)
        ? await launch(objScan.valor)
        : throw 'Could not launch ${objScan.valor}';
  }else{
    Navigator.pushNamed(context, 'mapa',arguments: objScan);
  }

}