import 'package:flutter/material.dart';
import 'package:listview_lainnya/model/lainn.dart';
import 'package:listview_lainnya/screens/event_details_screen.dart';


class EventList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lainnya..'),
      ),
      body: ListView.builder(
        itemCount: LainnList.length,
        itemBuilder: (context, index) {
        Lainn lainn = LainnList[index];
        return Card(
          child: ListTile(
            title: Text(lainn.title),
            subtitle: Text(lainn.tgl),
            leading: Image.network (lainn.imageurl),
            trailing: Icon(Icons.arrow_forward_rounded),
            onTap: (){
              Navigator.push(
                context, 
                MaterialPageRoute(
                  builder: (context) => EventDetailsScreen(lainn)));
            },
          ),
        );
      })
    );
  }
}