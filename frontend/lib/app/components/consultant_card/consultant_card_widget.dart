import 'package:flutter/material.dart';

class ConsultantCardWidget extends StatelessWidget {
  final data;

  ConsultantCardWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.symmetric(vertical: 8),
        color: Colors.grey[300],
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
                      child: Text(data['initials'],
                          style: TextStyle(fontSize: 32))),
                ),
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(data['name'], style: TextStyle(fontSize: 18)),
                Text(data['email']),
                Text(data['specialization'],
                    style: TextStyle(color: Colors.grey)),
              ])
            ],
          ),
        ));
  }
}
