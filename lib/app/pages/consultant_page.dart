import 'package:consultant_app/app/components/bottom_navigaton/bottom_navigaton_widget.dart';
import 'package:consultant_app/app/components/category_select/category_select_widget.dart';
import 'package:consultant_app/app/components/consultant_card/consultant_card_widget.dart';
import 'package:flutter/material.dart';

class ConsultantPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consultores'), actions: [
        GestureDetector(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.exit_to_app, size: 26.0),
          ),
        )
      ]),
      body: Container(
        child: SingleChildScrollView(
            child: Padding(
          padding:
              const EdgeInsets.only(top: 24, left: 26, right: 26, bottom: 12),
          child: Column(
            children: [
              CategorySelectWidget(),
              ConsultantCardWidget(),
              ConsultantCardWidget(),
              ConsultantCardWidget(),
              ConsultantCardWidget(),
              ConsultantCardWidget(),
              ConsultantCardWidget(),
            ],
          ),
        )),
      ),
      bottomNavigationBar: BottomNavigatonWidget(currentIndex: 1),
    );
  }
}
