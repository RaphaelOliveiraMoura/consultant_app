import 'package:consultant_app/app/components/bottom_navigaton/bottom_navigaton_widget.dart';
import 'package:flutter/material.dart';

class RatingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Avalie')),
      body: Container(),
      bottomNavigationBar: BottomNavigatonWidget(),
    );
  }
}
