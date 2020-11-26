import 'package:consultant_app/app/components/rating_card/rating_card_widget.dart';
import 'package:flutter/material.dart';

class RatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Avalie'), actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/login');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.exit_to_app, size: 26.0),
          ),
        )
      ]),
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                RatingCardWidget(
                  question:
                      'Quanto os videos te ajudaram no seu desenvolvimento ?',
                ),
                RatingCardWidget(
                  question:
                      'Quanto os videos te ajudaram no seu desenvolvimento ?',
                ),
                RatingCardWidget(
                  question:
                      'Quanto os videos te ajudaram no seu desenvolvimento ?',
                ),
                RatingCardWidget(
                  question:
                      'Quanto os videos te ajudaram no seu desenvolvimento ?',
                ),
                RatingCardWidget(
                  question:
                      'Quanto os videos te ajudaram no seu desenvolvimento ?',
                ),
                RatingCardWidget(
                  question:
                      'Quanto os videos te ajudaram no seu desenvolvimento ?',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
