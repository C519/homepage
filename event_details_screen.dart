import 'package:flutter/material.dart';
import 'package:listview_lainnya/model/lainn.dart';


class EventDetailsScreen extends StatelessWidget {

  final Lainn lainn;



EventDetailsScreen(this.lainn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lainn.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                lainn.imageurl,
                height: 500,
              ),
              Padding( // untuk tampilan setelah dipencet
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  lainn.tgl,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  lainn.desc,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}