import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';

class RatingCardWidget extends StatelessWidget {
  final String question;
  final int initialRating;
  final onRatingUpdate;

  const RatingCardWidget(
      {Key key, this.question, this.initialRating, this.onRatingUpdate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            question,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
          RatingBar.builder(
            initialRating: initialRating.toDouble(),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: onRatingUpdate,
          ),
          SizedBox(height: 26)
        ],
      ),
    );
  }
}
