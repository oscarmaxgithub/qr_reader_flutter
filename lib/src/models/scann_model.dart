// To parse this JSON data, do
//
//     final scannModel = scannModelFromJson(jsonString);

import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart' show LatLng;
import 'package:meta/meta.dart';//AYUDA A PODER DECLARAR EL REQUIERD EN EL CONSTRUCTOR

ScannModel scannModelFromJson(String str) => ScannModel.fromJson(json.decode(str));
String scannModelToJson(ScannModel data) => json.encode(data.toJson());

class ScannModel {
  ScannModel({
    this.id,
    this.tipo,
    @required this.valor,
  }){
    if(this.valor.contains('http')){
      this.tipo='http';
    }else{
      this.tipo='geo';
    }
  }

  int id;
  String tipo;
  String valor;

  LatLng getLatLong(){
    final latLong= this.valor.substring(4).split(',');
    final lat=double.parse(latLong[0]);
    final long=double.parse(latLong[1]);
    return LatLng(lat, long);
  }

  factory ScannModel.fromJson(Map<String, dynamic> json) => ScannModel(
    id: json["id"],
    tipo: json["tipo"],
    valor: json["valor"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tipo": tipo,
    "valor": valor,
  };
}
