import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providerServices/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanItem extends StatelessWidget {

  final String tipo;

  const ScanItem({@required this.tipo});

  @override
  Widget build(BuildContext context) {
    final mScanLisProvider=Provider.of<ScanListProvider>(context);
    final listaScans=mScanLisProvider.listScans;

    return ListView.builder(
      itemCount: listaScans.length,
      itemBuilder: (_, index) {
        return Dismissible(
          key: UniqueKey(),
          background: Container(
              color:Colors.red
          ),
          onDismissed: (DismissDirection disDirection){
            Provider.of<ScanListProvider>(context,listen: false).deleteScansbyId(listaScans[index].id);
          },
          child: ListTile(
            leading: Icon(
              this.tipo=='http'?
              Icons.link:Icons.map,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(listaScans[index].valor),
            subtitle: Text('Id: ${listaScans[index].id}'),
            trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
            onTap: ()=> launchURL(context, listaScans[index])
          ),
        );
      },
    );
  }
}
