import 'package:flutter/material.dart';

class HistorialMapasPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (_, index) {
        return ListTile(
          leading: Icon(
            Icons.map,
            color: Theme.of(context).primaryColor,
          ),
          title: Text('alksndlaksndlaksn'),
          subtitle: Text('Id:$index'),
          trailing: Icon(Icons.keyboard_arrow_right,color: Colors.grey,),
          onTap: ()=> print('abri algo '),
        );
      },
    );
  }
}
