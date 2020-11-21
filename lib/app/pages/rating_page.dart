import 'package:consultant_app/app/components/bottom_navigaton/bottom_navigaton_widget.dart';
import 'package:consultant_app/app/components/rating_card/rating_card_widget.dart';
import 'package:flutter/material.dart';

class RatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Avalie')),
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
      bottomNavigationBar: BottomNavigatonWidget(currentIndex: 2),
    );
  }
}
