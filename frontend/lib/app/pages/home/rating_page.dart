import 'package:consultant_app/app/components/rating_card/rating_card_widget.dart';
import 'package:consultant_app/app/services/login_service.dart';
import 'package:consultant_app/app/services/rating_service.dart';
import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final bool isConsultant = true;

  List questions = [];

  @override
  void initState() {
    super.initState();
    RatingService.listRatings().then((result) {
      setState(() {
        questions = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text('Avalie'), actions: [
        GestureDetector(
          onTap: () {
            LoginService.logout().then((result) {
              Navigator.of(context).pushReplacementNamed('/login');
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.exit_to_app, size: 26.0),
          ),
        )
      ]),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) => RatingCardWidget(
                    question: questions[index]['question'],
                    initialRating: questions[index]['rating'],
                    onRatingUpdate: (rating) {
                      RatingService.rate(
                              questionId: questions[index]['questionId'],
                              rating: rating.toInt())
                          .then((result) {
                        final snackBar = SnackBar(
                            content: Text('Resposta submetida com sucesso =)'),
                            backgroundColor: Colors.green);

                        _scaffoldKey.currentState.showSnackBar(snackBar);
                      });
                    },
                  ),
                  itemCount: questions.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
