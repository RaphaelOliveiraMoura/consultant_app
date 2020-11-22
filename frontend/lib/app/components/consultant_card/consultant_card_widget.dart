import 'package:flutter/material.dart';

class ConsultantCardWidget extends StatelessWidget {
  final String name = 'Raphael de Oliveira';
  final String email = 'raphaeldeoliveira@gmail.com';
  final String category = 'Tecnologia';

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                        style: BorderStyle.solid,
                      )),
                  child: Center(
                      child: Text(
                    "RA",
                    style: TextStyle(fontSize: 32),
                  )),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(name, style: TextStyle(fontSize: 18)),
                Text(email),
                Text(category, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 8),
                Icon(Icons.video_library)
              ])
            ],
          ),
        ));
  }
}
