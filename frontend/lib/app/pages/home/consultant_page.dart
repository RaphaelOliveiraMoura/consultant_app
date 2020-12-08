import 'package:consultant_app/app/components/consultant_card/consultant_card_widget.dart';
import 'package:consultant_app/app/services/consultant_service.dart';
import 'package:consultant_app/app/services/login_service.dart';
import 'package:flutter/material.dart';

class ConsultantPage extends StatefulWidget {
  @override
  _ConsultantPageState createState() => _ConsultantPageState();
}

class _ConsultantPageState extends State<ConsultantPage> {
  List consultants = [];

  @override
  void initState() {
    super.initState();

    ConsultantService.getAll().then((result) {
      setState(() {
        consultants = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Consultores'), actions: [
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
          padding:
              const EdgeInsets.only(top: 24, left: 26, right: 26, bottom: 12),
          child: Column(
            children: [
              // CategorySelectWidget(),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) =>
                      ConsultantCardWidget(consultants[index]),
                  itemCount: consultants.length,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
